package model

import (
	"time"
)

// CategoryAttrGroup 目录-属性组关联
type CategoryAttrGroup struct {
	ID            uint      `json:"id" gorm:"primaryKey"`
	CategoryID    uint      `json:"categoryId" gorm:"column:category_id;not null;default:0;comment:商品目录分类id"`
	CategoryCode  string    `json:"categoryCode" gorm:"column:category_code;not null;default:'';comment:商品目录分类编码"`
	AttrGroupID   uint      `json:"attrGroupId" gorm:"column:attr_group_id;not null;default:0;comment:属性组id"`
	AttrGroupCode string    `json:"attrGroupCode" gorm:"column:attr_group_code;not null;default:'';comment:属性组编码"`
	CreatedAt     time.Time `json:"createdAt" gorm:"column:created_at;default:CURRENT_TIMESTAMP;comment:创建时间"`
	UpdatedAt     time.Time `json:"updatedAt" gorm:"column:updated_at;default:CURRENT_TIMESTAMP;comment:更新时间"`
	IsDeleted     int       `json:"isDeleted" gorm:"column:is_deleted;default:0;comment:是否删除"`
	Creator       string    `json:"creator" gorm:"column:creator;not null;default:'';comment:创建人"`
	Updator       string    `json:"updator" gorm:"column:updator;not null;default:'';comment:更新人"`
}

// TableName 表名
func (m *CategoryAttrGroup) TableName() string {
	return "rcc_category_attr_group"
}

// Attr 属性
