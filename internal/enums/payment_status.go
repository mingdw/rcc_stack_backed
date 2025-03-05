package enums

// PaymentStatus 支付状态枚举
type PaymentStatus int

const (
	PaymentStatusUnpaid   PaymentStatus = iota + 1 // 1: 未支付
	PaymentStatusPaid                              // 2: 已支付
	PaymentStatusFailed                            // 3: 支付失败
	PaymentStatusRefunded                          // 4: 已退款
)

// String 返回状态的字符串表示
func (s PaymentStatus) String() string {
	switch s {
	case PaymentStatusUnpaid:
		return "UNPAID"
	case PaymentStatusPaid:
		return "PAID"
	case PaymentStatusFailed:
		return "FAILED"
	case PaymentStatusRefunded:
		return "REFUNDED"
	default:
		return "UNKNOWN"
	}
}

// Description 返回状态的中文描述
func (s PaymentStatus) Description() string {
	switch s {
	case PaymentStatusUnpaid:
		return "未支付"
	case PaymentStatusPaid:
		return "已支付"
	case PaymentStatusFailed:
		return "支付失败"
	case PaymentStatusRefunded:
		return "已退款"
	default:
		return "未知状态"
	}
}

// IsFinalStatus 判断是否为最终状态
func (s PaymentStatus) IsFinalStatus() bool {
	return s == PaymentStatusPaid ||
		s == PaymentStatusFailed ||
		s == PaymentStatusRefunded
}
