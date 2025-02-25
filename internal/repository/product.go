package repository

import (
    "context"
	"rcc-stake-backed/internal/model"
)

type ProductRepository interface {
	GetProduct(ctx context.Context, id int64) (*model.Product, error)
}

func NewProductRepository(
	repository *Repository,
) ProductRepository {
	return &productRepository{
		Repository: repository,
	}
}

type productRepository struct {
	*Repository
}

func (r *productRepository) GetProduct(ctx context.Context, id int64) (*model.Product, error) {
	var product model.Product

	return &product, nil
}
