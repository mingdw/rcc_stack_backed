package handler

import (
	v1 "rcc-stake-mall-backed/api/v1"
	"rcc-stake-mall-backed/internal/service"

	"strconv"

	"github.com/gin-gonic/gin"
)

type CategoryHandler struct {
	*Handler
	categoryService service.CategoryService
}

func NewCategoryHandler(handler *Handler, categoryService service.CategoryService) *CategoryHandler {
	return &CategoryHandler{
		Handler:         handler,
		categoryService: categoryService,
	}
}

// GetCategoryTree 获取完整的目录树，包含属性组和属性信息
func (h *CategoryHandler) GetCategoryTree(c *gin.Context) {
	tree, err := h.categoryService.GetCategoryTree(c)
	if err != nil {
		v1.HandleError(c, -1, v1.ErrBadRequest, nil)
		return
	}

	v1.HandleSuccess(c, map[string]interface{}{
		"categories": tree,
	})
}

func (h *CategoryHandler) ModifyCategory(c *gin.Context) {
	request := v1.CategoryModifyRequest{}
	if err := c.ShouldBindJSON(&request); err != nil {
		v1.HandleError(c, -1, v1.ErrBadRequest, nil)
		return
	}
	err := h.categoryService.ModifyCategory(c, &request)
	if err != nil {
		v1.HandleError(c, -1, v1.ErrBadRequest, err.Error())
		return
	}
	v1.HandleSuccess(c, nil)
}

func (h *CategoryHandler) DeleteCategory(c *gin.Context) {
	idStr := c.Param("id")

	// 转换ID
	id, err := strconv.ParseInt(idStr, 10, 64)
	if err != nil {
		v1.HandleError(c, -1, v1.ErrBadRequest, "无效的ID格式")
		return
	}

	// 调用服务
	err = h.categoryService.DeleteCategory(c, id)
	if err != nil {
		v1.HandleError(c, -1, v1.ErrBadRequest, err.Error())
		return
	}

	v1.HandleSuccess(c, nil)
}

func (h *CategoryHandler) ModifyCategoryGroup(c *gin.Context) {
	request := v1.CategoryGroupModifyRequest{}
	if err := c.ShouldBindJSON(&request); err != nil {
		v1.HandleError(c, -1, v1.ErrBadRequest, nil)
		return
	}
	if request.Code == "" {
		v1.HandleError(c, -1, v1.ErrBadRequest, "属性编码不能为空")
		return
	}
	err := h.categoryService.ModifyCategoryGroup(c, &request)
	if err != nil {
		v1.HandleError(c, -1, v1.ErrBadRequest, err.Error())
		return
	}
	v1.HandleSuccess(c, nil)
}
