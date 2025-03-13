package service


import (
	"context"
	"math/big"
	"github.com/ethereum/go-ethereum/accounts/abi/bind"
	"github.com/ethereum/go-ethereum/common"
	"github.com/ethereum/go-ethereum/ethclient"

	"rcc-stake-mall-backed/contracts" // 导入您生成的合约绑定
)

// ContractService 处理与以太坊智能合约的交互
type ContractService struct {
	client      *ethclient.Client
	rccToken    *contracts.RccToken
	rccStake    *contracts.RCCStake
	tokenAddr   common.Address
	stakeAddr   common.Address
}

// NewContractService 创建一个新的合约服务
func NewContractService(rpcURL string, tokenAddress, stakeAddress common.Address) (*ContractService, error) {
	client, err := ethclient.Dial(rpcURL)
	if err != nil {
		return nil, err
	}
	
	// 初始化RccToken合约
	rccToken, err := contracts.NewRccToken(tokenAddress, client)
	if err != nil {
		return nil, err
	}
	
	// 初始化RCCStake合约
	rccStake, err := contracts.NewRCCStake(stakeAddress, client)
	if err != nil {
		return nil, err
	}
	
	return &ContractService{
		client:    client,
		rccToken:  rccToken,
		rccStake:  rccStake,
		tokenAddr: tokenAddress,
		stakeAddr: stakeAddress,
	}, nil
}

// GetTokenBalance 返回地址的RCC代币余额
func (s *ContractService) GetTokenBalance(ctx context.Context, address common.Address) (*big.Int, error) {
	return s.rccToken.BalanceOf(&bind.CallOpts{Context: ctx}, address)
}

// GetTokenName 返回代币名称
func (s *ContractService) GetTokenName(ctx context.Context) (string, error) {
	return s.rccToken.Name(&bind.CallOpts{Context: ctx})
}

// GetTokenSymbol 返回代币符号
func (s *ContractService) GetTokenSymbol(ctx context.Context) (string, error) {
	return s.rccToken.Symbol(&bind.CallOpts{Context: ctx})
}

// GetStakingBalance 返回地址在特定池中的质押余额
func (s *ContractService) GetStakingBalance(ctx context.Context, poolId *big.Int, address common.Address) (*big.Int, error) {
	return s.rccStake.StakingBalance(&bind.CallOpts{Context: ctx}, poolId, address)
}

// GetPendingRewards 返回地址在特定池中的待领取奖励
func (s *ContractService) GetPendingRewards(ctx context.Context, poolId *big.Int, address common.Address) (*big.Int, error) {
	return s.rccStake.PendingRCC(&bind.CallOpts{Context: ctx}, poolId, address)
}

// GetPoolInfo 返回质押池的信息
func (s *ContractService) GetPoolInfo(ctx context.Context, poolId *big.Int) (struct {
	StTokenAddress     common.Address
	PoolWeight         *big.Int
	LastRewardBlock    *big.Int
	AccRCCPerST        *big.Int
	StTokenAmount      *big.Int
	MinDepositAmount   *big.Int
	UnstakeLockedBlocks *big.Int
}, error) {
	return s.rccStake.Pool(&bind.CallOpts{Context: ctx}, poolId)
}