package service

import (
	"context"
	"errors"
	v1 "rcc-stake-mall-backed/api/v1"
	"rcc-stake-mall-backed/internal/model"
	"rcc-stake-mall-backed/internal/repository"
	"sort"
)

// CategoryService 目录服务接口
type CategoryService interface {
	GetCategory(ctx context.Context, id int64) (*model.Category, error)
	GetCategoryTree(ctx context.Context) ([]v1.CategoryTreeResponse, error)
	ModifyCategory(ctx context.Context, request *v1.CategoryModifyRequest) error
	DeleteCategory(ctx context.Context, id int64) error
	ModifyCategoryGroup(ctx context.Context, request *v1.CategoryGroupModifyRequest) error
}

// categoryService 目录服务实现
type categoryService struct {
	*Service
	categoryRepository          repository.CategoryRepository
	categoryAttrGroupRepository repository.CategoryAttrGroupRepository
	attrRepository              repository.AttrRepository
	attrGroupRepository         repository.AttrGroupRepository
}

// NewCategoryService 创建目录服务实例
func NewCategoryService(
	service *Service,
	categoryRepository repository.CategoryRepository,
	categoryAttrGroupRepository repository.CategoryAttrGroupRepository,
	attrRepository repository.AttrRepository,
	attrGroupRepository repository.AttrGroupRepository,
) CategoryService {
	return &categoryService{
		Service:                     service,
		categoryRepository:          categoryRepository,
		categoryAttrGroupRepository: categoryAttrGroupRepository,
		attrRepository:              attrRepository,
		attrGroupRepository:         attrGroupRepository,
	}
}

func (s *categoryService) GetCategory(ctx context.Context, id int64) (*model.Category, error) {
	return s.categoryRepository.GetCategory(ctx, id)
}

// GetCategoryTree 获取目录树
func (s *categoryService) GetCategoryTree(ctx context.Context) ([]v1.CategoryTreeResponse, error) {
	// 1. 获取所有目录
	categories, err := s.categoryRepository.FindAll(ctx)
	if err != nil {
		return nil, err
	}

	// 2. 获取所有目录-属性组关联
	categoryAttrGroups, err := s.categoryAttrGroupRepository.FindAll(ctx)
	if err != nil {
		return nil, err
	}

	// 3. 获取所有属性组
	attrGroups, err := s.attrGroupRepository.FindAll(ctx)
	if err != nil {
		return nil, err
	}

	// 4. 获取所有属性
	attrs, err := s.attrRepository.FindAll(ctx)
	if err != nil {
		return nil, err
	}

	// 5. 构建属性组-属性映射
	attrGroupMap := make(map[uint][]model.Attr)
	for _, attr := range attrs {
		groupID := uint(attr.AttrGroupID)
		attrGroupMap[groupID] = append(attrGroupMap[groupID], attr)
	}

	// 6. 构建目录-属性组映射
	categoryAttrGroupMap := make(map[uint][]model.AttrGroup)
	for _, cag := range categoryAttrGroups {
		for _, ag := range attrGroups {
			if cag.AttrGroupID == ag.ID {
				categoryID := uint(cag.CategoryID)
				categoryAttrGroupMap[categoryID] = append(categoryAttrGroupMap[categoryID], ag)
			}
		}
	}

	// 7. 构建目录树，从顶级目录开始
	return buildCategoryTree(categories, categoryAttrGroupMap, attrGroupMap, 0), nil
}

// buildCategoryTree 构建目录树
func buildCategoryTree(categories []model.Category, categoryAttrGroupMap map[uint][]model.AttrGroup, attrGroupMap map[uint][]model.Attr, parentID uint) []v1.CategoryTreeResponse {
	var nodes []v1.CategoryTreeResponse

	for _, category := range categories {
		if uint(category.ParentID) == parentID {
			node := v1.CategoryTreeResponse{
				ID:       category.ID,
				Code:     category.Code,
				Name:     category.Name,
				ParentID: uint(category.ParentID),
				Level:    category.Level,
				Sort:     category.Sort,
				Icon:     category.Icon,
			}

			// 添加属性组信息
			if attrGroups, exists := categoryAttrGroupMap[uint(category.ID)]; exists {
				for _, ag := range attrGroups {
					attrGroupResp := v1.AttrGroupResponse{
						ID:          uint(ag.ID),
						Name:        ag.AttrGroupName,
						Code:        ag.AttrGroupCode,
						Sort:        ag.Sort,
						Type:        ag.Type,
						Status:      ag.Status,
						Description: ag.Description,
					}

					// 添加属性信息
					if attrs, exists := attrGroupMap[uint(ag.ID)]; exists {
						for _, attr := range attrs {
							attrResp := v1.AttrResponse{
								ID:          attr.ID,
								Name:        attr.AttrName,
								Code:        attr.AttrCode,
								Sort:        attr.Sort,
								Status:      attr.Status,
								Type:        attr.AttrType,
								GroupID:     uint(ag.ID),
								Description: attr.Description,
							}
							attrGroupResp.Attrs = append(attrGroupResp.Attrs, attrResp)
						}
					}
					node.AttrGroups = append(node.AttrGroups, attrGroupResp)
				}
			}

			// 递归构建子目录
			children := buildCategoryTree(categories, categoryAttrGroupMap, attrGroupMap, uint(category.ID))
			if len(children) > 0 {
				node.Children = children
			}

			nodes = append(nodes, node)
		}
	}

	// 按照排序字段排序
	sort.Slice(nodes, func(i, j int) bool {
		return nodes[i].Sort < nodes[j].Sort
	})

	return nodes
}

