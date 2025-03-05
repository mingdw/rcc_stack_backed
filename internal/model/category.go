package model

import "time"

// Category 商品目录分类
type Category struct {
	ID         uint      `json:"id" gorm:"primaryKey"`
	Code       string    `json:"code" gorm:"column:code;not null;default:'';comment:编码"`
	Name       string    `json:"name" gorm:"column:name;not null;default:'';comment:名称"`
	ParentID   uint      `json:"parentId" gorm:"column:parent_id;not null;default:0;comment:父级id"`
	ParentCode string    `json:"parentCode" gorm:"column:parent_code;not null;default:'';comment:父级编码"`
	Level      int       `json:"level" gorm:"column:level;not null;default:0;comment:级别"`
	Sort       int       `json:"sort" gorm:"column:sort;not null;default:0;comment:排序"`
	Icon       string    `json:"icon" gorm:"column:icon;not null;default:'';comment:图标"`
	CreatedAt  time.Time `json:"createdAt" gorm:"column:created_at;default:CURRENT_TIMESTAMP;comment:创建时间"`
	UpdatedAt  time.Time `json:"updatedAt" gorm:"column:updated_at;default:CURRENT_TIMESTAMP;comment:更新时间"`
	IsDeleted  int       `json:"isDeleted" gorm:"column:is_deleted;default:0;comment:是否删除"`
	Creator    string    `json:"creator" gorm:"column:creator;not null;default:'';comment:创建人"`
	Updator    string    `json:"updator" gorm:"column:updator;not null;default:'';comment:更新人"`
}

// TableName 表名
func (m *Category) TableName() string {
	return "sys_category"
}
