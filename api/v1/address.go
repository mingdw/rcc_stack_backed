package v1

import "rcc-stake-mall-backed/internal/model"

type AddressListRequest struct {
	Level      int    `json:"level"`
	ParentCode string `json:"parentCode"`
}

type AddressListResponse struct {
	Addresses []*Address `json:"addresses"`
}

type Address struct {
	*model.Address
	Children []*Address `json:"children,omitempty"` // 添加子节点字段，用于树形结构
}
