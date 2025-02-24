package model

import "time"

type Attr struct {
	ID          uint      `json:"id" gorm:"primaryKey"`
	AttrName    string    `json:"attrName" gorm:"column:attr_name;not null;default:'';comment:名称"`
	AttrCode    string    `json:"attrCode" gorm:"column:attr_code;not null;default:'';comment:编码"`
	AttrGroupID uint      `json:"attrGroupId" gorm:"column:attr_group_id;not null;default:0;comment:属性组id"`
	Icon        string    `json:"icon" gorm:"column:icon;not null;default:'';comment:图标"`
	AttrType    int       `json:"attrType" gorm:"column:attr_type;not null;default:0;comment:属性类型"`
	Status      int       `json:"status" gorm:"column:status;not null;default:0;comment:状态"`
	Sort        int       `json:"sort" gorm:"column:sort;not null;default:0;comment:排序"`
	CreatedAt   time.Time `json:"createdAt" gorm:"column:created_at;default:CURRENT_TIMESTAMP;comment:创建时间"`
	UpdatedAt   time.Time `json:"updatedAt" gorm:"column:updated_at;default:CURRENT_TIMESTAMP;comment:更新时间"`
	IsDeleted   int       `json:"isDeleted" gorm:"column:is_deleted;default:0;comment:是否删除"`
	Creator     string    `json:"creator" gorm:"column:creator;not null;default:'';comment:创建人"`
	Updator     string    `json:"updator" gorm:"column:updator;not null;default:'';comment:更新人"`
}

// TableName 表名
func (m *Attr) TableName() string {
	return "rcc_attr"
}
