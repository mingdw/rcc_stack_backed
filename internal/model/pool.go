package model

import "gorm.io/gorm"

type Pool struct {
	gorm.Model
}

func (m *Pool) TableName() string {
    return "pool"
}
