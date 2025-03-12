package handler

import (
	v1 "rcc-stake-mall-backed/api/v1"
	"rcc-stake-mall-backed/internal/service"

	"github.com/gin-gonic/gin"
)

type AddressHandler struct {
	*Handler
	addressService service.AddressService
}

func NewAddressHandler(
	handler *Handler,
	addressService service.AddressService,
) *AddressHandler {
	return &AddressHandler{
		Handler:        handler,
		addressService: addressService,
	}
}

// Create 创建地址
func (h *AddressHandler) GetAllAddress(ctx *gin.Context) {
	var req v1.AddressListRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}
	response, err := h.addressService.GetAll(ctx, &req)
	if err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}
	v1.HandleSuccess(ctx, response)
}
