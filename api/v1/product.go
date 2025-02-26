package v1

import "time"

// 请求参数
type ProductListRequest struct {
	CategoryCodes string `json:"categoryCodes"` // 分类编码，多个用逗号分隔
	ProductName   string `json:"productName"`   // 商品名称
	Page          int    `json:"page"`          // 页码
	PageSize      int    `json:"pageSize"`      // 每页数量
}

// 响应结果
type ProductListResponse struct {
	Total      int64               `json:"total"`      // 总记录数
	Categories []*CategoryProducts `json:"categories"` // 分类商品列表
}

// 分类商品
type CategoryProducts struct {
	CategoryId   int64      `json:"categoryId"`   // 分类ID
	CategoryCode string     `json:"categoryCode"` // 分类编码
	CategoryName string     `json:"categoryName"` // 分类名称
	ProductCount int64      `json:"productCount"` // 商品数量
	Products     []*Product `json:"products"`     // 商品列表
}

// 商品信息
type Product struct {
	Id            int64         `json:"id"`            // 商品ID
	Code          string        `json:"code"`          // 商品编码
	Name          string        `json:"name"`          // 商品名称
	Category1Id   int64         `json:"category1Id"`   // 分类ID
	Category1Code string        `json:"category1Code"` // 分类编码
	Category2Id   int64         `json:"category2Id"`   // 分类ID
	Category2Code string        `json:"category2Code"` // 分类编码
	Category3Id   int64         `json:"category3Id"`   // 分类ID
	Category3Code string        `json:"category3Code"` // 分类编码
	Brand         string        `json:"brand"`         // 品牌
	Price         float64       `json:"price"`         // 价格
	RealPrice     float64       `json:"realPrice"`     // 原价
	TotalSales    int           `json:"totalSales"`    // 总销量
	TotalStock    int           `json:"totalStock"`    // 总库存
	Status        int           `json:"status"`        // 状态
	Images        string        `json:"images"`        // 图片
	Description   string        `json:"description"`   // 描述
	Attributes    *ProductAttrs `json:"attributes"`    // 商品属性
}

// 商品属性
type ProductAttrs struct {
	BasicAttrs string `json:"basicAttrs"` // 基础属性
	SaleAttrs  string `json:"saleAttrs"`  // 销售属性
	SpecAttrs  string `json:"specAttrs"`  // 规格属性
}

// 请求参数
type ProductDetailRequest struct {
	ProductId int64 `json:"productId"` // 商品ID
	SpuId     int64 `json:"spuId"`     // spuID
}

// 响应结果
type ProductDetailResponse struct {
	ProductSpu           *ProductSpu             `json:"productSpu"`           // 商品SPU信息
	ProductSkus          []*ProductSku           `json:"productSku"`           // 商品SKU信息
	ProductSpuDetail     *ProductSpuDetail       `json:"productSpuDetail"`     // 商品SPU详情
	ProductSpuAttrParams []*ProductSpuAttrParams `json:"productSpuAttrParams"` // 商品SPU属性参数
}

type ProductSpu struct {
	Id            int64     `json:"id"`            // 商品SPU ID
	Code          string    `json:"code"`          // 商品SPU 编码
	Name          string    `json:"name"`          // 商品SPU 名称
	Category1ID   int64     `json:"category1Id"`   // 商品目录1分类ID
	Category1Code string    `json:"category1Code"` // 商品目录1分类编码
	Category2ID   int64     `json:"category2Id"`   // 商品目录2分类ID
	Category2Code string    `json:"category2Code"` // 商品目录2分类编码
	Category3ID   int64     `json:"category3Id"`   // 商品目录3分类ID
	Category3Code string    `json:"category3Code"` // 商品目录3分类编码
	Brand         string    `json:"brand"`         // 品牌
	Description   string    `json:"description"`   // 描述
	Status        int       `json:"status"`        // 状态
	Images        string    `json:"images"`        // 图片
	TotalSales    int       `json:"totalSales"`    // 总销量
	TotalStock    int       `json:"totalStock"`    // 总库存
	CreatedAt     time.Time `json:"createdAt"`     // 创建时间
	UpdatedAt     time.Time `json:"updatedAt"`     // 更新时间
}

type ProductSku struct {
	Id           int64     `json:"id"`           // 商品SKU ID
	Code         string    `json:"code"`         // 商品SKU 编码
	Name         string    `json:"name"`         // 商品SKU 名称
	ProductSpuID int64     `json:"productSpuId"` // 商品SPU ID
	Price        float64   `json:"price"`        // 价格
	RealPrice    float64   `json:"realPrice"`    // 原价
	TotalSales   int       `json:"totalSales"`   // 总销量
	TotalStock   int       `json:"totalStock"`   // 总库存
	Status       int       `json:"status"`       // 状态
	Images       string    `json:"images"`       // 图片
	CreatedAt    time.Time `json:"createdAt"`    // 创建时间
	UpdatedAt    time.Time `json:"updatedAt"`    // 更新时间
	IsDeleted    int       `json:"isDeleted"`    // 是否删除
	Creator      string    `json:"creator"`      // 创建者
	Updator      string    `json:"updator"`      // 更新者
}

type ProductSpuDetail struct {
	Id           int64     `json:"id"`           // 商品SPU详情ID
	ProductSpuID int64     `json:"productSpuId"` // 商品SPU ID
	Content      string    `json:"content"`      // 内容
	CreatedAt    time.Time `json:"createdAt"`    // 创建时间
	UpdatedAt    time.Time `json:"updatedAt"`    // 更新时间
	IsDeleted    int       `json:"isDeleted"`    // 是否删除
	Creator      string    `json:"creator"`      // 创建者
	Updator      string    `json:"updator"`      // 更新者
}

type ProductSpuAttrParams struct {
	Id           int64               `json:"id"`           // 商品SPU属性参数ID
	ProductSpuID int64               `json:"productSpuId"` // 商品SPU ID
	BasicAttrs   map[string]string   `json:"basicAttrs"`   // 基础属性
	SaleAttrs    map[string]string   `json:"saleAttrs"`    // 销售属性
	SpecAttrs    map[string][]string `json:"specAttrs"`    // 规格属性
	CreatedAt    time.Time           `json:"createdAt"`    // 创建时间
	UpdatedAt    time.Time           `json:"updatedAt"`    // 更新时间
	IsDeleted    int                 `json:"isDeleted"`    // 是否删除
	Creator      string              `json:"creator"`      // 创建者
	Updator      string              `json:"updator"`      // 更新者
}
