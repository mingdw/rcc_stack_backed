package handler

import (
	"github.com/gin-gonic/gin"
	"rcc-stake-mall-backed/internal/service"
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
		Handler:      handler,
		contractService: contractService,
	}
}

func (h *ContractHandler) GetContract(ctx *gin.Context) {

}
