package repository

import (
	"context"
	"rcc-stake-backed/internal/model"
)

type ProductSpuRepository interface {
	GetProductSpu(ctx context.Context, id int64) (*model.ProductSpu, error)
	ListProductSpus(ctx context.Context, productId int64) ([]*model.ProductSpu, error)
	CreateProductSpu(ctx context.Context, spu *model.ProductSpu) error
	UpdateProductSpu(ctx context.Context, spu *model.ProductSpu) error
	DeleteProductSpu(ctx context.Context, id int64) error
}

func NewProductSpuRepository(repository *Repository) ProductSpuRepository {
	return &productSpuRepository{Repository: repository}
}

type productSpuRepository struct {
	*Repository
}

func (r *productSpuRepository) GetProductSpu(ctx context.Context, id int64) (*model.ProductSpu, error) {
	var spu model.ProductSpu
	err := r.DB(ctx).Where("id = ? AND is_deleted = ?", id, 0).
		First(&spu).Error
	if err != nil {
		return nil, err
	}
	return &spu, nil
}

func (r *productSpuRepository) ListProductSpus(ctx context.Context, productId int64) ([]*model.ProductSpu, error) {
	var spus []*model.ProductSpu
	err := r.DB(ctx).Where("product_id = ? AND is_deleted = ?", productId, 0).
		Find(&spus).Error
	if err != nil {
		return nil, err
	}
	return spus, nil
}

func (r *productSpuRepository) CreateProductSpu(ctx context.Context, spu *model.ProductSpu) error {
	return r.DB(ctx).Create(spu).Error
}

func (r *productSpuRepository) UpdateProductSpu(ctx context.Context, spu *model.ProductSpu) error {
	return r.DB(ctx).Where("id = ?", spu.ID).
		Updates(map[string]interface{}{
			"product_id": spu.ID,
			"name":       spu.Name,
			"status":     spu.Status,
			"updated_at": spu.UpdatedAt,
		}).Error
}

func (r *productSpuRepository) DeleteProductSpu(ctx context.Context, id int64) error {
	return r.DB(ctx).
		Model(&model.ProductSpu{}).
		Where("id = ?", id).
		Update("is_deleted", 1).Error
}
