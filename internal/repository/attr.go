package repository

import (
	"context"
	"rcc-stake-backed/internal/model"
)

type AttrRepository interface {
	FindAll(ctx context.Context) ([]model.Attr, error)
}

func NewAttrRepository(r *Repository) AttrRepository {
	return &attrRepository{
		Repository: r,
	}
}

type attrRepository struct {
	*Repository
}

func (r *attrRepository) FindAll(ctx context.Context) ([]model.Attr, error) {
	var attrs []model.Attr
	if err := r.DB(ctx).Find(&attrs).Error; err != nil {
		return nil, err
	}
	return attrs, nil
}
