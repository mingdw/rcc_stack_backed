package repository

import (
	"context"
	"rcc-stake-mall-backed/internal/model"
)

type CategoryRepository interface {
	GetCategory(ctx context.Context, id int64) (*model.Category, error)
	FindAll(ctx context.Context) ([]model.Category, error)
	GetCategories(ctx context.Context, categoryCodes []string) ([]*model.Category, error)
	GetCategoriesByParams(ctx context.Context, params *model.Category) ([]*model.Category, error)
}

func NewCategoryRepository(
	r *Repository,
) CategoryRepository {
	return &categoryRepository{
		Repository: r,
	}
}

type categoryRepository struct {
	*Repository
}

func (r *categoryRepository) GetCategory(ctx context.Context, id int64) (*model.Category, error) {
	var category model.Category

	return &category, nil
}

func (r *categoryRepository) FindAll(ctx context.Context) ([]model.Category, error) {
	var categories []model.Category
	if err := r.DB(ctx).Where("is_deleted = ?", 0).Find(&categories).Error; err != nil {
		return nil, err
	}
	return categories, nil
}

func (r *categoryRepository) GetCategories(ctx context.Context, categoryCodes []string) ([]*model.Category, error) {
	var categories []*model.Category
	if err := r.DB(ctx).Where("is_deleted = ?", 0).Where("code IN ?", categoryCodes).Find(&categories).Error; err != nil {
		return nil, err
	}
	return categories, nil
}

func (r *categoryRepository) GetCategoriesByParams(ctx context.Context, params *model.Category) ([]*model.Category, error) {
	var categories []*model.Category
	if err := r.DB(ctx).Where("is_deleted = ?", 0).Where(params).Find(&categories).Error; err != nil {
		return nil, err
	}
	return categories, nil
}
