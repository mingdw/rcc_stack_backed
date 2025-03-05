package enums

// OrderStatus 订单状态枚举
type OrderStatus int

const (
	OrderStatusUnpaid    OrderStatus = iota + 1 // 1: 待支付
	OrderStatusPending                          // 2: 待发货
	OrderStatusShipped                          // 3: 已发货
	OrderStatusCompleted                        // 4: 已完成
	OrderStatusCancelled                        // 5: 已取消
	OrderStatusAfterSale                        // 6: 售后中
)

// String 返回状态的字符串表示
func (s OrderStatus) String() string {
	switch s {
	case OrderStatusUnpaid:
		return "UNPAID"
	case OrderStatusPending:
		return "PENDING"
	case OrderStatusShipped:
		return "SHIPPED"
	case OrderStatusCompleted:
		return "COMPLETED"
	case OrderStatusCancelled:
		return "CANCELLED"
	case OrderStatusAfterSale:
		return "AFTER_SALE"
	default:
		return "UNKNOWN"
	}
}

// Description 返回状态的中文描述
func (s OrderStatus) Description() string {
	switch s {
	case OrderStatusUnpaid:
		return "待支付"
	case OrderStatusPending:
		return "待发货"
	case OrderStatusShipped:
		return "已发货"
	case OrderStatusCompleted:
		return "已完成"
	case OrderStatusCancelled:
		return "已取消"
	case OrderStatusAfterSale:
		return "售后中"
	default:
		return "未知状态"
	}
}
