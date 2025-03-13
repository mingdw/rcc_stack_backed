package service

import (
	"context"
	"math/big"
	"rcc-stake-mall-backed/contracts"

	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/ethclient"
)

type ContractService interface {
	GetTokenBalance(ctx context.Context, address common.Address) (*big.Int, error)
	GetTokenName(ctx context.Context) (string, error)
	GetTokenSymbol(ctx context.Context) (string, error)
	GetStakingBalance(ctx context.Context, poolId *big.Int, address common.Address) (*big.Int, error)
	GetPendingRewards(ctx context.Context, poolId *big.Int, address common.Address) (*big.Int, error)
	GetPoolInfo(ctx context.Context, poolId *big.Int) (struct {
		StTokenAddress      common.Address
		PoolWeight          *big.Int
		LastRewardBlock     *big.Int
		AccRCCPerST         *big.Int
		StTokenAmount       *big.Int
		MinDepositAmount    *big.Int
		UnstakeLockedBlocks *big.Int
	}, error)
}

func NewContractService(
	service *Service,
	client *ethclient.Client,
	tokenAddr string,
	stakeAddr string,
) (ContractService, error) {
	rccToken, err := contracts.NewRccToken(common.HexToAddress(tokenAddr), client)
	if err != nil {
		return nil, err
	}
	rccStake, err := contracts.NewRCCStake(common.HexToAddress(stakeAddr), client)
	if err != nil {
		return nil, err
	}
	return &contractService{
		Service:  service,
		client:   client,
		rccToken: rccToken,
		rccStake: rccStake,
	}, nil
}

type contractService struct {
	*Service
	client   *ethclient.Client
	rccToken *contracts.RccToken
	rccStake *contracts.RCCStake
}

func (s *contractService) GetTokenBalance(ctx context.Context, address common.Address) (*big.Int, error) {
	return s.rccToken.BalanceOf(&bind.CallOpts{Context: ctx}, address)
}

func (s *contractService) GetTokenName(ctx context.Context) (string, error) {
	return s.rccToken.Name(&bind.CallOpts{Context: ctx})
}

func (s *contractService) GetTokenSymbol(ctx context.Context) (string, error) {
	return s.rccToken.Symbol(&bind.CallOpts{Context: ctx})
}

func (s *contractService) GetStakingBalance(ctx context.Context, poolId *big.Int, address common.Address) (*big.Int, error) {
	return s.rccStake.StakingBalance(&bind.CallOpts{Context: ctx}, poolId, address)
}

func (s *contractService) GetPendingRewards(ctx context.Context, poolId *big.Int, address common.Address) (*big.Int, error) {
	return s.rccStake.PendingRCC(&bind.CallOpts{Context: ctx}, poolId, address)
}

func (s *contractService) GetPoolInfo(ctx context.Context, poolId *big.Int) (struct {
	StTokenAddress      common.Address
	PoolWeight          *big.Int
	LastRewardBlock     *big.Int
	AccRCCPerST         *big.Int
	StTokenAmount       *big.Int
	MinDepositAmount    *big.Int
	UnstakeLockedBlocks *big.Int
}, error) {
	return s.rccStake.Pool(&bind.CallOpts{Context: ctx}, poolId)
}
