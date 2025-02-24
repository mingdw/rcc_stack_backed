package handler

import (
	v1 "rcc-stake-backed/api/v1"
	"rcc-stake-backed/internal/service"

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
		v1.HandleError(c, -1, v1.ErrInternalServerError, nil)
		return
	}

	v1.HandleSuccess(c, map[string]interface{}{
		"categories": tree,
	})
}
