package handler

import (
	v1 "rcc-stake-backed/api/v1"
	"rcc-stake-backed/internal/service"

	"github.com/gin-gonic/gin"
)

type ProductHandler struct {
	*Handler
	productService service.ProductService
}

func NewProductHandler(
	handler *Handler,
	productService service.ProductService,
) *ProductHandler {
	return &ProductHandler{
		Handler:        handler,
		productService: productService,
	}
}

func (h *ProductHandler) GetProduct(ctx *gin.Context) {
	req := new(v1.ProductListRequest)
	if err := ctx.ShouldBindJSON(req); err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}

	reponse, err := h.productService.GetProduct(ctx, req)
	if err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}
	v1.HandleSuccess(ctx, reponse)
}
