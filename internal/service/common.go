package service

import (
	"context"
	"rcc-stake-mall-backed/internal/model"
	"rcc-stake-mall-backed/internal/repository"
)

type CommonService interface {
	GetCommon(ctx context.Context, id int64) (*model.Common, error)
}

func NewCommonService(
	service *Service,
	commonRepository repository.CommonRepository,
) CommonService {
	return &commonService{
		Service:          service,
		commonRepository: commonRepository,
	}
}

type commonService struct {
	*Service
	commonRepository repository.CommonRepository
}

func (s *commonService) GetCommon(ctx context.Context, id int64) (*model.Common, error) {
	return s.commonRepository.GetCommon(ctx, id)
}
