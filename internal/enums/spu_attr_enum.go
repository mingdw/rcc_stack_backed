package enums

// SPU 属性类型枚举
const (
	// BasicAttrs 基础属性
	BasicAttrs = "BASIC_ATTRS"
	// SaleAttrs 销售属性
	SaleAttrs = "SALE_ATTRS"
	// SpecAttrs 规格属性
	SpecAttrs = "SPEC_ATTRS"
)

// GetSpuAttrType 获取 SPU 属性类型描述
func GetSpuAttrType(attrType string) string {
	switch attrType {
	case BasicAttrs:
		return "基础属性"
	case SaleAttrs:
		return "销售属性"
	case SpecAttrs:
		return "规格属性"
	default:
		return "未知属性"
	}
}

// IsValidSpuAttrType 验证 SPU 属性类型是否有效
func IsValidSpuAttrType(attrType string) bool {
	switch attrType {
	case BasicAttrs, SaleAttrs, SpecAttrs:
		return true
	default:
		return false
	}
}
