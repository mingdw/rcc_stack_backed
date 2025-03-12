package task

import (
	"rcc-stake-mall-backed/internal/repository"
	"rcc-stake-mall-backed/pkg/jwt"
	"rcc-stake-mall-backed/pkg/log"
	"rcc-stake-mall-backed/pkg/sid"
)

type Task struct {
	logger *log.Logger
	sid    *sid.Sid
	jwt    *jwt.JWT
	tm     repository.Transaction
}

func NewTask(
	tm repository.Transaction,
	logger *log.Logger,
	sid *sid.Sid,
) *Task {
	return &Task{
		logger: logger,
		sid:    sid,
		tm:     tm,
	}
}
