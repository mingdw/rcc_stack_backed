package repository

import (
	"context"
	"rcc-stake-mall-backed/internal/model"
)

type AttrGroupRepository interface {
	FindAll(ctx context.Context) ([]model.AttrGroup, error)
}

func NewAttrGroupRepository(r *Repository) AttrGroupRepository {
	return &attrGroupRepository{
		Repository: r,
	}
}

type attrGroupRepository struct {
	*Repository
}

func (r *attrGroupRepository) FindAll(ctx context.Context) ([]model.AttrGroup, error) {
	var attrGroups []model.AttrGroup
	if err := r.DB(ctx).Find(&attrGroups).Error; err != nil {
		return nil, err
	}
	return attrGroups, nil
}
