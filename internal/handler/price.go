package handler

import (
	"github.com/gin-gonic/gin"
	"rcc-stake-backed/internal/service"
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
