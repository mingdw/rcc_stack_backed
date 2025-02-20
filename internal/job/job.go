package job

import (
	"rcc-stake-backed/internal/repository"
	"rcc-stake-backed/pkg/jwt"
	"rcc-stake-backed/pkg/log"
	"rcc-stake-backed/pkg/sid"
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
