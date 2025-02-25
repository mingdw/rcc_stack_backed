package model

import "time"

// ProductSkuAttr 商品sku属性关联表
type ProductSkuAttr struct {
	ID             int64     `gorm:"column:id;primaryKey;autoIncrement" json:"id"`
	ProductSkuID   int64     `gorm:"column:product_sku_id;not null" json:"productSkuId"`     // 商品sku id
	ProductSkuCode string    `gorm:"column:product_sku_code;not null" json:"productSkuCode"` // 商品sku编码
	AttrID         int64     `gorm:"column:attr_id;not null" json:"attrId"`                  // 属性id
	CreatedAt      time.Time `gorm:"column:created_at" json:"createdAt"`                     // 创建时间
	UpdatedAt      time.Time `gorm:"column:updated_at" json:"updatedAt"`                     // 更新时间
	IsDeleted      int       `gorm:"column:is_deleted" json:"isDeleted"`                     // 是否删除
	Creator        string    `gorm:"column:creator;not null" json:"creator"`                 // 创建人
	Updator        string    `gorm:"column:updator;not null" json:"updator"`                 // 更新人
}

// TableName 表名
func (p *ProductSkuAttr) TableName() string {
	return "rcc_product_sku_attr"
}
