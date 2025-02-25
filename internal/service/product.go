package service

import (
    "context"
	"rcc-stake-backed/internal/model"
	"rcc-stake-backed/internal/repository"
)

type ProductService interface {
	GetProduct(ctx context.Context, id int64) (*model.Product, error)
}
func NewProductService(
    service *Service,
    productRepository repository.ProductRepository,
) ProductService {
	return &productService{
		Service:        service,
		productRepository: productRepository,
	}
}

type productService struct {
	*Service
	productRepository repository.ProductRepository
}

func (s *productService) GetProduct(ctx context.Context, id int64) (*model.Product, error) {
	return s.productRepository.GetProduct(ctx, id)
}
