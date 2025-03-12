package repository

import (
	"context"
	"rcc-stake-mall-backed/internal/model"
)

type PriceRepository interface {
	GetPrice(ctx context.Context, id int64) (*model.Price, error)
}

func NewPriceRepository(
	repository *Repository,
) PriceRepository {
	return &priceRepository{
		Repository: repository,
	}
}

type priceRepository struct {
	*Repository
}

func (r *priceRepository) GetPrice(ctx context.Context, id int64) (*model.Price, error) {
	var price model.Price

	return &price, nil
}
