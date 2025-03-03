package service

import (
	"context"
	v1 "rcc-stake-backed/api/v1"
	"rcc-stake-backed/internal/model"
	"rcc-stake-backed/internal/repository"
	"strings"
)

type ProductService interface {
	GetProduct(ctx context.Context, request *v1.ProductDetailRequest) (response *v1.ProductDetailResponse, err error)
	ListProducts(ctx context.Context, request *v1.ProductListRequest) (response *v1.ProductListResponse, err error)
}

func NewProductService(
	service *Service,
	productRepository repository.ProductRepository,
	categoryRepository repository.CategoryRepository,
) ProductService {
	return &productService{
		Service:            service,
		productRepository:  productRepository,
		categoryRepository: categoryRepository,
	}
}

type productService struct {
	*Service
	productRepository  repository.ProductRepository
	categoryRepository repository.CategoryRepository
}

func (s *productService) GetProduct(ctx context.Context, request *v1.ProductDetailRequest) (response *v1.ProductDetailResponse, err error) {
	// 获取单个商品信息
	product, err := s.productRepository.GetProduct(ctx, request.ProductID)
	if err != nil {
		return nil, err
	}

	// 构造商品属性参数
	productSpuAttrParams := &v1.ProductSpuAttrParams{}
	for _, param := range product.SPUAttrParams {
		if param.Code == "BASIC_ATTRS" {
			productSpuAttrParams.BasicAttrs = param.Value
		}
		if param.Code == "SALE_ATTRS" {
			productSpuAttrParams.SaleAttrs = param.Value
		}
		if param.Code == "SPEC_ATTRS" {
			productSpuAttrParams.SpecAttrs = param.Value
		}
	}

	// 构造商品SKU列表
	var productSkus []*v1.ProductSku
	for _, sku := range product.SKUs {
		productSkus = append(productSkus, &v1.ProductSku{
			Id:           sku.ID,
			ProductSpuID: sku.ProductSpuID,
			SkuCode:      sku.SkuCode,
			Price:        sku.Price,
			Stock:        sku.Stock,
			SaleCount:    sku.SaleCount,
			Status:       sku.Status,
			Indexs:       sku.Indexs,
			AttrParams:   sku.AttrParams,
			Images:       sku.Images,
			Title:        sku.Title,
			SubTitle:     sku.SubTitle,
			Description:  sku.Description,
		})
	}

	response = &v1.ProductDetailResponse{
		ProductSpu: &v1.ProductSpu{
			Id:            product.SPU.ID,
			Code:          product.SPU.Code,
			Name:          product.SPU.Name,
			Category1ID:   product.SPU.Category1ID,
			Category1Code: product.SPU.Category1Code,
			Category2ID:   product.SPU.Category2ID,
			Category2Code: product.SPU.Category2Code,
			Category3ID:   product.SPU.Category3ID,
			Category3Code: product.SPU.Category3Code,
			Brand:         product.SPU.Brand,
			Price:         product.SPU.Price,
			RealPrice:     product.SPU.RealPrice,
			TotalSales:    product.SPU.TotalSales,
			TotalStock:    product.SPU.TotalStock,
			Status:        product.SPU.Status,
			// ... existing code ...
			Images: func() []string {
				if product.SPU.Images == "" {
					return []string{}
				}
				images := strings.Split(product.SPU.Images, ",")
				var result []string
				for _, img := range images {
					// 清理 URL 两端的空格
					img = strings.TrimSpace(img)
					// 跳过空字符串
					if img == "" {
						continue
					}
					// 检查 URL 是否合法（至少包含基本的 URL 结构）
					if strings.HasPrefix(img, "http://") || strings.HasPrefix(img, "https://") || strings.HasPrefix(img, "/") {
						result = append(result, img)
					}
				}
				return result
			}(),
			Description: product.SPU.Description,
		},
		ProductSpuDetail: &v1.ProductSpuDetail{
			Id:           product.SPUDetail.ID,
			ProductSpuID: product.SPUDetail.ProductSpuID,
			Detail:       string(product.SPUDetail.Detail),
			PackingList:  string(product.SPUDetail.PackingList),
			AfterSale:    string(product.SPUDetail.AfterSale),
		},
		ProductSpuAttrParams: productSpuAttrParams,
		ProductSkus:          productSkus,
	}

	return response, nil
}

