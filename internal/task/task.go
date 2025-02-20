package task

import (
	"rcc-stake-backed/internal/repository"
	"rcc-stake-backed/pkg/jwt"
	"rcc-stake-backed/pkg/log"
	"rcc-stake-backed/pkg/sid"
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
