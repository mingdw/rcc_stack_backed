package handler

import (
	v1 "rcc-stake-backed/api/v1"
	"rcc-stake-backed/internal/service"
	"strconv"

	"github.com/gin-gonic/gin"
)

type UserAddressHandler struct {
	*Handler
	userAddressService service.UserAddressService
}

func NewUserAddressHandler(
	handler *Handler,
	userAddressService service.UserAddressService,
) *UserAddressHandler {
	return &UserAddressHandler{
		Handler:            handler,
		userAddressService: userAddressService,
	}
}

// GetUserAddress 获取用户地址详情
func (h *UserAddressHandler) GetUserAddress(ctx *gin.Context) {
	var req v1.UserAddressListRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}
	address, err := h.userAddressService.GetUserAddress(ctx, req.UserID, req.UserCode)
	if err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}

	v1.HandleSuccess(ctx, address)
}

// CreateUserAddress 创建用户地址
func (h *UserAddressHandler) AddAndUpdateUserAddress(ctx *gin.Context) {
	var req v1.UserAddressModifyRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}

	if err := h.userAddressService.AddAndUpdateUserAddress(ctx, &req); err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}

	v1.HandleSuccess(ctx, nil)
}

// UpdateUserAddress 更新用户地址
func (h *UserAddressHandler) UpdateUserAddress(ctx *gin.Context) {
	var req v1.UserAddressModifyRequest
	if err := ctx.ShouldBindJSON(&req); err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}

	if err := h.userAddressService.AddAndUpdateUserAddress(ctx, &req); err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}

	v1.HandleSuccess(ctx, nil)
}

// DeleteUserAddress 删除用户地址
func (h *UserAddressHandler) DeleteUserAddress(ctx *gin.Context) {
	id, err := strconv.ParseInt(ctx.Param("id"), 10, 64)
	if err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}

	if err := h.userAddressService.DeleteUserAddress(ctx, id); err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}

	v1.HandleSuccess(ctx, nil)
}

// ListUserAddresses 获取用户地址列表
func (h *UserAddressHandler) ListUserAddresses(ctx *gin.Context) {
	userID, err := strconv.ParseInt(ctx.Query("user_id"), 10, 64)
	if err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}

	addresses, err := h.userAddressService.ListUserAddresses(ctx, userID)
	if err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}

	v1.HandleSuccess(ctx, addresses)
}

// SetDefaultAddress 设置默认地址
func (h *UserAddressHandler) SetDefaultAddress(ctx *gin.Context) {
	userID, err := strconv.ParseInt(ctx.Query("user_id"), 10, 64)
	if err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}

	addressID, err := strconv.ParseInt(ctx.Param("id"), 10, 64)
	if err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}

	if err := h.userAddressService.SetDefaultAddress(ctx, userID, addressID); err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}

	v1.HandleSuccess(ctx, nil)
}
