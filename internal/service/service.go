package service

import (
	"rcc-stake-mall-backed/internal/repository"
	"rcc-stake-mall-backed/pkg/jwt"
	"rcc-stake-mall-backed/pkg/log"
	"rcc-stake-mall-backed/pkg/sid"
)

type Service struct {
	logger *log.Logger
	sid    *sid.Sid
	jwt    *jwt.JWT
	tm     repository.Transaction
}

func NewService(
	tm repository.Transaction,
	logger *log.Logger,
	sid *sid.Sid,
	jwt *jwt.JWT,
) *Service {
	return &Service{
		logger: logger,
		sid:    sid,
		jwt:    jwt,
		tm:     tm,
	}
}
