package service

import (
	"context"
	v1 "rcc-stake-mall-backed/api/v1"
	"rcc-stake-mall-backed/internal/model"
	"rcc-stake-mall-backed/internal/repository"
	"sort"
)

type AddressService interface {
	// Create 创建地址
	Create(ctx context.Context, address *model.Address) error
	// Update 更新地址
	Update(ctx context.Context, address *model.Address) error
	// Delete 删除地址
	Delete(ctx context.Context, id int64) error
	// Get 获取单个地址
	Get(ctx context.Context, id int64) (*model.Address, error)
	// GetByCode 根据编码获取地址
	GetByCode(ctx context.Context, code string) (*model.Address, error)
	// List 获取地址列表
	List(ctx context.Context, level int, parentCode string) ([]*model.Address, error)
	// GetAll 获取所有地址
	GetAll(ctx context.Context, request *v1.AddressListRequest) (response *v1.AddressListResponse, err error)
}

func NewAddressService(
	service *Service,
	addressRepository repository.AddressRepository,
) AddressService {
	return &addressService{
		Service:           service,
		addressRepository: addressRepository,
	}
}

type addressService struct {
	*Service
	addressRepository repository.AddressRepository
}

func (s *addressService) Create(ctx context.Context, address *model.Address) error {
	return s.addressRepository.Create(ctx, address)
}

func (s *addressService) Update(ctx context.Context, address *model.Address) error {
	return s.addressRepository.Update(ctx, address)
}

func (s *addressService) Delete(ctx context.Context, id int64) error {
	return s.addressRepository.Delete(ctx, id)
}

func (s *addressService) Get(ctx context.Context, id int64) (*model.Address, error) {
	return s.addressRepository.FindByID(ctx, id)
}

func (s *addressService) GetByCode(ctx context.Context, code string) (*model.Address, error) {
	return s.addressRepository.FindByCode(ctx, code)
}

func (s *addressService) List(ctx context.Context, level int, parentCode string) ([]*model.Address, error) {
	if level > 0 {
		return s.addressRepository.FindByLevel(ctx, level)
	}
	if parentCode != "" {
		return s.addressRepository.FindByParentCode(ctx, parentCode)
	}
	response := make([]*model.Address, 0)
	return response, nil
}

func (s *addressService) GetAll(ctx context.Context, request *v1.AddressListRequest) (response *v1.AddressListResponse, err error) {
	// 初始化响应对象
	response = &v1.AddressListResponse{
		Addresses: make([]*v1.Address, 0),
	}

	// 获取所有地址
	addresses, err := s.addressRepository.FindAll(ctx, int64(request.Level), request.ParentCode)
	if err != nil {
		return nil, err
	}

	// 构建地址映射，用于快速查找
	addressMap := make(map[string]*v1.Address)

	// 第一步：转换所有地址为v1.Address并建立映射
	for _, addr := range addresses {
		addressMap[addr.Code] = &v1.Address{
			Address:  addr, // addr 现在已经是 *model.Address 类型
			Children: make([]*v1.Address, 0),
		}
	}

	// 第二步：构建树形结构
	for _, addr := range addresses {
		if addr.Level == 1 { // 省级节点作为根节点
			response.Addresses = append(response.Addresses, addressMap[addr.Code])
		} else {
			// 找到父节点，将当前节点添加到父节点的子节点中
			if parent, exists := addressMap[addr.ParentCode]; exists {
				parent.Children = append(parent.Children, addressMap[addr.Code])
			}
		}
	}

	// 第三步：递归排序
	sortAddressTree(response.Addresses)

	return response, nil
}

// sortAddressTree 递归对地址树进行排序
func sortAddressTree(addresses []*v1.Address) {
	// 按Sort字段排序当前层级
	sort.Slice(addresses, func(i, j int) bool {
		return addresses[i].Sort < addresses[j].Sort
	})

	// 递归排序子节点
	for _, addr := range addresses {
		if len(addr.Children) > 0 {
			sortAddressTree(addr.Children)
		}
	}
}
