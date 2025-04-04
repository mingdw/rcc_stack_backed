package v1

// CategoryTreeResponse 目录树响应结构
type CategoryTreeResponse struct {
	ID         uint                   `json:"id"`
	Name       string                 `json:"name"`
	Code       string                 `json:"code"`
	Level      int                    `json:"level"`
	Sort       int                    `json:"sort"`
	ParentID   uint                   `json:"parentId"`
	Icon       string                 `json:"icon"`
	AttrGroups []AttrGroupResponse    `json:"attrGroups,omitempty"`
	Children   []CategoryTreeResponse `json:"children,omitempty"`
}

// AttrGroupResponse 属性组响应结构
type AttrGroupResponse struct {
	ID          uint           `json:"id"`
	Name        string         `json:"name"`
	Code        string         `json:"code"`
	Sort        int            `json:"sort"`
	Type        int            `json:"type"`
	Description string         `json:"description"`
	Status      int            `json:"status"`
	Attrs       []AttrResponse `json:"attrs"`
}

// AttrResponse 属性响应结构
type AttrResponse struct {
	ID          uint   `json:"id"`
	Name        string `json:"name"`
	Code        string `json:"code"`
	Type        int    `json:"type"`
	Status      int    `json:"status"`
	GroupID     uint   `json:"groupId"`
	Description string `json:"description"`
	Sort        int    `json:"sort"`
}

type CategoryModifyRequest struct {
	ID         uint   `json:"id"`
	Name       string `json:"name"`
	Code       string `json:"code"`
	Sort       int    `json:"sort"`
	ParentID   uint   `json:"parentId"`
	ParentCode string `json:"parentCode"`
	Level      int    `json:"level"`
	Icon       string `json:"icon"`
	Status     int    `json:"status"`
}

type CategoryGroupModifyRequest struct {
	ID           uint   `json:"id"`
	CategoryID   uint   `json:"categoryId"`
	CategoryCode string `json:"categoryCode"`
	Name         string `json:"name"`
	Code         string `json:"code"`
	Type         int    `json:"type"`
	Status       int    `json:"status"`
	Sort         int    `json:"sort"`
	Description  string `json:"description"`
}
