-- 1.商品目录分类表
CREATE TABLE `rcc_category` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(255) NOT NULL default '' COMMENT '编码',
    `name` VARCHAR(255) NOT NULL default '' COMMENT '名称',
    `parent_id` BIGINT NOT NULL default 0 COMMENT '父级id',
    `parent_code` VARCHAR(255) NOT NULL default '' COMMENT '父级编码',
    `level` INT NOT NULL default 0 COMMENT '级别',
    `sort` INT NOT NULL default 0 COMMENT '排序',
    `icon` VARCHAR(255) NOT NULL default '' COMMENT '图标',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2.属性组
CREATE TABLE `rcc_attr_group` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `attr_group_name` VARCHAR(255) NOT NULL default '' COMMENT '名称',
    `attr_group_code` VARCHAR(255) NOT NULL default '' COMMENT '编码',
    `type` VARCHAR(64) NOT NULL default '' COMMENT '类型',
    `status` INT NOT NULL default 0 COMMENT '状态',
    `sort` INT NOT NULL default 0 COMMENT '排序',
    `description` VARCHAR(255) NOT NULL default '' COMMENT '描述',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3.属性
CREATE TABLE `rcc_attr` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `attr_name` VARCHAR(255) NOT NULL default '' COMMENT '名称',
    `attr_code` VARCHAR(255) NOT NULL default '' COMMENT '编码',
    `attr_group_id` BIGINT NOT NULL default 0 COMMENT '属性组id',
    `attr_group_code` VARCHAR(255) NOT NULL default '' COMMENT '属性组编码',
    `icon` VARCHAR(255) NOT NULL default '' COMMENT '图标',
    `attr_type` INT NOT NULL default 0 COMMENT '属性类型',
    `status` INT NOT NULL default 0 COMMENT '状态',
    `description` VARCHAR(255) NOT NULL default '' COMMENT '描述',
    `sort` INT NOT NULL default 0 COMMENT '排序',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default ''  COMMENT '更新人',
    PRIMARY KEY (`id`),
    KEY `idx_attr_group_id` (`attr_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4.目录属性组关联表
CREATE TABLE `rcc_category_attr_group` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `category_id` BIGINT NOT NULL default 0 COMMENT '商品目录分类id',
    `category_code` VARCHAR(255) NOT NULL default '' COMMENT '商品目录分类编码',
    `attr_group_id` BIGINT NOT NULL default 0 COMMENT '属性组id',
    `attr_group_code` VARCHAR(255) NOT NULL default '' COMMENT '属性组编码',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`),
    KEY `idx_category_id` (`category_id`),
    KEY `idx_attr_group_id` (`attr_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5.商品spu
CREATE TABLE `rcc_product_spu` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(255) NOT NULL default '' COMMENT '编码',
    `name` VARCHAR(255) NOT NULL default '' COMMENT '名称',
    `category1_id` BIGINT NOT NULL default 0 COMMENT '商品目录1分类id',
    `category1_code` VARCHAR(255) NOT NULL default '' COMMENT '商品目录分类编码',
    `category2_id` BIGINT NOT NULL default 0 COMMENT '商品目录2分类id',
    `category2_code` VARCHAR(255) NOT NULL default '' COMMENT '商品目录2分类编码',
    `category3_id` BIGINT NOT NULL default 0 COMMENT '商品目录3分类id',
    `category3_code` VARCHAR(255) NOT NULL default '' COMMENT '商品目录3分类编码',
    `total_sales` INT NOT NULL default 0 COMMENT '总销量',
    `total_stock` INT NOT NULL default 0 COMMENT '总库存',
    `brand` VARCHAR(255) NOT NULL default '' COMMENT '品牌',
    `description` VARCHAR(255) NOT NULL default '' COMMENT '描述',
    `price` DECIMAL(10,2) NOT NULL default 0 COMMENT '价格',
    `real_price` DECIMAL(10,2) NOT NULL default 0 COMMENT '原价',
    `status` INT NOT NULL default 0 COMMENT '状态',
    `images` VARCHAR(1000) NOT NULL default '' COMMENT '图片',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6.商品spu详情
CREATE TABLE `rcc_product_spu_detail` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `product_spu_id` BIGINT NOT NULL default 0 COMMENT '商品spu id',
    `product_spu_code` VARCHAR(255) NOT NULL default '' COMMENT '商品spu编码',
    `detail` LONGBLOB COMMENT '详情',
    `packing_list` LONGBLOB COMMENT '包装清单',
    `after_sale` LONGBLOB COMMENT '售后服务',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`),
    KEY `idx_product_spu_id` (`product_spu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 7.商品spu属性详情表
CREATE TABLE `rcc_product_spu_attr_params` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `product_spu_id` BIGINT NOT NULL default 0 COMMENT '商品spu id',
    `product_spu_code` VARCHAR(255) NOT NULL default '' COMMENT '商品spu编码',
    `code` VARCHAR(255) NOT NULL default '' COMMENT '编码',
    `name` VARCHAR(255) NOT NULL default '' COMMENT '名称',
    `attr_type` INT NOT NULL default 0 COMMENT '类型：1-基本属性，2-销售属性，3-规格属性',
    `value_type` INT NOT NULL default 0 COMMENT '值类型：1-文本，2-图片，3-视频，4-音频，5-链接，6-其它',
    `value` TEXT NOT NULL  COMMENT '值',
    `sort` INT NOT NULL default 0 COMMENT '排序',
    `status` INT NOT NULL default 0 COMMENT '状态',
    `is_required` INT NOT NULL default 0 COMMENT '是否必填',
    `is_generic` INT NOT NULL default 0 COMMENT '是否通用',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`),
    KEY `idx_product_spu_id` (`product_spu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 8.商品sku
CREATE TABLE `rcc_product_sku` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `product_spu_id` BIGINT NOT NULL default 0 COMMENT '商品spu id',
    `product_spu_code` VARCHAR(255) NOT NULL default '' COMMENT '商品spu编码',
    `sku_code` VARCHAR(255) NOT NULL default '' COMMENT 'sku编码',
    `price` DECIMAL(10,2) NOT NULL default 0 COMMENT '价格',
    `stock` INT NOT NULL default 0 COMMENT '库存',
    `sale_count` INT NOT NULL COMMENT '销量',
    `status` INT NOT NULL COMMENT '状态',
    `indexs` INT NOT NULL default 0 COMMENT '规格索引',
    `attr_params` TEXT  COMMENT '属性参数',
    `images` VARCHAR(1000) COMMENT '图片',
    `title` VARCHAR(255) COMMENT '标题',
    `sub_title` VARCHAR(255) COMMENT '副标题',
    `description` VARCHAR(255) COMMENT '描述',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`),
    KEY `idx_product_spu_id` (`product_spu_id`),
    UNIQUE KEY `uk_sku_code` (`sku_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;





-- 插入目录相关示例数据
-- 插入一级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
VALUES 
('100000', 'NFT专区', 0, '', 1, 1, '', NOW(), NOW(), 0, 'admin', 'admin'),
('200000', '数字素材类', 0, '', 1, 2, '', NOW(), NOW(), 0, 'admin', 'admin'),
('300000', '学习资源类', 0, '', 1, 3, '', NOW(), NOW(), 0, 'admin', 'admin'),
('400000', '生活娱乐类', 0, '', 1, 4, '', NOW(), NOW(), 0, 'admin', 'admin'),
('500000', '会员权益类', 0, '', 1, 5, '', NOW(), NOW(), 0, 'admin', 'admin'),
('600000', '软件服务类', 0, '', 1, 6, '', NOW(), NOW(), 0, 'admin', 'admin');


-- 插入NFT专区的二级目录
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '101000' as code,
    '数字艺术品' as name,
    id as parent_id,
    '100000' as parent_code,
    2 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '100000'
UNION ALL
SELECT '102000', '虚拟身份', id, '100000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '100000'
UNION ALL
SELECT '103000', '游戏资产', id, '100000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '100000'
UNION ALL
SELECT '104000', '收藏品', id, '100000', 2, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '100000'
UNION ALL
SELECT '105000', '虚拟房地产', id, '100000', 2, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '100000'
UNION ALL
SELECT '106000', '数字证书', id, '100000', 2, 6, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '100000'
UNION ALL
SELECT '107000', '金融资产', id, '100000', 2, 7, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '100000';

-- 插入数字艺术品(101000)下的三级分类
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '101001' as code,
    '潮流艺术画作NFT' as name,
    id as parent_id,
    '101000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '101000'
UNION ALL
SELECT '101002', '先锋音乐作品NFT', id, '101000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '101000'
UNION ALL
SELECT '101003', '视频艺术NFT', id, '101000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '101000'
UNION ALL
SELECT '101004', '文本类型NFT', id, '101000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '101000'
UNION ALL
SELECT '101005', '其它类型NFT', id, '101000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '101000';

-- 插入虚拟身份(102000)下的三级分类
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '102001' as code,
    '独特头像NFT' as name,
    id as parent_id,
    '102000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '102000'
UNION ALL
SELECT '102002', '定制虚拟形象NFT', id, '102000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '102000'
UNION ALL
SELECT '102003', '专属社交身份NFT', id, '102000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '102000';

-- 插入游戏资产(103000)下的三级分类
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '103001' as code,
    '游戏道具NFT' as name,
    id as parent_id,
    '103000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '103000'
UNION ALL
SELECT '103002', '游戏装备NFT', id, '103000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '103000'
UNION ALL
SELECT '103003', '游戏角色NFT', id, '103000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '103000';

-- 插入收藏品(104000)下的三级分类
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '104001' as code,
    '体育赛事纪念NFT' as name,
    id as parent_id,
    '104000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '104000'
UNION ALL
SELECT '104002', '历史文化收藏NFT', id, '104000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '104000'
UNION ALL
SELECT '104003', '名人周边NFT', id, '104000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '104000'
UNION ALL
SELECT '104004', '限量版徽章NFT', id, '104000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '104000';

-- 插入虚拟房地产(105000)下的三级分类
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '105001' as code,
    '元宇宙地块NFT' as name,
    id as parent_id,
    '105000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '105000'
UNION ALL
SELECT '105002', '虚拟建筑NFT', id, '105000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '105000'
UNION ALL
SELECT '105003', '数字空间NFT', id, '105000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '105000';

-- 插入数字证书(106000)下的三级分类
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '106001' as code,
    '教育认证NFT' as name,
    id as parent_id,
    '106000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '106000'
UNION ALL
SELECT '106002', '会员资格NFT', id, '106000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '106000'
UNION ALL
SELECT '106003', '活动门票NFT', id, '106000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '106000'
UNION ALL
SELECT '106004', '数字版权NFT', id, '106000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '106000';

-- 插入金融资产(107000)下的三级分类
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '107001' as code,
    '数字债券NFT' as name,
    id as parent_id,
    '107000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '107000'
UNION ALL
SELECT '107002', '资产凭证NFT', id, '107000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '107000'
UNION ALL
SELECT '107003', '股权通证NFT', id, '107000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '107000';



-- 插入数字素材类二级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '201000' as code,
    '文档模板' as name,
    id as parent_id,
    '200000' as parent_code,
    2 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '200000'
UNION ALL
SELECT '202000', '图片素材', id, '200000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '200000'
UNION ALL
SELECT '203000', '音频素材', id, '200000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '200000'
UNION ALL
SELECT '204000', '视频素材', id, '200000', 2, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '200000';


-- 插入文档模板的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '201001' as code,
    'world' as name,
    id as parent_id,
    '201000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '201000'
UNION ALL
SELECT '201002', 'excel', id, '201000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '201000'
UNION ALL
SELECT '201003', 'ppt', id, '201000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '201000'
UNION ALL
SELECT '201004', 'pdf', id, '201000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '201000'
UNION ALL
SELECT '201005', '其它', id, '201000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '201000';


-- 插入图片素材的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '202001' as code,
    '壁纸' as name,
    id as parent_id,
    '202000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '202000'
UNION ALL
SELECT '202002', '头像', id, '202000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '202000'
UNION ALL
SELECT '202003', '海报', id, '202000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '202000'
UNION ALL
SELECT '202004', '插画', id, '202000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '202000';


-- 插入音乐素材的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '203001' as code,
    '背景音乐' as name,
    id as parent_id,
    '203000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '203000'
UNION ALL
SELECT '203002', '配乐相关', id, '203000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '203000'
UNION ALL
SELECT '203003', '音乐节拍', id, '203000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '203000'
UNION ALL
SELECT '203004', '自然声音', id, '203000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '203000'
UNION ALL
SELECT '203005', '其它', id, '203000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '203000';


-- 插入视频素材的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '204001' as code,
    '广告视频' as name,
    id as parent_id,
    '204000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '204000'
UNION ALL
SELECT '204002', '宣传片', id, '204000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '204000'
UNION ALL
SELECT '204003', '教学视频', id, '204000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '204000'
UNION ALL
SELECT '204004', '动画视频', id, '204000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '204000'
UNION ALL
SELECT '204005', '其它', id, '204000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '204000';



-- 插入学习资源类的二级目录
-- 插入学习资源类二级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '301000' as code,
    '学术资料' as name,
    id as parent_id,
    '300000' as parent_code,
    2 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '300000'
UNION ALL
SELECT '302000', '职业技能', id, '300000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '300000'
UNION ALL
SELECT '303000', '语言学习', id, '300000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '300000'
UNION ALL
SELECT '304000', '其它', id, '300000', 2, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '300000';


-- 插入学术资料的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '301001' as code,
    '论文' as name,
    id as parent_id,
    '301000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '301000'
UNION ALL
SELECT '301002', '书籍', id, '301000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '301000'
UNION ALL
SELECT '301003', '报告', id, '301000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '301000'
UNION ALL
SELECT '301004', '真题', id, '301000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '301000'
UNION ALL
SELECT '301005', '课件', id, '301000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '301000'
UNION ALL
SELECT '301006', '其它', id, '301000', 3, 6, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '301000';


-- 插入职业技能的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '302001' as code,
    '编程' as name,
    id as parent_id,
    '302000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '302000'
UNION ALL
SELECT '302002', '设计', id, '302000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '302000'
UNION ALL
SELECT '302003', '营销', id, '302000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '302000'
UNION ALL
SELECT '302004', '其它', id, '302000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '302000';

-- 插入语言学习的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '303001' as code,
    '英语' as name,
    id as parent_id,
    '303000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '303000'
UNION ALL
SELECT '303002', '日语', id, '303000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '303000'
UNION ALL
SELECT '303003', '韩语', id, '303000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '303000'
UNION ALL
SELECT '303004', '其它', id, '303000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '303000';

-- 插入生活娱乐类的二级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '401000' as code,
    '影音娱乐' as name,
    id as parent_id,
    '400000' as parent_code,
    2 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '400000'
UNION ALL
SELECT '402000', '游戏周边', id, '400000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '400000'
UNION ALL
SELECT '403000', '兴趣爱好', id, '400000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '400000';

-- 插入影音娱乐的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '401001' as code,
    '电影' as name,
    id as parent_id,
    '401000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '401000'
UNION ALL
SELECT '401002', '电视剧', id, '401000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '401000'
UNION ALL
SELECT '401003', '综艺', id, '401000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '401000'
UNION ALL
SELECT '401004', '动漫', id, '401000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '401000'
UNION ALL
SELECT '401005', '游戏', id, '401000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '401000'
UNION ALL
SELECT '401006', '其它', id, '401000', 3, 6, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '401000';

-- 插入游戏周边的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '402001' as code,
    '虚拟物品' as name,
    id as parent_id,
    '402000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '402000'
UNION ALL
SELECT '402002', '账号服务', id, '402000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '402000'
UNION ALL
SELECT '402003', '辅助工具', id, '402000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '402000'
UNION ALL
SELECT '402004', '游戏服务', id, '402000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '402000';

-- 插入兴趣爱好的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '403001' as code,
    '运动健身' as name,
    id as parent_id,
    '403000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '403000'
UNION ALL
SELECT '403002', '摄影摄像', id, '403000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '403000'
UNION ALL
SELECT '403003', '绘画设计', id, '403000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '403000'
UNION ALL
SELECT '403004', '音乐舞蹈', id, '403000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '403000'
UNION ALL
SELECT '403005', '阅读写作', id, '403000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '403000'
UNION ALL
SELECT '403006', '其它', id, '403000', 3, 6, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '403000';


-- 插入会员权益类的二级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '501000' as code,
    '视频会员' as name,
    id as parent_id,
    '500000' as parent_code,
    2 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '500000'
UNION ALL
SELECT '502000', '音乐会员', id, '500000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '500000'
UNION ALL
SELECT '503000', '阅读会员', id, '500000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '500000'
UNION ALL
SELECT '504000', '其它', id, '500000', 2, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '500000';

-- 插入视频会员的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '501001' as code,
    '爱奇艺' as name,
    id as parent_id,
    '501000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '501000'
UNION ALL
SELECT '501002', '腾讯视频', id, '501000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '501000'
UNION ALL
SELECT '501003', '优酷', id, '501000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '501000'
UNION ALL
SELECT '501004', '哔哩哔哩', id, '501000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '501000'
UNION ALL
SELECT '501005', '其它', id, '501000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '501000';

-- 插入音乐会员的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '502001' as code,
    '网易云音乐' as name,
    id as parent_id,
    '502000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '502000'
UNION ALL
SELECT '502002', 'QQ音乐', id, '502000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '502000'
UNION ALL
SELECT '502003', '酷狗音乐', id, '502000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '502000'
UNION ALL
SELECT '502004', '酷我音乐', id, '502000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '502000'
UNION ALL
SELECT '502005', '其它', id, '502000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '502000';

-- 插入阅读会员的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '503001' as code,
    '得到' as name,
    id as parent_id,
    '503000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '503000'
UNION ALL
SELECT '503002', '喜马拉雅', id, '503000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '503000'
UNION ALL
SELECT '503003', '其它', id, '503000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '503000';

-- 插入软件服务类的二级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '601000' as code,
    '安装程序' as name,
    id as parent_id,
    '600000' as parent_code,
    2 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '600000'
UNION ALL
SELECT '602000', '激活码', id, '600000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '600000'
UNION ALL
SELECT '603000', '破解工具', id, '600000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '600000'
UNION ALL
SELECT '604000', '其它服务', id, '600000', 2, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '600000';

-- 插入安装程序的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '601001' as code,
    '办公软件' as name,
    id as parent_id,
    '601000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '601000'
UNION ALL
SELECT '601002', '设计软件', id, '601000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '601000'
UNION ALL
SELECT '601003', '编程软件', id, '601000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '601000'
UNION ALL
SELECT '601004', '影音软件', id, '601000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '601000'
UNION ALL
SELECT '601005', '其它', id, '601000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '601000';

-- 插入激活码的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '602001' as code,
    'office 365全家桶' as name,
    id as parent_id,
    '602000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '602000'
UNION ALL
SELECT '602002', '金山办公', id, '602000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '602000'
UNION ALL
SELECT '602003', '腾讯文档', id, '602000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '602000'
UNION ALL
SELECT '602004', 'wps', id, '602000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '602000'
UNION ALL
SELECT '602005', '其它', id, '602000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '602000';

-- 插入破解工具的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '603001' as code,
    'office 365全家桶' as name,
    id as parent_id,
    '603000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '603000'
UNION ALL
SELECT '603002', '金山办公', id, '603000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '603000'
UNION ALL
SELECT '603003', '腾讯文档', id, '603000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '603000'
UNION ALL
SELECT '603004', 'wps', id, '603000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '603000'
UNION ALL
SELECT '603005', '其它', id, '603000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '603000';

-- 插入数字素材类二级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '201000' as code,
    '文档模板' as name,
    id as parent_id,
    '200000' as parent_code,
    2 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '200000'
UNION ALL
SELECT '202000', '图片素材', id, '200000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '200000'
UNION ALL
SELECT '203000', '音频素材', id, '200000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '200000'
UNION ALL
SELECT '204000', '视频素材', id, '200000', 2, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '200000';


-- 插入文档模板的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '201001' as code,
    'world' as name,
    id as parent_id,
    '201000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '201000'
UNION ALL
SELECT '201002', 'excel', id, '201000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '201000'
UNION ALL
SELECT '201003', 'ppt', id, '201000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '201000'
UNION ALL
SELECT '201004', 'pdf', id, '201000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '201000'
UNION ALL
SELECT '201005', '其它', id, '201000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '201000';


-- 插入图片素材的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '202001' as code,
    '壁纸' as name,
    id as parent_id,
    '202000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '202000'
UNION ALL
SELECT '202002', '头像', id, '202000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '202000'
UNION ALL
SELECT '202003', '海报', id, '202000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '202000'
UNION ALL
SELECT '202004', '插画', id, '202000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '202000';


-- 插入音乐素材的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '203001' as code,
    '背景音乐' as name,
    id as parent_id,
    '203000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '203000'
UNION ALL
SELECT '203002', '配乐相关', id, '203000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '203000'
UNION ALL
SELECT '203003', '音乐节拍', id, '203000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '203000'
UNION ALL
SELECT '203004', '自然声音', id, '203000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '203000'
UNION ALL
SELECT '203005', '其它', id, '203000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '203000';


-- 插入视频素材的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '204001' as code,
    '广告视频' as name,
    id as parent_id,
    '204000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '204000'
UNION ALL
SELECT '204002', '宣传片', id, '204000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '204000'
UNION ALL
SELECT '204003', '教学视频', id, '204000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '204000'
UNION ALL
SELECT '204004', '动画视频', id, '204000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '204000'
UNION ALL
SELECT '204005', '其它', id, '204000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '204000';



-- 插入学习资源类的二级目录
-- 插入学习资源类二级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '301000' as code,
    '学术资料' as name,
    id as parent_id,
    '300000' as parent_code,
    2 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '300000'
UNION ALL
SELECT '302000', '职业技能', id, '300000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '300000'
UNION ALL
SELECT '303000', '语言学习', id, '300000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '300000'
UNION ALL
SELECT '304000', '其它', id, '300000', 2, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '300000';


-- 插入学术资料的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '301001' as code,
    '论文' as name,
    id as parent_id,
    '301000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '301000'
UNION ALL
SELECT '301002', '书籍', id, '301000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '301000'
UNION ALL
SELECT '301003', '报告', id, '301000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '301000'
UNION ALL
SELECT '301004', '真题', id, '301000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '301000'
UNION ALL
SELECT '301005', '课件', id, '301000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '301000'
UNION ALL
SELECT '301006', '其它', id, '301000', 3, 6, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '301000';


-- 插入职业技能的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '302001' as code,
    '编程' as name,
    id as parent_id,
    '302000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '302000'
UNION ALL
SELECT '302002', '设计', id, '302000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '302000'
UNION ALL
SELECT '302003', '营销', id, '302000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '302000'
UNION ALL
SELECT '302004', '其它', id, '302000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '302000';

-- 插入语言学习的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '303001' as code,
    '英语' as name,
    id as parent_id,
    '303000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '303000'
UNION ALL
SELECT '303002', '日语', id, '303000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '303000'
UNION ALL
SELECT '303003', '韩语', id, '303000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '303000'
UNION ALL
SELECT '303004', '其它', id, '303000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '303000';

-- 插入生活娱乐类的二级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '401000' as code,
    '影音娱乐' as name,
    id as parent_id,
    '400000' as parent_code,
    2 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '400000'
UNION ALL
SELECT '402000', '游戏周边', id, '400000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '400000'
UNION ALL
SELECT '403000', '兴趣爱好', id, '400000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '400000';

-- 插入影音娱乐的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '401001' as code,
    '电影' as name,
    id as parent_id,
    '401000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '401000'
UNION ALL
SELECT '401002', '电视剧', id, '401000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '401000'
UNION ALL
SELECT '401003', '综艺', id, '401000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '401000'
UNION ALL
SELECT '401004', '动漫', id, '401000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '401000'
UNION ALL
SELECT '401005', '游戏', id, '401000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '401000'
UNION ALL
SELECT '401006', '其它', id, '401000', 3, 6, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '401000';

-- 插入游戏周边的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '402001' as code,
    '虚拟物品' as name,
    id as parent_id,
    '402000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '402000'
UNION ALL
SELECT '402002', '账号服务', id, '402000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '402000'
UNION ALL
SELECT '402003', '辅助工具', id, '402000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '402000'
UNION ALL
SELECT '402004', '游戏服务', id, '402000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '402000';

-- 插入兴趣爱好的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '403001' as code,
    '运动健身' as name,
    id as parent_id,
    '403000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '403000'
UNION ALL
SELECT '403002', '摄影摄像', id, '403000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '403000'
UNION ALL
SELECT '403003', '绘画设计', id, '403000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '403000'
UNION ALL
SELECT '403004', '音乐舞蹈', id, '403000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '403000'
UNION ALL
SELECT '403005', '阅读写作', id, '403000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '403000'
UNION ALL
SELECT '403006', '其它', id, '403000', 3, 6, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '403000';


-- 插入会员权益类的二级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '501000' as code,
    '视频会员' as name,
    id as parent_id,
    '500000' as parent_code,
    2 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '500000'
UNION ALL
SELECT '502000', '音乐会员', id, '500000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '500000'
UNION ALL
SELECT '503000', '阅读会员', id, '500000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '500000'
UNION ALL
SELECT '504000', '其它', id, '500000', 2, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '500000';

-- 插入视频会员的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '501001' as code,
    '爱奇艺' as name,
    id as parent_id,
    '501000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '501000'
UNION ALL
SELECT '501002', '腾讯视频', id, '501000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '501000'
UNION ALL
SELECT '501003', '优酷', id, '501000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '501000'
UNION ALL
SELECT '501004', '哔哩哔哩', id, '501000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '501000'
UNION ALL
SELECT '501005', '其它', id, '501000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '501000';

-- 插入音乐会员的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '502001' as code,
    '网易云音乐' as name,
    id as parent_id,
    '502000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '502000'
UNION ALL
SELECT '502002', 'QQ音乐', id, '502000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '502000'
UNION ALL
SELECT '502003', '酷狗音乐', id, '502000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '502000'
UNION ALL
SELECT '502004', '酷我音乐', id, '502000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '502000'
UNION ALL
SELECT '502005', '其它', id, '502000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '502000';

-- 插入阅读会员的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '503001' as code,
    '得到' as name,
    id as parent_id,
    '503000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '503000'
UNION ALL
SELECT '503002', '喜马拉雅', id, '503000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '503000'
UNION ALL
SELECT '503003', '其它', id, '503000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '503000';

-- 插入软件服务类的二级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '601000' as code,
    '安装程序' as name,
    id as parent_id,
    '600000' as parent_code,
    2 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '600000'
UNION ALL
SELECT '602000', '激活码', id, '600000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '600000'
UNION ALL
SELECT '603000', '破解工具', id, '600000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '600000'
UNION ALL
SELECT '604000', '其它服务', id, '600000', 2, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '600000';

-- 插入安装程序的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '601001' as code,
    '办公软件' as name,
    id as parent_id,
    '601000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '601000'
UNION ALL
SELECT '601002', '设计软件', id, '601000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '601000'
UNION ALL
SELECT '601003', '编程软件', id, '601000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '601000'
UNION ALL
SELECT '601004', '影音软件', id, '601000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '601000'
UNION ALL
SELECT '601005', '其它', id, '601000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '601000';

-- 插入激活码的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '602001' as code,
    'office 365全家桶' as name,
    id as parent_id,
    '602000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '602000'
UNION ALL
SELECT '602002', '金山办公', id, '602000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '602000'
UNION ALL
SELECT '602003', '腾讯文档', id, '602000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '602000'
UNION ALL
SELECT '602004', 'wps', id, '602000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '602000'
UNION ALL
SELECT '602005', '其它', id, '602000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '602000';

-- 插入破解工具的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '603001' as code,
    'office 365全家桶' as name,
    id as parent_id,
    '603000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '603000'
UNION ALL
SELECT '603002', '金山办公', id, '603000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '603000'
UNION ALL
SELECT '603003', '腾讯文档', id, '603000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '603000'
UNION ALL
SELECT '603004', 'wps', id, '603000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '603000'
UNION ALL
SELECT '603005', '其它', id, '603000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '603000';

-- 插入数字素材类二级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '201000' as code,
    '文档模板' as name,
    id as parent_id,
    '200000' as parent_code,
    2 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '200000'
UNION ALL
SELECT '202000', '图片素材', id, '200000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '200000'
UNION ALL
SELECT '203000', '音频素材', id, '200000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '200000'
UNION ALL
SELECT '204000', '视频素材', id, '200000', 2, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '200000';


-- 插入文档模板的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '201001' as code,
    'world' as name,
    id as parent_id,
    '201000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '201000'
UNION ALL
SELECT '201002', 'excel', id, '201000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '201000'
UNION ALL
SELECT '201003', 'ppt', id, '201000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '201000'
UNION ALL
SELECT '201004', 'pdf', id, '201000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '201000'
UNION ALL
SELECT '201005', '其它', id, '201000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '201000';


-- 插入图片素材的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '202001' as code,
    '壁纸' as name,
    id as parent_id,
    '202000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '202000'
UNION ALL
SELECT '202002', '头像', id, '202000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '202000'
UNION ALL
SELECT '202003', '海报', id, '202000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '202000'
UNION ALL
SELECT '202004', '插画', id, '202000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '202000';


-- 插入音乐素材的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '203001' as code,
    '背景音乐' as name,
    id as parent_id,
    '203000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '203000'
UNION ALL
SELECT '203002', '配乐相关', id, '203000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '203000'
UNION ALL
SELECT '203003', '音乐节拍', id, '203000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '203000'
UNION ALL
SELECT '203004', '自然声音', id, '203000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '203000'
UNION ALL
SELECT '203005', '其它', id, '203000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '203000';


-- 插入视频素材的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '204001' as code,
    '广告视频' as name,
    id as parent_id,
    '204000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '204000'
UNION ALL
SELECT '204002', '宣传片', id, '204000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '204000'
UNION ALL
SELECT '204003', '教学视频', id, '204000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '204000'
UNION ALL
SELECT '204004', '动画视频', id, '204000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '204000'
UNION ALL
SELECT '204005', '其它', id, '204000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '204000';



-- 插入学习资源类的二级目录
-- 插入学习资源类二级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '301000' as code,
    '学术资料' as name,
    id as parent_id,
    '300000' as parent_code,
    2 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '300000'
UNION ALL
SELECT '302000', '职业技能', id, '300000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '300000'
UNION ALL
SELECT '303000', '语言学习', id, '300000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '300000'
UNION ALL
SELECT '304000', '其它', id, '300000', 2, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '300000';



-- 插入学术资料的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '301001' as code,
    '论文' as name,
    id as parent_id,
    '301000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '301000'
UNION ALL
SELECT '301002', '书籍', id, '301000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '301000'
UNION ALL
SELECT '301003', '报告', id, '301000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '301000'
UNION ALL
SELECT '301004', '真题', id, '301000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '301000'
UNION ALL
SELECT '301005', '课件', id, '301000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '301000'
UNION ALL
SELECT '301006', '其它', id, '301000', 3, 6, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '301000';


-- 插入职业技能的三级目录数据
INSERT INTO `rcc_category` (`code`, `name`, `parent_id`, `parent_code`, `level`, `sort`, `icon`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
    '302001' as code,
    '编程' as name,
    id as parent_id,
    '302000' as parent_code,
    3 as level,
    1 as sort,
    '' as icon,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category WHERE code = '302000'
UNION ALL
SELECT '302002', '设计', id, '302000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category WHERE code = '302000';


-- 插入NFT属性组数据
INSERT INTO `rcc_attr_group` (`attr_group_name`, `attr_group_code`, `type`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) VALUES
-- 基础属性组
('应用领域', 'NFT_APPLICATION_FIELD', 1, 1, 1, 'NFT应用领域属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('技术形式', 'NFT_TECH_FORM', 1, 1, 2, 'NFT技术形式属性组', NOW(), NOW(), 0, 'admin', 'admin'),

-- 数字艺术品属性组
('艺术风格', 'NFT_ART_STYLE', 1, 1, 3, '艺术作品风格属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('艺术主题', 'NFT_ART_THEME', 1, 1, 4, '艺术作品主题属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('创作方式', 'NFT_CREATION_METHOD', 1, 1, 5, '音乐创作方式属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('音乐类型', 'NFT_MUSIC_TYPE', 1, 1, 6, '音乐类型属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('视频类型', 'NFT_VIDEO_TYPE', 1, 1, 7, '视频类型属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('视频时长', 'NFT_VIDEO_DURATION', 1, 1, 8, '视频时长属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('文本体裁', 'NFT_TEXT_GENRE', 1, 1, 9, '文本体裁属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('文本语言', 'NFT_TEXT_LANGUAGE', 1, 1, 10, '文本语言属性组', NOW(), NOW(), 0, 'admin', 'admin'),

-- 虚拟身份属性组
('应用平台', 'NFT_APP_PLATFORM', 1, 1, 11, '虚拟身份应用平台属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('形象来源', 'NFT_IMAGE_SOURCE', 1, 1, 12, '头像形象来源属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('稀有度', 'NFT_RARITY', 1, 1, 13, 'NFT稀有度属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('定制元素', 'NFT_CUSTOM_ELEMENT', 1, 1, 14, '虚拟形象定制元素属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('适用场景', 'NFT_APPLICATION_SCENE', 1, 1, 15, '虚拟形象适用场景属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('身份象征', 'NFT_IDENTITY_SYMBOL', 1, 1, 16, '社交身份象征属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('特权', 'NFT_PRIVILEGE', 1, 1, 17, '社交身份特权属性组', NOW(), NOW(), 0, 'admin', 'admin'),

-- 游戏资产属性组
('游戏类型', 'NFT_GAME_TYPE', 1, 1, 18, '游戏类型属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('道具功能', 'NFT_PROP_FUNCTION', 1, 1, 19, '游戏道具功能属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('获取方式', 'NFT_ACQUISITION_METHOD', 1, 1, 20, '游戏道具获取方式属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('装备部位', 'NFT_EQUIPMENT_POSITION', 1, 1, 21, '游戏装备部位属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('品质', 'NFT_QUALITY', 1, 1, 22, '游戏装备品质属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('职业', 'NFT_PROFESSION', 1, 1, 23, '游戏角色职业属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('等级上限', 'NFT_LEVEL_CAP', 1, 1, 24, '游戏角色等级上限属性组', NOW(), NOW(), 0, 'admin', 'admin'),

-- 收藏品属性组
('体育项目', 'NFT_SPORTS', 1, 1, 25, '体育项目属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('赛事类型', 'NFT_COMPETITION_TYPE', 1, 1, 26, '体育赛事类型属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('历史时期', 'NFT_HISTORICAL_PERIOD', 1, 1, 27, '历史时期属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('文化类型', 'NFT_CULTURE_TYPE', 1, 1, 28, '文化类型属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('名人领域', 'NFT_CELEBRITY_FIELD', 1, 1, 29, '名人领域属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('周边形式', 'NFT_PERIPHERAL_FORM', 1, 1, 30, '名人周边形式属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('徽章主题', 'NFT_BADGE_THEME', 1, 1, 31, '徽章主题属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('限量数量', 'NFT_LIMITED_QUANTITY', 1, 1, 32, '限量版数量属性组', NOW(), NOW(), 0, 'admin', 'admin'),

-- 虚拟房地产属性组
('平台', 'NFT_PLATFORM_TYPE', 1, 1, 33, '虚拟房地产平台属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('位置', 'NFT_LOCATION', 1, 1, 34, '虚拟房地产位置属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('面积', 'NFT_AREA', 1, 1, 35, '虚拟房地产面积属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('空间风格', 'NFT_SPACE_STYLE', 1, 1, 36, '虚拟建筑风格属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('空间用途', 'NFT_SPACE_USE', 1, 1, 37, '虚拟建筑用途属性组', NOW(), NOW(), 0, 'admin', 'admin'),

-- 数字证书属性组
('认证类型', 'NFT_CERT_TYPE', 1, 1, 38, '教育认证类型属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('颁发机构', 'NFT_ISSUING_ORG', 1, 1, 39, '证书颁发机构属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('会员等级', 'NFT_MEMBER_LEVEL', 1, 1, 40, '会员等级属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('会员权益', 'NFT_MEMBER_RIGHTS', 1, 1, 41, '会员权益属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('活动类型', 'NFT_EVENT_TYPE', 1, 1, 42, '活动类型属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('座位等级', 'NFT_SEAT_LEVEL', 1, 1, 43, '活动座位等级属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('版权类型', 'NFT_COPYRIGHT_TYPE', 1, 1, 44, '数字版权类型属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('授权方式', 'NFT_LICENSE_TYPE', 1, 1, 45, '版权授权方式属性组', NOW(), NOW(), 0, 'admin', 'admin'),

-- 金融资产属性组
('债券期限', 'NFT_BOND_PERIOD', 1, 1, 46, '数字债券期限属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('利率类型', 'NFT_INTEREST_TYPE', 1, 1, 47, '债券利率类型属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('资产类别', 'NFT_ASSET_TYPE', 1, 1, 48, '资产凭证类别属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('凭证用途', 'NFT_VOUCHER_USE', 1, 1, 49, '资产凭证用途属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('企业领域', 'NFT_ENTERPRISE_FIELD', 1, 1, 50, '股权企业领域属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('股权比例', 'NFT_EQUITY_RATIO', 1, 1, 51, '股权通证比例属性组', NOW(), NOW(), 0, 'admin', 'admin');

-- 应用领域属性数据
-- 插入NFT属性值数据
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'艺术创作', 'NFT_APPLICATION_FIELD_ART', id, 'NFT_APPLICATION_FIELD', 1, 1, '艺术创作领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_APPLICATION_FIELD'
UNION ALL
SELECT 
'虚拟资产', 'NFT_APPLICATION_FIELD_VIRTUAL', id, 'NFT_APPLICATION_FIELD', 1, 2, '虚拟资产领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_APPLICATION_FIELD'
UNION ALL
SELECT 
'游戏相关', 'NFT_APPLICATION_FIELD_GAME', id, 'NFT_APPLICATION_FIELD', 1, 3, '游戏相关领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_APPLICATION_FIELD'
UNION ALL
SELECT 
'艺术收藏', 'NFT_APPLICATION_FIELD_COLLECTION', id, 'NFT_APPLICATION_FIELD', 1, 4, '艺术收藏领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_APPLICATION_FIELD'
UNION ALL
SELECT 
'域名', 'NFT_APPLICATION_FIELD_DOMAIN', id, 'NFT_APPLICATION_FIELD', 1, 5, '域名领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_APPLICATION_FIELD';

-- 技术形式属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'区块链数字艺术品', 'NFT_TECH_FORM_BLOCKCHAIN', id, 'NFT_TECH_FORM', 1, 1, '区块链数字艺术品形式', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_TECH_FORM'
UNION ALL
SELECT 
'人工智能生成艺术品', 'NFT_TECH_FORM_AI', id, 'NFT_TECH_FORM', 1, 2, '人工智能生成艺术品形式', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_TECH_FORM'
UNION ALL
SELECT 
'传统数字艺术形式', 'NFT_TECH_FORM_TRADITIONAL', id, 'NFT_TECH_FORM', 1, 3, '传统数字艺术形式', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_TECH_FORM';

-- 艺术风格属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'赛博朋克', 'NFT_ART_STYLE_CYBERPUNK', id, 'NFT_ART_STYLE', 1, 1, '赛博朋克风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ART_STYLE'
UNION ALL
SELECT 
'波普艺术', 'NFT_ART_STYLE_POP', id, 'NFT_ART_STYLE', 1, 2, '波普艺术风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ART_STYLE'
UNION ALL
SELECT 
'新艺术运动风', 'NFT_ART_STYLE_NEW', id, 'NFT_ART_STYLE', 1, 3, '新艺术运动风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ART_STYLE'
UNION ALL
SELECT 
'简约', 'NFT_ART_STYLE_SIMPLE', id, 'NFT_ART_STYLE', 1, 4, '简约风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ART_STYLE'
UNION ALL
SELECT 
'黑白', 'NFT_ART_STYLE_BW', id, 'NFT_ART_STYLE', 1, 5, '黑白风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ART_STYLE';

-- 艺术主题属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'未来都市', 'NFT_ART_THEME_FUTURE', id, 'NFT_ART_THEME', 1, 1, '未来都市主题', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ART_THEME'
UNION ALL
SELECT 
'复古情怀', 'NFT_ART_THEME_RETRO', id, 'NFT_ART_THEME', 1, 2, '复古情怀主题', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ART_THEME'
UNION ALL
SELECT 
'人物', 'NFT_ART_THEME_CHARACTER', id, 'NFT_ART_THEME', 1, 3, '人物主题', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ART_THEME'
UNION ALL
SELECT 
'汽车', 'NFT_ART_THEME_CAR', id, 'NFT_ART_THEME', 1, 4, '汽车主题', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ART_THEME';

-- 创作方式属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'原创', 'NFT_CREATION_METHOD_ORIGINAL', id, 'NFT_CREATION_METHOD', 1, 1, '原创方式', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CREATION_METHOD'
UNION ALL
SELECT 
'混音', 'NFT_CREATION_METHOD_REMIX', id, 'NFT_CREATION_METHOD', 1, 2, '混音方式', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CREATION_METHOD'
UNION ALL
SELECT 
'采样', 'NFT_CREATION_METHOD_SAMPLE', id, 'NFT_CREATION_METHOD', 1, 3, '采样方式', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CREATION_METHOD';

-- 音乐类型属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'电子', 'NFT_MUSIC_TYPE_ELECTRONIC', id, 'NFT_MUSIC_TYPE', 1, 1, '电子音乐', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_MUSIC_TYPE'
UNION ALL
SELECT 
'摇滚', 'NFT_MUSIC_TYPE_ROCK', id, 'NFT_MUSIC_TYPE', 1, 2, '摇滚音乐', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_MUSIC_TYPE'
UNION ALL
SELECT 
'嘻哈', 'NFT_MUSIC_TYPE_HIPHOP', id, 'NFT_MUSIC_TYPE', 1, 3, '嘻哈音乐', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_MUSIC_TYPE'
UNION ALL
SELECT 
'古典', 'NFT_MUSIC_TYPE_CLASSICAL', id, 'NFT_MUSIC_TYPE', 1, 4, '古典音乐', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_MUSIC_TYPE';

-- 视频类型属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'动画短片', 'NFT_VIDEO_TYPE_ANIMATION', id, 'NFT_VIDEO_TYPE', 1, 1, '动画短片', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_VIDEO_TYPE'
UNION ALL
SELECT 
'实验影像', 'NFT_VIDEO_TYPE_EXPERIMENTAL', id, 'NFT_VIDEO_TYPE', 1, 2, '实验影像', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_VIDEO_TYPE'
UNION ALL
SELECT 
'纪录片片段', 'NFT_VIDEO_TYPE_DOCUMENTARY', id, 'NFT_VIDEO_TYPE', 1, 3, '纪录片片段', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_VIDEO_TYPE'
UNION ALL
SELECT 
'剧情短片', 'NFT_VIDEO_TYPE_DRAMA', id, 'NFT_VIDEO_TYPE', 1, 4, '剧情短片', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_VIDEO_TYPE';

-- 视频时长属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'1分钟以内', 'NFT_VIDEO_DURATION_1MIN', id, 'NFT_VIDEO_DURATION', 1, 1, '1分钟以内', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_VIDEO_DURATION'
UNION ALL
SELECT 
'1-5分钟', 'NFT_VIDEO_DURATION_1_5MIN', id, 'NFT_VIDEO_DURATION', 1, 2, '1-5分钟', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_VIDEO_DURATION'
UNION ALL
SELECT 
'5-15分钟', 'NFT_VIDEO_DURATION_5_15MIN', id, 'NFT_VIDEO_DURATION', 1, 3, '5-15分钟', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_VIDEO_DURATION'
UNION ALL
SELECT 
'15分钟以上', 'NFT_VIDEO_DURATION_15MIN_PLUS', id, 'NFT_VIDEO_DURATION', 1, 4, '15分钟以上', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_VIDEO_DURATION';

-- 文本体裁属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'诗歌', 'NFT_TEXT_GENRE_POETRY', id, 'NFT_TEXT_GENRE', 1, 1, '诗歌体裁', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_TEXT_GENRE'
UNION ALL
SELECT 
'小说片段', 'NFT_TEXT_GENRE_NOVEL', id, 'NFT_TEXT_GENRE', 1, 2, '小说片段体裁', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_TEXT_GENRE'
UNION ALL
SELECT 
'散文', 'NFT_TEXT_GENRE_ESSAY', id, 'NFT_TEXT_GENRE', 1, 3, '散文体裁', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_TEXT_GENRE'
UNION ALL
SELECT 
'名言警句', 'NFT_TEXT_GENRE_QUOTE', id, 'NFT_TEXT_GENRE', 1, 4, '名言警句体裁', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_TEXT_GENRE';

-- 文本语言属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'中文', 'NFT_TEXT_LANGUAGE_CN', id, 'NFT_TEXT_LANGUAGE', 1, 1, '中文', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_TEXT_LANGUAGE'
UNION ALL
SELECT 
'英文', 'NFT_TEXT_LANGUAGE_EN', id, 'NFT_TEXT_LANGUAGE', 1, 2, '英文', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_TEXT_LANGUAGE'
UNION ALL
SELECT 
'日文', 'NFT_TEXT_LANGUAGE_JP', id, 'NFT_TEXT_LANGUAGE', 1, 3, '日文', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_TEXT_LANGUAGE'
UNION ALL
SELECT 
'法文', 'NFT_TEXT_LANGUAGE_FR', id, 'NFT_TEXT_LANGUAGE', 1, 4, '法文', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_TEXT_LANGUAGE';

-- 应用平台属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'社交平台', 'NFT_APP_PLATFORM_SOCIAL', id, 'NFT_APP_PLATFORM', 1, 1, '社交平台', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_APP_PLATFORM'
UNION ALL
SELECT 
'元宇宙平台', 'NFT_APP_PLATFORM_METAVERSE', id, 'NFT_APP_PLATFORM', 1, 2, '元宇宙平台', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_APP_PLATFORM'
UNION ALL
SELECT 
'游戏平台', 'NFT_APP_PLATFORM_GAME', id, 'NFT_APP_PLATFORM', 1, 3, '游戏平台', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_APP_PLATFORM';

-- 形象来源属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'动漫角色', 'NFT_IMAGE_SOURCE_ANIME', id, 'NFT_IMAGE_SOURCE', 1, 1, '动漫角色来源', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_IMAGE_SOURCE'
UNION ALL
SELECT 
'原创角色', 'NFT_IMAGE_SOURCE_ORIGINAL', id, 'NFT_IMAGE_SOURCE', 1, 2, '原创角色来源', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_IMAGE_SOURCE'
UNION ALL
SELECT 
'名人形象', 'NFT_IMAGE_SOURCE_CELEBRITY', id, 'NFT_IMAGE_SOURCE', 1, 3, '名人形象来源', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_IMAGE_SOURCE'
UNION ALL
SELECT 
'动物形象', 'NFT_IMAGE_SOURCE_ANIMAL', id, 'NFT_IMAGE_SOURCE', 1, 4, '动物形象来源', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_IMAGE_SOURCE';

-- 稀有度属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'普通', 'NFT_RARITY_COMMON', id, 'NFT_RARITY', 1, 1, '普通稀有度', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_RARITY'
UNION ALL
SELECT 
'稀有', 'NFT_RARITY_RARE', id, 'NFT_RARITY', 1, 2, '稀有稀有度', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_RARITY'
UNION ALL
SELECT 
'史诗', 'NFT_RARITY_EPIC', id, 'NFT_RARITY', 1, 3, '史诗稀有度', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_RARITY'
UNION ALL
SELECT 
'传说', 'NFT_RARITY_LEGENDARY', id, 'NFT_RARITY', 1, 4, '传说稀有度', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_RARITY';

-- 定制元素属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'发型', 'NFT_CUSTOM_ELEMENT_HAIR', id, 'NFT_CUSTOM_ELEMENT', 1, 1, '发型定制元素', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CUSTOM_ELEMENT'
UNION ALL
SELECT 
'服饰', 'NFT_CUSTOM_ELEMENT_CLOTHING', id, 'NFT_CUSTOM_ELEMENT', 1, 2, '服饰定制元素', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CUSTOM_ELEMENT'
UNION ALL
SELECT 
'配饰', 'NFT_CUSTOM_ELEMENT_ACCESSORY', id, 'NFT_CUSTOM_ELEMENT', 1, 3, '配饰定制元素', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CUSTOM_ELEMENT'
UNION ALL
SELECT 
'面部特征', 'NFT_CUSTOM_ELEMENT_FACIAL', id, 'NFT_CUSTOM_ELEMENT', 1, 4, '面部特征定制元素', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CUSTOM_ELEMENT';

-- 适用场景属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'社交互动', 'NFT_APPLICATION_SCENE_SOCIAL', id, 'NFT_APPLICATION_SCENE', 1, 1, '社交互动场景', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_APPLICATION_SCENE'
UNION ALL
SELECT 
'游戏体验', 'NFT_APPLICATION_SCENE_GAME', id, 'NFT_APPLICATION_SCENE', 1, 2, '游戏体验场景', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_APPLICATION_SCENE'
UNION ALL
SELECT 
'虚拟演出', 'NFT_APPLICATION_SCENE_PERFORMANCE', id, 'NFT_APPLICATION_SCENE', 1, 3, '虚拟演出场景', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_APPLICATION_SCENE';

-- 身份象征属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'社区元老', 'NFT_IDENTITY_SYMBOL_ELDER', id, 'NFT_IDENTITY_SYMBOL', 1, 1, '社区元老身份', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_IDENTITY_SYMBOL'
UNION ALL
SELECT 
'意见领袖', 'NFT_IDENTITY_SYMBOL_KOL', id, 'NFT_IDENTITY_SYMBOL', 1, 2, '意见领袖身份', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_IDENTITY_SYMBOL'
UNION ALL
SELECT 
'活动大使', 'NFT_IDENTITY_SYMBOL_AMBASSADOR', id, 'NFT_IDENTITY_SYMBOL', 1, 3, '活动大使身份', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_IDENTITY_SYMBOL';

-- 特权属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'优先参与权', 'NFT_PRIVILEGE_PRIORITY', id, 'NFT_PRIVILEGE', 1, 1, '优先参与权特权', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PRIVILEGE'
UNION ALL
SELECT 
'专属徽章', 'NFT_PRIVILEGE_BADGE', id, 'NFT_PRIVILEGE', 1, 2, '专属徽章特权', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PRIVILEGE'
UNION ALL
SELECT 
'特殊标识', 'NFT_PRIVILEGE_MARK', id, 'NFT_PRIVILEGE', 1, 3, '特殊标识特权', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PRIVILEGE';

-- 游戏类型属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'角色扮演', 'NFT_GAME_TYPE_RPG', id, 'NFT_GAME_TYPE', 1, 1, '角色扮演游戏', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_GAME_TYPE'
UNION ALL
SELECT 
'策略', 'NFT_GAME_TYPE_STRATEGY', id, 'NFT_GAME_TYPE', 1, 2, '策略类游戏', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_GAME_TYPE'
UNION ALL
SELECT 
'竞技', 'NFT_GAME_TYPE_COMPETITIVE', id, 'NFT_GAME_TYPE', 1, 3, '竞技类游戏', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_GAME_TYPE'
UNION ALL
SELECT 
'休闲', 'NFT_GAME_TYPE_CASUAL', id, 'NFT_GAME_TYPE', 1, 4, '休闲类游戏', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_GAME_TYPE';

-- 道具功能属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'增益', 'NFT_PROP_FUNCTION_BUFF', id, 'NFT_PROP_FUNCTION', 1, 1, '增益道具', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PROP_FUNCTION'
UNION ALL
SELECT 
'装饰', 'NFT_PROP_FUNCTION_DECORATION', id, 'NFT_PROP_FUNCTION', 1, 2, '装饰道具', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PROP_FUNCTION'
UNION ALL
SELECT 
'消耗品', 'NFT_PROP_FUNCTION_CONSUMABLE', id, 'NFT_PROP_FUNCTION', 1, 3, '消耗品道具', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PROP_FUNCTION';


-- 游戏类型属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'角色扮演(RPG)', 'NFT_GAME_TYPE_RPG', id, 'NFT_GAME_TYPE', 1, 1, '角色扮演类游戏', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_GAME_TYPE'
UNION ALL
SELECT 
'策略游戏(SLG)', 'NFT_GAME_TYPE_SLG', id, 'NFT_GAME_TYPE', 1, 2, '策略类游戏', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_GAME_TYPE'
UNION ALL
SELECT 
'射击游戏(FPS/TPS)', 'NFT_GAME_TYPE_FPS', id, 'NFT_GAME_TYPE', 1, 3, '射击类游戏', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_GAME_TYPE'
UNION ALL
SELECT 
'模拟经营(SIM)', 'NFT_GAME_TYPE_SIM', id, 'NFT_GAME_TYPE', 1, 4, '模拟经营类游戏', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_GAME_TYPE';

-- 道具功能属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'增强属性', 'NFT_PROP_FUNCTION_ATTR', id, 'NFT_PROP_FUNCTION', 1, 1, '增强属性功能', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PROP_FUNCTION'
UNION ALL
SELECT 
'解锁技能', 'NFT_PROP_FUNCTION_SKILL', id, 'NFT_PROP_FUNCTION', 1, 2, '解锁技能功能', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PROP_FUNCTION'
UNION ALL
SELECT 
'开启特殊场景', 'NFT_PROP_FUNCTION_SCENE', id, 'NFT_PROP_FUNCTION', 1, 3, '开启特殊场景功能', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PROP_FUNCTION'
UNION ALL
SELECT 
'交易媒介', 'NFT_PROP_FUNCTION_TRADE', id, 'NFT_PROP_FUNCTION', 1, 4, '交易媒介功能', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PROP_FUNCTION';

-- 获取方式属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'任务奖励', 'NFT_OBTAIN_METHOD_TASK', id, 'NFT_OBTAIN_METHOD', 1, 1, '任务奖励获取', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_OBTAIN_METHOD'
UNION ALL
SELECT 
'副本掉落', 'NFT_OBTAIN_METHOD_DROP', id, 'NFT_OBTAIN_METHOD', 1, 2, '副本掉落获取', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_OBTAIN_METHOD'
UNION ALL
SELECT 
'商店购买', 'NFT_OBTAIN_METHOD_SHOP', id, 'NFT_OBTAIN_METHOD', 1, 3, '商店购买获取', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_OBTAIN_METHOD';

-- 装备部位属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'武器', 'NFT_EQUIPMENT_POSITION_WEAPON', id, 'NFT_EQUIPMENT_POSITION', 1, 1, '武器装备', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_EQUIPMENT_POSITION'
UNION ALL
SELECT 
'防具', 'NFT_EQUIPMENT_POSITION_ARMOR', id, 'NFT_EQUIPMENT_POSITION', 1, 2, '防具装备', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_EQUIPMENT_POSITION'
UNION ALL
SELECT 
'饰品', 'NFT_EQUIPMENT_POSITION_ACCESSORY', id, 'NFT_EQUIPMENT_POSITION', 1, 3, '饰品装备', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_EQUIPMENT_POSITION'
UNION ALL
SELECT 
'坐骑', 'NFT_EQUIPMENT_POSITION_MOUNT', id, 'NFT_EQUIPMENT_POSITION', 1, 4, '坐骑装备', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_EQUIPMENT_POSITION';

-- 品质属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'普通', 'NFT_QUALITY_NORMAL', id, 'NFT_QUALITY', 1, 1, '普通品质', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_QUALITY'
UNION ALL
SELECT 
'精良', 'NFT_QUALITY_FINE', id, 'NFT_QUALITY', 1, 2, '精良品质', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_QUALITY'
UNION ALL
SELECT 
'稀有', 'NFT_QUALITY_RARE', id, 'NFT_QUALITY', 1, 3, '稀有品质', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_QUALITY'
UNION ALL
SELECT 
'史诗', 'NFT_QUALITY_EPIC', id, 'NFT_QUALITY', 1, 4, '史诗品质', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_QUALITY'
UNION ALL
SELECT 
'传说', 'NFT_QUALITY_LEGENDARY', id, 'NFT_QUALITY', 1, 5, '传说品质', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_QUALITY';

-- 职业属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'战士', 'NFT_PROFESSION_WARRIOR', id, 'NFT_PROFESSION', 1, 1, '战士职业', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PROFESSION'
UNION ALL
SELECT 
'法师', 'NFT_PROFESSION_MAGE', id, 'NFT_PROFESSION', 1, 2, '法师职业', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PROFESSION'
UNION ALL
SELECT 
'射手', 'NFT_PROFESSION_ARCHER', id, 'NFT_PROFESSION', 1, 3, '射手职业', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PROFESSION'
UNION ALL
SELECT 
'刺客', 'NFT_PROFESSION_ASSASSIN', id, 'NFT_PROFESSION', 1, 4, '刺客职业', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PROFESSION'
UNION ALL
SELECT 
'辅助', 'NFT_PROFESSION_SUPPORT', id, 'NFT_PROFESSION', 1, 5, '辅助职业', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PROFESSION';

-- 等级上限属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'50级', 'NFT_LEVEL_CAP_50', id, 'NFT_LEVEL_CAP', 1, 1, '50级上限', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_LEVEL_CAP'
UNION ALL
SELECT 
'100级', 'NFT_LEVEL_CAP_100', id, 'NFT_LEVEL_CAP', 1, 2, '100级上限', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_LEVEL_CAP'
UNION ALL
SELECT 
'150级', 'NFT_LEVEL_CAP_150', id, 'NFT_LEVEL_CAP', 1, 3, '150级上限', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_LEVEL_CAP'
UNION ALL
SELECT 
'150级以上', 'NFT_LEVEL_CAP_150_UP', id, 'NFT_LEVEL_CAP', 1, 4, '150级级以上', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_LEVEL_CAP' ;

-- 体育项目属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'足球', 'NFT_SPORTS_FOOTBALL', id, 'NFT_SPORTS', 1, 1, '足球运动', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_SPORTS'
UNION ALL
SELECT '篮球', 'NFT_SPORTS_BASKETBALL', id, 'NFT_SPORTS', 1, 2, '篮球运动', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_SPORTS'
UNION ALL
SELECT '网球', 'NFT_SPORTS_TENNIS', id, 'NFT_SPORTS', 1, 3, '网球运动', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_SPORTS'
UNION ALL
SELECT '田径', 'NFT_SPORTS_ATHLETICS', id, 'NFT_SPORTS', 1, 4, '田径运动', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_SPORTS';

-- 赛事类型属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'奥运会', 'NFT_COMPETITION_TYPE_OLYMPIC', id, 'NFT_COMPETITION_TYPE', 1, 1, '奥运会赛事', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_COMPETITION_TYPE'
UNION ALL
SELECT '世界杯', 'NFT_COMPETITION_TYPE_WORLDCUP', id, 'NFT_COMPETITION_TYPE', 1, 2, '世界杯赛事', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_COMPETITION_TYPE'
UNION ALL
SELECT '职业联赛', 'NFT_COMPETITION_TYPE_LEAGUE', id, 'NFT_COMPETITION_TYPE', 1, 3, '职业联赛赛事', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_COMPETITION_TYPE'
UNION ALL
SELECT '洲际锦标赛', 'NFT_COMPETITION_TYPE_CONTINENTAL', id, 'NFT_COMPETITION_TYPE', 1, 4, '洲际锦标赛赛事', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_COMPETITION_TYPE';

-- 历史时期属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'神话', 'NFT_HISTORICAL_PERIOD_MYTH', id, 'NFT_HISTORICAL_PERIOD', 1, 1, '神话时期', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_HISTORICAL_PERIOD'
UNION ALL
SELECT '远古', 'NFT_HISTORICAL_PERIOD_ANCIENT', id, 'NFT_HISTORICAL_PERIOD', 1, 2, '远古时期', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_HISTORICAL_PERIOD'
UNION ALL
SELECT '近代', 'NFT_HISTORICAL_PERIOD_MODERN', id, 'NFT_HISTORICAL_PERIOD', 1, 3, '近代时期', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_HISTORICAL_PERIOD'
UNION ALL
SELECT '现代', 'NFT_HISTORICAL_PERIOD_CONTEMPORARY', id, 'NFT_HISTORICAL_PERIOD', 1, 4, '现代时期', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_HISTORICAL_PERIOD';

-- 文化类型属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'宗教信仰', 'NFT_CULTURE_TYPE_RELIGION', id, 'NFT_CULTURE_TYPE', 1, 1, '宗教信仰文化', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CULTURE_TYPE'
UNION ALL
SELECT '文物复刻', 'NFT_CULTURE_TYPE_RELIC', id, 'NFT_CULTURE_TYPE', 1, 2, '文物复刻文化', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CULTURE_TYPE'
UNION ALL
SELECT '传统技艺', 'NFT_CULTURE_TYPE_CRAFT', id, 'NFT_CULTURE_TYPE', 1, 3, '传统技艺文化', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CULTURE_TYPE'
UNION ALL
SELECT '民俗文化', 'NFT_CULTURE_TYPE_FOLK', id, 'NFT_CULTURE_TYPE', 1, 4, '民俗文化', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CULTURE_TYPE';

-- 名人领域属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'影视明星', 'NFT_CELEBRITY_FIELD_ENTERTAINMENT', id, 'NFT_CELEBRITY_FIELD', 1, 1, '影视明星领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CELEBRITY_FIELD'
UNION ALL
SELECT '体育明星', 'NFT_CELEBRITY_FIELD_SPORTS', id, 'NFT_CELEBRITY_FIELD', 1, 2, '体育明星领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CELEBRITY_FIELD'
UNION ALL
SELECT '科技大佬', 'NFT_CELEBRITY_FIELD_TECH', id, 'NFT_CELEBRITY_FIELD', 1, 3, '科技大佬领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CELEBRITY_FIELD'
UNION ALL
SELECT '艺术家', 'NFT_CELEBRITY_FIELD_ARTIST', id, 'NFT_CELEBRITY_FIELD', 1, 4, '艺术家领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CELEBRITY_FIELD';

-- 周边形式属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'签名照', 'NFT_PERIPHERAL_FORM_SIGNATURE', id, 'NFT_PERIPHERAL_FORM', 1, 1, '签名照周边', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PERIPHERAL_FORM'
UNION ALL
SELECT '手写笔记', 'NFT_PERIPHERAL_FORM_NOTE', id, 'NFT_PERIPHERAL_FORM', 1, 2, '手写笔记周边', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PERIPHERAL_FORM'
UNION ALL
SELECT '私人物品复刻', 'NFT_PERIPHERAL_FORM_REPLICA', id, 'NFT_PERIPHERAL_FORM', 1, 3, '私人物品复刻周边', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PERIPHERAL_FORM'
UNION ALL
SELECT '视频祝福', 'NFT_PERIPHERAL_FORM_VIDEO', id, 'NFT_PERIPHERAL_FORM', 1, 4, '视频祝福周边', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PERIPHERAL_FORM';

-- 徽章主题属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'节日', 'NFT_BADGE_THEME_FESTIVAL', id, 'NFT_BADGE_THEME', 1, 1, '节日主题徽章', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_BADGE_THEME'
UNION ALL
SELECT '活动', 'NFT_BADGE_THEME_EVENT', id, 'NFT_BADGE_THEME', 1, 2, '活动主题徽章', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_BADGE_THEME'
UNION ALL
SELECT '品牌合作', 'NFT_BADGE_THEME_BRAND', id, 'NFT_BADGE_THEME', 1, 3, '品牌合作主题徽章', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_BADGE_THEME'
UNION ALL
SELECT '公益项目', 'NFT_BADGE_THEME_CHARITY', id, 'NFT_BADGE_THEME', 1, 4, '公益项目主题徽章', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_BADGE_THEME';

-- 限量数量属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'专属', 'NFT_LIMITED_QUANTITY_EXCLUSIVE', id, 'NFT_LIMITED_QUANTITY', 1, 1, '专属限量', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_LIMITED_QUANTITY'
UNION ALL
SELECT '100份', 'NFT_LIMITED_QUANTITY_100', id, 'NFT_LIMITED_QUANTITY', 1, 2, '100份限量', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_LIMITED_QUANTITY'
UNION ALL
SELECT '500份', 'NFT_LIMITED_QUANTITY_500', id, 'NFT_LIMITED_QUANTITY', 1, 3, '500份限量', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_LIMITED_QUANTITY'
UNION ALL
SELECT '1000份', 'NFT_LIMITED_QUANTITY_1000', id, 'NFT_LIMITED_QUANTITY', 1, 4, '1000份限量', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_LIMITED_QUANTITY'
UNION ALL
SELECT '5000份', 'NFT_LIMITED_QUANTITY_5000', id, 'NFT_LIMITED_QUANTITY', 1, 5, '5000份限量', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_LIMITED_QUANTITY';


-- 平台属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'Decentraland', 'NFT_PLATFORM_TYPE_DECENTRALAND', id, 'NFT_PLATFORM_TYPE', 1, 1, 'Decentraland平台', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PLATFORM_TYPE'
UNION ALL
SELECT 'The Sandbox', 'NFT_PLATFORM_TYPE_SANDBOX', id, 'NFT_PLATFORM_TYPE', 1, 2, 'The Sandbox平台', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PLATFORM_TYPE'
UNION ALL
SELECT 'Somnium Space', 'NFT_PLATFORM_TYPE_SOMNIUM', id, 'NFT_PLATFORM_TYPE', 1, 3, 'Somnium Space平台', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PLATFORM_TYPE'
UNION ALL
SELECT 'Cryptovoxels', 'NFT_PLATFORM_TYPE_CRYPTOVOXELS', id, 'NFT_PLATFORM_TYPE', 1, 4, 'Cryptovoxels平台', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_PLATFORM_TYPE';

-- 位置属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'中心商业区', 'NFT_LOCATION_CBD', id, 'NFT_LOCATION', 1, 1, '中心商业区位置', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_LOCATION'
UNION ALL
SELECT '住宅区', 'NFT_LOCATION_RESIDENTIAL', id, 'NFT_LOCATION', 1, 2, '住宅区位置', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_LOCATION'
UNION ALL
SELECT '风景区', 'NFT_LOCATION_SCENIC', id, 'NFT_LOCATION', 1, 3, '风景区位置', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_LOCATION'
UNION ALL
SELECT '工业区', 'NFT_LOCATION_INDUSTRIAL', id, 'NFT_LOCATION', 1, 4, '工业区位置', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_LOCATION';

-- 面积属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'100平', 'NFT_AREA_100', id, 'NFT_AREA', 1, 1, '100平米面积', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_AREA'
UNION ALL
SELECT '500平', 'NFT_AREA_500', id, 'NFT_AREA', 1, 2, '500平米面积', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_AREA'
UNION ALL
SELECT '1000平', 'NFT_AREA_1000', id, 'NFT_AREA', 1, 3, '1000平米面积', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_AREA'
UNION ALL
SELECT '5000平', 'NFT_AREA_5000', id, 'NFT_AREA', 1, 4, '5000平米面积', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_AREA'
UNION ALL
SELECT '5000平以上', 'NFT_AREA_ABOVE_5000', id, 'NFT_AREA', 1, 5, '5000平米以上面积', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_AREA';

-- 空间风格属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'现代简约', 'NFT_SPACE_STYLE_MODERN', id, 'NFT_SPACE_STYLE', 1, 1, '现代简约风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_SPACE_STYLE'
UNION ALL
SELECT '欧式古典', 'NFT_SPACE_STYLE_EUROPEAN', id, 'NFT_SPACE_STYLE', 1, 2, '欧式古典风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_SPACE_STYLE'
UNION ALL
SELECT '中式古风', 'NFT_SPACE_STYLE_CHINESE', id, 'NFT_SPACE_STYLE', 1, 3, '中式古风风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_SPACE_STYLE'
UNION ALL
SELECT '未来科幻', 'NFT_SPACE_STYLE_FUTURE', id, 'NFT_SPACE_STYLE', 1, 4, '未来科幻风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_SPACE_STYLE';

-- 空间用途属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'展览展示', 'NFT_SPACE_USE_EXHIBITION', id, 'NFT_SPACE_USE', 1, 1, '展览展示用途', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_SPACE_USE'
UNION ALL
SELECT '社交聚会', 'NFT_SPACE_USE_SOCIAL', id, 'NFT_SPACE_USE', 1, 2, '社交聚会用途', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_SPACE_USE'
UNION ALL
SELECT '办公场所', 'NFT_SPACE_USE_OFFICE', id, 'NFT_SPACE_USE', 1, 3, '办公场所用途', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_SPACE_USE';


-- 认证类型属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'学历证书', 'NFT_CERT_TYPE_EDUCATION', id, 'NFT_CERT_TYPE', 1, 1, '学历证书认证', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CERT_TYPE'
UNION ALL
SELECT '技能证书', 'NFT_CERT_TYPE_SKILL', id, 'NFT_CERT_TYPE', 1, 2, '技能证书认证', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CERT_TYPE'
UNION ALL
SELECT '培训结业证书', 'NFT_CERT_TYPE_TRAINING', id, 'NFT_CERT_TYPE', 1, 3, '培训结业证书认证', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_CERT_TYPE';

-- 颁发机构属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'知名大学', 'NFT_ISSUING_ORG_UNIVERSITY', id, 'NFT_ISSUING_ORG', 1, 1, '知名大学机构', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ISSUING_ORG'
UNION ALL
SELECT '专业培训机构', 'NFT_ISSUING_ORG_TRAINING', id, 'NFT_ISSUING_ORG', 1, 2, '专业培训机构', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ISSUING_ORG'
UNION ALL
SELECT '行业协会', 'NFT_ISSUING_ORG_ASSOCIATION', id, 'NFT_ISSUING_ORG', 1, 3, '行业协会机构', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ISSUING_ORG';

-- 会员等级属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'普通会员', 'NFT_MEMBER_LEVEL_NORMAL', id, 'NFT_MEMBER_LEVEL', 1, 1, '普通会员等级', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_MEMBER_LEVEL'
UNION ALL
SELECT '银卡会员', 'NFT_MEMBER_LEVEL_SILVER', id, 'NFT_MEMBER_LEVEL', 1, 2, '银卡会员等级', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_MEMBER_LEVEL'
UNION ALL
SELECT '金卡会员', 'NFT_MEMBER_LEVEL_GOLD', id, 'NFT_MEMBER_LEVEL', 1, 3, '金卡会员等级', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_MEMBER_LEVEL'
UNION ALL
SELECT '钻石会员', 'NFT_MEMBER_LEVEL_DIAMOND', id, 'NFT_MEMBER_LEVEL', 1, 4, '钻石会员等级', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_MEMBER_LEVEL';

-- 会员权益属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'折扣优惠', 'NFT_MEMBER_RIGHTS_DISCOUNT', id, 'NFT_MEMBER_RIGHTS', 1, 1, '折扣优惠权益', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_MEMBER_RIGHTS'
UNION ALL
SELECT '优先服务', 'NFT_MEMBER_RIGHTS_PRIORITY', id, 'NFT_MEMBER_RIGHTS', 1, 2, '优先服务权益', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_MEMBER_RIGHTS'
UNION ALL
SELECT '专属活动', 'NFT_MEMBER_RIGHTS_EXCLUSIVE', id, 'NFT_MEMBER_RIGHTS', 1, 3, '专属活动权益', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_MEMBER_RIGHTS';

-- 活动类型属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'演唱会', 'NFT_EVENT_TYPE_CONCERT', id, 'NFT_EVENT_TYPE', 1, 1, '演唱会活动', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_EVENT_TYPE'
UNION ALL
SELECT '音乐节', 'NFT_EVENT_TYPE_MUSIC_FESTIVAL', id, 'NFT_EVENT_TYPE', 1, 2, '音乐节活动', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_EVENT_TYPE'
UNION ALL
SELECT '艺术展览', 'NFT_EVENT_TYPE_ART_EXHIBITION', id, 'NFT_EVENT_TYPE', 1, 3, '艺术展览活动', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_EVENT_TYPE'
UNION ALL
SELECT '体育赛事', 'NFT_EVENT_TYPE_SPORTS', id, 'NFT_EVENT_TYPE', 1, 4, '体育赛事活动', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_EVENT_TYPE';

-- 座位等级属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'VIP', 'NFT_SEAT_LEVEL_VIP', id, 'NFT_SEAT_LEVEL', 1, 1, 'VIP座位', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_SEAT_LEVEL'
UNION ALL
SELECT '前排', 'NFT_SEAT_LEVEL_FRONT', id, 'NFT_SEAT_LEVEL', 1, 2, '前排座位', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_SEAT_LEVEL'
UNION ALL
SELECT '中排', 'NFT_SEAT_LEVEL_MIDDLE', id, 'NFT_SEAT_LEVEL', 1, 3, '中排座位', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_SEAT_LEVEL'
UNION ALL
SELECT '后排', 'NFT_SEAT_LEVEL_BACK', id, 'NFT_SEAT_LEVEL', 1, 4, '后排座位', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_SEAT_LEVEL';

-- 版权类型属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'文字作品版权', 'NFT_COPYRIGHT_TYPE_TEXT', id, 'NFT_COPYRIGHT_TYPE', 1, 1, '文字作品版权', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_COPYRIGHT_TYPE'
UNION ALL
SELECT '音乐作品版权', 'NFT_COPYRIGHT_TYPE_MUSIC', id, 'NFT_COPYRIGHT_TYPE', 1, 2, '音乐作品版权', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_COPYRIGHT_TYPE'
UNION ALL
SELECT '美术作品版权', 'NFT_COPYRIGHT_TYPE_ART', id, 'NFT_COPYRIGHT_TYPE', 1, 3, '美术作品版权', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_COPYRIGHT_TYPE'
UNION ALL
SELECT '影视作品版权', 'NFT_COPYRIGHT_TYPE_VIDEO', id, 'NFT_COPYRIGHT_TYPE', 1, 4, '影视作品版权', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_COPYRIGHT_TYPE';

-- 授权方式属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'独家授权', 'NFT_LICENSE_TYPE_EXCLUSIVE', id, 'NFT_LICENSE_TYPE', 1, 1, '独家授权方式', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_LICENSE_TYPE'
UNION ALL
SELECT '非独家授权', 'NFT_LICENSE_TYPE_NON_EXCLUSIVE', id, 'NFT_LICENSE_TYPE', 1, 2, '非独家授权方式', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_LICENSE_TYPE'
UNION ALL
SELECT '限时授权', 'NFT_LICENSE_TYPE_LIMITED', id, 'NFT_LICENSE_TYPE', 1, 3, '限时授权方式', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_LICENSE_TYPE';

-- 债券期限属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'1年期', 'NFT_BOND_PERIOD_1Y', id, 'NFT_BOND_PERIOD', 1, 1, '1年期债券', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_BOND_PERIOD'
UNION ALL
SELECT '3年期', 'NFT_BOND_PERIOD_3Y', id, 'NFT_BOND_PERIOD', 1, 2, '3年期债券', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_BOND_PERIOD'
UNION ALL
SELECT '5年期', 'NFT_BOND_PERIOD_5Y', id, 'NFT_BOND_PERIOD', 1, 3, '5年期债券', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_BOND_PERIOD'
UNION ALL
SELECT '10年期', 'NFT_BOND_PERIOD_10Y', id, 'NFT_BOND_PERIOD', 1, 4, '10年期债券', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_BOND_PERIOD';

-- 利率类型属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'固定利率', 'NFT_INTEREST_TYPE_FIXED', id, 'NFT_INTEREST_TYPE', 1, 1, '固定利率类型', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_INTEREST_TYPE'
UNION ALL
SELECT '浮动利率', 'NFT_INTEREST_TYPE_FLOAT', id, 'NFT_INTEREST_TYPE', 1, 2, '浮动利率类型', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_INTEREST_TYPE'
UNION ALL
SELECT '零息债券', 'NFT_INTEREST_TYPE_ZERO', id, 'NFT_INTEREST_TYPE', 1, 3, '零息债券类型', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_INTEREST_TYPE'
UNION ALL
SELECT '混合利率', 'NFT_INTEREST_TYPE_HYBRID', id, 'NFT_INTEREST_TYPE', 1, 4, '混合利率类型', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_INTEREST_TYPE';

-- 资产类别属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'房地产', 'NFT_ASSET_TYPE_REAL_ESTATE', id, 'NFT_ASSET_TYPE', 1, 1, '房地产资产', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ASSET_TYPE'
UNION ALL
SELECT '艺术品', 'NFT_ASSET_TYPE_ART', id, 'NFT_ASSET_TYPE', 1, 2, '艺术品资产', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ASSET_TYPE'
UNION ALL
SELECT '贵金属', 'NFT_ASSET_TYPE_PRECIOUS_METAL', id, 'NFT_ASSET_TYPE', 1, 3, '贵金属资产', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ASSET_TYPE'
UNION ALL
SELECT '收藏品', 'NFT_ASSET_TYPE_COLLECTIBLE', id, 'NFT_ASSET_TYPE', 1, 4, '收藏品资产', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ASSET_TYPE';

-- 凭证用途属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'资产确权', 'NFT_VOUCHER_USE_OWNERSHIP', id, 'NFT_VOUCHER_USE', 1, 1, '资产确权用途', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_VOUCHER_USE'
UNION ALL
SELECT '交易流转', 'NFT_VOUCHER_USE_TRADING', id, 'NFT_VOUCHER_USE', 1, 2, '交易流转用途', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_VOUCHER_USE'
UNION ALL
SELECT '融资抵押', 'NFT_VOUCHER_USE_MORTGAGE', id, 'NFT_VOUCHER_USE', 1, 3, '融资抵押用途', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_VOUCHER_USE'
UNION ALL
SELECT '权益分配', 'NFT_VOUCHER_USE_DISTRIBUTION', id, 'NFT_VOUCHER_USE', 1, 4, '权益分配用途', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_VOUCHER_USE';

-- 企业领域属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'科技创新', 'NFT_ENTERPRISE_FIELD_TECH', id, 'NFT_ENTERPRISE_FIELD', 1, 1, '科技创新领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ENTERPRISE_FIELD'
UNION ALL
SELECT '文化创意', 'NFT_ENTERPRISE_FIELD_CULTURE', id, 'NFT_ENTERPRISE_FIELD', 1, 2, '文化创意领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ENTERPRISE_FIELD'
UNION ALL
SELECT '生物医药', 'NFT_ENTERPRISE_FIELD_BIOTECH', id, 'NFT_ENTERPRISE_FIELD', 1, 3, '生物医药领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ENTERPRISE_FIELD'
UNION ALL
SELECT '新能源', 'NFT_ENTERPRISE_FIELD_NEW_ENERGY', id, 'NFT_ENTERPRISE_FIELD', 1, 4, '新能源领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_ENTERPRISE_FIELD';

-- 股权比例属性值
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'1%以下', 'NFT_EQUITY_RATIO_BELOW_1', id, 'NFT_EQUITY_RATIO', 1, 1, '1%以下股权', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_EQUITY_RATIO'
UNION ALL
SELECT '1%-5%', 'NFT_EQUITY_RATIO_1_5', id, 'NFT_EQUITY_RATIO', 1, 2, '1%-5%股权', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_EQUITY_RATIO'
UNION ALL
SELECT '5%-10%', 'NFT_EQUITY_RATIO_5_10', id, 'NFT_EQUITY_RATIO', 1, 3, '5%-10%股权', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_EQUITY_RATIO'
UNION ALL
SELECT '10%-20%', 'NFT_EQUITY_RATIO_10_20', id, 'NFT_EQUITY_RATIO', 1, 4, '10%-20%股权', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_EQUITY_RATIO'
UNION ALL
SELECT '20%以上', 'NFT_EQUITY_RATIO_ABOVE_20', id, 'NFT_EQUITY_RATIO', 1, 5, '20%以上股权', NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'NFT_EQUITY_RATIO';


-- 插入NFT专区目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '100000' as category_code,
    ag.id as attr_group_id,
    'NFT_APPLICATION_FIELD' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c, rcc_attr_group ag 
WHERE c.code = '100000' AND ag.attr_group_code = 'NFT_APPLICATION_FIELD';

-- 插入数字艺术品目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '101000' as category_code,
    ag.id as attr_group_id,
    'NFT_TECH_FORM' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c, rcc_attr_group ag 
WHERE c.code = '101000' AND ag.attr_group_code = 'NFT_TECH_FORM';

-- 插入虚拟身份目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '102000' as category_code,
    ag.id as attr_group_id,
    'NFT_APP_PLATFORM' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c, rcc_attr_group ag 
WHERE c.code = '102000' AND ag.attr_group_code = 'NFT_APP_PLATFORM';

-- 插入游戏资产目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '103000' as category_code,
    ag.id as attr_group_id,
    'NFT_GAME_TYPE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c, rcc_attr_group ag 
WHERE c.code = '103000' AND ag.attr_group_code = 'NFT_GAME_TYPE';

-- 插入收藏品目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '104000' as category_code,
    ag.id as attr_group_id,
    'NFT_HISTORICAL_PERIOD' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c, rcc_attr_group ag 
WHERE c.code = '104000' AND ag.attr_group_code = 'NFT_HISTORICAL_PERIOD';

-- 插入虚拟房地产目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '105000' as category_code,
    ag.id as attr_group_id,
    'NFT_PLATFORM_TYPE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c, rcc_attr_group ag 
WHERE c.code = '105000' AND ag.attr_group_code = 'NFT_PLATFORM_TYPE';

-- 插入数字证书目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '106000' as category_code,
    ag.id as attr_group_id,
    'NFT_CERT_TYPE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c, rcc_attr_group ag 
WHERE c.code = '106000' AND ag.attr_group_code = 'NFT_CERT_TYPE';

-- 插入金融资产目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '107000' as category_code,
    ag.id as attr_group_id,
    'NFT_ASSET_TYPE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c, rcc_attr_group ag 
WHERE c.code = '107000' AND ag.attr_group_code = 'NFT_ASSET_TYPE';



-- 修正潮流艺术画作NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '101001' 
AND ag.attr_group_code IN ('NFT_ART_STYLE', 'NFT_ART_THEME');

-- 修正先锋音乐作品NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '101002' 
AND ag.attr_group_code IN ('NFT_MUSIC_CREATION', 'NFT_MUSIC_TYPE');

-- 修正视频艺术NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '101003' 
AND ag.attr_group_code IN ('NFT_VIDEO_TYPE', 'NFT_VIDEO_DURATION');


-- 修正文本类型NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '101004' 
AND ag.attr_group_code IN ('NFT_TEXT_GENRE', 'NFT_TEXT_LANGUAGE');


-- 修正独特头像NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '102001' 
AND ag.attr_group_code IN ('NFT_AVATAR_SOURCE', 'NFT_AVATAR_RARITY');

-- 修正定制虚拟形象NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '102002' 
AND ag.attr_group_code IN ('NFT_VIRTUAL_ELEMENT', 'NFT_VIRTUAL_SCENE');

-- 修正专属社交身份NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '102003' 
AND ag.attr_group_code IN ('NFT_SOCIAL_SYMBOL', 'NFT_SOCIAL_PRIVILEGE');


-- 修正游戏道具NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '103001' 
AND ag.attr_group_code IN ('NFT_PROP_FUNCTION', 'NFT_PROP_OBTAIN');

-- 修正游戏装备NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '103002' 
AND ag.attr_group_code IN ('NFT_EQUIPMENT_PART', 'NFT_EQUIPMENT_QUALITY');

-- 修正游戏角色NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '103003' 
AND ag.attr_group_code IN ('NFT_CHARACTER_CLASS', 'NFT_CHARACTER_LEVEL');


-- 修正体育赛事纪念NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '104001' 
AND ag.attr_group_code IN ('NFT_SPORTS_TYPE', 'NFT_SPORTS_EVENT', 'NFT_SPORTS_THEME');

-- 修正历史文化收藏NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '104002' 
AND ag.attr_group_code IN ('NFT_HISTORICAL_PERIOD', 'NFT_CULTURAL_TYPE');

-- 修正名人周边NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '104003' 
AND ag.attr_group_code IN ('NFT_CELEBRITY_FIELD', 'NFT_PERIPHERAL_FORM');

-- 修正限量版徽章NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '104004' 
AND ag.attr_group_code IN ('NFT_BADGE_THEME', 'NFT_LIMITED_QUANTITY');


-- 修正元宇宙地块NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '105001' 
AND ag.attr_group_code IN ('NFT_PLATFORM_TYPE', 'NFT_LOCATION', 'NFT_AREA');

-- 修正虚拟建筑NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '105002' 
AND ag.attr_group_code IN ('NFT_SPACE_STYLE', 'NFT_SPACE_USE');


-- 修正教育认证NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '106001' 
AND ag.attr_group_code IN ('NFT_CERT_TYPE', 'NFT_ISSUING_ORG');

-- 修正会员资格NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '106002' 
AND ag.attr_group_code IN ('NFT_MEMBER_LEVEL', 'NFT_MEMBER_RIGHTS');

-- 修正活动门票NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '106003' 
AND ag.attr_group_code IN ('NFT_EVENT_TYPE', 'NFT_SEAT_LEVEL');

-- 修正数字版权NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '106004' 
AND ag.attr_group_code IN ('NFT_COPYRIGHT_TYPE', 'NFT_LICENSE_TYPE');


-- 修正数字债券NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '107001' 
AND ag.attr_group_code IN ('NFT_BOND_PERIOD', 'NFT_INTEREST_TYPE');

-- 修正资产凭证NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '107002' 
AND ag.attr_group_code IN ('NFT_ASSET_TYPE', 'NFT_VOUCHER_USE');

-- 修正股权通证NFT目录属性组关联数据
insert into rcc_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_category c 
CROSS JOIN rcc_attr_group ag 
WHERE c.code = '107003' 
AND ag.attr_group_code IN ('NFT_ENTERPRISE_FIELD', 'NFT_EQUITY_RATIO');



-- 插入商品SPU示例数据
-- 插入商品SPU示例数据
INSERT INTO `rcc_product_spu` 
(`code`, `name`, `category1_id`, `category1_code`, `category2_id`, `category2_code`, 
`category3_id`, `category3_code`, `total_sales`, `total_stock`, `brand`, `description`, 
`price`, `real_price`, `status`, `images`, `creator`, `updator`) 
SELECT 
    'SPU20240101001', '潮流数字艺术画作-星空系列', c1.id, c1.code, c2.id, c2.code, c3.id, c3.code,
    100, 1000, 'ArtBlock', '独特的数字艺术画作，以星空为主题的NFT艺术品系列',
    999.99, 1999.99, 1, 
    'https://example.com/images/1.jpg,https://example.com/images/2.jpg', 
    'admin', 'admin'
FROM rcc_category c1 
JOIN rcc_category c2 ON c2.parent_id = c1.id
JOIN rcc_category c3 ON c3.parent_id = c2.id
WHERE c1.code = '100000' AND c2.code = '101000' AND c3.code = '101001';

-- 插入商品SPU属性参数示例数据
INSERT INTO `rcc_product_spu_attr_params` 
(`product_spu_id`, `product_spu_code`, `code`, `name`, `attr_type`, `value_type`, 
`value`, `sort`, `status`, `is_required`, `is_generic`, `creator`, `updator`)
SELECT 
    id, code,
    'BASIC_ATTRS', '基本属性', 1, 1,
    '{"艺术风格":"现代抽象","创作主题":"星空宇宙","创作者":"John Doe","创作时间":"2024-01","作品编号":"ART2024001"}',
    1, 1, 1, 1, 'admin', 'admin'
FROM rcc_product_spu
WHERE code = 'SPU20240101001'
UNION ALL
SELECT 
    id, code,
    'SALE_ATTRS', '销售属性', 2, 1,
    '{"版本":["普通版","珍藏版","限定版"],"尺寸":["1000x1000px","2000x2000px","4000x4000px"],"质地":["普通纸张","珍珠纸","艺术纸"]}',
    2, 1, 1, 1, 'admin', 'admin'
FROM rcc_product_spu
WHERE code = 'SPU20240101001'
UNION ALL
SELECT 
    id, code,
    'SPEC_ATTRS', '规格属性', 3, 1,
    '{"文件格式":"JPG/PNG","分辨率":"300DPI","色彩模式":"RGB","文件大小":"100MB","打印尺寸":"50x50cm"}',
    3, 1, 1, 1, 'admin', 'admin'
FROM rcc_product_spu
WHERE code = 'SPU20240101001';

-- 插入商品SKU示例数据 (根据规格属性组合生成SKU)
INSERT INTO `rcc_product_sku` 
(`product_spu_id`, `product_spu_code`, `sku_code`, `price`, `stock`, `sale_count`, 
`status`, `indexs`, `attr_params`, `images`, `title`, `sub_title`, `description`, 
`creator`, `updator`)
SELECT 
    id, code,
    CONCAT(code, '-SKU001'), 999.99, 100, 10,
    1, 1, 
    '{"版本":"普通版","尺寸":"1000x1000px","质地":"普通纸张"}',
    'https://example.com/images/sku1.jpg',
    '星空系列 普通版 1000x1000px', '限量发行100份', '普通版数字艺术收藏品',
    'admin', 'admin'
FROM rcc_product_spu
WHERE code = 'SPU20240101001'
UNION ALL
SELECT 
    id, code,
    CONCAT(code, '-SKU002'), 1999.99, 50, 5,
    1, 2,
    '{"版本":"珍藏版","尺寸":"2000x2000px","质地":"珍珠纸"}',
    'https://example.com/images/sku2.jpg',
    '星空系列 珍藏版 2000x2000px', '限量发行50份', '珍藏版数字艺术收藏品',
    'admin', 'admin'
FROM rcc_product_spu
WHERE code = 'SPU20240101001'
UNION ALL
SELECT 
    id, code,
    CONCAT(code, '-SKU003'), 4999.99, 10, 2,
    1, 3,
    '{"版本":"限定版","尺寸":"4000x4000px","质地":"艺术纸"}',
    'https://example.com/images/sku3.jpg',
    '星空系列 限定版 4000x4000px', '限量发行10份', '限定版数字艺术收藏品',
    'admin', 'admin'
FROM rcc_product_spu
WHERE code = 'SPU20240101001';

-- 插入数字艺术品商品数据 (目录code: 101001 潮流艺术画作NFT)
INSERT INTO `rcc_product_spu` 
(`code`, `name`, `category1_id`, `category1_code`, `category2_id`, `category2_code`, 
`category3_id`, `category3_code`, `total_sales`, `total_stock`, `brand`, `description`, 
`price`, `real_price`, `status`, `images`, `creator`, `updator`) 
SELECT 
    'SPU20240102001', '元宇宙艺术画作-未来城市', c1.id, c1.code, c2.id, c2.code, c3.id, c3.code,
    200, 500, 'MetaArt', '以未来城市为主题的数字艺术作品，展现科技与艺术的完美融合',
    1999.99, 1799.99, 1, 
    'https://example.com/images/future_city.jpg', 
    'admin', 'admin'
FROM rcc_category c1 
JOIN rcc_category c2 ON c2.parent_id = c1.id
JOIN rcc_category c3 ON c3.parent_id = c2.id
WHERE c1.code = '100000' AND c2.code = '101000' AND c3.code = '101001';

-- 插入音乐作品数据 (目录code: 101002 先锋音乐作品NFT)
INSERT INTO `rcc_product_spu` 
(`code`, `name`, `category1_id`, `category1_code`, `category2_id`, `category2_code`, 
`category3_id`, `category3_code`, `total_sales`, `total_stock`, `brand`, `description`, 
`price`, `real_price`, `status`, `images`, `creator`, `updator`) 
SELECT 
    'SPU20240102002', '电子音乐专辑-赛博朋克', c1.id, c1.code, c2.id, c2.code, c3.id, c3.code,
    150, 300, 'CyberMusic', '融合未来科技元素的电子音乐专辑，带来沉浸式听觉体验',
    899.99, 799.99, 1, 
    'https://example.com/images/cyberpunk_music.jpg', 
    'admin', 'admin'
FROM rcc_category c1 
JOIN rcc_category c2 ON c2.parent_id = c1.id
JOIN rcc_category c3 ON c3.parent_id = c2.id
WHERE c1.code = '100000' AND c2.code = '101000' AND c3.code = '101002';

-- 插入视频艺术数据 (目录code: 101003 视频艺术NFT)
INSERT INTO `rcc_product_spu` 
(`code`, `name`, `category1_id`, `category1_code`, `category2_id`, `category2_code`, 
`category3_id`, `category3_code`, `total_sales`, `total_stock`, `brand`, `description`, 
`price`, `real_price`, `status`, `images`, `creator`, `updator`) 
SELECT 
    'SPU20240102003', '数字视觉艺术-时空之旅', c1.id, c1.code, c2.id, c2.code, c3.id, c3.code,
    100, 200, 'TimeArt', '探索时间与空间概念的视觉艺术作品，呈现独特的艺术视角',
    2999.99, 2799.99, 1, 
    'https://example.com/images/time_space.jpg', 
    'admin', 'admin'
FROM rcc_category c1 
JOIN rcc_category c2 ON c2.parent_id = c1.id
JOIN rcc_category c3 ON c3.parent_id = c2.id
WHERE c1.code = '100000' AND c2.code = '101000' AND c3.code = '101003';

-- 插入游戏道具数据 (目录code: 103001 游戏道具NFT)
INSERT INTO `rcc_product_spu` 
(`code`, `name`, `category1_id`, `category1_code`, `category2_id`, `category2_code`, 
`category3_id`, `category3_code`, `total_sales`, `total_stock`, `brand`, `description`, 
`price`, `real_price`, `status`, `images`, `creator`, `updator`) 
SELECT 
    'SPU20240102004', '限定皮肤-星际战士', c1.id, c1.code, c2.id, c2.code, c3.id, c3.code,
    500, 1000, 'GameSkin', '独特的限定版游戏角色皮肤，展现未来战士的酷炫外观',
    299.99, 259.99, 1, 
    'https://example.com/images/star_warrior.jpg', 
    'admin', 'admin'
FROM rcc_category c1 
JOIN rcc_category c2 ON c2.parent_id = c1.id
JOIN rcc_category c3 ON c3.parent_id = c2.id
WHERE c1.code = '100000' AND c2.code = '103000' AND c3.code = '103001';

-- 为每个商品添加SPU属性参数
INSERT INTO `rcc_product_spu_attr_params` 
(`product_spu_id`, `product_spu_code`, `code`, `name`, `attr_type`, `value_type`, 
`value`, `sort`, `status`, `is_required`, `is_generic`, `creator`, `updator`)
SELECT 
    id, code,
    'BASIC_ATTRS', '基本属性', 1, 1,
    '{"创作者":"Digital Artist","创作时间":"2024-01","作品编号":"ART2024002"}',
    1, 1, 1, 1, 'admin', 'admin'
FROM rcc_product_spu
WHERE code = 'SPU20240102001'
UNION ALL
SELECT 
    id, code,
    'BASIC_ATTRS', '基本属性', 1, 1,
    '{"音乐人":"Cyber Artist","发行时间":"2024-01","专辑编号":"MUSIC2024001"}',
    1, 1, 1, 1, 'admin', 'admin'
FROM rcc_product_spu
WHERE code = 'SPU20240102002'
UNION ALL
SELECT 
    id, code,
    'BASIC_ATTRS', '基本属性', 1, 1,
    '{"导演":"Visual Artist","制作时间":"2024-01","作品编号":"VIDEO2024001"}',
    1, 1, 1, 1, 'admin', 'admin'
FROM rcc_product_spu
WHERE code = 'SPU20240102003'
UNION ALL
SELECT 
    id, code,
    'BASIC_ATTRS', '基本属性', 1, 1,
    '{"游戏":"Star Wars","发行时间":"2024-01","道具编号":"GAME2024001"}',
    1, 1, 1, 1, 'admin', 'admin'
FROM rcc_product_spu
WHERE code = 'SPU20240102004';