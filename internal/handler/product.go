package handler

import (
	"github.com/gin-gonic/gin"
	"rcc-stake-backed/internal/service"
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
		Handler:      handler,
		productService: productService,
	}
}

func (h *ProductHandler) GetProduct(ctx *gin.Context) {

}
