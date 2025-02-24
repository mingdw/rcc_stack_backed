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
    `type` INT NOT NULL default 0 COMMENT '类型',
    `status` INT NOT NULL default 0 COMMENT '状态',
    `sort` INT NOT NULL default 0 COMMENT '排序',
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
    `category_id` BIGINT NOT NULL default 0 COMMENT '商品目录分类id',
    `category_code` VARCHAR(255) NOT NULL default '' COMMENT '商品目录分类编码',
    `brand` VARCHAR(255) NOT NULL default '' COMMENT '品牌',
    `description` VARCHAR(255) NOT NULL default '' COMMENT '描述',
    `status` INT NOT NULL default 0 COMMENT '状态',
    `images` VARCHAR(1000) NOT NULL default '' COMMENT '图片',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`),
    KEY `idx_category_id` (`category_id`),
    UNIQUE KEY `uk_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6.商品spu详情
CREATE TABLE `rcc_product_spu_detail` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `product_spu_id` BIGINT NOT NULL default 0 COMMENT '商品spu id',
    `product_spu_code` VARCHAR(255) NOT NULL default '' COMMENT '商品spu编码',
    `detail` LONGBLOB COMMENT '详情',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`),
    KEY `idx_product_spu_id` (`product_spu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 7.商品spu属性组关联表
CREATE TABLE `rcc_product_spu_attr_group` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `product_spu_id` BIGINT NOT NULL default 0 COMMENT '商品spu id',
    `product_spu_code` VARCHAR(255) NOT NULL default '' COMMENT '商品spu编码',
    `attr_group_id` BIGINT NOT NULL default 0 COMMENT '属性组id',
    `attr_group_code` VARCHAR(255) NOT NULL default '' COMMENT '属性组编码',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`),
    KEY `idx_product_spu_id` (`product_spu_id`),
    KEY `idx_attr_group_id` (`attr_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 8.商品spu属性关联表
CREATE TABLE `rcc_product_spu_attr` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `product_spu_id` BIGINT NOT NULL default 0 COMMENT '商品spu id',
    `product_spu_code` VARCHAR(255) NOT NULL default '' COMMENT '商品spu编码',
    `attr_id` BIGINT NOT NULL default 0 COMMENT '属性id',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`),
    KEY `idx_product_spu_id` (`product_spu_id`),
    KEY `idx_attr_id` (`attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 9.商品sku
CREATE TABLE `rcc_product_sku` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `product_spu_id` BIGINT NOT NULL default 0 COMMENT '商品spu id',
    `product_spu_code` VARCHAR(255) NOT NULL default '' COMMENT '商品spu编码',
    `sku_code` VARCHAR(255) NOT NULL default '' COMMENT 'sku编码',
    `category_id` BIGINT NOT NULL default 0 COMMENT '商品目录分类id',
    `category_code` VARCHAR(255) NOT NULL default '' COMMENT '商品目录分类编码',
    `price` DECIMAL(10,2) NOT NULL default 0 COMMENT '价格',
    `stock` INT NOT NULL default 0 COMMENT '库存',
    `sale_count` INT NOT NULL COMMENT '销量',
    `status` INT NOT NULL COMMENT '状态',
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
    KEY `idx_category_id` (`category_id`),
    UNIQUE KEY `uk_sku_code` (`sku_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 10.商品sku属性组关联表
CREATE TABLE `rcc_product_sku_attr_group` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `product_sku_id` BIGINT NOT NULL default 0 COMMENT '商品sku id',
    `product_sku_code` VARCHAR(255) NOT NULL default '' COMMENT '商品sku编码',
    `attr_group_id` BIGINT NOT NULL default 0 COMMENT '属性组id',
    `attr_group_code` VARCHAR(255) NOT NULL default '' COMMENT '属性组编码',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`),
    KEY `idx_product_sku_id` (`product_sku_id`),
    KEY `idx_attr_group_id` (`attr_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 11.商品sku属性关联表
CREATE TABLE `rcc_product_sku_attr` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `product_sku_id` BIGINT NOT NULL default 0 COMMENT '商品sku id',
    `product_sku_code` VARCHAR(255) NOT NULL default '' COMMENT '商品sku编码',
    `attr_id` BIGINT NOT NULL default 0 COMMENT '属性id',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间', 
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default ''  COMMENT '更新人',
    PRIMARY KEY (`id`),
    KEY `idx_product_sku_id` (`product_sku_id`),
    KEY `idx_attr_id` (`attr_id`)
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

-- 插入属性和属性组
-- 插入NFT专区相关属性组
INSERT INTO `rcc_attr_group` (`attr_group_name`, `attr_group_code`, `type`, `status`, `sort`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`)
VALUES 
('应用领域', 'nft_application_field', 1, 1, 1, NOW(), NOW(), 0, 'admin', 'admin'),
('内容形式', 'nft_content_form', 1, 1, 2, NOW(), NOW(), 0, 'admin', 'admin');

