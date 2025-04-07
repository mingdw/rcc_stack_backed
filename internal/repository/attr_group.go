package repository

import (
	"context"
	"rcc-stake-mall-backed/internal/model"
)

type AttrGroupRepository interface {
	FindAll(ctx context.Context) ([]model.AttrGroup, error)
	DeleteByCategoryID(ctx context.Context, ids []uint) error
	GetAttrGroupByCode(ctx context.Context, code string) (*model.AttrGroup, error)
	Update(ctx context.Context, attrGroup *model.AttrGroup) error
	Create(ctx context.Context, attrGroup *model.AttrGroup) (uint, error)
	Delete(ctx context.Context, id int64) error
}

func NewAttrGroupRepository(r *Repository) AttrGroupRepository {
	return &attrGroupRepository{
		Repository: r,
	}
}

type attrGroupRepository struct {
	*Repository
}

func (r *attrGroupRepository) FindAll(ctx context.Context) ([]model.AttrGroup, error) {
	var attrGroups []model.AttrGroup
	if err := r.DB(ctx).Find(&attrGroups).Error; err != nil {
		return nil, err
	}
	return attrGroups, nil
}

func (r *attrGroupRepository) DeleteByCategoryID(ctx context.Context, ids []uint) error {
	return r.DB(ctx).Where("id IN (?) and is_deleted = 0 and type = 1", ids).Delete(&model.AttrGroup{}).Error
}

func (r *attrGroupRepository) GetAttrGroupByCode(ctx context.Context, code string) (*model.AttrGroup, error) {
	var attrGroup model.AttrGroup
	result := r.DB(ctx).Where("attr_group_code = ? and is_deleted = 0", code).Limit(1).Find(&attrGroup)
	if result.Error != nil {
		return nil, result.Error
	}
	if result.RowsAffected == 0 {
		return nil, nil
	}
	return &attrGroup, nil
}

func (r *attrGroupRepository) Update(ctx context.Context, attrGroup *model.AttrGroup) error {
	return r.DB(ctx).Model(&model.AttrGroup{}).Where("id = ?", attrGroup.ID).Select("status", "updated_at", "updator").Updates(attrGroup).Error
}

func (r *attrGroupRepository) Create(ctx context.Context, attrGroup *model.AttrGroup) (uint, error) {
	err := r.DB(ctx).Create(attrGroup).Error
	if err != nil {
		return 0, err
	}
	return attrGroup.ID, nil
}

func (r *attrGroupRepository) Delete(ctx context.Context, id int64) error {
	return r.DB(ctx).Where("id = ? and is_deleted = 0", id).Delete(&model.AttrGroup{}).Error
}
