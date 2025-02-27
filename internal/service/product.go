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
	product, err := s.productRepository.GetProduct(ctx, request.ProductId)
	if err != nil {
		return nil, err
	}
	var productSpuAttrParams []*v1.ProductSpuAttrParams
	for _, attr := range product.SPUAttrParams {
		productSpuAttrParams = append(productSpuAttrParams, &v1.ProductSpuAttrParams{
			Id:           attr.ID,
			ProductSpuID: attr.ProductSpuID,
		})
	}
	var productSkus []*v1.ProductSku
	for _, sku := range product.SKUs {
		productSkus = append(productSkus, &v1.ProductSku{
			Id:           sku.ID,
			ProductSpuID: sku.ProductSpuID,
		})
	}

	response = &v1.ProductDetailResponse{
		ProductSpu: &v1.ProductSpu{
			Id:            product.SPU.ID,
			Code:          product.SPU.Code,
			Name:          product.SPU.Name,
			Category1ID:   product.SPU.Category1ID,
			Category1Code: product.SPU.Category1Code,
		},
		ProductSpuDetail: &v1.ProductSpuDetail{
			Id:           product.SPUDetail.ID,
			ProductSpuID: product.SPUDetail.ProductSpuID,
			Content:      string(product.SPUDetail.Detail),
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
					Images:        strings.Split(product.SPU.Images, ","),
					Description:   product.SPU.Description,
					Attributes: &v1.ProductAttrs{
						BasicAttrs: basicAttrs,
						SaleAttrs:  saleAttrs,
						SpecAttrs:  specAttrs,
					},
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
