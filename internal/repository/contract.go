package repository

import (
    "context"
	"rcc-stake-mall-backed/internal/model"
)

type ContractRepository interface {
	GetContract(ctx context.Context, id int64) (*model.Contract, error)
}

func NewContractRepository(
	repository *Repository,
) ContractRepository {
	return &contractRepository{
		Repository: repository,
	}
}

type contractRepository struct {
	*Repository
}

func (r *contractRepository) GetContract(ctx context.Context, id int64) (*model.Contract, error) {
	var contract model.Contract

	return &contract, nil
}
