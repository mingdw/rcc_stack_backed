package handler

import (
	"rcc-stake-mall-backed/internal/service"

	"github.com/gin-gonic/gin"
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
		Handler:       handler,
		commonService: commonService,
	}
}

func (h *CommonHandler) GetCommon(ctx *gin.Context) {

}
