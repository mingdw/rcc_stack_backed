package repository

import (
	"context"
	"rcc-stake-mall-backed/internal/model"

	"gorm.io/gorm"
)

type CategoryRepository interface {
	GetCategory(ctx context.Context, id int64) (*model.Category, error)
	FindAll(ctx context.Context) ([]model.Category, error)
	GetCategories(ctx context.Context, categoryCodes []string) ([]*model.Category, error)
	GetCategoriesByParams(ctx context.Context, params *model.Category) ([]*model.Category, error)
	Create(ctx context.Context, category *model.Category) error
	Update(ctx context.Context, category *model.Category) error
	GetCategoryByCode(ctx context.Context, code string) (*model.Category, error)
	Delete(ctx context.Context, id int64) error
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

func (r *categoryRepository) Create(ctx context.Context, category *model.Category) error {
	return r.DB(ctx).Create(category).Error
}

func (r *categoryRepository) Update(ctx context.Context, category *model.Category) error {
	return r.DB(ctx).Updates(category).Error
}

func (r *categoryRepository) GetCategoryByCode(ctx context.Context, code string) (*model.Category, error) {
	var category model.Category
	if err := r.DB(ctx).Where("code = ? and is_deleted = 0", code).First(&category).Limit(1).Error; err != nil {
		if err == gorm.ErrRecordNotFound {
			return nil, nil
		}
		return nil, err
	}
	return &category, nil
}

func (r *categoryRepository) Delete(ctx context.Context, id int64) error {
	return r.DB(ctx).Where("id = ? and is_deleted = 0", id).Delete(&model.Category{}).Error
}
