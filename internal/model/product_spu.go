package model

import "time"

// ProductSpu 商品spu表
type ProductSpu struct {
	ID           int64     `gorm:"column:id;primaryKey;autoIncrement" json:"id"`
	Code         string    `gorm:"column:code;not null" json:"code"`                  // 编码
	Name         string    `gorm:"column:name;not null" json:"name"`                  // 名称
	CategoryID   int64     `gorm:"column:category_id;not null" json:"categoryId"`     // 商品目录分类id
	CategoryCode string    `gorm:"column:category_code;not null" json:"categoryCode"` // 商品目录分类编码
	Brand        string    `gorm:"column:brand;not null" json:"brand"`                // 品牌
	Description  string    `gorm:"column:description;not null" json:"description"`    // 描述
	Status       int       `gorm:"column:status;not null" json:"status"`              // 状态
	Images       string    `gorm:"column:images;not null" json:"images"`              // 图片
	TotalSales   int       `gorm:"column:total_sales;not null" json:"totalSales"`     // 总销量
	TotalStock   int       `gorm:"column:total_stock;not null" json:"totalStock"`     // 总库存
	CreatedAt    time.Time `gorm:"column:created_at" json:"createdAt"`                // 创建时间
	UpdatedAt    time.Time `gorm:"column:updated_at" json:"updatedAt"`                // 更新时间
	IsDeleted    int       `gorm:"column:is_deleted" json:"isDeleted"`                // 是否删除
	Creator      string    `gorm:"column:creator;not null" json:"creator"`            // 创建人
	Updator      string    `gorm:"column:updator;not null" json:"updator"`            // 更新人
}

// TableName 表名
func (p *ProductSpu) TableName() string {
	return "rcc_product_spu"
}
