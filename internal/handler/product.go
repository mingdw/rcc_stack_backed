package handler

import (
	v1 "rcc-stake-backed/api/v1"
	"rcc-stake-backed/internal/service"

	"github.com/gin-gonic/gin"
	"github.com/sirupsen/logrus"
)

type ProductHandler struct {
	*Handler
	productService service.ProductService
	logger         *logrus.Logger
}

func NewProductHandler(
	handler *Handler,
	productService service.ProductService,
) *ProductHandler {
	return &ProductHandler{
		Handler:        handler,
		productService: productService,
		logger:         logrus.New(),
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
	req := new(v1.ProductDetailRequest)
	if err := ctx.ShouldBindJSON(req); err != nil {
		h.logger.WithError(err).Error("bind json error")
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}

	response, err := h.productService.GetProduct(ctx, req)
	if err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}
	v1.HandleSuccess(ctx, response)
}
