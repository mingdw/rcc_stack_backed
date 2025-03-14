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
	GetPoolInfos(ctx context.Context) ([]struct {
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

func (s *contractService) GetPoolInfos(ctx context.Context) ([]struct {
	StTokenAddress      common.Address
	PoolWeight          *big.Int
	LastRewardBlock     *big.Int
	AccRCCPerST         *big.Int
	StTokenAmount       *big.Int
	MinDepositAmount    *big.Int
	UnstakeLockedBlocks *big.Int
}, error) {
	// 获取池子数量
	poolLength, err := s.rccStake.PoolLength(&bind.CallOpts{Context: ctx})
	if err != nil {
		return nil, err
	}

	// 创建结果切片
	result := make([]struct {
		StTokenAddress      common.Address
		PoolWeight          *big.Int
		LastRewardBlock     *big.Int
		AccRCCPerST         *big.Int
		StTokenAmount       *big.Int
		MinDepositAmount    *big.Int
		UnstakeLockedBlocks *big.Int
	}, 0, poolLength.Int64())

	// 遍历所有池子获取信息
	for i := int64(0); i < poolLength.Int64(); i++ {
		poolId := big.NewInt(i)
		poolInfo, err := s.rccStake.Pool(&bind.CallOpts{Context: ctx}, poolId)
		if err != nil {
			return nil, err
		}

		// 将池信息添加到结果中
		result = append(result, struct {
			StTokenAddress      common.Address
			PoolWeight          *big.Int
			LastRewardBlock     *big.Int
			AccRCCPerST         *big.Int
			StTokenAmount       *big.Int
			MinDepositAmount    *big.Int
			UnstakeLockedBlocks *big.Int
		}{
			StTokenAddress:      poolInfo.StTokenAddress,
			PoolWeight:          poolInfo.PoolWeight,
			LastRewardBlock:     poolInfo.LastRewardBlock,
			AccRCCPerST:         poolInfo.AccRCCPerST,
			StTokenAmount:       poolInfo.StTokenAmount,
			MinDepositAmount:    poolInfo.MinDepositAmount,
			UnstakeLockedBlocks: poolInfo.UnstakeLockedBlocks,
		})
	}

	return result, nil
}
