package model

import "time"

type Address struct {
	ID           int64     `json:"id" gorm:"primaryKey;column:id;comment:主键ID"`
	Code         string    `json:"code" gorm:"column:code;type:varchar(20);not null;comment:地址编码"`
	Name         string    `json:"name" gorm:"column:name;type:varchar(50);not null;comment:地址名称"`
	ParentCode   string    `json:"parentCode" gorm:"column:parent_code;type:varchar(20);comment:父级编码"`
	Level        int       `json:"level" gorm:"column:level;type:tinyint;not null;comment:地址级别（1:省级 2:市级 3:区县级 4:街道级 5:详细地址）"`
	ProvinceCode string    `json:"provinceCode" gorm:"column:province_code;type:varchar(20);comment:省级编码"`
	ProvinceName string    `json:"provinceName" gorm:"column:province_name;type:varchar(50);comment:省级名称"`
	CityCode     string    `json:"cityCode" gorm:"column:city_code;type:varchar(20);comment:市级编码"`
	CityName     string    `json:"cityName" gorm:"column:city_name;type:varchar(50);comment:市级名称"`
	DistrictCode string    `json:"districtCode" gorm:"column:district_code;type:varchar(20);comment:区县级编码"`
	DistrictName string    `json:"districtName" gorm:"column:district_name;type:varchar(50);comment:区县级名称"`
	StreetCode   string    `json:"streetCode" gorm:"column:street_code;type:varchar(20);comment:街道级编码"`
	StreetName   string    `json:"streetName" gorm:"column:street_name;type:varchar(50);comment:街道级名称"`
	FullAddress  string    `json:"fullAddress" gorm:"column:full_address;type:varchar(500);comment:完整地址"`
	Postcode     string    `json:"postcode" gorm:"column:postcode;type:varchar(10);comment:邮政编码"`
	Sort         int       `json:"sort" gorm:"column:sort;type:int;default:0;comment:排序"`
	CreatedAt    time.Time `json:"createdAt" gorm:"column:created_at;type:datetime;not null;comment:创建时间"`
	UpdatedAt    time.Time `json:"updatedAt" gorm:"column:updated_at;type:datetime;not null;comment:更新时间"`
	Creator      string    `json:"creator" gorm:"column:creator;type:varchar(64);comment:创建人"`
	Updator      string    `json:"updator" gorm:"column:updator;type:varchar(64);comment:更新人"`
	IsDeleted    int       `json:"isDeleted" gorm:"column:is_deleted;type:tinyint;not null;default:0;comment:是否删除（0：未删除 1：已删除）"`
}

// TableName 表名
func (m *Address) TableName() string {
	return "sys_address"
}
