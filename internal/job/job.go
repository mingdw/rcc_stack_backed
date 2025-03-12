package job

import (
	"rcc-stake-mall-backed/internal/repository"
	"rcc-stake-mall-backed/pkg/jwt"
	"rcc-stake-mall-backed/pkg/log"
	"rcc-stake-mall-backed/pkg/sid"
)

type Job struct {
	logger *log.Logger
	sid    *sid.Sid
	jwt    *jwt.JWT
	tm     repository.Transaction
}

func NewJob(
	tm repository.Transaction,
	logger *log.Logger,
	sid *sid.Sid,
) *Job {
	return &Job{
		logger: logger,
		sid:    sid,
		tm:     tm,
	}
}
