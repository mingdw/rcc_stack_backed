package model

type Product struct {
	SPU           *ProductSpu             `gorm:"embedded"` // 使用 embedded 标签嵌入 SPU
	SPUDetail     *ProductSpuDetail       `gorm:"foreignKey:ProductSpuID;references:ID"`
	SPUAttrParams []*ProductSpuAttrParams `gorm:"foreignKey:ProductSpuID;references:ID"`
	SKUs          []*ProductSku           `gorm:"foreignKey:ProductSpuID;references:ID"`
}

func (Product) TableName() string {
	return "rcc_product_spu" // 使用主表名称
}
