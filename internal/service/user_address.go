package service

import (
	"context"
	v1 "rcc-stake-mall-backed/api/v1"
	"rcc-stake-mall-backed/internal/model"
	"rcc-stake-mall-backed/internal/repository"
	"time"

	"gorm.io/gorm"
)

type UserAddressService interface {
	GetUserAddress(ctx context.Context, id int64, userCode string) ([]*model.UserAddress, error)
	AddAndUpdateUserAddress(ctx context.Context, req *v1.UserAddressModifyRequest) error
	DeleteUserAddress(ctx context.Context, id int64) error
	ListUserAddresses(ctx context.Context, userID int64) ([]*model.UserAddress, error)
	GetDefaultAddress(ctx context.Context, userID int64) (*model.UserAddress, error)
	SetDefaultAddress(ctx context.Context, userID, addressID int64) error
}

func NewUserAddressService(
	service *Service,
	userAddressRepository repository.UserAddressRepository,
) UserAddressService {
	return &userAddressService{
		Service:               service,
		userAddressRepository: userAddressRepository,
	}
}

type userAddressService struct {
	*Service
	userAddressRepository repository.UserAddressRepository
}

func (s *userAddressService) GetUserAddress(ctx context.Context, id int64, userCode string) ([]*model.UserAddress, error) {
	return s.userAddressRepository.GetUserAddress(ctx, id, userCode)
}

func (s *userAddressService) AddAndUpdateUserAddress(ctx context.Context, req *v1.UserAddressModifyRequest) error {
	userAddress := &model.UserAddress{
		Model:        gorm.Model{ID: uint(req.ID), Creator: req.Creator, Updator: req.Updator, IsDeleted: 0, CreatedAt: time.Now(), UpdatedAt: time.Now()},
		UserID:       req.UserID,
		UserCode:     req.UserCode,
		ReciverName:  req.ReciverName,
		ReciverPhone: req.ReciverPhone,
		ProvinceCode: req.ProvinceCode,
		ProvinceName: req.ProvinceName,
		CityCode:     req.CityCode,
		CityName:     req.CityName,
		DistrictCode: req.DistrictCode,
		DistrictName: req.DistrictName,
		StreetCode:   req.StreetCode,
		StreetName:   req.StreetName,
		FullAddress:  req.FullAddress,
		HouseAddress: req.HouseAddress,
		IsDefault:    req.IsDefault,
		Longitude:    req.Longitude,
		Latitude:     req.Latitude,
	}

	if req.ID > 0 {
		return s.userAddressRepository.Update(ctx, userAddress)
	} else {
		return s.userAddressRepository.Create(ctx, userAddress)
	}
}

func (s *userAddressService) DeleteUserAddress(ctx context.Context, id int64) error {
	return s.userAddressRepository.Delete(ctx, id)
}

func (s *userAddressService) ListUserAddresses(ctx context.Context, userID int64) ([]*model.UserAddress, error) {
	return s.userAddressRepository.FindByUserID(ctx, userID)
}

func (s *userAddressService) GetDefaultAddress(ctx context.Context, userID int64) (*model.UserAddress, error) {
	return s.userAddressRepository.GetDefaultAddress(ctx, userID)
}

func (s *userAddressService) SetDefaultAddress(ctx context.Context, userID, addressID int64) error {
	return s.userAddressRepository.SetDefault(ctx, userID, addressID)
}
