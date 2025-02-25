package model

import "time"

// ProductSpuAttr 商品spu属性关联表
type ProductSpuAttr struct {
	ID             int64     `gorm:"column:id;primaryKey;autoIncrement" json:"id"`
	ProductSpuID   int64     `gorm:"column:product_spu_id;not null" json:"productSpuId"`     // 商品spu id
	ProductSpuCode string    `gorm:"column:product_spu_code;not null" json:"productSpuCode"` // 商品spu编码
	AttrID         int64     `gorm:"column:attr_id;not null" json:"attrId"`                  // 属性id
	AttrCode       string    `gorm:"column:attr_code;not null" json:"attrCode"`              // 属性编码
	Description    string    `gorm:"column:description;not null" json:"description"`         // 描述
	CreatedAt      time.Time `gorm:"column:created_at" json:"createdAt"`                     // 创建时间
	UpdatedAt      time.Time `gorm:"column:updated_at" json:"updatedAt"`                     // 更新时间
	IsDeleted      int       `gorm:"column:is_deleted" json:"isDeleted"`                     // 是否删除
	Creator        string    `gorm:"column:creator;not null" json:"creator"`                 // 创建人
	Updator        string    `gorm:"column:updator;not null" json:"updator"`                 // 更新人
}

// TableName 表名
func (p *ProductSpuAttr) TableName() string {
	return "rcc_product_spu_attr"
}
