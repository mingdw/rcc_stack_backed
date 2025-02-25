package model

import "gorm.io/gorm"

type Product struct {
	gorm.Model
}

func (m *Product) TableName() string {
    return "product"
}
