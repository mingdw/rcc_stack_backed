package service

import (
	"context"
	"rcc-stake-mall-backed/internal/model"
	"rcc-stake-mall-backed/internal/repository"
)

type PoolService interface {
	GetPool(ctx context.Context, id int64) (*model.Pool, error)
}

func NewPoolService(
	service *Service,
	poolRepository repository.PoolRepository,
) PoolService {
	return &poolService{
		Service:        service,
		poolRepository: poolRepository,
	}
}

type poolService struct {
	*Service
	poolRepository repository.PoolRepository
}

func (s *poolService) GetPool(ctx context.Context, id int64) (*model.Pool, error) {
	return s.poolRepository.GetPool(ctx, id)
}