func (s *productService) ListProducts(ctx context.Context, request *v1.ProductListRequest) (*v1.ProductListResponse, error) {
	// 解析请求中的分类编码
	var categoryCodes []string
	if request.CategoryCodes != "" {
		categoryCodes = strings.Split(request.CategoryCodes, ",")
	}

	// 如果没有指定分类编码，获取所有一级分类
	if len(categoryCodes) == 0 {
		categories, err := s.categoryRepository.GetCategoriesByParams(ctx, &model.Category{Level: 1})
		if err != nil {
			return nil, err
		}
		for _, category := range categories {
			categoryCodes = append(categoryCodes, category.Code)
		}
	}
	// 查询商品列表
	products, total, err := s.productRepository.ListProductsByCategoryCodes(
		ctx,
		categoryCodes,
		request.ProductName,
		request.Page,
		request.PageSize,
	)
	if err != nil {
		return nil, err
	}

	// 目录--> 商品集合的映射关系
	// 构建响应
	var response v1.ProductListResponse
	for _, categoryCode := range categoryCodes {
		var categoryProducts v1.CategoryProducts
		categoryProducts.CategoryCode = categoryCode
		var count int64 = 0
		var ps []*v1.Product
		for _, product := range products {
			if product.SPU == nil {
				continue
			}
			if product.SPU.Category1Code == categoryCode || product.SPU.Category2Code == categoryCode || product.SPU.Category3Code == categoryCode {
				var basicAttrs string // 基础属性
				var saleAttrs string  // 销售属性
				var specAttrs string  // 规格属性
				for _, attr := range product.SPUAttrParams {
					if attr.Code == "BASIC_ATTRS" {
						basicAttrs = attr.Value
					}
					if attr.Code == "SALE_ATTRS" {
						saleAttrs = attr.Value
					}
					if attr.Code == "SPEC_ATTRS" {
						specAttrs = attr.Value
					}
				}

				// 构造 SKU 列表
				var skuList []*v1.ProductSku
				for _, sku := range product.SKUs {
					skuList = append(skuList, &v1.ProductSku{
						Id:             sku.ID,
						ProductSpuID:   sku.ProductSpuID,
						ProductSpuCode: sku.ProductSpuCode,
						SkuCode:        sku.SkuCode,
						Price:          sku.Price,
						Stock:          sku.Stock,
						SaleCount:      sku.SaleCount,
						Status:         sku.Status,
						Indexs:         sku.Indexs,
						AttrParams:     sku.AttrParams,
						OwnerParams:    sku.OwnerParams,
						Images:         sku.Images,
						Title:          sku.Title,
						SubTitle:       sku.SubTitle,
						Description:    sku.Description,
					})
				}

				ps = append(ps, &v1.Product{
					Id:            product.SPU.ID,
					Code:          product.SPU.Code,
					Name:          product.SPU.Name,
					Category1Id:   product.SPU.Category1ID,
					Category1Code: product.SPU.Category1Code,
					Category2Id:   product.SPU.Category2ID,
					Category2Code: product.SPU.Category2Code,
					Category3Id:   product.SPU.Category3ID,
					Category3Code: product.SPU.Category3Code,
					Brand:         product.SPU.Brand,
					Price:         product.SPU.Price,
					RealPrice:     product.SPU.RealPrice,
					TotalSales:    product.SPU.TotalSales,
					TotalStock:    product.SPU.TotalStock,
					Status:        product.SPU.Status,
					Images: func() []string {
						if product.SPU.Images == "" {
							return []string{}
						}
						images := strings.Split(product.SPU.Images, ",")
						var result []string
						for _, img := range images {
							img = strings.TrimSpace(img)
							if img == "" {
								continue
							}
							if strings.HasPrefix(img, "http://") ||
								strings.HasPrefix(img, "https://") ||
								strings.HasPrefix(img, "/") {
								result = append(result, img)
							}
						}
						return result
					}(),
					Description: product.SPU.Description,
					Attributes: &v1.ProductAttrs{
						BasicAttrs: basicAttrs,
						SaleAttrs:  saleAttrs,
						SpecAttrs:  specAttrs,
					},
					SkuList: skuList, // 添加 SKU 列表到返回结构
				})
				count++
			}
		}

		categoryProducts.ProductCount = count
		categoryProducts.Products = ps
		response.Categories = append(response.Categories, &categoryProducts)

	}
	response.Total = total

	return &response, nil
}
