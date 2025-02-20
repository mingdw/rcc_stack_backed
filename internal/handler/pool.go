package handler

import (
	"github.com/gin-gonic/gin"
	"rcc-stake-backed/internal/service"
)

type PoolHandler struct {
	*Handler
	poolService service.PoolService
}

func NewPoolHandler(
    handler *Handler,
    poolService service.PoolService,
) *PoolHandler {
	return &PoolHandler{
		Handler:      handler,
		poolService: poolService,
	}
}

func (h *PoolHandler) GetPool(ctx *gin.Context) {

}
