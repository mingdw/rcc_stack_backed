package model

import "gorm.io/gorm"

type Contract struct {
	gorm.Model
}

func (m *Contract) TableName() string {
    return "contract"
}
