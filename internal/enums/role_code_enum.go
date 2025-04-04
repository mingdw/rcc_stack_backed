package enums

// RoleCode 角色代码枚举
type RoleCode string

const (
	// SuperAdmin 超级管理员
	SuperAdmin RoleCode = "R0001"

	// SystemAdmin 系统管理员
	SystemAdmin RoleCode = "R0002"

	// NormalUser 普通用户
	NormalUser RoleCode = "R0003"
)

// String 转换为字符串
func (r RoleCode) String() string {
	return string(r)
}

// GetRoleNameByCode 根据角色代码获取角色名称
func GetRoleNameByCode(code RoleCode) string {
	switch code {
	case SuperAdmin:
		return "超级管理员"
	case SystemAdmin:
		return "系统管理员"
	case NormalUser:
		return "普通用户"
	default:
		return "未知角色"
	}
}

// IsValid 判断角色代码是否有效
func (r RoleCode) IsValid() bool {
	switch r {
	case SuperAdmin, SystemAdmin, NormalUser:
		return true
	default:
		return false
	}
}

// AllRoleCodes 获取所有角色代码
func AllRoleCodes() []RoleCode {
	return []RoleCode{
		SuperAdmin,
		SystemAdmin,
		NormalUser,
	}
}

// IsAdmin 判断是否是管理员角色（超级管理员或系统管理员）
func (r RoleCode) IsAdmin() bool {
	return r == SuperAdmin || r == SystemAdmin
}

// IsAdmin 包级函数
func IsAdmin(roleCode RoleCode) bool {
	return roleCode.IsAdmin()
}
