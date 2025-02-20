package model

import "gorm.io/gorm"

type Price struct {
	gorm.Model
}

func (m *Price) TableName() string {
    return "price"
}
