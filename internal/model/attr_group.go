package model

import "time"

// AttrGroup 属性组
type AttrGroup struct {
	ID            uint      `json:"id" gorm:"primaryKey"`
	AttrGroupName string    `json:"attrGroupName" gorm:"column:attr_group_name;not null;default:'';comment:名称"`
	AttrGroupCode string    `json:"attrGroupCode" gorm:"column:attr_group_code;not null;default:'';comment:编码"`
	Type          int       `json:"type" gorm:"column:type;not null;default:0;comment:类型"`
	Status        int       `json:"status" gorm:"column:status;not null;default:0;comment:状态"`
	Sort          int       `json:"sort" gorm:"column:sort;not null;default:0;comment:排序"`
	Description   string    `json:"description" gorm:"column:description;not null;default:'';comment:描述"`
	CreatedAt     time.Time `json:"createdAt" gorm:"column:created_at;default:CURRENT_TIMESTAMP;comment:创建时间"`
	UpdatedAt     time.Time `json:"updatedAt" gorm:"column:updated_at;default:CURRENT_TIMESTAMP;comment:更新时间"`
	IsDeleted     int       `json:"isDeleted" gorm:"column:is_deleted;default:0;comment:是否删除"`
	Creator       string    `json:"creator" gorm:"column:creator;not null;default:'';comment:创建人"`
	Updator       string    `json:"updator" gorm:"column:updator;not null;default:'';comment:更新人"`
}

// TableName 表名
func (m *AttrGroup) TableName() string {
	return "rcc_attr_group"
}
