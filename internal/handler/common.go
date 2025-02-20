package handler

import (
	"github.com/gin-gonic/gin"
	"rcc-stake-backed/internal/service"
)

type CommonHandler struct {
	*Handler
	commonService service.CommonService
}

func NewCommonHandler(
    handler *Handler,
    commonService service.CommonService,
) *CommonHandler {
	return &CommonHandler{
		Handler:      handler,
		commonService: commonService,
	}
}

func (h *CommonHandler) GetCommon(ctx *gin.Context) {

}
