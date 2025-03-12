package service

import (
	"context"
	"rcc-stake-mall-backed/internal/model"
	"rcc-stake-mall-backed/internal/repository"
)

type PriceService interface {
	GetPrice(ctx context.Context, id int64) (*model.Price, error)
}

func NewPriceService(
	service *Service,
	priceRepository repository.PriceRepository,
) PriceService {
	return &priceService{
		Service:         service,
		priceRepository: priceRepository,
	}
}

type priceService struct {
	*Service
	priceRepository repository.PriceRepository
}

func (s *priceService) GetPrice(ctx context.Context, id int64) (*model.Price, error) {
	return s.priceRepository.GetPrice(ctx, id)
}
