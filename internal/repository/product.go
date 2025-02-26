package repository

import (
	"context"
	"rcc-stake-backed/internal/model"
)

type ProductRepository interface {
	GetProduct(ctx context.Context, id int64) (*model.Product, error)
	ListProductsByCategoryCodes(ctx context.Context, categoryCodes []string, productName string, page, pageSize int) ([]*model.Product, int64, error)
	GetCategories(ctx context.Context, categoryCodes []string) ([]*model.Category, error)
}

func NewProductRepository(
	repository *Repository,
	productSpuRepository *ProductSpuRepository,
	productSpuDetailRepository *ProductSpuDetailRepository,
	productSpuAttrParamsRepository *ProductSpuAttrParamsRepository,
	productSkuRepository *ProductSkuRepository,
) ProductRepository {
	return &productRepository{
		Repository:                     repository,
		productSpuRepository:           productSpuRepository,
		productSpuDetailRepository:     productSpuDetailRepository,
		productSpuAttrParamsRepository: productSpuAttrParamsRepository,
		productSkuRepository:           productSkuRepository,
	}
}

type productRepository struct {
	*Repository
	productSpuRepository           *ProductSpuRepository
	productSpuDetailRepository     *ProductSpuDetailRepository
	productSpuAttrParamsRepository *ProductSpuAttrParamsRepository
	productSkuRepository           *ProductSkuRepository
}

func (r *productRepository) GetProduct(ctx context.Context, id int64) (*model.Product, error) {
	var product model.Product
	err := r.DB(ctx).
		Where("id = ? AND is_deleted = ?", id, 0).
		First(&product).Error
	if err != nil {
		return nil, err
	}
	return &product, nil
}

func (r *productRepository) ListProductsByCategoryCodes(ctx context.Context, categoryCodes []string, productName string, page, pageSize int) ([]*model.Product, int64, error) {
	var products []*model.Product
	var total int64

	query := r.DB(ctx)

	if len(categoryCodes) > 0 {
		query = query.Where("category1_code  IN ?  or category2_code IN ? or category3_code IN ?", categoryCodes, categoryCodes, categoryCodes)
	}

	if productName != "" {
		query = query.Where("name LIKE ?", "%"+productName+"%")
	}

	// 获取总数
	err := query.Model(&model.Product{}).Count(&total).Error
	if err != nil {
		return nil, 0, err
	}

	// 获取分页数据
	err = query.Offset((page - 1) * pageSize).
		Limit(pageSize).
		Find(&products).Error
	if err != nil {
		return nil, 0, err
	}

	return products, total, nil
}

func (r *productRepository) GetCategories(ctx context.Context, categoryCodes []string) ([]*model.Category, error) {
	var categories []*model.Category

	query := r.DB(ctx)
	if len(categoryCodes) > 0 {
		query = query.Where("code IN ?", categoryCodes)
	}

	err := query.Find(&categories).Error
	if err != nil {
		return nil, err
	}

	return categories, nil
}
