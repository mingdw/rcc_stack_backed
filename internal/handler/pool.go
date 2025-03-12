package handler

import (
	"rcc-stake-mall-backed/internal/service"

	"github.com/gin-gonic/gin"
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
		Handler:     handler,
		poolService: poolService,
	}
}

func (h *PoolHandler) GetPool(ctx *gin.Context) {

}
