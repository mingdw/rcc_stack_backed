package v1

import "rcc-stake-backed/internal/model"

type UserAddressListRequest struct {
	UserID   int64  `json:"userId"`
	UserCode string `json:"userCode"`
}

type UserAddressListResponse struct {
	UserAddresses []*UserAddress `json:"user_addresses"`
}

type UserAddress struct {
	*model.UserAddress
}

type UserAddressModifyRequest struct {
	ID           int64  `json:"id"`
	UserID       int64  `json:"userId"`       // 用户id
	UserCode     string `json:"userCode"`     // 用户编码
	ProvinceCode string `json:"provinceCode"` // 省编码
	ProvinceName string `json:"provinceName"` // 省名称
	CityCode     string `json:"cityCode"`     // 市编码
	CityName     string `json:"cityName"`     // 市名称
	DistrictCode string `json:"districtCode"` // 区编码
	DistrictName string `json:"districtName"` // 区名称
	StreetCode   string `json:"streetCode"`   // 街道编码
	StreetName   string `json:"streetName"`   // 街道名称
	HouseAddress string `json:"houseAddress"` // 门牌号
	FullAddress  string `json:"fullAddress"`  // 完整地址
	IsDefault    int    `json:"isDefault"`    // 是否默认
	Longitude    string `json:"longitude"`    // 经度
	Latitude     string `json:"latitude"`     // 纬度
	IsDeleted    int    `json:"isDeleted"`    // 是否删除
	Creator      string `json:"creator"`      // 创建人
	Updator      string `json:"updator"`
}

type UpdateUserAddressRequest struct {
	ID           int64  `json:"id"`
	UserID       int64  `json:"userId"`       // 用户id
	UserCode     string `json:"userCode"`     // 用户编码
	ProvinceCode string `json:"provinceCode"` // 省编码
	ProvinceName string `json:"provinceName"` // 省名称
	CityCode     string `json:"cityCode"`     // 市编码
	CityName     string `json:"cityName"`     // 市名称
	DistrictCode string `json:"districtCode"` // 区编码
	DistrictName string `json:"districtName"` // 区名称
	StreetCode   string `json:"streetCode"`   // 街道编码
	StreetName   string `json:"streetName"`   // 街道名称
	HouseAddress string `json:"houseAddress"` // 门牌号
	FullAddress  string `json:"fullAddress"`  // 完整地址
	IsDefault    int    `json:"isDefault"`    // 是否默认
	Longitude    string `json:"longitude"`    // 经度
	Latitude     string `json:"latitude"`     // 纬度
	IsDeleted    int    `json:"isDeleted"`    // 是否删除
	Creator      string `json:"creator"`      // 创建人
	Updator      string `json:"updator"`
}
