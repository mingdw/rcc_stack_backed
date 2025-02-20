package repository

import (
    "context"
	"rcc-stake-backed/internal/model"
)

type PoolRepository interface {
	GetPool(ctx context.Context, id int64) (*model.Pool, error)
}

func NewPoolRepository(
	repository *Repository,
) PoolRepository {
	return &poolRepository{
		Repository: repository,
	}
}

type poolRepository struct {
	*Repository
}

func (r *poolRepository) GetPool(ctx context.Context, id int64) (*model.Pool, error) {
	var pool model.Pool

	return &pool, nil
}
