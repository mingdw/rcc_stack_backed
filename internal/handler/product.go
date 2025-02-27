package handler

import (
	v1 "rcc-stake-backed/api/v1"
	"rcc-stake-backed/internal/service"

	"strconv"

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

func (h *ProductHandler) ListProducts(ctx *gin.Context) {
	req := new(v1.ProductListRequest)
	if err := ctx.ShouldBindJSON(req); err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}

	reponse, err := h.productService.ListProducts(ctx, req)
	if err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}
	v1.HandleSuccess(ctx, reponse)
}

// 或者方案2：使用查询参数或路径参数
func (h *ProductHandler) GetProductDetail(ctx *gin.Context) {
	productID, err := strconv.ParseInt(ctx.Param("productId"), 10, 64)
	if err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}

	req := &v1.ProductDetailRequest{
		ProductId: productID,
	}

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
