package repository

import (
	"context"
	"rcc-stake-backed/internal/model"

	"gorm.io/gorm"
)

type UserAddressRepository interface {
	GetUserAddress(ctx context.Context, userid int64, userCode string) ([]*model.UserAddress, error)
	Create(ctx context.Context, userAddress *model.UserAddress) error
	Update(ctx context.Context, userAddress *model.UserAddress) error
	Delete(ctx context.Context, id int64) error
	FindByUserID(ctx context.Context, userID int64) ([]*model.UserAddress, error)
	GetDefaultAddress(ctx context.Context, userID int64) (*model.UserAddress, error)
	SetDefault(ctx context.Context, userID, addressID int64) error
}

func NewUserAddressRepository(
	repository *Repository,
) UserAddressRepository {
	return &userAddressRepository{
		Repository: repository,
	}
}

type userAddressRepository struct {
	*Repository
}

func (r *userAddressRepository) GetUserAddress(ctx context.Context, userId int64, userCode string) ([]*model.UserAddress, error) {
	var userAddress []*model.UserAddress
	sql := r.DB(ctx).Where("is_deleted = ?", 0)
	if userCode != "" {
		sql = sql.Where("user_code = ?", userCode)
	}
	if userId != -1 {
		sql = sql.Where("user_id = ?", userId)
	}
	if err := sql.Find(&userAddress).Error; err != nil {
		return nil, err
	}
	return userAddress, nil
}

func (r *userAddressRepository) Create(ctx context.Context, userAddress *model.UserAddress) error {
	return r.DB(ctx).Create(userAddress).Error
}

func (r *userAddressRepository) Update(ctx context.Context, userAddress *model.UserAddress) error {
	return r.DB(ctx).Where("id = ? AND is_deleted = ?", userAddress.ID, 0).Updates(userAddress).Error
}

func (r *userAddressRepository) Delete(ctx context.Context, id int64) error {
	return r.DB(ctx).Model(&model.UserAddress{}).Where("id = ?", id).Update("is_deleted", 1).Error
}

func (r *userAddressRepository) FindByUserID(ctx context.Context, userID int64) ([]*model.UserAddress, error) {
	var addresses []*model.UserAddress
	if err := r.DB(ctx).Where("user_id = ? AND is_deleted = ?", userID, 0).Find(&addresses).Error; err != nil {
		return nil, err
	}
	return addresses, nil
}

func (r *userAddressRepository) GetDefaultAddress(ctx context.Context, userID int64) (*model.UserAddress, error) {
	var address model.UserAddress
	if err := r.DB(ctx).Where("user_id = ? AND is_default = ? AND is_deleted = ?", userID, 1, 0).First(&address).Error; err != nil {
		return nil, err
	}
	return &address, nil
}

func (r *userAddressRepository) SetDefault(ctx context.Context, userID, addressID int64) error {
	// 开启事务
	return r.DB(ctx).Transaction(func(tx *gorm.DB) error {
		// 先将该用户的所有地址设为非默认
		if err := tx.Model(&model.UserAddress{}).Where("user_id = ? AND is_deleted = ?", userID, 0).Update("is_default", 0).Error; err != nil {
			return err
		}
		// 将指定地址设为默认
		return tx.Model(&model.UserAddress{}).Where("id = ? AND user_id = ? AND is_deleted = ?", addressID, userID, 0).Update("is_default", 1).Error
	})
}