func (s *categoryService) ModifyCategory(ctx context.Context, request *v1.CategoryModifyRequest) error {
	ecategory, err := s.categoryRepository.GetCategoryByCode(ctx, request.Code)
	if err != nil {
		return err
	}
	if request.ID != 0 {
		// 更新
		if ecategory != nil && ecategory.ID != request.ID {
			return errors.New("code已存在")
		}
		category := model.Category{
			ID:         request.ID,
			Name:       request.Name,
			Code:       request.Code,
			Sort:       request.Sort,
			ParentID:   request.ParentID,
			ParentCode: request.ParentCode,
			Level:      request.Level,
			Icon:       request.Icon,
			Status:     request.Status,
		}
		err := s.categoryRepository.Update(ctx, &category)
		if err != nil {
			return err
		}
	} else {
		//先判断保存的code是否存在
		if ecategory != nil {
			return errors.New("code已存在")
		}
		// 创建
		category := model.Category{
			Name:       request.Name,
			Code:       request.Code,
			Sort:       request.Sort,
			ParentID:   request.ParentID,
			ParentCode: request.ParentCode,
			Level:      request.Level,
			Icon:       request.Icon,
			Status:     request.Status,
		}
		err2 := s.categoryRepository.Create(ctx, &category)
		if err2 != nil {
			return err2
		}
	}
	return nil
}

func (s *categoryService) DeleteCategory(ctx context.Context, id int64) error {
	categoryAttrGroups, err := s.categoryAttrGroupRepository.FindByCategoryID(ctx, id)
	if err != nil {
		return err
	}

	attrGroupsIds := make([]uint, 0)
	categoryIds := make([]uint, 0)
	for _, cag := range categoryAttrGroups {
		attrGroupsIds = append(attrGroupsIds, cag.AttrGroupID)
		categoryIds = append(categoryIds, cag.CategoryID)
	}

	// 删除属性组
	if len(attrGroupsIds) > 0 {
		err = s.attrGroupRepository.DeleteByCategoryID(ctx, attrGroupsIds)
		if err != nil {
			return err
		}
	}

	// 删除目录-属性组关联
	if len(categoryIds) > 0 {
		err = s.categoryAttrGroupRepository.DeleteByCategoryIDs(ctx, categoryIds)
		if err != nil {
			return err
		}
	}

	// 删除目录
	err = s.categoryRepository.Delete(ctx, id)
	if err != nil {
		return err
	}
	return nil
}

// 更新或者新增目录属性组
func (s *categoryService) ModifyCategoryGroup(ctx context.Context, request *v1.CategoryGroupModifyRequest) error {

	//根据code查询属性组
	attrGroup, err := s.attrGroupRepository.GetAttrGroupByCode(ctx, request.Code)
	if err != nil {
		return err
	}

	if request.ID != 0 {
		if attrGroup != nil && attrGroup.ID != request.ID {
			return errors.New("code已存在")
		}
		//更新
		attrGroup := model.AttrGroup{
			ID:            request.ID,
			Sort:          request.Sort,
			Type:          request.Type,
			Status:        request.Status,
			Description:   request.Description,
			AttrGroupName: request.Name,
			AttrGroupCode: request.Code,
		}
		err = s.attrGroupRepository.Update(ctx, &attrGroup)
		if err != nil {
			return err
		}
	} else {
		//新增
		if attrGroup != nil {
			return errors.New("code已存在")
		}

		attrGroup := model.AttrGroup{
			Sort:          request.Sort,
			Type:          request.Type,
			Status:        request.Status,
			Description:   request.Description,
			AttrGroupName: request.Name,
			AttrGroupCode: request.Code,
		}
		groupID, err := s.attrGroupRepository.Create(ctx, &attrGroup)
		if err != nil {
			return err
		}

		// 创建目录-属性组关联
		categoryAttrGroup := model.CategoryAttrGroup{
			CategoryID:    request.CategoryID,
			CategoryCode:  request.CategoryCode,
			AttrGroupID:   groupID,
			AttrGroupCode: request.Code,
		}
		_, err = s.categoryAttrGroupRepository.Create(ctx, &categoryAttrGroup)
		if err != nil {
			return err
		}
	}
	return nil
}
