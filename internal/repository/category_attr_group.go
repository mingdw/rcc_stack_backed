package repository

import (
	"context"
	"rcc-stake-mall-backed/internal/model"
)

type CategoryAttrGroupRepository interface {
	FindAll(ctx context.Context) ([]model.CategoryAttrGroup, error)
}

type categoryAttrGroupRepository struct {
	*Repository
}

func NewCategoryAttrGroupRepository(r *Repository) CategoryAttrGroupRepository {
	return &categoryAttrGroupRepository{
		Repository: r,
	}
}

func (r *categoryAttrGroupRepository) FindAll(ctx context.Context) ([]model.CategoryAttrGroup, error) {
	var categoryAttrGroups []model.CategoryAttrGroup
	if err := r.DB(ctx).Find(&categoryAttrGroups).Error; err != nil {
		return nil, err
	}
	return categoryAttrGroups, nil
}
