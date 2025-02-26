package model

type Product struct {
	SPU           *ProductSpu             `json:"spu"`
	SPUDetail     *ProductSpuDetail       `json:"spuDetail"`
	SPUAttrParams []*ProductSpuAttrParams `json:"spuAttrParams"`
	SKU           []*ProductSku           `json:"sku"`
}