-- 插入应用领域属性组下的属性
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `icon`, `attr_type`, `status`, `sort`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`)
SELECT 
    '艺术创作' as attr_name,
    'art_creation' as attr_code,
    id as attr_group_id,
    '' as icon,
    1 as attr_type,
    1 as status,
    1 as sort,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_attr_group WHERE attr_group_code = 'nft_application_field'
UNION ALL
SELECT '音乐作品', 'music_works', id, '', 1, 1, 2, NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'nft_application_field'
UNION ALL
SELECT '游戏道具', 'game_props', id, '', 1, 1, 3, NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'nft_application_field'
UNION ALL
SELECT '虚拟资产', 'virtual_assets', id, '', 1, 1, 4, NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'nft_application_field'
UNION ALL
SELECT '体育收藏', 'sports_collection', id, '', 1, 1, 5, NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'nft_application_field'
UNION ALL
SELECT '域名', 'domain_name', id, '', 1, 1, 6, NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'nft_application_field';

-- 插入内容形式属性组下的属性
INSERT INTO `rcc_attr` (`attr_name`, `attr_code`, `attr_group_id`, `icon`, `attr_type`, `status`, `sort`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`)
SELECT 
    '图片' as attr_name,
    'image' as attr_code,
    id as attr_group_id,
    '' as icon,
    1 as attr_type,
    1 as status,
    1 as sort,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_attr_group WHERE attr_group_code = 'nft_content_form'
UNION ALL
SELECT '视频', 'video', id, '', 1, 1, 2, NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'nft_content_form'
UNION ALL
SELECT '音频', 'audio', id, '', 1, 1, 3, NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'nft_content_form'
UNION ALL
SELECT '3D模型', '3d_model', id, '', 1, 1, 4, NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'nft_content_form'
UNION ALL
SELECT '文本类型', 'text', id, '', 1, 1, 5, NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'nft_content_form'
UNION ALL
SELECT '其它', 'other', id, '', 1, 1, 6, NOW(), NOW(), 0, 'admin', 'admin'
FROM rcc_attr_group WHERE attr_group_code = 'nft_content_form';

-- 建立NFT专区与属性组的关联
INSERT INTO `rcc_category_attr_group` (`category_id`, `category_code`, `attr_group_id`, `attr_group_code`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`)
SELECT 
    c.id as category_id,
    c.code as category_code,
    ag.id as attr_group_id,
    ag.attr_group_code as attr_group_code,
    NOW() as created_at,
    NOW() as updated_at,
    0 as is_deleted,
    'admin' as creator,
    'admin' as updator
FROM rcc_category c
CROSS JOIN rcc_attr_group ag
WHERE c.code = (select code from rcc_category where name = 'NFT专区') 
AND ag.attr_group_code IN ('nft_application_field', 'nft_content_form');
