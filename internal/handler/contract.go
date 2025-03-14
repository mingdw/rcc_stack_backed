package handler

import (
	v1 "rcc-stake-mall-backed/api/v1"
	"rcc-stake-mall-backed/internal/service"

	"github.com/gin-gonic/gin"
)

type ContractHandler struct {
	*Handler
	contractService service.ContractService
}

func NewContractHandler(
	handler *Handler,
	contractService service.ContractService,
) *ContractHandler {
	return &ContractHandler{
		Handler:         handler,
		contractService: contractService,
	}
}

func (h *ContractHandler) GetContract(ctx *gin.Context) {

}

func (h *ContractHandler) GetPoolsInfo(ctx *gin.Context) {
	pools, err := h.contractService.GetPoolInfos(ctx)
	if err != nil {
		v1.HandleError(ctx, -1, v1.ErrInternalServerError, nil)
		return
	}
	v1.HandleSuccess(ctx, pools)
}
