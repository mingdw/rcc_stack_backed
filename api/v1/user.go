package v1

import (
	"time"
)

type RegisterRequest struct {
	Email    string `json:"email" binding:"required,email" example:"1234@gmail.com"`
	Password string `json:"password" binding:"required" example:"123456"`
}

type LoginRequest struct {
	Email    string `json:"email" binding:"required,email" example:"1234@gmail.com"`
	Password string `json:"password" binding:"required" example:"123456"`
}
type LoginResponseData struct {
	AccessToken string `json:"accessToken"`
}
type LoginResponse struct {
	Response
	Data LoginResponseData
}

type UpdateProfileRequest struct {
	Nickname string `json:"nickname" example:"alan"`
	Email    string `json:"email" binding:"required,email" example:"1234@gmail.com"`
}
type GetProfileResponseData struct {
	UserId   string `json:"userId"`
	Nickname string `json:"nickname" example:"alan"`
}
type GetProfileResponse struct {
	Response
	Data GetProfileResponseData
}

type UserInfo struct {
	ID         int64     `json:"id"`
	UniqueId   string    `json:"uniqueId"`
	UserCode   string    `json:"userCode"`
	Nickname   string    `json:"nickname"`
	Avatar     string    `json:"avatar"`
	Gender     int       `json:"gender"`
	Birthday   time.Time `json:"birthday"`
	Email      string    `json:"email"`
	Phone      string    `json:"phone"`
	Password   string    `json:"password"`
	Status     int       `json:"status"`
	StatusDesc string    `json:"statusDesc"`
	Type       int       `json:"type"`
	TypeDesc   string    `json:"typeDesc"`
	IsAdmin    bool      `json:"isAdmin"`
}
