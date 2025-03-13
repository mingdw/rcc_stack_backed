package handler

import (
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

}
