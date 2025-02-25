package service

import (
	"context"
	v1 "rcc-stake-backed/api/v1"
	"rcc-stake-backed/internal/model"
	"rcc-stake-backed/internal/repository"
	"sort"
)

// CategoryService 目录服务接口
type CategoryService interface {
	GetCategory(ctx context.Context, id int64) (*model.Category, error)
	GetCategoryTree(ctx context.Context) ([]v1.CategoryTreeResponse, error)
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
