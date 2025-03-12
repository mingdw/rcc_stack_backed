package handler

import (
	"rcc-stake-mall-backed/internal/service"

	"github.com/gin-gonic/gin"
)

type PriceHandler struct {
	*Handler
	priceService service.PriceService
}

func NewPriceHandler(
	handler *Handler,
	priceService service.PriceService,
) *PriceHandler {
	return &PriceHandler{
		Handler:      handler,
		priceService: priceService,
	}
}

func (h *PriceHandler) GetPrice(ctx *gin.Context) {

}
