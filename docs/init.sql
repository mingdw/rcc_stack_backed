-- 1.商品目录分类表
CREATE TABLE `sys_category` (
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
CREATE TABLE `sys_attr_group` (
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
CREATE TABLE `sys_attr` (
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
CREATE TABLE `sys_category_attr_group` (
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
CREATE TABLE `sys_product_spu` (
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
CREATE TABLE `sys_product_spu_detail` (
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
CREATE TABLE `sys_product_spu_attr_params` (
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
CREATE TABLE `sys_product_sku` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `product_spu_id` BIGINT NOT NULL default 0 COMMENT '商品spu id',
    `product_spu_code` VARCHAR(255) NOT NULL default '' COMMENT '商品spu编码',
    `sku_code` VARCHAR(255) NOT NULL default '' COMMENT 'sku编码',
    `price` DECIMAL(10,2) NOT NULL default 0 COMMENT '价格',
    `stock` INT NOT NULL default 0 COMMENT '库存',
    `sale_count` INT NOT NULL COMMENT '销量',
    `status` INT NOT NULL COMMENT '状态',
    `indexs` VARCHAR(64) NOT NULL default '' COMMENT '规格索引',
    `attr_params` TEXT  COMMENT '属性参数json',
    `owner_params` TEXT  COMMENT '属性参数json',
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

-- 9.订单表
CREATE TABLE `sys_order` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `order_code` VARCHAR(255) NOT NULL default '' COMMENT '订单编码',
    `user_id` BIGINT NOT NULL default 0 COMMENT '用户id',
    `user_code` VARCHAR(255) NOT NULL default '' COMMENT '用户编码',
    `order_status` INT NOT NULL default 0 COMMENT '订单状态',
    `order_status_desc` VARCHAR(255) NOT NULL default '' COMMENT '订单状态描述',
    `payment_status` INT NOT NULL default 0 COMMENT '支付状态',
    `payment_status_desc` VARCHAR(255) NOT NULL default '' COMMENT '支付状态描述',
    `order_date` DATETIME NOT NULL default CURRENT_TIMESTAMP COMMENT '订单日期',
    `order_amount` DECIMAL(10,2) NOT NULL default 0 COMMENT '订单金额',
    `order_discount` DECIMAL(10,2) NOT NULL default 0 COMMENT '订单折扣',
    `order_total` DECIMAL(10,2) NOT NULL default 0 COMMENT '订单总价',
    `order_remark` VARCHAR(255) NOT NULL default '' COMMENT '订单备注',
    `order_pay_type` INT NOT NULL default 0 COMMENT '支付方式',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 10.订单商品表
CREATE TABLE `sys_order_product` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `order_id` BIGINT NOT NULL default 0 COMMENT '订单id',
    `order_code` VARCHAR(255) NOT NULL default '' COMMENT '订单编码',
    `spu_id` BIGINT NOT NULL default 0 COMMENT 'spu id',
    `spu_code` VARCHAR(255) NOT NULL default '' COMMENT 'spu编码',
    `sku_id` BIGINT NOT NULL default 0 COMMENT 'sku id',
    `sku_code` VARCHAR(255) NOT NULL default '' COMMENT 'sku编码',
    `product_name` VARCHAR(255) NOT NULL default '' COMMENT '商品名称',
    `product_price` DECIMAL(10,2) NOT NULL default 0 COMMENT '商品价格',
    `product_quantity` INT NOT NULL default 0 COMMENT '商品数量',
    `product_total` DECIMAL(10,2) NOT NULL default 0 COMMENT '商品总价',
    `product_remark` VARCHAR(255) NOT NULL default '' COMMENT '商品备注',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 11.订单支付表
CREATE TABLE `sys_order_payment` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `order_id` BIGINT NOT NULL default 0 COMMENT '订单id',
    `order_code` VARCHAR(255) NOT NULL default '' COMMENT '订单编码',
    `payment_type` INT NOT NULL default 0 COMMENT '支付方式',
    `payment_type_desc` VARCHAR(255) NOT NULL default '' COMMENT '支付方式描述',
    `payment_amount` DECIMAL(10,2) NOT NULL default 0 COMMENT '支付金额',
    `payment_time` DATETIME COMMENT '支付时间',
    `payment_status` INT NOT NULL default 0 COMMENT '支付状态',
    `payment_status_desc` VARCHAR(255) NOT NULL default '' COMMENT '支付状态描述',
    `channel_payment_no` VARCHAR(255) NOT NULL default '' COMMENT '渠道支付单号',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 12.订单配送地址
CREATE TABLE `sys_order_delivery_address` ( 
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `order_id` BIGINT NOT NULL default 0 COMMENT '订单id',
    `order_code` VARCHAR(255) NOT NULL default '' COMMENT '订单编码',
    `user_id` BIGINT NOT NULL default 0 COMMENT '用户id',
    `user_code` VARCHAR(255) NOT NULL default '' COMMENT '用户编码',
    `receiver_name` VARCHAR(255) NOT NULL default '' COMMENT '收货人姓名',
    `receiver_phone` VARCHAR(255) NOT NULL default '' COMMENT '收货人手机号',
    `province_code` VARCHAR(255) NOT NULL default '' COMMENT '省编码',
    `province_name` VARCHAR(255) NOT NULL default '' COMMENT '省名称',
    `city_code` VARCHAR(255) NOT NULL default '' COMMENT '市编码',
    `city_name` VARCHAR(255) NOT NULL default '' COMMENT '市名称',
    `area_code` VARCHAR(255) NOT NULL default '' COMMENT '区编码',
    `area_name` VARCHAR(255) NOT NULL default '' COMMENT '区名称',
    `detail_address` VARCHAR(255) NOT NULL default '' COMMENT '详细地址',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 13.订单物流表
CREATE TABLE `sys_order_logistics` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `order_id` BIGINT NOT NULL default 0 COMMENT '订单id',
    `order_code` VARCHAR(255) NOT NULL default '' COMMENT '订单编码',
    `logistics_company_code` VARCHAR(255) NOT NULL default '' COMMENT '物流公司编码',
    `logistics_company_name` VARCHAR(255) NOT NULL default '' COMMENT '物流公司名称',
    `logistics_no` VARCHAR(255) NOT NULL default '' COMMENT '物流单号',
    `logistics_status` INT NOT NULL default 0 COMMENT '物流状态',
    `logistics_status_desc` VARCHAR(255) NOT NULL default '' COMMENT '物流状态描述',
    `ship_time` DATETIME COMMENT '发货时间',
    `expect_delivery_time` DATETIME COMMENT '预计送达时间',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 14. 售后表
CREATE TABLE `sys_order_after_sale` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `order_id` BIGINT NOT NULL default 0 COMMENT '订单id',
    `order_code` VARCHAR(255) NOT NULL default '' COMMENT '订单编码',
    `after_sale_type` INT NOT NULL default 0 COMMENT '售后类型',
    `after_sale_type_desc` VARCHAR(255) NOT NULL default '' COMMENT '售后类型描述',
    `after_sale_status` INT NOT NULL default 0 COMMENT '售后状态',
    `after_sale_status_desc` VARCHAR(255) NOT NULL default '' COMMENT '售后状态描述',
    `apply_time` DATETIME COMMENT '申请时间',
    `reason` VARCHAR(255) NOT NULL default '' COMMENT '售后原因',
    `images` VARCHAR(1000) COMMENT '图片',
    `after_sale_remark` VARCHAR(255) NOT NULL default '' COMMENT '售后备注',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 15.订单评价表
CREATE TABLE `sys_order_reviews` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `order_id` BIGINT NOT NULL default 0 COMMENT '订单id',
    `order_code` VARCHAR(255) NOT NULL default '' COMMENT '订单编码',
    `user_id` BIGINT NOT NULL default 0 COMMENT '用户id',
    `user_code` VARCHAR(255) NOT NULL default '' COMMENT '用户编码',
    `product_id` BIGINT NOT NULL default 0 COMMENT '商品id',
    `content` VARCHAR(255) NOT NULL default '' COMMENT '评价内容',
    `rating` INT NOT NULL default 0 COMMENT '评分',
    `review_time` DATETIME COMMENT '评价时间',
    `images` VARCHAR(1000) COMMENT '图片',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 16.用户表
CREATE TABLE `sys_user` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL default 0 COMMENT '用户id',
    `user_code` VARCHAR(255) NOT NULL default '' COMMENT '用户编码',
    `nickname` VARCHAR(255) NOT NULL default '' COMMENT '昵称',
    `avatar` VARCHAR(255) NOT NULL default '' COMMENT '头像',
    `gender` INT NOT NULL default 0 COMMENT '性别',
    `birthday` DATETIME COMMENT '生日',
    `email` VARCHAR(255) NOT NULL default '' COMMENT '邮箱',
    `phone` VARCHAR(255) NOT NULL default '' COMMENT '手机号',
    `password` VARCHAR(255) NOT NULL default '' COMMENT '密码',
    `status` INT NOT NULL default 0 COMMENT '状态',
    `status_desc` VARCHAR(255) NOT NULL default '' COMMENT '状态描述',
    `type` INT NOT NULL default 0 COMMENT '类型',
    `type_desc` VARCHAR(255) NOT NULL default '' COMMENT '类型描述',
    `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `is_deleted` INT DEFAULT 0 COMMENT '是否删除',
    `creator` VARCHAR(64) NOT NULL default '' COMMENT '创建人',
    `updator` VARCHAR(64) NOT NULL default '' COMMENT '更新人',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 清理所有已有目录数据
DELETE FROM sys_category where id>0;

-- 1. 一级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator) VALUES
('100000', 'NFT专区', 0, '', 1, 1, '', NOW(), NOW(), 0, 'admin', 'admin'),
('200000', '数字素材类', 0, '', 1, 2, '', NOW(), NOW(), 0, 'admin', 'admin'),
('300000', '学习资源类', 0, '', 1, 3, '', NOW(), NOW(), 0, 'admin', 'admin'),
('400000', '生活娱乐类', 0, '', 1, 4, '', NOW(), NOW(), 0, 'admin', 'admin'),
('500000', '会员权益类', 0, '', 1, 5, '', NOW(), NOW(), 0, 'admin', 'admin'),
('600000', '软件服务类', 0, '', 1, 6, '', NOW(), NOW(), 0, 'admin', 'admin');

-- ================ 1. NFT专区 (100000) ================
-- 1.1-1.7 NFT专区二级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '110000', '数字艺术品', id, '100000', 2, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '100000'
UNION ALL
SELECT 
    '120000', '虚拟身份', id, '100000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '100000'
UNION ALL
SELECT 
    '130000', '游戏资产', id, '100000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '100000'
UNION ALL
SELECT 
    '140000', '收藏品', id, '100000', 2, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '100000'
UNION ALL
SELECT 
    '150000', '虚拟房地产', id, '100000', 2, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '100000'
UNION ALL
SELECT 
    '160000', '数字证书', id, '100000', 2, 6, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '100000'
UNION ALL
SELECT 
    '170000', '金融资产', id, '100000', 2, 7, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '100000';

-- 1.1.x 数字艺术品三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '111000', '潮流艺术画作NFT', id, '110000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '110000'
UNION ALL
SELECT 
    '112000', '先锋音乐作品NFT', id, '110000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '110000'
UNION ALL
SELECT 
    '113000', '视频艺术NFT', id, '110000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '110000'
UNION ALL
SELECT 
    '114000', '文本类型NFT', id, '110000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '110000';

-- 1.2.x 虚拟身份三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '121000', '独特头像NFT', id, '120000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '120000'
UNION ALL
SELECT 
    '122000', '定制虚拟形象NFT', id, '120000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '120000'
UNION ALL
SELECT 
    '123000', '专属社交身份NFT', id, '120000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '120000';

-- 1.3.x 游戏资产三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '131000', '游戏道具NFT', id, '130000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '130000'
UNION ALL
SELECT 
    '132000', '游戏装备NFT', id, '130000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '130000'
UNION ALL
SELECT 
    '133000', '游戏角色NFT', id, '130000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '130000';

-- 1.4.x 收藏品三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '141000', '体育赛事纪念NFT', id, '140000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '140000'
UNION ALL
SELECT 
    '142000', '历史文化收藏NFT', id, '140000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '140000'
UNION ALL
SELECT 
    '143000', '名人周边NFT', id, '140000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '140000'
UNION ALL
SELECT 
    '144000', '限量版徽章NFT', id, '140000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '140000';

-- 1.5.x 虚拟房地产三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '151000', '元宇宙地块NFT', id, '150000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '150000'
UNION ALL
SELECT 
    '152000', '虚拟建筑NFT', id, '150000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '150000';

-- 1.6.x 数字证书三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '161000', '教育认证NFT', id, '160000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '160000'
UNION ALL
SELECT 
    '162000', '会员资格NFT', id, '160000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '160000'
UNION ALL
SELECT 
    '163000', '活动门票NFT', id, '160000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '160000'
UNION ALL
SELECT 
    '164000', '数字版权NFT', id, '160000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '160000';

-- 1.7.x 金融资产三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '171000', '数字债券NFT', id, '170000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '170000'
UNION ALL
SELECT 
    '172000', '资产凭证NFT', id, '170000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '170000'
UNION ALL
SELECT 
    '173000', '股权通证NFT', id, '170000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '170000';

-- ================ 2. 数字素材类 (200000) ================
-- 2.1-2.4 数字素材类二级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '210000', '文档模板', id, '200000', 2, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '200000'
UNION ALL
SELECT 
    '220000', '图片素材', id, '200000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '200000'
UNION ALL
SELECT 
    '230000', '音乐素材', id, '200000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '200000'
UNION ALL
SELECT 
    '240000', '视频素材', id, '200000', 2, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '200000';

-- 2.1.x 文档模板三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '211000', 'Word模板', id, '210000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '210000'
UNION ALL
SELECT 
    '212000', 'Excel模板', id, '210000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '210000'
UNION ALL
SELECT 
    '213000', 'PPT模板', id, '210000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '210000'
UNION ALL
SELECT 
    '214000', 'PDF模板', id, '210000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '210000'
UNION ALL
SELECT 
    '215000', '其它模板', id, '210000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '210000';

-- 2.2.x 图片素材三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '221000', '壁纸', id, '220000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '220000'
UNION ALL
SELECT 
    '222000', '头像', id, '220000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '220000'
UNION ALL
SELECT 
    '223000', '海报', id, '220000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '220000'
UNION ALL
SELECT 
    '224000', '插画', id, '220000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '220000';

-- 2.3.x 音乐素材三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '231000', '背景音乐', id, '230000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '230000'
UNION ALL
SELECT 
    '232000', '配乐相关', id, '230000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '230000'
UNION ALL
SELECT 
    '233000', '音乐节拍', id, '230000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '230000'
UNION ALL
SELECT 
    '234000', '自然声音', id, '230000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '230000'
UNION ALL
SELECT 
    '235000', '其它音乐', id, '230000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '230000';

-- 2.4.x 视频素材三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '241000', '广告视频', id, '240000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '240000'
UNION ALL
SELECT 
    '242000', '宣传片', id, '240000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '240000'
UNION ALL
SELECT 
    '243000', '教学视频', id, '240000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '240000'
UNION ALL
SELECT 
    '244000', '动画视频', id, '240000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '240000'
UNION ALL
SELECT 
    '245000', '其它视频', id, '240000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '240000';

-- ================ 3. 学习资源类 (300000) ================
-- 3.1-3.4 学习资源类二级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '310000', '学术资料', id, '300000', 2, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '300000'
UNION ALL
SELECT 
    '320000', '职业技能', id, '300000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '300000'
UNION ALL
SELECT 
    '330000', '语言学习', id, '300000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '300000'
UNION ALL
SELECT 
    '340000', '其它学习资源', id, '300000', 2, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '300000';

-- 3.1.x 学术资料三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '311000', '论文', id, '310000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '310000'
UNION ALL
SELECT 
    '312000', '书籍', id, '310000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '310000'
UNION ALL
SELECT 
    '313000', '报告', id, '310000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '310000'
UNION ALL
SELECT 
    '314000', '真题', id, '310000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '310000'
UNION ALL
SELECT 
    '315000', '课件', id, '310000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '310000'
UNION ALL
SELECT 
    '316000', '其它学术资料', id, '310000', 3, 6, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '310000';

-- 3.2.x 职业技能三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '321000', '编程', id, '320000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '320000'
UNION ALL
SELECT 
    '322000', '设计', id, '320000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '320000'
UNION ALL
SELECT 
    '323000', '营销', id, '320000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '320000'
UNION ALL
SELECT 
    '324000', '其它技能', id, '320000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '320000';

-- 3.3.x 语言学习三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '331000', '英语', id, '330000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '330000'
UNION ALL
SELECT 
    '332000', '日语', id, '330000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '330000'
UNION ALL
SELECT 
    '333000', '韩语', id, '330000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '330000'
UNION ALL
SELECT 
    '334000', '其它语言', id, '330000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '330000';

-- 3.4.x 其它学习资源三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '341000', '考试资料', id, '340000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '340000'
UNION ALL
SELECT 
    '342000', '学习工具', id, '340000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '340000'
UNION ALL
SELECT 
    '343000', '学习方法', id, '340000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '340000';

-- ================ 4. 生活娱乐类 (400000) ================
-- 4.1-4.3 生活娱乐类二级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '410000', '影音娱乐', id, '400000', 2, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '400000'
UNION ALL
SELECT 
    '420000', '游戏周边', id, '400000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '400000'
UNION ALL
SELECT 
    '430000', '兴趣爱好', id, '400000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '400000';

-- 4.1.x 影音娱乐三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '411000', '电影', id, '410000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '410000'
UNION ALL
SELECT 
    '412000', '电视剧', id, '410000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '410000'
UNION ALL
SELECT 
    '413000', '综艺', id, '410000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '410000'
UNION ALL
SELECT 
    '414000', '动漫', id, '410000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '410000'
UNION ALL
SELECT 
    '415000', '游戏', id, '410000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '410000'
UNION ALL
SELECT 
    '416000', '其它影音', id, '410000', 3, 6, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '410000';

-- 4.2.x 游戏周边三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '421000', '虚拟物品', id, '420000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '420000'
UNION ALL
SELECT 
    '422000', '账号服务', id, '420000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '420000'
UNION ALL
SELECT 
    '423000', '辅助工具', id, '420000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '420000'
UNION ALL
SELECT 
    '424000', '游戏服务', id, '420000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '420000';

-- 4.3.x 兴趣爱好三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '431000', '运动健身', id, '430000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '430000'
UNION ALL
SELECT 
    '432000', '摄影摄像', id, '430000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '430000'
UNION ALL
SELECT 
    '433000', '绘画设计', id, '430000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '430000'
UNION ALL
SELECT 
    '434000', '音乐舞蹈', id, '430000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '430000'
UNION ALL
SELECT 
    '435000', '阅读写作', id, '430000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '430000'
UNION ALL
SELECT 
    '436000', '其它爱好', id, '430000', 3, 6, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '430000';

-- ================ 5. 会员权益类 (500000) ================
-- 5.1-5.4 会员权益类二级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '510000', '视频会员', id, '500000', 2, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '500000'
UNION ALL
SELECT 
    '520000', '音乐会员', id, '500000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '500000'
UNION ALL
SELECT 
    '530000', '阅读会员', id, '500000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '500000';

-- 5.1.x 视频会员三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '511000', '爱奇艺会员', id, '510000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '510000'
UNION ALL
SELECT 
    '512000', '腾讯视频会员', id, '510000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '510000'
UNION ALL
SELECT 
    '513000', '优酷会员', id, '510000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '510000'
UNION ALL
SELECT 
    '514000', '哔哩哔哩会员', id, '510000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '510000'
UNION ALL
SELECT 
    '515000', '其它视频会员', id, '510000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '510000';

-- 5.2.x 音乐会员三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '521000', '网易云音乐会员', id, '520000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '520000'
UNION ALL
SELECT 
    '522000', 'QQ音乐会员', id, '520000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '520000'
UNION ALL
SELECT 
    '523000', '酷狗音乐会员', id, '520000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '520000'
UNION ALL
SELECT 
    '524000', '酷我音乐会员', id, '520000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '520000'
UNION ALL
SELECT 
    '525000', '其它音乐会员', id, '520000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '520000';

-- 5.3.x 阅读会员三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '531000', '得到会员', id, '530000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '530000'
UNION ALL
SELECT 
    '532000', '喜马拉雅会员', id, '530000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '530000'
UNION ALL
SELECT 
    '533000', '其它阅读会员', id, '530000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '530000';

-- ================ 6. 软件服务类 (600000) ================
-- 6.1-6.4 软件服务类二级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '610000', '安装程序', id, '600000', 2, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '600000'
UNION ALL
SELECT 
    '620000', '激活码', id, '600000', 2, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '600000'
UNION ALL
SELECT 
    '630000', '破解工具', id, '600000', 2, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '600000'
UNION ALL
SELECT 
    '640000', '其它服务', id, '600000', 2, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '600000';

-- 6.1.x 安装程序三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '611000', '办公软件', id, '610000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '610000'
UNION ALL
SELECT 
    '612000', '设计软件', id, '610000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '610000'
UNION ALL
SELECT 
    '613000', '编程软件', id, '610000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '610000'
UNION ALL
SELECT 
    '614000', '影音软件', id, '610000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '610000'
UNION ALL
SELECT 
    '615000', '其它软件', id, '610000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '610000';

-- 6.2.x 激活码三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '621000', 'Office激活码', id, '620000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '620000'
UNION ALL
SELECT 
    '622000', '金山办公激活码', id, '620000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '620000'
UNION ALL
SELECT 
    '623000', '腾讯文档激活码', id, '620000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '620000'
UNION ALL
SELECT 
    '624000', 'WPS激活码', id, '620000', 3, 4, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '620000'
UNION ALL
SELECT 
    '625000', '其它激活码', id, '620000', 3, 5, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '620000';

-- 6.3.x 破解工具三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '631000', 'Office破解工具', id, '630000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '630000'
UNION ALL
SELECT 
    '632000', '金山办公破解工具', id, '630000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '630000'
UNION ALL
SELECT 
    '633000', '其它破解工具', id, '630000', 3, 3, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '630000';

-- 6.4.x 其它服务三级目录
INSERT INTO sys_category (code, name, parent_id, parent_code, level, sort, icon, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    '641000', '游戏服务', id, '640000', 3, 1, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '640000'
UNION ALL
SELECT 
    '642000', '其它服务项目', id, '640000', 3, 2, '', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category WHERE code = '640000';


INSERT INTO `sys_attr_group` (`attr_group_name`, `attr_group_code`, `type`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) VALUES
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
('主题', 'NFT_COLLECTION_THEME', 1, 1, 25, '体育项目属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('体育项目', 'NFT_SPORTS', 1, 1, 25, '体育项目属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('赛事类型', 'NFT_COMPETITION_TYPE', 1, 1, 26, '体育赛事类型属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('历史时期', 'NFT_HISTORICAL_PERIOD', 1, 1, 27, '历史时期属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('文化类型', 'NFT_CULTURE_TYPE', 1, 1, 28, '文化类型属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('名人领域', 'NFT_CELEBRITY_FIELD', 1, 1, 29, '名人领域属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('周边形式', 'NFT_PERIPHERAL_FORM', 1, 1, 30, '名人周边形式属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('徽章主题', 'NFT_BADGE_THEME', 1, 1, 31, '徽章主题属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('限量数量', 'NFT_LIMITED_QUANTITY', 1, 1, 32, '限量版数量属性组', NOW(), NOW(), 0, 'admin', 'admin'),

-- 虚拟房地产属性组
('应用领域', 'NFT_APPLICATION_HOUSE', 1, 1, 33, '虚拟应用领域属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('平台', 'NFT_PLATFORM_TYPE', 1, 1, 33, '虚拟房地产平台属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('位置', 'NFT_LOCATION', 1, 1, 34, '虚拟房地产位置属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('面积', 'NFT_AREA', 1, 1, 35, '虚拟房地产面积属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('空间风格', 'NFT_SPACE_STYLE', 1, 1, 36, '虚拟建筑风格属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('空间用途', 'NFT_SPACE_USE', 1, 1, 37, '虚拟建筑用途属性组', NOW(), NOW(), 0, 'admin', 'admin'),

-- 数字证书属性组
('证书用途', 'NFT_CERT_TYPE_ATTR', 1, 1, 38, '证书用途属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('认证类型', 'NFT_CERT_TYPE', 1, 1, 38, '教育认证类型属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('颁发机构', 'NFT_ISSUING_ORG', 1, 1, 39, '证书颁发机构属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('会员等级', 'NFT_MEMBER_LEVEL', 1, 1, 40, '会员等级属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('会员权益', 'NFT_MEMBER_RIGHTS', 1, 1, 41, '会员权益属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('活动类型', 'NFT_EVENT_TYPE', 1, 1, 42, '活动类型属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('座位等级', 'NFT_SEAT_LEVEL', 1, 1, 43, '活动座位等级属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('版权类型', 'NFT_COPYRIGHT_TYPE', 1, 1, 44, '数字版权类型属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('授权方式', 'NFT_LICENSE_TYPE', 1, 1, 45, '版权授权方式属性组', NOW(), NOW(), 0, 'admin', 'admin'),

-- 金融资产属性组
('资产类型', 'NFT_ASSET_TYPE_ATTR', 1, 1, 48, '资产类型属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('债券期限', 'NFT_BOND_PERIOD', 1, 1, 46, '数字债券期限属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('利率类型', 'NFT_INTEREST_TYPE', 1, 1, 47, '债券利率类型属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('资产类别', 'NFT_ASSET_TYPE', 1, 1, 48, '资产凭证类别属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('凭证用途', 'NFT_VOUCHER_USE', 1, 1, 49, '资产凭证用途属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('企业领域', 'NFT_ENTERPRISE_FIELD', 1, 1, 50, '股权企业领域属性组', NOW(), NOW(), 0, 'admin', 'admin'),
('股权比例', 'NFT_EQUITY_RATIO', 1, 1, 51, '股权通证比例属性组', NOW(), NOW(), 0, 'admin', 'admin');


-- 应用领域属性数据
-- 插入NFT属性值数据
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'艺术创作', 'NFT_APPLICATION_FIELD_ART', id, 'NFT_APPLICATION_FIELD', 1, 1, '艺术创作领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_APPLICATION_FIELD'
UNION ALL
SELECT 
'虚拟资产', 'NFT_APPLICATION_FIELD_VIRTUAL', id, 'NFT_APPLICATION_FIELD', 1, 2, '虚拟资产领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_APPLICATION_FIELD'
UNION ALL
SELECT 
'游戏相关', 'NFT_APPLICATION_FIELD_GAME', id, 'NFT_APPLICATION_FIELD', 1, 3, '游戏相关领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_APPLICATION_FIELD'
UNION ALL
SELECT 
'艺术收藏', 'NFT_APPLICATION_FIELD_COLLECTION', id, 'NFT_APPLICATION_FIELD', 1, 4, '艺术收藏领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_APPLICATION_FIELD'
UNION ALL
SELECT 
'域名', 'NFT_APPLICATION_FIELD_DOMAIN', id, 'NFT_APPLICATION_FIELD', 1, 5, '域名领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_APPLICATION_FIELD';

-- 技术形式属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'区块链数字艺术品', 'NFT_TECH_FORM_BLOCKCHAIN', id, 'NFT_TECH_FORM', 1, 1, '区块链数字艺术品形式', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_TECH_FORM'
UNION ALL
SELECT 
'人工智能生成艺术品', 'NFT_TECH_FORM_AI', id, 'NFT_TECH_FORM', 1, 2, '人工智能生成艺术品形式', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_TECH_FORM'
UNION ALL
SELECT 
'传统数字艺术形式', 'NFT_TECH_FORM_TRADITIONAL', id, 'NFT_TECH_FORM', 1, 3, '传统数字艺术形式', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_TECH_FORM';

-- 艺术风格属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'赛博朋克', 'NFT_ART_STYLE_CYBERPUNK', id, 'NFT_ART_STYLE', 1, 1, '赛博朋克风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ART_STYLE'
UNION ALL
SELECT 
'波普艺术', 'NFT_ART_STYLE_POP', id, 'NFT_ART_STYLE', 1, 2, '波普艺术风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ART_STYLE'
UNION ALL
SELECT 
'新艺术运动风', 'NFT_ART_STYLE_NEW', id, 'NFT_ART_STYLE', 1, 3, '新艺术运动风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ART_STYLE'
UNION ALL
SELECT 
'简约', 'NFT_ART_STYLE_SIMPLE', id, 'NFT_ART_STYLE', 1, 4, '简约风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ART_STYLE'
UNION ALL
SELECT 
'黑白', 'NFT_ART_STYLE_BW', id, 'NFT_ART_STYLE', 1, 5, '黑白风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ART_STYLE';

-- 艺术主题属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'未来都市', 'NFT_ART_THEME_FUTURE', id, 'NFT_ART_THEME', 1, 1, '未来都市主题', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ART_THEME'
UNION ALL
SELECT 
'复古情怀', 'NFT_ART_THEME_RETRO', id, 'NFT_ART_THEME', 1, 2, '复古情怀主题', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ART_THEME'
UNION ALL
SELECT 
'人物', 'NFT_ART_THEME_CHARACTER', id, 'NFT_ART_THEME', 1, 3, '人物主题', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ART_THEME'
UNION ALL
SELECT 
'汽车', 'NFT_ART_THEME_CAR', id, 'NFT_ART_THEME', 1, 4, '汽车主题', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ART_THEME';

-- 创作方式属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'原创', 'NFT_CREATION_METHOD_ORIGINAL', id, 'NFT_CREATION_METHOD', 1, 1, '原创方式', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CREATION_METHOD'
UNION ALL
SELECT 
'混音', 'NFT_CREATION_METHOD_REMIX', id, 'NFT_CREATION_METHOD', 1, 2, '混音方式', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CREATION_METHOD'
UNION ALL
SELECT 
'采样', 'NFT_CREATION_METHOD_SAMPLE', id, 'NFT_CREATION_METHOD', 1, 3, '采样方式', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CREATION_METHOD';

-- 音乐类型属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'电子', 'NFT_MUSIC_TYPE_ELECTRONIC', id, 'NFT_MUSIC_TYPE', 1, 1, '电子音乐', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_MUSIC_TYPE'
UNION ALL
SELECT 
'摇滚', 'NFT_MUSIC_TYPE_ROCK', id, 'NFT_MUSIC_TYPE', 1, 2, '摇滚音乐', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_MUSIC_TYPE'
UNION ALL
SELECT 
'嘻哈', 'NFT_MUSIC_TYPE_HIPHOP', id, 'NFT_MUSIC_TYPE', 1, 3, '嘻哈音乐', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_MUSIC_TYPE'
UNION ALL
SELECT 
'古典', 'NFT_MUSIC_TYPE_CLASSICAL', id, 'NFT_MUSIC_TYPE', 1, 4, '古典音乐', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_MUSIC_TYPE';

-- 视频类型属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'动画短片', 'NFT_VIDEO_TYPE_ANIMATION', id, 'NFT_VIDEO_TYPE', 1, 1, '动画短片', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_VIDEO_TYPE'
UNION ALL
SELECT 
'实验影像', 'NFT_VIDEO_TYPE_EXPERIMENTAL', id, 'NFT_VIDEO_TYPE', 1, 2, '实验影像', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_VIDEO_TYPE'
UNION ALL
SELECT 
'纪录片片段', 'NFT_VIDEO_TYPE_DOCUMENTARY', id, 'NFT_VIDEO_TYPE', 1, 3, '纪录片片段', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_VIDEO_TYPE'
UNION ALL
SELECT 
'剧情短片', 'NFT_VIDEO_TYPE_DRAMA', id, 'NFT_VIDEO_TYPE', 1, 4, '剧情短片', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_VIDEO_TYPE';

-- 视频时长属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'1分钟以内', 'NFT_VIDEO_DURATION_1MIN', id, 'NFT_VIDEO_DURATION', 1, 1, '1分钟以内', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_VIDEO_DURATION'
UNION ALL
SELECT 
'1-5分钟', 'NFT_VIDEO_DURATION_1_5MIN', id, 'NFT_VIDEO_DURATION', 1, 2, '1-5分钟', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_VIDEO_DURATION'
UNION ALL
SELECT 
'5-15分钟', 'NFT_VIDEO_DURATION_5_15MIN', id, 'NFT_VIDEO_DURATION', 1, 3, '5-15分钟', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_VIDEO_DURATION'
UNION ALL
SELECT 
'15分钟以上', 'NFT_VIDEO_DURATION_15MIN_PLUS', id, 'NFT_VIDEO_DURATION', 1, 4, '15分钟以上', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_VIDEO_DURATION';

-- 文本体裁属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'诗歌', 'NFT_TEXT_GENRE_POETRY', id, 'NFT_TEXT_GENRE', 1, 1, '诗歌体裁', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_TEXT_GENRE'
UNION ALL
SELECT 
'小说片段', 'NFT_TEXT_GENRE_NOVEL', id, 'NFT_TEXT_GENRE', 1, 2, '小说片段体裁', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_TEXT_GENRE'
UNION ALL
SELECT 
'散文', 'NFT_TEXT_GENRE_ESSAY', id, 'NFT_TEXT_GENRE', 1, 3, '散文体裁', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_TEXT_GENRE'
UNION ALL
SELECT 
'名言警句', 'NFT_TEXT_GENRE_QUOTE', id, 'NFT_TEXT_GENRE', 1, 4, '名言警句体裁', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_TEXT_GENRE';

-- 文本语言属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'中文', 'NFT_TEXT_LANGUAGE_CN', id, 'NFT_TEXT_LANGUAGE', 1, 1, '中文', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_TEXT_LANGUAGE'
UNION ALL
SELECT 
'英文', 'NFT_TEXT_LANGUAGE_EN', id, 'NFT_TEXT_LANGUAGE', 1, 2, '英文', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_TEXT_LANGUAGE'
UNION ALL
SELECT 
'日文', 'NFT_TEXT_LANGUAGE_JP', id, 'NFT_TEXT_LANGUAGE', 1, 3, '日文', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_TEXT_LANGUAGE'
UNION ALL
SELECT 
'法文', 'NFT_TEXT_LANGUAGE_FR', id, 'NFT_TEXT_LANGUAGE', 1, 4, '法文', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_TEXT_LANGUAGE';

-- 应用平台属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'社交平台', 'NFT_APP_PLATFORM_SOCIAL', id, 'NFT_APP_PLATFORM', 1, 1, '社交平台', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_APP_PLATFORM'
UNION ALL
SELECT 
'元宇宙平台', 'NFT_APP_PLATFORM_METAVERSE', id, 'NFT_APP_PLATFORM', 1, 2, '元宇宙平台', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_APP_PLATFORM'
UNION ALL
SELECT 
'游戏平台', 'NFT_APP_PLATFORM_GAME', id, 'NFT_APP_PLATFORM', 1, 3, '游戏平台', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_APP_PLATFORM';

-- 形象来源属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'动漫角色', 'NFT_IMAGE_SOURCE_ANIME', id, 'NFT_IMAGE_SOURCE', 1, 1, '动漫角色来源', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_IMAGE_SOURCE'
UNION ALL
SELECT 
'原创角色', 'NFT_IMAGE_SOURCE_ORIGINAL', id, 'NFT_IMAGE_SOURCE', 1, 2, '原创角色来源', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_IMAGE_SOURCE'
UNION ALL
SELECT 
'名人形象', 'NFT_IMAGE_SOURCE_CELEBRITY', id, 'NFT_IMAGE_SOURCE', 1, 3, '名人形象来源', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_IMAGE_SOURCE'
UNION ALL
SELECT 
'动物形象', 'NFT_IMAGE_SOURCE_ANIMAL', id, 'NFT_IMAGE_SOURCE', 1, 4, '动物形象来源', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_IMAGE_SOURCE';

-- 稀有度属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'普通', 'NFT_RARITY_COMMON', id, 'NFT_RARITY', 1, 1, '普通稀有度', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_RARITY'
UNION ALL
SELECT 
'稀有', 'NFT_RARITY_RARE', id, 'NFT_RARITY', 1, 2, '稀有稀有度', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_RARITY'
UNION ALL
SELECT 
'史诗', 'NFT_RARITY_EPIC', id, 'NFT_RARITY', 1, 3, '史诗稀有度', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_RARITY'
UNION ALL
SELECT 
'传说', 'NFT_RARITY_LEGENDARY', id, 'NFT_RARITY', 1, 4, '传说稀有度', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_RARITY';

-- 定制元素属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'发型', 'NFT_CUSTOM_ELEMENT_HAIR', id, 'NFT_CUSTOM_ELEMENT', 1, 1, '发型定制元素', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CUSTOM_ELEMENT'
UNION ALL
SELECT 
'服饰', 'NFT_CUSTOM_ELEMENT_CLOTHING', id, 'NFT_CUSTOM_ELEMENT', 1, 2, '服饰定制元素', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CUSTOM_ELEMENT'
UNION ALL
SELECT 
'配饰', 'NFT_CUSTOM_ELEMENT_ACCESSORY', id, 'NFT_CUSTOM_ELEMENT', 1, 3, '配饰定制元素', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CUSTOM_ELEMENT'
UNION ALL
SELECT 
'面部特征', 'NFT_CUSTOM_ELEMENT_FACIAL', id, 'NFT_CUSTOM_ELEMENT', 1, 4, '面部特征定制元素', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CUSTOM_ELEMENT';

-- 适用场景属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'社交互动', 'NFT_APPLICATION_SCENE_SOCIAL', id, 'NFT_APPLICATION_SCENE', 1, 1, '社交互动场景', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_APPLICATION_SCENE'
UNION ALL
SELECT 
'游戏体验', 'NFT_APPLICATION_SCENE_GAME', id, 'NFT_APPLICATION_SCENE', 1, 2, '游戏体验场景', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_APPLICATION_SCENE'
UNION ALL
SELECT 
'虚拟演出', 'NFT_APPLICATION_SCENE_PERFORMANCE', id, 'NFT_APPLICATION_SCENE', 1, 3, '虚拟演出场景', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_APPLICATION_SCENE';

-- 身份象征属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'社区元老', 'NFT_IDENTITY_SYMBOL_ELDER', id, 'NFT_IDENTITY_SYMBOL', 1, 1, '社区元老身份', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_IDENTITY_SYMBOL'
UNION ALL
SELECT 
'意见领袖', 'NFT_IDENTITY_SYMBOL_KOL', id, 'NFT_IDENTITY_SYMBOL', 1, 2, '意见领袖身份', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_IDENTITY_SYMBOL'
UNION ALL
SELECT 
'活动大使', 'NFT_IDENTITY_SYMBOL_AMBASSADOR', id, 'NFT_IDENTITY_SYMBOL', 1, 3, '活动大使身份', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_IDENTITY_SYMBOL';

-- 特权属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'优先参与权', 'NFT_PRIVILEGE_PRIORITY', id, 'NFT_PRIVILEGE', 1, 1, '优先参与权特权', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PRIVILEGE'
UNION ALL
SELECT 
'专属徽章', 'NFT_PRIVILEGE_BADGE', id, 'NFT_PRIVILEGE', 1, 2, '专属徽章特权', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PRIVILEGE'
UNION ALL
SELECT 
'特殊标识', 'NFT_PRIVILEGE_MARK', id, 'NFT_PRIVILEGE', 1, 3, '特殊标识特权', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PRIVILEGE';

-- 游戏类型属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'角色扮演', 'NFT_GAME_TYPE_RPG', id, 'NFT_GAME_TYPE', 1, 1, '角色扮演游戏', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_GAME_TYPE'
UNION ALL
SELECT 
'策略', 'NFT_GAME_TYPE_STRATEGY', id, 'NFT_GAME_TYPE', 1, 2, '策略类游戏', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_GAME_TYPE'
UNION ALL
SELECT 
'竞技', 'NFT_GAME_TYPE_COMPETITIVE', id, 'NFT_GAME_TYPE', 1, 3, '竞技类游戏', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_GAME_TYPE'
UNION ALL
SELECT 
'休闲', 'NFT_GAME_TYPE_CASUAL', id, 'NFT_GAME_TYPE', 1, 4, '休闲类游戏', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_GAME_TYPE';

-- 道具功能属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'增益', 'NFT_PROP_FUNCTION_BUFF', id, 'NFT_PROP_FUNCTION', 1, 1, '增益道具', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PROP_FUNCTION'
UNION ALL
SELECT 
'装饰', 'NFT_PROP_FUNCTION_DECORATION', id, 'NFT_PROP_FUNCTION', 1, 2, '装饰道具', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PROP_FUNCTION'
UNION ALL
SELECT 
'消耗品', 'NFT_PROP_FUNCTION_CONSUMABLE', id, 'NFT_PROP_FUNCTION', 1, 3, '消耗品道具', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PROP_FUNCTION';


-- 游戏类型属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'角色扮演(RPG)', 'NFT_GAME_TYPE_RPG', id, 'NFT_GAME_TYPE', 1, 1, '角色扮演类游戏', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_GAME_TYPE'
UNION ALL
SELECT 
'策略游戏(SLG)', 'NFT_GAME_TYPE_SLG', id, 'NFT_GAME_TYPE', 1, 2, '策略类游戏', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_GAME_TYPE'
UNION ALL
SELECT 
'射击游戏(FPS/TPS)', 'NFT_GAME_TYPE_FPS', id, 'NFT_GAME_TYPE', 1, 3, '射击类游戏', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_GAME_TYPE'
UNION ALL
SELECT 
'模拟经营(SIM)', 'NFT_GAME_TYPE_SIM', id, 'NFT_GAME_TYPE', 1, 4, '模拟经营类游戏', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_GAME_TYPE';

-- 道具功能属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'增强属性', 'NFT_PROP_FUNCTION_ATTR', id, 'NFT_PROP_FUNCTION', 1, 1, '增强属性功能', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PROP_FUNCTION'
UNION ALL
SELECT 
'解锁技能', 'NFT_PROP_FUNCTION_SKILL', id, 'NFT_PROP_FUNCTION', 1, 2, '解锁技能功能', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PROP_FUNCTION'
UNION ALL
SELECT 
'开启特殊场景', 'NFT_PROP_FUNCTION_SCENE', id, 'NFT_PROP_FUNCTION', 1, 3, '开启特殊场景功能', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PROP_FUNCTION'
UNION ALL
SELECT 
'交易媒介', 'NFT_PROP_FUNCTION_TRADE', id, 'NFT_PROP_FUNCTION', 1, 4, '交易媒介功能', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PROP_FUNCTION';

-- 获取方式属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'任务奖励', 'NFT_OBTAIN_METHOD_TASK', id, 'NFT_OBTAIN_METHOD', 1, 1, '任务奖励获取', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_OBTAIN_METHOD'
UNION ALL
SELECT 
'副本掉落', 'NFT_OBTAIN_METHOD_DROP', id, 'NFT_OBTAIN_METHOD', 1, 2, '副本掉落获取', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_OBTAIN_METHOD'
UNION ALL
SELECT 
'商店购买', 'NFT_OBTAIN_METHOD_SHOP', id, 'NFT_OBTAIN_METHOD', 1, 3, '商店购买获取', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_OBTAIN_METHOD';

-- 装备部位属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'武器', 'NFT_EQUIPMENT_POSITION_WEAPON', id, 'NFT_EQUIPMENT_POSITION', 1, 1, '武器装备', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_EQUIPMENT_POSITION'
UNION ALL
SELECT 
'防具', 'NFT_EQUIPMENT_POSITION_ARMOR', id, 'NFT_EQUIPMENT_POSITION', 1, 2, '防具装备', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_EQUIPMENT_POSITION'
UNION ALL
SELECT 
'饰品', 'NFT_EQUIPMENT_POSITION_ACCESSORY', id, 'NFT_EQUIPMENT_POSITION', 1, 3, '饰品装备', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_EQUIPMENT_POSITION'
UNION ALL
SELECT 
'坐骑', 'NFT_EQUIPMENT_POSITION_MOUNT', id, 'NFT_EQUIPMENT_POSITION', 1, 4, '坐骑装备', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_EQUIPMENT_POSITION';

-- 品质属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'普通', 'NFT_QUALITY_NORMAL', id, 'NFT_QUALITY', 1, 1, '普通品质', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_QUALITY'
UNION ALL
SELECT 
'精良', 'NFT_QUALITY_FINE', id, 'NFT_QUALITY', 1, 2, '精良品质', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_QUALITY'
UNION ALL
SELECT 
'稀有', 'NFT_QUALITY_RARE', id, 'NFT_QUALITY', 1, 3, '稀有品质', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_QUALITY'
UNION ALL
SELECT 
'史诗', 'NFT_QUALITY_EPIC', id, 'NFT_QUALITY', 1, 4, '史诗品质', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_QUALITY'
UNION ALL
SELECT 
'传说', 'NFT_QUALITY_LEGENDARY', id, 'NFT_QUALITY', 1, 5, '传说品质', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_QUALITY';

-- 职业属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'战士', 'NFT_PROFESSION_WARRIOR', id, 'NFT_PROFESSION', 1, 1, '战士职业', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PROFESSION'
UNION ALL
SELECT 
'法师', 'NFT_PROFESSION_MAGE', id, 'NFT_PROFESSION', 1, 2, '法师职业', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PROFESSION'
UNION ALL
SELECT 
'射手', 'NFT_PROFESSION_ARCHER', id, 'NFT_PROFESSION', 1, 3, '射手职业', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PROFESSION'
UNION ALL
SELECT 
'刺客', 'NFT_PROFESSION_ASSASSIN', id, 'NFT_PROFESSION', 1, 4, '刺客职业', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PROFESSION'
UNION ALL
SELECT 
'辅助', 'NFT_PROFESSION_SUPPORT', id, 'NFT_PROFESSION', 1, 5, '辅助职业', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PROFESSION';

-- 等级上限属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'50级', 'NFT_LEVEL_CAP_50', id, 'NFT_LEVEL_CAP', 1, 1, '50级上限', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_LEVEL_CAP'
UNION ALL
SELECT 
'100级', 'NFT_LEVEL_CAP_100', id, 'NFT_LEVEL_CAP', 1, 2, '100级上限', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_LEVEL_CAP'
UNION ALL
SELECT 
'150级', 'NFT_LEVEL_CAP_150', id, 'NFT_LEVEL_CAP', 1, 3, '150级上限', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_LEVEL_CAP'
UNION ALL
SELECT 
'150级以上', 'NFT_LEVEL_CAP_150_UP', id, 'NFT_LEVEL_CAP', 1, 4, '150级级以上', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_LEVEL_CAP' ;

-- 体育项目属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'足球', 'NFT_SPORTS_FOOTBALL', id, 'NFT_SPORTS', 1, 1, '足球运动', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_SPORTS'
UNION ALL
SELECT '篮球', 'NFT_SPORTS_BASKETBALL', id, 'NFT_SPORTS', 1, 2, '篮球运动', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_SPORTS'
UNION ALL
SELECT '网球', 'NFT_SPORTS_TENNIS', id, 'NFT_SPORTS', 1, 3, '网球运动', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_SPORTS'
UNION ALL
SELECT '田径', 'NFT_SPORTS_ATHLETICS', id, 'NFT_SPORTS', 1, 4, '田径运动', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_SPORTS';

-- 赛事类型属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'奥运会', 'NFT_COMPETITION_TYPE_OLYMPIC', id, 'NFT_COMPETITION_TYPE', 1, 1, '奥运会赛事', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_COMPETITION_TYPE'
UNION ALL
SELECT '世界杯', 'NFT_COMPETITION_TYPE_WORLDCUP', id, 'NFT_COMPETITION_TYPE', 1, 2, '世界杯赛事', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_COMPETITION_TYPE'
UNION ALL
SELECT '职业联赛', 'NFT_COMPETITION_TYPE_LEAGUE', id, 'NFT_COMPETITION_TYPE', 1, 3, '职业联赛赛事', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_COMPETITION_TYPE'
UNION ALL
SELECT '洲际锦标赛', 'NFT_COMPETITION_TYPE_CONTINENTAL', id, 'NFT_COMPETITION_TYPE', 1, 4, '洲际锦标赛赛事', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_COMPETITION_TYPE';

-- 历史时期属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'神话', 'NFT_HISTORICAL_PERIOD_MYTH', id, 'NFT_HISTORICAL_PERIOD', 1, 1, '神话时期', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_HISTORICAL_PERIOD'
UNION ALL
SELECT '远古', 'NFT_HISTORICAL_PERIOD_ANCIENT', id, 'NFT_HISTORICAL_PERIOD', 1, 2, '远古时期', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_HISTORICAL_PERIOD'
UNION ALL
SELECT '近代', 'NFT_HISTORICAL_PERIOD_MODERN', id, 'NFT_HISTORICAL_PERIOD', 1, 3, '近代时期', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_HISTORICAL_PERIOD'
UNION ALL
SELECT '现代', 'NFT_HISTORICAL_PERIOD_CONTEMPORARY', id, 'NFT_HISTORICAL_PERIOD', 1, 4, '现代时期', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_HISTORICAL_PERIOD';

-- 文化类型属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'宗教信仰', 'NFT_CULTURE_TYPE_RELIGION', id, 'NFT_CULTURE_TYPE', 1, 1, '宗教信仰文化', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CULTURE_TYPE'
UNION ALL
SELECT '文物复刻', 'NFT_CULTURE_TYPE_RELIC', id, 'NFT_CULTURE_TYPE', 1, 2, '文物复刻文化', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CULTURE_TYPE'
UNION ALL
SELECT '传统技艺', 'NFT_CULTURE_TYPE_CRAFT', id, 'NFT_CULTURE_TYPE', 1, 3, '传统技艺文化', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CULTURE_TYPE'
UNION ALL
SELECT '民俗文化', 'NFT_CULTURE_TYPE_FOLK', id, 'NFT_CULTURE_TYPE', 1, 4, '民俗文化', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CULTURE_TYPE';

-- 名人领域属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'影视明星', 'NFT_CELEBRITY_FIELD_ENTERTAINMENT', id, 'NFT_CELEBRITY_FIELD', 1, 1, '影视明星领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CELEBRITY_FIELD'
UNION ALL
SELECT '体育明星', 'NFT_CELEBRITY_FIELD_SPORTS', id, 'NFT_CELEBRITY_FIELD', 1, 2, '体育明星领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CELEBRITY_FIELD'
UNION ALL
SELECT '科技大佬', 'NFT_CELEBRITY_FIELD_TECH', id, 'NFT_CELEBRITY_FIELD', 1, 3, '科技大佬领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CELEBRITY_FIELD'
UNION ALL
SELECT '艺术家', 'NFT_CELEBRITY_FIELD_ARTIST', id, 'NFT_CELEBRITY_FIELD', 1, 4, '艺术家领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CELEBRITY_FIELD';

-- 周边形式属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'签名照', 'NFT_PERIPHERAL_FORM_SIGNATURE', id, 'NFT_PERIPHERAL_FORM', 1, 1, '签名照周边', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PERIPHERAL_FORM'
UNION ALL
SELECT '手写笔记', 'NFT_PERIPHERAL_FORM_NOTE', id, 'NFT_PERIPHERAL_FORM', 1, 2, '手写笔记周边', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PERIPHERAL_FORM'
UNION ALL
SELECT '私人物品复刻', 'NFT_PERIPHERAL_FORM_REPLICA', id, 'NFT_PERIPHERAL_FORM', 1, 3, '私人物品复刻周边', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PERIPHERAL_FORM'
UNION ALL
SELECT '视频祝福', 'NFT_PERIPHERAL_FORM_VIDEO', id, 'NFT_PERIPHERAL_FORM', 1, 4, '视频祝福周边', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PERIPHERAL_FORM';

-- 徽章主题属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'节日', 'NFT_BADGE_THEME_FESTIVAL', id, 'NFT_BADGE_THEME', 1, 1, '节日主题徽章', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_BADGE_THEME'
UNION ALL
SELECT '活动', 'NFT_BADGE_THEME_EVENT', id, 'NFT_BADGE_THEME', 1, 2, '活动主题徽章', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_BADGE_THEME'
UNION ALL
SELECT '品牌合作', 'NFT_BADGE_THEME_BRAND', id, 'NFT_BADGE_THEME', 1, 3, '品牌合作主题徽章', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_BADGE_THEME'
UNION ALL
SELECT '公益项目', 'NFT_BADGE_THEME_CHARITY', id, 'NFT_BADGE_THEME', 1, 4, '公益项目主题徽章', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_BADGE_THEME';

-- 限量数量属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'专属', 'NFT_LIMITED_QUANTITY_EXCLUSIVE', id, 'NFT_LIMITED_QUANTITY', 1, 1, '专属限量', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_LIMITED_QUANTITY'
UNION ALL
SELECT '100份', 'NFT_LIMITED_QUANTITY_100', id, 'NFT_LIMITED_QUANTITY', 1, 2, '100份限量', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_LIMITED_QUANTITY'
UNION ALL
SELECT '500份', 'NFT_LIMITED_QUANTITY_500', id, 'NFT_LIMITED_QUANTITY', 1, 3, '500份限量', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_LIMITED_QUANTITY'
UNION ALL
SELECT '1000份', 'NFT_LIMITED_QUANTITY_1000', id, 'NFT_LIMITED_QUANTITY', 1, 4, '1000份限量', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_LIMITED_QUANTITY'
UNION ALL
SELECT '5000份', 'NFT_LIMITED_QUANTITY_5000', id, 'NFT_LIMITED_QUANTITY', 1, 5, '5000份限量', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_LIMITED_QUANTITY';


-- 平台属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'Decentraland', 'NFT_PLATFORM_TYPE_DECENTRALAND', id, 'NFT_PLATFORM_TYPE', 1, 1, 'Decentraland平台', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PLATFORM_TYPE'
UNION ALL
SELECT 'The Sandbox', 'NFT_PLATFORM_TYPE_SANDBOX', id, 'NFT_PLATFORM_TYPE', 1, 2, 'The Sandbox平台', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PLATFORM_TYPE'
UNION ALL
SELECT 'Somnium Space', 'NFT_PLATFORM_TYPE_SOMNIUM', id, 'NFT_PLATFORM_TYPE', 1, 3, 'Somnium Space平台', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PLATFORM_TYPE'
UNION ALL
SELECT 'Cryptovoxels', 'NFT_PLATFORM_TYPE_CRYPTOVOXELS', id, 'NFT_PLATFORM_TYPE', 1, 4, 'Cryptovoxels平台', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_PLATFORM_TYPE';

-- 位置属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'中心商业区', 'NFT_LOCATION_CBD', id, 'NFT_LOCATION', 1, 1, '中心商业区位置', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_LOCATION'
UNION ALL
SELECT '住宅区', 'NFT_LOCATION_RESIDENTIAL', id, 'NFT_LOCATION', 1, 2, '住宅区位置', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_LOCATION'
UNION ALL
SELECT '风景区', 'NFT_LOCATION_SCENIC', id, 'NFT_LOCATION', 1, 3, '风景区位置', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_LOCATION'
UNION ALL
SELECT '工业区', 'NFT_LOCATION_INDUSTRIAL', id, 'NFT_LOCATION', 1, 4, '工业区位置', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_LOCATION';

-- 面积属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'100平', 'NFT_AREA_100', id, 'NFT_AREA', 1, 1, '100平米面积', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_AREA'
UNION ALL
SELECT '500平', 'NFT_AREA_500', id, 'NFT_AREA', 1, 2, '500平米面积', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_AREA'
UNION ALL
SELECT '1000平', 'NFT_AREA_1000', id, 'NFT_AREA', 1, 3, '1000平米面积', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_AREA'
UNION ALL
SELECT '5000平', 'NFT_AREA_5000', id, 'NFT_AREA', 1, 4, '5000平米面积', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_AREA'
UNION ALL
SELECT '5000平以上', 'NFT_AREA_ABOVE_5000', id, 'NFT_AREA', 1, 5, '5000平米以上面积', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_AREA';

-- 空间风格属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'现代简约', 'NFT_SPACE_STYLE_MODERN', id, 'NFT_SPACE_STYLE', 1, 1, '现代简约风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_SPACE_STYLE'
UNION ALL
SELECT '欧式古典', 'NFT_SPACE_STYLE_EUROPEAN', id, 'NFT_SPACE_STYLE', 1, 2, '欧式古典风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_SPACE_STYLE'
UNION ALL
SELECT '中式古风', 'NFT_SPACE_STYLE_CHINESE', id, 'NFT_SPACE_STYLE', 1, 3, '中式古风风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_SPACE_STYLE'
UNION ALL
SELECT '未来科幻', 'NFT_SPACE_STYLE_FUTURE', id, 'NFT_SPACE_STYLE', 1, 4, '未来科幻风格', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_SPACE_STYLE';

-- 空间用途属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'展览展示', 'NFT_SPACE_USE_EXHIBITION', id, 'NFT_SPACE_USE', 1, 1, '展览展示用途', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_SPACE_USE'
UNION ALL
SELECT '社交聚会', 'NFT_SPACE_USE_SOCIAL', id, 'NFT_SPACE_USE', 1, 2, '社交聚会用途', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_SPACE_USE'
UNION ALL
SELECT '办公场所', 'NFT_SPACE_USE_OFFICE', id, 'NFT_SPACE_USE', 1, 3, '办公场所用途', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_SPACE_USE';


-- 认证类型属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'学历证书', 'NFT_CERT_TYPE_EDUCATION', id, 'NFT_CERT_TYPE', 1, 1, '学历证书认证', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CERT_TYPE'
UNION ALL
SELECT '技能证书', 'NFT_CERT_TYPE_SKILL', id, 'NFT_CERT_TYPE', 1, 2, '技能证书认证', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CERT_TYPE'
UNION ALL
SELECT '培训结业证书', 'NFT_CERT_TYPE_TRAINING', id, 'NFT_CERT_TYPE', 1, 3, '培训结业证书认证', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_CERT_TYPE';

-- 颁发机构属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'知名大学', 'NFT_ISSUING_ORG_UNIVERSITY', id, 'NFT_ISSUING_ORG', 1, 1, '知名大学机构', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ISSUING_ORG'
UNION ALL
SELECT '专业培训机构', 'NFT_ISSUING_ORG_TRAINING', id, 'NFT_ISSUING_ORG', 1, 2, '专业培训机构', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ISSUING_ORG'
UNION ALL
SELECT '行业协会', 'NFT_ISSUING_ORG_ASSOCIATION', id, 'NFT_ISSUING_ORG', 1, 3, '行业协会机构', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ISSUING_ORG';

-- 会员等级属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'普通会员', 'NFT_MEMBER_LEVEL_NORMAL', id, 'NFT_MEMBER_LEVEL', 1, 1, '普通会员等级', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_MEMBER_LEVEL'
UNION ALL
SELECT '银卡会员', 'NFT_MEMBER_LEVEL_SILVER', id, 'NFT_MEMBER_LEVEL', 1, 2, '银卡会员等级', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_MEMBER_LEVEL'
UNION ALL
SELECT '金卡会员', 'NFT_MEMBER_LEVEL_GOLD', id, 'NFT_MEMBER_LEVEL', 1, 3, '金卡会员等级', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_MEMBER_LEVEL'
UNION ALL
SELECT '钻石会员', 'NFT_MEMBER_LEVEL_DIAMOND', id, 'NFT_MEMBER_LEVEL', 1, 4, '钻石会员等级', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_MEMBER_LEVEL';

-- 会员权益属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'折扣优惠', 'NFT_MEMBER_RIGHTS_DISCOUNT', id, 'NFT_MEMBER_RIGHTS', 1, 1, '折扣优惠权益', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_MEMBER_RIGHTS'
UNION ALL
SELECT '优先服务', 'NFT_MEMBER_RIGHTS_PRIORITY', id, 'NFT_MEMBER_RIGHTS', 1, 2, '优先服务权益', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_MEMBER_RIGHTS'
UNION ALL
SELECT '专属活动', 'NFT_MEMBER_RIGHTS_EXCLUSIVE', id, 'NFT_MEMBER_RIGHTS', 1, 3, '专属活动权益', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_MEMBER_RIGHTS';

-- 活动类型属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'演唱会', 'NFT_EVENT_TYPE_CONCERT', id, 'NFT_EVENT_TYPE', 1, 1, '演唱会活动', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_EVENT_TYPE'
UNION ALL
SELECT '音乐节', 'NFT_EVENT_TYPE_MUSIC_FESTIVAL', id, 'NFT_EVENT_TYPE', 1, 2, '音乐节活动', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_EVENT_TYPE'
UNION ALL
SELECT '艺术展览', 'NFT_EVENT_TYPE_ART_EXHIBITION', id, 'NFT_EVENT_TYPE', 1, 3, '艺术展览活动', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_EVENT_TYPE'
UNION ALL
SELECT '体育赛事', 'NFT_EVENT_TYPE_SPORTS', id, 'NFT_EVENT_TYPE', 1, 4, '体育赛事活动', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_EVENT_TYPE';

-- 座位等级属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'VIP', 'NFT_SEAT_LEVEL_VIP', id, 'NFT_SEAT_LEVEL', 1, 1, 'VIP座位', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_SEAT_LEVEL'
UNION ALL
SELECT '前排', 'NFT_SEAT_LEVEL_FRONT', id, 'NFT_SEAT_LEVEL', 1, 2, '前排座位', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_SEAT_LEVEL'
UNION ALL
SELECT '中排', 'NFT_SEAT_LEVEL_MIDDLE', id, 'NFT_SEAT_LEVEL', 1, 3, '中排座位', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_SEAT_LEVEL'
UNION ALL
SELECT '后排', 'NFT_SEAT_LEVEL_BACK', id, 'NFT_SEAT_LEVEL', 1, 4, '后排座位', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_SEAT_LEVEL';

-- 版权类型属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'文字作品版权', 'NFT_COPYRIGHT_TYPE_TEXT', id, 'NFT_COPYRIGHT_TYPE', 1, 1, '文字作品版权', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_COPYRIGHT_TYPE'
UNION ALL
SELECT '音乐作品版权', 'NFT_COPYRIGHT_TYPE_MUSIC', id, 'NFT_COPYRIGHT_TYPE', 1, 2, '音乐作品版权', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_COPYRIGHT_TYPE'
UNION ALL
SELECT '美术作品版权', 'NFT_COPYRIGHT_TYPE_ART', id, 'NFT_COPYRIGHT_TYPE', 1, 3, '美术作品版权', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_COPYRIGHT_TYPE'
UNION ALL
SELECT '影视作品版权', 'NFT_COPYRIGHT_TYPE_VIDEO', id, 'NFT_COPYRIGHT_TYPE', 1, 4, '影视作品版权', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_COPYRIGHT_TYPE';

-- 授权方式属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'独家授权', 'NFT_LICENSE_TYPE_EXCLUSIVE', id, 'NFT_LICENSE_TYPE', 1, 1, '独家授权方式', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_LICENSE_TYPE'
UNION ALL
SELECT '非独家授权', 'NFT_LICENSE_TYPE_NON_EXCLUSIVE', id, 'NFT_LICENSE_TYPE', 1, 2, '非独家授权方式', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_LICENSE_TYPE'
UNION ALL
SELECT '限时授权', 'NFT_LICENSE_TYPE_LIMITED', id, 'NFT_LICENSE_TYPE', 1, 3, '限时授权方式', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_LICENSE_TYPE';

-- 债券期限属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'1年期', 'NFT_BOND_PERIOD_1Y', id, 'NFT_BOND_PERIOD', 1, 1, '1年期债券', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_BOND_PERIOD'
UNION ALL
SELECT '3年期', 'NFT_BOND_PERIOD_3Y', id, 'NFT_BOND_PERIOD', 1, 2, '3年期债券', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_BOND_PERIOD'
UNION ALL
SELECT '5年期', 'NFT_BOND_PERIOD_5Y', id, 'NFT_BOND_PERIOD', 1, 3, '5年期债券', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_BOND_PERIOD'
UNION ALL
SELECT '10年期', 'NFT_BOND_PERIOD_10Y', id, 'NFT_BOND_PERIOD', 1, 4, '10年期债券', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_BOND_PERIOD';

-- 利率类型属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'固定利率', 'NFT_INTEREST_TYPE_FIXED', id, 'NFT_INTEREST_TYPE', 1, 1, '固定利率类型', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_INTEREST_TYPE'
UNION ALL
SELECT '浮动利率', 'NFT_INTEREST_TYPE_FLOAT', id, 'NFT_INTEREST_TYPE', 1, 2, '浮动利率类型', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_INTEREST_TYPE'
UNION ALL
SELECT '零息债券', 'NFT_INTEREST_TYPE_ZERO', id, 'NFT_INTEREST_TYPE', 1, 3, '零息债券类型', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_INTEREST_TYPE'
UNION ALL
SELECT '混合利率', 'NFT_INTEREST_TYPE_HYBRID', id, 'NFT_INTEREST_TYPE', 1, 4, '混合利率类型', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_INTEREST_TYPE';

-- 资产类别属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'房地产', 'NFT_ASSET_TYPE_REAL_ESTATE', id, 'NFT_ASSET_TYPE', 1, 1, '房地产资产', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ASSET_TYPE'
UNION ALL
SELECT '艺术品', 'NFT_ASSET_TYPE_ART', id, 'NFT_ASSET_TYPE', 1, 2, '艺术品资产', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ASSET_TYPE'
UNION ALL
SELECT '贵金属', 'NFT_ASSET_TYPE_PRECIOUS_METAL', id, 'NFT_ASSET_TYPE', 1, 3, '贵金属资产', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ASSET_TYPE'
UNION ALL
SELECT '收藏品', 'NFT_ASSET_TYPE_COLLECTIBLE', id, 'NFT_ASSET_TYPE', 1, 4, '收藏品资产', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ASSET_TYPE';

-- 凭证用途属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'资产确权', 'NFT_VOUCHER_USE_OWNERSHIP', id, 'NFT_VOUCHER_USE', 1, 1, '资产确权用途', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_VOUCHER_USE'
UNION ALL
SELECT '交易流转', 'NFT_VOUCHER_USE_TRADING', id, 'NFT_VOUCHER_USE', 1, 2, '交易流转用途', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_VOUCHER_USE'
UNION ALL
SELECT '融资抵押', 'NFT_VOUCHER_USE_MORTGAGE', id, 'NFT_VOUCHER_USE', 1, 3, '融资抵押用途', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_VOUCHER_USE'
UNION ALL
SELECT '权益分配', 'NFT_VOUCHER_USE_DISTRIBUTION', id, 'NFT_VOUCHER_USE', 1, 4, '权益分配用途', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_VOUCHER_USE';

-- 企业领域属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'科技创新', 'NFT_ENTERPRISE_FIELD_TECH', id, 'NFT_ENTERPRISE_FIELD', 1, 1, '科技创新领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ENTERPRISE_FIELD'
UNION ALL
SELECT '文化创意', 'NFT_ENTERPRISE_FIELD_CULTURE', id, 'NFT_ENTERPRISE_FIELD', 1, 2, '文化创意领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ENTERPRISE_FIELD'
UNION ALL
SELECT '生物医药', 'NFT_ENTERPRISE_FIELD_BIOTECH', id, 'NFT_ENTERPRISE_FIELD', 1, 3, '生物医药领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ENTERPRISE_FIELD'
UNION ALL
SELECT '新能源', 'NFT_ENTERPRISE_FIELD_NEW_ENERGY', id, 'NFT_ENTERPRISE_FIELD', 1, 4, '新能源领域', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_ENTERPRISE_FIELD';

-- 股权比例属性值
INSERT INTO `sys_attr` (`attr_name`, `attr_code`, `attr_group_id`, `attr_group_code`, `status`, `sort`, `description`, `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`) 
SELECT 
'1%以下', 'NFT_EQUITY_RATIO_BELOW_1', id, 'NFT_EQUITY_RATIO', 1, 1, '1%以下股权', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_EQUITY_RATIO'
UNION ALL
SELECT '1%-5%', 'NFT_EQUITY_RATIO_1_5', id, 'NFT_EQUITY_RATIO', 1, 2, '1%-5%股权', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_EQUITY_RATIO'
UNION ALL
SELECT '5%-10%', 'NFT_EQUITY_RATIO_5_10', id, 'NFT_EQUITY_RATIO', 1, 3, '5%-10%股权', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_EQUITY_RATIO'
UNION ALL
SELECT '10%-20%', 'NFT_EQUITY_RATIO_10_20', id, 'NFT_EQUITY_RATIO', 1, 4, '10%-20%股权', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_EQUITY_RATIO'
UNION ALL
SELECT '20%以上', 'NFT_EQUITY_RATIO_ABOVE_20', id, 'NFT_EQUITY_RATIO', 1, 5, '20%以上股权', NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_attr_group WHERE attr_group_code = 'NFT_EQUITY_RATIO';


-- 插入NFT专区目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '100000' as category_code,
    ag.id as attr_group_id,
    'NFT_APPLICATION_FIELD' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '100000' AND ag.attr_group_code = 'NFT_APPLICATION_FIELD';

-- 插入数字艺术品目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '110000' as category_code,
    ag.id as attr_group_id,
    'NFT_TECH_FORM' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '110000' AND ag.attr_group_code = 'NFT_TECH_FORM';   

-- 插入潮流艺术画作NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '111000' as category_code,
    ag.id as attr_group_id,
    'NFT_ART_STYLE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '111000' AND ag.attr_group_code = 'NFT_ART_STYLE';  

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '111000' as category_code,
    ag.id as attr_group_id,
    'NFT_ART_THEME' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '111000' AND ag.attr_group_code = 'NFT_ART_THEME';   

-- 插入先锋音乐作品NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '112000' as category_code,
    ag.id as attr_group_id,
    'NFT_CREATION_METHOD' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '112000' AND ag.attr_group_code = 'NFT_CREATION_METHOD';  

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '112000' as category_code,
    ag.id as attr_group_id,
    'NFT_MUSIC_TYPE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '112000' AND ag.attr_group_code = 'NFT_MUSIC_TYPE';  


-- 插入视频艺术NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '113000' as category_code,
    ag.id as attr_group_id,
    'NFT_VIDEO_TYPE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '113000' AND ag.attr_group_code = 'NFT_VIDEO_TYPE';  

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '113000' as category_code,
    ag.id as attr_group_id,
    'NFT_VIDEO_DURATION' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '113000' AND ag.attr_group_code = 'NFT_VIDEO_DURATION';  

-- 插入文本类型NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '114000' as category_code,
    ag.id as attr_group_id,
    'NFT_TEXT_GENRE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '114000' AND ag.attr_group_code = 'NFT_TEXT_GENRE';  

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '114000' as category_code,
    ag.id as attr_group_id,
    'NFT_TEXT_LANGUAGE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '114000' AND ag.attr_group_code = 'NFT_TEXT_LANGUAGE';  


-- 插入虚拟身份目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '120000' as category_code,
    ag.id as attr_group_id, 
    'NFT_APP_PLATFORM' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '120000' AND ag.attr_group_code = 'NFT_APP_PLATFORM';  


-- 插入独特头像NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '121000' as category_code,
    ag.id as attr_group_id,
    'NFT_TEXT_LANGUAGE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '121000' AND ag.attr_group_code = 'NFT_TEXT_LANGUAGE';  

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '121000' as category_code,
    ag.id as attr_group_id,
    'NFT_RARITY' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '121000' AND ag.attr_group_code = 'NFT_RARITY';  

-- 插入定制虚拟形象NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '122000' as category_code,
    ag.id as attr_group_id,
    'NFT_CUSTOM_ELEMENT' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '122000' AND ag.attr_group_code = 'NFT_CUSTOM_ELEMENT';  

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '122000' as category_code,
    ag.id as attr_group_id,
    'NFT_APPLICATION_SCENE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '122000' AND ag.attr_group_code = 'NFT_APPLICATION_SCENE';  

-- 插入专属社交身份NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '123000' as category_code,  
    ag.id as attr_group_id,
    'NFT_IDENTITY_SYMBOL' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '123000' AND ag.attr_group_code = 'NFT_IDENTITY_SYMBOL';  

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '123000' as category_code,  
    ag.id as attr_group_id,
    'NFT_PRIVILEGE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '123000' AND ag.attr_group_code = 'NFT_PRIVILEGE';


-- 插入游戏资产目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '130000' as category_code,  
    ag.id as attr_group_id,
    'NFT_GAME_TYPE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '130000' AND ag.attr_group_code = 'NFT_GAME_TYPE';


-- 插入游戏道具NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '131000' as category_code,  
    ag.id as attr_group_id,
    'NFT_PROP_FUNCTION' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'   
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '131000' AND ag.attr_group_code = 'NFT_PROP_FUNCTION';   

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '131000' as category_code,  
    ag.id as attr_group_id,
    'NFT_ACQUISITION_METHOD' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'   
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '131000' AND ag.attr_group_code = 'NFT_ACQUISITION_METHOD';


-- 插入游戏装备NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '132000' as category_code,  
    ag.id as attr_group_id,
    'NFT_EQUIPMENT_POSITION' as attr_group_code,    
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '132000' AND ag.attr_group_code = 'NFT_EQUIPMENT_POSITION';      

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '132000' as category_code,  
    ag.id as attr_group_id,
    'NFT_QUALITY' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'   
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '132000' AND ag.attr_group_code = 'NFT_QUALITY';   

-- 插入游戏角色NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '133000' as category_code,  
    ag.id as attr_group_id,
    'NFT_PROFESSION' as attr_group_code,    
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '133000' AND ag.attr_group_code = 'NFT_PROFESSION';

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '133000' as category_code,  
    ag.id as attr_group_id, 
    'NFT_LEVEL_CAP' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '133000' AND ag.attr_group_code = 'NFT_LEVEL_CAP';


-- 插入收藏品目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '140000' as category_code,  
    ag.id as attr_group_id,
    'NFT_COLLECTION_THEME' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '140000' AND ag.attr_group_code = 'NFT_COLLECTION_THEME';

-- 插入体育赛事纪念NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '141000' as category_code,  
    ag.id as attr_group_id, 
    'NFT_SPORTS' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '141000' AND ag.attr_group_code = 'NFT_SPORTS';  

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '141000' as category_code,  
    ag.id as attr_group_id,
    'NFT_COMPETITION_TYPE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '141000' AND ag.attr_group_code = 'NFT_COMPETITION_TYPE';

-- 插入历史文化收藏NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '142000' as category_code,  
    ag.id as attr_group_id,  
    'NFT_HISTORICAL_PERIOD' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '142000' AND ag.attr_group_code = 'NFT_HISTORICAL_PERIOD';   

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '142000' as category_code,  
    ag.id as attr_group_id,
    'NFT_CULTURE_TYPE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '142000' AND ag.attr_group_code = 'NFT_CULTURE_TYPE';

-- 插入名人周边NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '143000' as category_code,  
    ag.id as attr_group_id,
    'NFT_CELEBRITY_FIELD' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '143000' AND ag.attr_group_code = 'NFT_CELEBRITY_FIELD';

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '143000' as category_code,  
    ag.id as attr_group_id,
    'NFT_PERIPHERAL_FORM' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '143000' AND ag.attr_group_code = 'NFT_PERIPHERAL_FORM';


-- 插入限量版徽章NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '144000' as category_code,  
    ag.id as attr_group_id,
    'NFT_BADGE_THEME' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '144000' AND ag.attr_group_code = 'NFT_BADGE_THEME';

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '144000' as category_code,  
    ag.id as attr_group_id,
    'NFT_LIMITED_QUANTITY' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '144000' AND ag.attr_group_code = 'NFT_LIMITED_QUANTITY';


-- 插入虚拟房地产目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '150000' as category_code,  
    ag.id as attr_group_id,
    'NFT_APPLICATION_HOUSE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '150000' AND ag.attr_group_code = 'NFT_APPLICATION_HOUSE';

-- 插入元宇宙地块NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '151000' as category_code,  
    ag.id as attr_group_id,
    'NFT_PLATFORM_TYPE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '151000' AND ag.attr_group_code = 'NFT_PLATFORM_TYPE';

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '151000' as category_code,  
    ag.id as attr_group_id, 
    'NFT_LOCATION' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '151000' AND ag.attr_group_code = 'NFT_LOCATION';


-- 插入虚拟建筑NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '152000' as category_code,  
    ag.id as attr_group_id,
    'NFT_SPACE_STYLE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '152000' AND ag.attr_group_code = 'NFT_SPACE_STYLE';

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '152000' as category_code,  
    ag.id as attr_group_id,
    'NFT_SPACE_USE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '152000' AND ag.attr_group_code = 'NFT_SPACE_USE';


-- 插入数字证书目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '160000' as category_code,  
    ag.id as attr_group_id,
    'NFT_CERT_TYPE_ATTR' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '160000' AND ag.attr_group_code = 'NFT_CERT_TYPE_ATTR';


-- 插入教育认证NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '161000' as category_code,  
    ag.id as attr_group_id,
    'NFT_CERT_TYPE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '161000' AND ag.attr_group_code = 'NFT_CERT_TYPE';

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '161000' as category_code,  
    ag.id as attr_group_id, 
    'NFT_ISSUING_ORG' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '161000' AND ag.attr_group_code = 'NFT_ISSUING_ORG';

-- 插入会员资格NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '162000' as category_code,  
    ag.id as attr_group_id,
    'NFT_MEMBER_LEVEL' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '162000' AND ag.attr_group_code = 'NFT_MEMBER_LEVEL';

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '162000' as category_code,  
    ag.id as attr_group_id,     
    'NFT_MEMBER_RIGHTS' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '162000' AND ag.attr_group_code = 'NFT_MEMBER_RIGHTS';

-- 插入活动门票NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '163000' as category_code,  
    ag.id as attr_group_id, 
    'NFT_EVENT_TYPE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '163000' AND ag.attr_group_code = 'NFT_EVENT_TYPE';

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '163000' as category_code,  
    ag.id as attr_group_id, 
    'NFT_SEAT_LEVEL' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '163000' AND ag.attr_group_code = 'NFT_SEAT_LEVEL';

-- 插入数字版权NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '164000' as category_code,  
    ag.id as attr_group_id,
    'NFT_COPYRIGHT_TYPE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '164000' AND ag.attr_group_code = 'NFT_COPYRIGHT_TYPE';

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '164000' as category_code,  
    ag.id as attr_group_id,
    'NFT_LICENSE_TYPE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '164000' AND ag.attr_group_code = 'NFT_LICENSE_TYPE';


-- 插入金融资产目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '170000' as category_code,  
    ag.id as attr_group_id,
    'NFT_ASSET_TYPE_ATTR' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '170000' AND ag.attr_group_code = 'NFT_ASSET_TYPE_ATTR';


-- 插入数字债券NFT目录属性组关联数据    
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '171000' as category_code,  
    ag.id as attr_group_id, 
    'NFT_BOND_PERIOD' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '171000' AND ag.attr_group_code = 'NFT_BOND_PERIOD';

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '171000' as category_code,  
    ag.id as attr_group_id,      
    'NFT_INTEREST_TYPE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '171000' AND ag.attr_group_code = 'NFT_INTEREST_TYPE';



-- 插入资产凭证NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '172000' as category_code,  
    ag.id as attr_group_id,      
    'NFT_ASSET_TYPE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '172000' AND ag.attr_group_code = 'NFT_ASSET_TYPE';

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '172000' as category_code,  
    ag.id as attr_group_id,
    'NFT_VOUCHER_USE' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '172000' AND ag.attr_group_code = 'NFT_VOUCHER_USE';


-- 插入股权通证NFT目录属性组关联数据
insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '173000' as category_code,  
    ag.id as attr_group_id, 
    'NFT_ENTERPRISE_FIELD' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '173000' AND ag.attr_group_code = 'NFT_ENTERPRISE_FIELD';

insert into sys_category_attr_group (category_id, category_code, attr_group_id, attr_group_code, created_at, updated_at, is_deleted, creator, updator)
SELECT 
    c.id as category_id, 
    '173000' as category_code,  
    ag.id as attr_group_id,
    'NFT_EQUITY_RATIO' as attr_group_code,
    NOW(), NOW(), 0, 'admin', 'admin'
FROM sys_category c, sys_attr_group ag 
WHERE c.code = '173000' AND ag.attr_group_code = 'NFT_EQUITY_RATIO';



-- ================ 清理测试数据 ================
DELETE FROM sys_product_sku WHERE id > 0;
DELETE FROM sys_product_spu_attr_params WHERE id > 0;
DELETE FROM sys_product_spu_detail WHERE id > 0;
DELETE FROM sys_product_spu WHERE id > 0;

-- ================ 1. NFT专区 - 数字艺术品 - 潮流艺术画作NFT (111000) ================
-- ================ 1. 数字艺术品 - 潮流艺术画作NFT (111000) ================

-- 商品1: 未来城市艺术画作NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_ART_PAINT_001', '未来城市艺术画作NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '111000'), '111000',
    45, 100, 'FutureArt', '限量版未来城市艺术画作NFT，由知名数字艺术家创作',
    1999.00, 2499.00, 1, 'http://example.com/images/future_city_art.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_001'), 'SPU_ART_PAINT_001',
    '这是一幅由知名数字艺术家创作的未来城市艺术画作NFT，展现了2150年未来城市的科技与人文融合景象，采用先进的数字绘画技术，色彩鲜明，细节丰富。',
    '数字艺术品NFT、区块链所有权证书、艺术品鉴赏指南',
    '区块链永久认证，资产真实性终身保障，艺术品升级服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_001'), 'SPU_ART_PAINT_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"数字绘画","创作工具":"Procreate","艺术风格":"未来主义","尺寸":"4000x3000像素"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_001'), 'SPU_ART_PAINT_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Alex Future","创作时间":"2023-03-15","区块链平台":"Ethereum","发行数量":"100","作品编号":"FUTURE2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_001'), 'SPU_ART_PAINT_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"分辨率":["4K","8K"],"版本":["标准版","收藏版","艺术家签名版"]}', 
3, 1, 1, 0);

-- 商品2: 抽象几何艺术画作NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_ART_PAINT_002', '抽象几何艺术画作NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '111000'), '111000',
    38, 80, 'GeoArt', '限量版抽象几何艺术画作NFT，现代艺术杰作',
    1599.00, 1999.00, 1, 'http://example.com/images/abstract_geo_art.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_002'), 'SPU_ART_PAINT_002',
    '这是一幅现代抽象几何艺术画作NFT，艺术家通过几何形状和鲜明的色彩对比，表达了对现代社会秩序与混沌的思考，是现代艺术收藏的优质选择。',
    '数字艺术品NFT、区块链所有权证书、艺术品鉴赏指南',
    '区块链永久认证，资产真实性终身保障，艺术品升级服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_002'), 'SPU_ART_PAINT_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"抽象几何","创作工具":"Adobe Illustrator","艺术风格":"极简主义","尺寸":"3600x3600像素"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_002'), 'SPU_ART_PAINT_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Geo Master","创作时间":"2023-04-20","区块链平台":"Ethereum","发行数量":"80","作品编号":"GEO2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_002'), 'SPU_ART_PAINT_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"色彩主题":["冷色调","暖色调","对比色"],"形状主题":["圆形","方形","三角形","混合几何"]}', 
3, 1, 1, 0);

-- 商品3: 赛博朋克艺术画作NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_ART_PAINT_003', '赛博朋克艺术画作NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '111000'), '111000',
    52, 90, 'CyberArt', '限量版赛博朋克风格艺术画作NFT，科技与反乌托邦的完美融合',
    2299.00, 2799.00, 1, 'http://example.com/images/cyberpunk_art.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_003'), 'SPU_ART_PAINT_003',
    '这是一幅赛博朋克风格的艺术画作NFT，描绘了一个高科技但低生活水平的反乌托邦世界，霓虹灯、电子设备与人类的交互，表达了对技术发展与人性的思考。',
    '数字艺术品NFT、区块链所有权证书、艺术品鉴赏指南',
    '区块链永久认证，资产真实性终身保障，艺术品升级服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_003'), 'SPU_ART_PAINT_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"数字绘画","创作工具":"Blender+Photoshop","艺术风格":"赛博朋克","尺寸":"5000x3000像素"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_003'), 'SPU_ART_PAINT_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Cyber Vision","创作时间":"2023-05-10","区块链平台":"Ethereum","发行数量":"90","作品编号":"CYBER2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_003'), 'SPU_ART_PAINT_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"场景":["城市夜景","地下世界","高科技实验室","废弃工厂"],"主题":["人机交互","反乌托邦","科技革命"]}', 
3, 1, 1, 0);

-- 商品4: 波普艺术画作NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_ART_PAINT_004', '波普艺术画作NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '111000'), '111000',
    35, 70, 'PopArt', '限量版波普艺术风格画作NFT，现代流行文化的艺术表达',
    1799.00, 2199.00, 1, 'http://example.com/images/pop_art.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_004'), 'SPU_ART_PAINT_004',
    '这是一幅波普艺术风格的画作NFT，艺术家借鉴了安迪·沃霍尔的创作手法，将现代流行文化元素与艺术创作相结合，色彩鲜明，风格独特。',
    '数字艺术品NFT、区块链所有权证书、艺术品鉴赏指南',
    '区块链永久认证，资产真实性终身保障，艺术品升级服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_004'), 'SPU_ART_PAINT_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"数字绘画","创作工具":"Adobe Photoshop","艺术风格":"波普艺术","尺寸":"4200x3600像素"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_004'), 'SPU_ART_PAINT_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Pop Master","创作时间":"2023-06-05","区块链平台":"Ethereum","发行数量":"70","作品编号":"POP2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_004'), 'SPU_ART_PAINT_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"主题":["名人肖像","流行文化","商业符号","日常物品"],"色彩":["高饱和度","对比色","单色系列"]}', 
3, 1, 1, 0);

-- 商品5: 东方水墨艺术画作NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_ART_PAINT_005', '东方水墨艺术画作NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '111000'), '111000',
    42, 85, 'InkArt', '限量版东方水墨风格艺术画作NFT，传统与现代的完美结合',
    2499.00, 2999.00, 1, 'http://example.com/images/ink_art.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_005'), 'SPU_ART_PAINT_005',
    '这是一幅东方水墨风格的艺术画作NFT，艺术家将传统东方水墨技法与现代数字艺术相结合，表现了山水、花鸟等传统题材，意境深远，韵味悠长。',
    '数字艺术品NFT、区块链所有权证书、艺术品鉴赏指南',
    '区块链永久认证，资产真实性终身保障，艺术品升级服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_005'), 'SPU_ART_PAINT_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"数字水墨","创作工具":"Corel Painter","艺术风格":"新水墨","尺寸":"4500x2800像素"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_005'), 'SPU_ART_PAINT_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"墨韵轩","创作时间":"2023-07-15","区块链平台":"Ethereum","发行数量":"85","作品编号":"INK2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_ART_PAINT_005'), 'SPU_ART_PAINT_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"题材":["山水","花鸟","人物","抽象"],"风格":["写意","工笔","现代水墨"]}', 
3, 1, 1, 0);


-- ================ 2. 数字艺术品 - 先锋音乐作品NFT (112000) ================

-- 商品1: 电子音乐专辑NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_MUSIC_001', '电子音乐专辑NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '112000'), '112000',
    65, 100, 'ElectroBeats', '限量版电子音乐专辑NFT，包含独家音轨',
    899.00, 1199.00, 1, 'http://example.com/images/electronic_music.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_001'), 'SPU_MUSIC_001',
    '这是一张限量版电子音乐专辑NFT，由知名电子音乐制作人创作，包含10首独家音轨，融合了多种电子音乐元素，节奏感强，音效丰富。',
    '音乐专辑NFT、区块链所有权证书、高品质音频文件下载权限',
    '区块链永久认证，资产真实性终身保障，音乐作品更新服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_001'), 'SPU_MUSIC_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"音乐类型":"电子音乐","创作工具":"Ableton Live","音乐风格":"House/Techno","专辑长度":"45分钟"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_001'), 'SPU_MUSIC_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"音乐人":"DJ Electro","创作时间":"2023-04-10","区块链平台":"Ethereum","发行数量":"100","专辑编号":"MUSIC2023001","音轨数量":"10"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_001'), 'SPU_MUSIC_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"音质":["标准音质","高清音质","无损音质"],"版本":["标准版","收藏版","艺术家签名版"]}', 
3, 1, 1, 0);

-- 商品2: 实验爵士乐NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_MUSIC_002', '实验爵士乐NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '112000'), '112000',
    48, 80, 'JazzFusion', '限量版实验爵士乐NFT，融合多种音乐元素',
    1099.00, 1399.00, 1, 'http://example.com/images/jazz_fusion.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_002'), 'SPU_MUSIC_002',
    '这是一张限量版实验爵士乐NFT，由知名爵士乐团创作，融合了爵士、电子、古典等多种音乐元素，打破传统爵士乐界限，创新性强。',
    '音乐作品NFT、区块链所有权证书、高品质音频文件下载权限',
    '区块链永久认证，资产真实性终身保障，音乐作品更新服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_002'), 'SPU_MUSIC_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"音乐类型":"实验爵士乐","创作工具":"现场录音+数字后期","音乐风格":"爵士融合","专辑长度":"52分钟"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_002'), 'SPU_MUSIC_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"音乐人":"Jazz Explorers","创作时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"80","专辑编号":"MUSIC2023002","音轨数量":"8"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_002'), 'SPU_MUSIC_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"录制方式":["现场录音","工作室录音","混合录制"],"附加内容":["创作花絮","乐谱","乐手访谈"]}', 
3, 1, 1, 0);

-- 商品3: 环境音乐作品NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_MUSIC_003', '环境音乐作品NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '112000'), '112000',
    55, 90, 'AmbientSounds', '限量版环境音乐作品NFT，沉浸式声音体验',
    799.00, 999.00, 1, 'http://example.com/images/ambient_music.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_003'), 'SPU_MUSIC_003',
    '这是一张限量版环境音乐作品NFT，由环境音乐大师创作，融合了自然声音与电子合成音色，营造出沉浸式的声音景观，适合冥想、放松和专注。',
    '音乐作品NFT、区块链所有权证书、高品质音频文件下载权限',
    '区块链永久认证，资产真实性终身保障，音乐作品更新服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性

((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_003'), 'SPU_MUSIC_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"音乐类型":"环境音乐","创作工具":"现场录音+合成器","音乐风格":"氛围/冥想","专辑长度":"60分钟"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_003'), 'SPU_MUSIC_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"音乐人":"Ambient Master","创作时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"90","专辑编号":"MUSIC2023003","音轨数量":"6"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_003'), 'SPU_MUSIC_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"主题":["森林","海洋","宇宙","城市"],"时长":["标准版60分钟","延长版90分钟","冥想专用120分钟"]}', 
3, 1, 1, 0);

-- 商品4: 先锋古典音乐NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_MUSIC_004', '先锋古典音乐NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '112000'), '112000',
    42, 75, 'NeoClassical', '限量版先锋古典音乐NFT，传统与现代的碰撞',
    1299.00, 1599.00, 1, 'http://example.com/images/neo_classical.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_004'), 'SPU_MUSIC_004',
    '这是一张限量版先锋古典音乐NFT，由新生代古典音乐作曲家创作，将传统古典音乐元素与现代电子音乐、实验音乐相结合，打破传统古典音乐的界限。',
    '音乐作品NFT、区块链所有权证书、高品质音频文件下载权限、乐谱PDF',
    '区块链永久认证，资产真实性终身保障，音乐作品更新服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_004'), 'SPU_MUSIC_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"音乐类型":"先锋古典","创作工具":"管弦乐团+电子合成","音乐风格":"新古典主义","专辑长度":"48分钟"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_004'), 'SPU_MUSIC_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"音乐人":"Neo Orchestra","创作时间":"2023-07-05","区块链平台":"Ethereum","发行数量":"75","专辑编号":"MUSIC2023004","音轨数量":"7"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_004'), 'SPU_MUSIC_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"演奏阵容":["室内乐团","交响乐团","电子+管弦乐"],"附加内容":["创作花絮","乐谱","指挥访谈"]}', 
3, 1, 1, 0);

-- 商品5: 世界音乐融合NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_MUSIC_005', '世界音乐融合NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '112000'), '112000',
    58, 85, 'WorldFusion', '限量版世界音乐融合NFT，多元文化的音乐对话',
    999.00, 1299.00, 1, 'http://example.com/images/world_fusion.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_005'), 'SPU_MUSIC_005',
    '这是一张限量版世界音乐融合NFT，由来自不同文化背景的音乐人合作创作，融合了亚洲、非洲、拉丁美洲等地区的传统音乐元素，展现了多元文化的音乐对话。',
    '音乐作品NFT、区块链所有权证书、高品质音频文件下载权限、创作纪录片访问权',
    '区块链永久认证，资产真实性终身保障，音乐作品更新服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_005'), 'SPU_MUSIC_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"音乐类型":"世界音乐","创作工具":"传统乐器+现代制作","音乐风格":"多元文化融合","专辑长度":"55分钟"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_005'), 'SPU_MUSIC_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"音乐人":"Global Ensemble","创作时间":"2023-08-10","区块链平台":"Ethereum","发行数量":"85","专辑编号":"MUSIC2023005","音轨数量":"9"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_005'), 'SPU_MUSIC_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"文化元素":["亚洲","非洲","拉丁美洲","中东"],"乐器特色":["传统乐器","现代电子","混合编曲"]}', 
3, 1, 1, 0);


-- ================ 3. 数字艺术品 - 视频艺术NFT (113000) ================

-- 商品1: 抽象动态艺术NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_VIDEO_ART_001', '抽象动态艺术NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '113000'), '113000',
    62, 100, 'MotionArt', '限量版抽象动态艺术NFT，视觉与情感的流动表达',
    1899.00, 2299.00, 1, 'http://example.com/images/abstract_motion.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_001'), 'SPU_VIDEO_ART_001',
    '这是一件限量版抽象动态艺术NFT，由视觉艺术家创作，通过流动的色彩、形状和纹理，表达情感和思想的流动性，是一种视觉与情感的沉浸式体验。',
    '视频艺术品NFT、区块链所有权证书、高清视频文件下载权限',
    '区块链永久认证，资产真实性终身保障，艺术品升级服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_001'), 'SPU_VIDEO_ART_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"动态视频艺术","创作工具":"After Effects","艺术风格":"抽象表现主义","视频长度":"2分钟","分辨率":"4K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_001'), 'SPU_VIDEO_ART_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Motion Master","创作时间":"2023-04-15","区块链平台":"Ethereum","发行数量":"100","作品编号":"VIDEO2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_001'), 'SPU_VIDEO_ART_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"视频格式":["MP4","MOV"],"循环方式":["单次播放","无缝循环","变化循环"]}', 
3, 1, 1, 0);

-- 商品2: 数字生命模拟NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_VIDEO_ART_002', '数字生命模拟NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '113000'), '113000',
    55, 80, 'DigitalLife', '限量版数字生命模拟NFT，算法生成的生命演化',
    2199.00, 2599.00, 1, 'http://example.com/images/digital_life.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_002'), 'SPU_VIDEO_ART_002',
    '这是一件限量版数字生命模拟NFT，由算法艺术家创作，通过复杂算法模拟生命体的生成、演化和互动过程，每个NFT都是独特的生命演化轨迹，永不重复。',
    '视频艺术品NFT、区块链所有权证书、高清视频文件下载权限、算法源代码访问权',
    '区块链永久认证，资产真实性终身保障，艺术品升级服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_002'), 'SPU_VIDEO_ART_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"算法生成艺术","创作工具":"Processing","艺术风格":"生命模拟","视频长度":"3分钟","分辨率":"4K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_002'), 'SPU_VIDEO_ART_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Algorithm Life","创作时间":"2023-05-20","区块链平台":"Ethereum","发行数量":"80","作品编号":"VIDEO2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_002'), 'SPU_VIDEO_ART_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"生命形态":["细胞","微生物","植物","抽象生命"],"互动性":["静态观看","有限互动","完全互动"]}', 
3, 1, 1, 0);

-- 商品3: 沉浸式风景NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_VIDEO_ART_003', '沉浸式风景NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '113000'), '113000',
    68, 90, 'ImmersiveLandscape', '限量版沉浸式风景NFT，超现实自然景观',
    1699.00, 1999.00, 1, 'http://example.com/images/immersive_landscape.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_003'), 'SPU_VIDEO_ART_003',
    '这是一件限量版沉浸式风景NFT，由数字景观艺术家创作，通过3D建模和动画技术，创造出超现实的自然景观，如流动的山脉、漂浮的岛屿、变幻的天空等，带来视觉上的沉浸感。',
    '视频艺术品NFT、区块链所有权证书、高清视频文件下载权限',
    '区块链永久认证，资产真实性终身保障，艺术品升级服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_003'), 'SPU_VIDEO_ART_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"3D景观艺术","创作工具":"Blender","艺术风格":"超现实主义","视频长度":"2.5分钟","分辨率":"4K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_003'), 'SPU_VIDEO_ART_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Landscape Dreamer","创作时间":"2023-06-10","区块链平台":"Ethereum","发行数量":"90","作品编号":"VIDEO2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_003'), 'SPU_VIDEO_ART_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"景观类型":["山脉","海洋","森林","天空","抽象地形"],"时间周期":["日出","日落","星空","四季变换"]}', 
3, 1, 1, 0);

-- 商品4: 数字舞蹈表演NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_VIDEO_ART_004', '数字舞蹈表演NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '113000'), '113000',
    50, 75, 'DigitalDance', '限量版数字舞蹈表演NFT，身体与数字的对话',
    1599.00, 1899.00, 1, 'http://example.com/images/digital_dance.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_004'), 'SPU_VIDEO_ART_004',
    '这是一件限量版数字舞蹈表演NFT，由舞蹈艺术家与数字艺术家合作创作，通过动作捕捉技术，将真实舞者的表演转化为数字视觉艺术，展现身体与数字的对话。',
    '视频艺术品NFT、区块链所有权证书、高清视频文件下载权限、创作花絮访问权',
    '区块链永久认证，资产真实性终身保障，艺术品升级服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_004'), 'SPU_VIDEO_ART_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"数字舞蹈艺术","创作工具":"动作捕捉+After Effects","艺术风格":"当代舞蹈+数字视效","视频长度":"4分钟","分辨率":"4K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_004'), 'SPU_VIDEO_ART_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Digital Dancers","创作时间":"2023-07-05","区块链平台":"Ethereum","发行数量":"75","作品编号":"VIDEO2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_004'), 'SPU_VIDEO_ART_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"舞蹈风格":["现代舞","当代舞","芭蕾","街舞"],"视觉效果":["粒子效果","几何变形","光影追踪","抽象映射"]}', 
3, 1, 1, 0);

-- 商品5: 城市脉动NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_VIDEO_ART_005', '城市脉动NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '113000'), '113000',
    60, 85, 'UrbanPulse', '限量版城市脉动NFT，城市生活的视觉韵律',
    1799.00, 2099.00, 1, 'http://example.com/images/urban_pulse.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_005'), 'SPU_VIDEO_ART_005',
    '这是一件限量版城市脉动NFT，由城市影像艺术家创作，通过延时摄影和数字处理技术，捕捉城市的流动、节奏和脉动，展现现代都市生活的视觉韵律。',
    '视频艺术品NFT、区块链所有权证书、高清视频文件下载权限',
    '区块链永久认证，资产真实性终身保障，艺术品升级服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_005'), 'SPU_VIDEO_ART_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"城市影像艺术","创作工具":"延时摄影+数字处理","艺术风格":"城市纪实+视觉艺术","视频长度":"3.5分钟","分辨率":"4K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_005'), 'SPU_VIDEO_ART_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Urban Eye","创作时间":"2023-08-15","区块链平台":"Ethereum","发行数量":"85","作品编号":"VIDEO2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ART_005'), 'SPU_VIDEO_ART_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"城市场景":["交通流","人群","建筑","夜景"],"拍摄城市":["纽约","东京","上海","伦敦","巴黎"]}', 
3, 1, 1, 0);


-- ================ 4. 数字艺术品 - 文本类型NFT (114000) ================

-- 商品1: 数字诗歌集NFT
-- 继续数字诗歌集NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_TEXT_ART_001', '数字诗歌集NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '114000'), '114000',
    45, 100, 'DigitalPoetry', '限量版数字诗歌集NFT，文字与视觉的艺术融合',
    899.00, 1199.00, 1, 'http://example.com/images/digital_poetry.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_001'), 'SPU_TEXT_ART_001',
    '这是一部限量版数字诗歌集NFT，由当代诗人与视觉艺术家合作创作，将文字与视觉元素融合，通过动态排版、互动文本和视觉效果，为诗歌赋予新的表达形式。',
    '文本艺术品NFT、区块链所有权证书、高清数字文件下载权限',
    '区块链永久认证，资产真实性终身保障，艺术品升级服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_001'), 'SPU_TEXT_ART_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"文本艺术","创作工具":"数字排版+视觉设计","艺术风格":"实验诗歌","作品数量":"15首"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_001'), 'SPU_TEXT_ART_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Word Visionary","创作时间":"2023-04-20","区块链平台":"Ethereum","发行数量":"100","作品编号":"TEXT2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_001'), 'SPU_TEXT_ART_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"主题":["爱情","自然","城市","科技"],"呈现形式":["静态文本","动态文本","互动文本"]}', 
3, 1, 1, 0);

-- 商品2: 实验小说NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_TEXT_ART_002', '实验小说NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '114000'), '114000',
    38, 80, 'NovelArt', '限量版实验小说NFT，打破传统叙事结构',
    1099.00, 1399.00, 1, 'http://example.com/images/experimental_novel.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_002'), 'SPU_TEXT_ART_002',
    '这是一部限量版实验小说NFT，由前卫作家创作，打破传统叙事结构，采用非线性叙事、多视角、互动选择等创新手法，读者可以参与故事的发展方向。',
    '文本艺术品NFT、区块链所有权证书、高清数字文件下载权限、作者签名版PDF',
    '区块链永久认证，资产真实性终身保障，艺术品升级服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_002'), 'SPU_TEXT_ART_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"文本艺术","创作工具":"数字写作+互动设计","艺术风格":"实验小说","字数":"约5万字"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_002'), 'SPU_TEXT_ART_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Novel Explorer","创作时间":"2023-05-25","区块链平台":"Ethereum","发行数量":"80","作品编号":"TEXT2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_002'), 'SPU_TEXT_ART_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"叙事结构":["非线性","多视角","分支选择"],"互动程度":["低互动","中互动","高互动"]}', 
3, 1, 1, 0);

-- 商品3: 数字剧本NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_TEXT_ART_003', '数字剧本NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '114000'), '114000',
    42, 90, 'ScriptArt', '限量版数字剧本NFT，创新戏剧文本',
    999.00, 1299.00, 1, 'http://example.com/images/digital_script.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_003'), 'SPU_TEXT_ART_003',
    '这是一部限量版数字剧本NFT，由新锐剧作家创作，探索数字时代的人性与科技关系，采用创新的戏剧文本形式，包含多媒体元素和互动场景。',
    '文本艺术品NFT、区块链所有权证书、高清数字文件下载权限、作者签名版PDF',
    '区块链永久认证，资产真实性终身保障，艺术品升级服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_003'), 'SPU_TEXT_ART_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"文本艺术","创作工具":"数字写作+多媒体设计","艺术风格":"实验戏剧","幕数":"3幕"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_003'), 'SPU_TEXT_ART_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Script Innovator","创作时间":"2023-06-15","区块链平台":"Ethereum","发行数量":"90","作品编号":"TEXT2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_003'), 'SPU_TEXT_ART_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"主题":["科技与人性","身份认同","虚拟与现实"],"附加内容":["角色设计","场景设计","导演笔记"]}', 
3, 1, 1, 0);

-- 商品4: 概念文本艺术NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_TEXT_ART_004', '概念文本艺术NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '114000'), '114000',
    35, 75, 'ConceptText', '限量版概念文本艺术NFT，文字的视觉实验',
    799.00, 999.00, 1, 'http://example.com/images/concept_text.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_004'), 'SPU_TEXT_ART_004',
    '这是一件限量版概念文本艺术NFT，由概念艺术家创作，将文字作为视觉元素进行排列组合，探索语言、符号与意义之间的关系，是文字的视觉实验。',
    '文本艺术品NFT、区块链所有权证书、高清数字文件下载权限',
    '区块链永久认证，资产真实性终身保障，艺术品升级服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_004'), 'SPU_TEXT_ART_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"文本艺术","创作工具":"数字排版+视觉设计","艺术风格":"概念艺术","作品数量":"8件"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_004'), 'SPU_TEXT_ART_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Text Conceptualist","创作时间":"2023-07-10","区块链平台":"Ethereum","发行数量":"75","作品编号":"TEXT2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_004'), 'SPU_TEXT_ART_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"表现形式":["文字拼贴","字形变形","符号组合","空间排列"],"互动性":["静态","动态","互动"]}', 
3, 1, 1, 0);

-- 商品5: 数字散文集NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_TEXT_ART_005', '数字散文集NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '110000'), '110000',
    (SELECT id FROM sys_category WHERE code = '114000'), '114000',
    40, 85, 'EssayArt', '限量版数字散文集NFT，思想与文字的艺术',
    899.00, 1199.00, 1, 'http://example.com/images/digital_essays.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_005'), 'SPU_TEXT_ART_005',
    '这是一部限量版数字散文集NFT，由当代思想家创作，探讨数字时代的哲学、艺术与社会议题，文字优美，思想深刻，配有精美的视觉设计。',
    '文本艺术品NFT、区块链所有权证书、高清数字文件下载权限、作者签名版PDF',
    '区块链永久认证，资产真实性终身保障，艺术品升级服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_005'), 'SPU_TEXT_ART_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"文本艺术","创作工具":"数字写作+视觉设计","艺术风格":"哲思散文","作品数量":"12篇"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_005'), 'SPU_TEXT_ART_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Digital Thinker","创作时间":"2023-08-20","区块链平台":"Ethereum","发行数量":"85","作品编号":"TEXT2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_TEXT_ART_005'), 'SPU_TEXT_ART_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"主题":["数字哲学","艺术理论","社会批评","科技伦理"],"附加内容":["作者访谈","创作笔记","读者讨论"]}', 
3, 1, 1, 0);


-- ================ 5. 虚拟身份 - 独特头像NFT (121000) ================

-- 商品1: 未来科技头像NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_AVATAR_001', '未来科技头像NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '120000'), '120000',
    (SELECT id FROM sys_category WHERE code = '121000'), '121000',
    75, 100, 'FutureAvatar', '限量版未来科技风格头像NFT，彰显数字身份',
    599.00, 799.00, 1, 'http://example.com/images/future_avatar.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_001'), 'SPU_AVATAR_001',
    '这是一款限量版未来科技风格头像NFT，由数字艺术家精心设计，融合赛博朋克和未来主义元素，适用于各大社交平台和元宇宙空间，彰显独特的数字身份。',
    '头像NFT、区块链所有权证书、多种尺寸文件下载权限',
    '区块链永久认证，资产真实性终身保障，头像更新服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_001'), 'SPU_AVATAR_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"数字头像","创作工具":"Procreate+Blender","艺术风格":"赛博朋克/未来主义","分辨率":"4000x4000像素"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_001'), 'SPU_AVATAR_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Future Face","创作时间":"2023-04-05","区块链平台":"Ethereum","发行数量":"100","作品编号":"AVATAR2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_001'), 'SPU_AVATAR_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"性别":["男性","女性","中性","非二元"],"风格元素":["机械增强","全息投影","神经接口","量子特效"]}', 
3, 1, 1, 0);

-- 商品2: 幻想生物头像NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_AVATAR_002', '幻想生物头像NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '120000'), '120000',
    (SELECT id FROM sys_category WHERE code = '121000'), '121000',
    68, 80, 'FantasyAvatar', '限量版幻想生物头像NFT，奇幻世界的化身',
    699.00, 899.00, 1, 'http://example.com/images/fantasy_avatar.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_002'), 'SPU_AVATAR_002',
    '这是一款限量版幻想生物头像NFT，由奇幻艺术家创作，融合神话、魔幻和奇幻元素，创造出独特的非人类生物形象，适用于游戏、社交平台和元宇宙空间。',
    '头像NFT、区块链所有权证书、多种尺寸文件下载权限',
    '区块链永久认证，资产真实性终身保障，头像更新服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_002'), 'SPU_AVATAR_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"数字头像","创作工具":"ZBrush+Photoshop","艺术风格":"奇幻/神话","分辨率":"4000x4000像素"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_002'), 'SPU_AVATAR_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Creature Creator","创作时间":"2023-05-10","区块链平台":"Ethereum","发行数量":"80","作品编号":"AVATAR2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_002'), 'SPU_AVATAR_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"生物类型":["龙族","精灵","兽人","神话生物","异次元生物"],"元素属性":["火","水","土","风","光","暗"]}', 
3, 1, 1, 0);

-- 商品3: 抽象艺术头像NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_AVATAR_003', '抽象艺术头像NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '120000'), '120000',
    (SELECT id FROM sys_category WHERE code = '121000'), '121000',
    62, 90, 'AbstractAvatar', '限量版抽象艺术头像NFT，艺术表达的数字身份',
    499.00, 699.00, 1, 'http://example.com/images/abstract_avatar.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_003'), 'SPU_AVATAR_003',
    '这是一款限量版抽象艺术头像NFT，由抽象艺术家创作，运用几何形状、色彩和纹理，创造出非具象的视觉表达，适合追求艺术表达的数字身份。',
    '头像NFT、区块链所有权证书、多种尺寸文件下载权限',
    '区块链永久认证，资产真实性终身保障，头像更新服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_003'), 'SPU_AVATAR_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"数字头像","创作工具":"Adobe Illustrator","艺术风格":"抽象/几何","分辨率":"4000x4000像素"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_003'), 'SPU_AVATAR_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Abstract Identity","创作时间":"2023-06-15","区块链平台":"Ethereum","发行数量":"90","作品编号":"AVATAR2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_003'), 'SPU_AVATAR_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"形状元素":["几何形状","流体形态","分形图案","抽象线条"],"色彩方案":["单色","对比色","渐变色","彩虹色"]}', 
3, 1, 1, 0);


-- 商品4: 复古像素头像NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_AVATAR_004', '复古像素头像NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '120000'), '120000',
    (SELECT id FROM sys_category WHERE code = '121000'), '121000',
    70, 85, 'PixelAvatar', '限量版复古像素风格头像NFT，怀旧游戏风格',
    399.00, 599.00, 1, 'http://example.com/images/pixel_avatar.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_004'), 'SPU_AVATAR_004',
    '这是一款限量版复古像素风格头像NFT，由像素艺术家创作，采用经典8位或16位游戏风格，充满怀旧感和复古游戏魅力，适合游戏爱好者和复古文化爱好者。',
    '头像NFT、区块链所有权证书、多种尺寸文件下载权限',
    '区块链永久认证，资产真实性终身保障，头像更新服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_004'), 'SPU_AVATAR_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"数字头像","创作工具":"Aseprite","艺术风格":"像素艺术/复古游戏","分辨率":"64x64像素(可放大)"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_004'), 'SPU_AVATAR_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Pixel Master","创作时间":"2023-07-20","区块链平台":"Ethereum","发行数量":"85","作品编号":"AVATAR2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_004'), 'SPU_AVATAR_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"游戏风格":["8位风格","16位风格","32位风格"],"角色类型":["冒险者","魔法师","战士","太空人","赛博朋克"]}', 
3, 1, 1, 0);

-- 商品5: 动物拟人头像NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_AVATAR_005', '动物拟人头像NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '120000'), '120000',
    (SELECT id FROM sys_category WHERE code = '121000'), '121000',
    65, 95, 'AnimalAvatar', '限量版动物拟人头像NFT，个性化动物形象',
    599.00, 799.00, 1, 'http://example.com/images/animal_avatar.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_005'), 'SPU_AVATAR_005',
    '这是一款限量版动物拟人头像NFT，由插画艺术家创作，将各种动物形象拟人化，赋予人类特征和表情，个性鲜明，适合喜爱动物和卡通风格的用户。',
    '头像NFT、区块链所有权证书、多种尺寸文件下载权限',
    '区块链永久认证，资产真实性终身保障，头像更新服务';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_005'), 'SPU_AVATAR_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"数字头像","创作工具":"Clip Studio Paint","艺术风格":"卡通/拟人化","分辨率":"4000x4000像素"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_005'), 'SPU_AVATAR_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Animal Artist","创作时间":"2023-08-25","区块链平台":"Ethereum","发行数量":"95","作品编号":"AVATAR2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_AVATAR_005'), 'SPU_AVATAR_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"动物类型":["猫科","犬科","鸟类","爬行类","海洋生物"],"风格":["写实","卡通","赛博朋克","奇幻"]}', 
3, 1, 1, 0);



-- ================ 6. 虚拟身份 - 定制虚拟形象NFT (122000) ================

-- 商品1: 3D全身虚拟形象NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_VIRTUAL_CHAR_001', '3D全身虚拟形象NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '120000'), '120000',
    (SELECT id FROM sys_category WHERE code = '122000'), '122000',
    55, 100, 'VirtualSelf', '限量版3D全身虚拟形象NFT，元宇宙中的数字分身',
    1999.00, 2499.00, 1, 'http://example.com/images/3d_avatar.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_001'), 'SPU_VIRTUAL_CHAR_001',
    '这是一款限量版3D全身虚拟形象NFT，由3D建模艺术家精心打造，高精度全身模型，包含丰富的表情和动作，可用于元宇宙平台、VR社交和游戏中，是您在数字世界的完美分身。',
    '3D虚拟形象NFT、区块链所有权证书、多种格式3D模型文件、使用说明',
    '区块链永久认证，资产真实性终身保障，形象更新服务，元宇宙平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_001'), 'SPU_VIRTUAL_CHAR_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"3D虚拟形象","创作工具":"Blender+ZBrush","艺术风格":"写实/科幻","多边形数":"50K-100K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_001'), 'SPU_VIRTUAL_CHAR_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"3D Master","创作时间":"2023-04-10","区块链平台":"Ethereum","发行数量":"100","作品编号":"VCHAR2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_001'), 'SPU_VIRTUAL_CHAR_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"风格":["写实","科幻","卡通","奇幻"],"适配平台":["Decentraland","The Sandbox","VRChat","Roblox"]}', 
3, 1, 1, 0);

-- 商品2: 动漫风格虚拟形象NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_VIRTUAL_CHAR_002', '动漫风格虚拟形象NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '120000'), '120000',
    (SELECT id FROM sys_category WHERE code = '122000'), '122000',
    65, 90, 'AnimeAvatar', '限量版动漫风格虚拟形象NFT，二次元数字身份',
    1499.00, 1899.00, 1, 'http://example.com/images/anime_avatar.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_002'), 'SPU_VIRTUAL_CHAR_002',
    '这是一款限量版动漫风格虚拟形象NFT，由日系插画艺术家创作，采用经典动漫风格设计，包含多套服装和丰富表情，适合二次元爱好者在各类平台展示个性。',
    '虚拟形象NFT、区块链所有权证书、多种格式模型文件、使用说明',
    '区块链永久认证，资产真实性终身保障，形象更新服务，平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_002'), 'SPU_VIRTUAL_CHAR_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"动漫虚拟形象","创作工具":"Clip Studio Paint+Blender","艺术风格":"日系动漫","多边形数":"30K-50K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_002'), 'SPU_VIRTUAL_CHAR_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Anime Creator","创作时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"90","作品编号":"VCHAR2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_002'), 'SPU_VIRTUAL_CHAR_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"动漫风格":["少年漫画","少女漫画","赛博朋克","奇幻"],"服装套装":["校园","战斗","日常","特殊节日"]}', 
3, 1, 1, 0);

-- 商品3: 赛博朋克虚拟形象NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_VIRTUAL_CHAR_003', '赛博朋克虚拟形象NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '120000'), '120000',
    (SELECT id FROM sys_category WHERE code = '122000'), '122000',
    58, 85, 'CyberAvatar', '限量版赛博朋克虚拟形象NFT，未来科技风格',
    1799.00, 2199.00, 1, 'http://example.com/images/cyberpunk_avatar.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_003'), 'SPU_VIRTUAL_CHAR_003',
    '这是一款限量版赛博朋克虚拟形象NFT，由科幻概念艺术家设计，融合高科技与朋克元素，包含机械义肢、全息投影和神经接口等未来科技特征，适合科幻爱好者。',
    '虚拟形象NFT、区块链所有权证书、多种格式模型文件、使用说明',
    '区块链永久认证，资产真实性终身保障，形象更新服务，平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_003'), 'SPU_VIRTUAL_CHAR_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"赛博朋克虚拟形象","创作工具":"ZBrush+Substance Painter","艺术风格":"赛博朋克/科幻","多边形数":"60K-80K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_003'), 'SPU_VIRTUAL_CHAR_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Cyber Designer","创作时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"85","作品编号":"VCHAR2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_003'), 'SPU_VIRTUAL_CHAR_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"增强类型":["机械义肢","神经接口","全息投影","生物改造"],"职业背景":["黑客","赏金猎人","公司特工","街头医生","反抗军"]}', 
3, 1, 1, 0);

-- 商品4: 奇幻种族虚拟形象NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_VIRTUAL_CHAR_004', '奇幻种族虚拟形象NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '120000'), '120000',
    (SELECT id FROM sys_category WHERE code = '122000'), '122000',
    52, 80, 'FantasyAvatar', '限量版奇幻种族虚拟形象NFT，魔幻世界的化身',
    1699.00, 2099.00, 1, 'http://example.com/images/fantasy_character.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_004'), 'SPU_VIRTUAL_CHAR_004',
    '这是一款限量版奇幻种族虚拟形象NFT，由奇幻概念艺术家创作，包括精灵、矮人、兽人等多种奇幻种族，配有精美的奇幻装备和魔法效果，适合奇幻游戏和社交平台。',
    '虚拟形象NFT、区块链所有权证书、多种格式模型文件、使用说明',
    '区块链永久认证，资产真实性终身保障，形象更新服务，平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_004'), 'SPU_VIRTUAL_CHAR_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"奇幻虚拟形象","创作工具":"Maya+Substance Painter","艺术风格":"奇幻/魔幻","多边形数":"50K-70K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_004'), 'SPU_VIRTUAL_CHAR_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Fantasy Sculptor","创作时间":"2023-07-25","区块链平台":"Ethereum","发行数量":"80","作品编号":"VCHAR2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_004'), 'SPU_VIRTUAL_CHAR_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"种族":["精灵","矮人","兽人","龙人","元素生物"],"职业":["战士","法师","游侠","牧师","盗贼"]}', 
3, 1, 1, 0);

-- 商品5: 未来运动员虚拟形象NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_VIRTUAL_CHAR_005', '未来运动员虚拟形象NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '120000'), '120000',
    (SELECT id FROM sys_category WHERE code = '122000'), '122000',
    60, 90, 'SportAvatar', '限量版未来运动员虚拟形象NFT，电竞与体育的融合',
    1599.00, 1999.00, 1, 'http://example.com/images/future_athlete.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_005'), 'SPU_VIRTUAL_CHAR_005',
    '这是一款限量版未来运动员虚拟形象NFT，由体育概念艺术家设计，融合传统体育与未来科技元素，适合电竞选手、体育爱好者在元宇宙中展示运动精神。',
    '虚拟形象NFT、区块链所有权证书、多种格式模型文件、使用说明',
    '区块链永久认证，资产真实性终身保障，形象更新服务，平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_005'), 'SPU_VIRTUAL_CHAR_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"运动虚拟形象","创作工具":"3ds Max+Marvelous Designer","艺术风格":"未来运动/科技","多边形数":"40K-60K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_005'), 'SPU_VIRTUAL_CHAR_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"艺术家":"Future Athlete","创作时间":"2023-08-30","区块链平台":"Ethereum","发行数量":"90","作品编号":"VCHAR2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIRTUAL_CHAR_005'), 'SPU_VIRTUAL_CHAR_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"运动类型":["电竞","未来足球","增强篮球","极限运动","机甲格斗"],"装备特性":["动力外骨骼","生物反馈","全息显示","智能材料"]}', 
3, 1, 1, 0);


-- ================ 7. 虚拟身份 - 专属社交身份NFT (123000) ================

-- 商品1: 社交媒体身份包NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_SOCIAL_ID_001', '社交媒体身份包NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '120000'), '120000',
    (SELECT id FROM sys_category WHERE code = '123000'), '123000',
    70, 100, 'SocialID', '限量版社交媒体身份包NFT，全平台统一形象',
    999.00, 1299.00, 1, 'http://example.com/images/social_identity.png',
    NOW(), NOW(), 0, 'admin', 'admin';

-- 继续社交媒体身份包NFT
INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_001'), 'SPU_SOCIAL_ID_001',
    '这是一款限量版社交媒体身份包NFT，包含适用于各大社交平台的统一形象设计，包括头像、横幅、背景和主题元素，让您在所有平台保持一致的个人品牌形象。',
    '社交身份NFT、区块链所有权证书、多种格式和尺寸文件包、使用指南',
    '区块链永久认证，资产真实性终身保障，形象更新服务，新平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_001'), 'SPU_SOCIAL_ID_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"社交媒体设计","创作工具":"Photoshop+Illustrator","艺术风格":"现代/简约","包含元素":"头像、横幅、背景、主题"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_001'), 'SPU_SOCIAL_ID_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Social Branding","创作时间":"2023-04-25","区块链平台":"Ethereum","发行数量":"100","作品编号":"SOCIAL2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_001'), 'SPU_SOCIAL_ID_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"适配平台":["Twitter","Instagram","Facebook","LinkedIn","Discord"],"风格":["简约","科技","艺术","商务","创意"]}', 
3, 1, 1, 0);

-- 商品2: 专业创作者身份NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_SOCIAL_ID_002', '专业创作者身份NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '120000'), '120000',
    (SELECT id FROM sys_category WHERE code = '123000'), '123000',
    60, 80, 'CreatorID', '限量版专业创作者身份NFT，展示专业形象',
    1299.00, 1599.00, 1, 'http://example.com/images/creator_identity.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_002'), 'SPU_SOCIAL_ID_002',
    '这是一款限量版专业创作者身份NFT，专为艺术家、设计师、作家等创意工作者设计，包含专业形象设计和品牌元素，帮助创作者在数字世界建立专业形象。',
    '创作者身份NFT、区块链所有权证书、品牌设计文件包、使用指南',
    '区块链永久认证，资产真实性终身保障，形象更新服务，平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_002'), 'SPU_SOCIAL_ID_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"品牌形象设计","创作工具":"Adobe Creative Suite","艺术风格":"专业/创意","包含元素":"头像、标志、名片、作品集模板"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_002'), 'SPU_SOCIAL_ID_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Brand Expert","创作时间":"2023-05-20","区块链平台":"Ethereum","发行数量":"80","作品编号":"SOCIAL2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_002'), 'SPU_SOCIAL_ID_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"创作者类型":["视觉艺术家","音乐人","作家","设计师","摄影师"],"风格":["极简","艺术","前卫","经典","实验"]}', 
3, 1, 1, 0);

-- 商品3: 游戏玩家身份NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_SOCIAL_ID_003', '游戏玩家身份NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '120000'), '120000',
    (SELECT id FROM sys_category WHERE code = '123000'), '123000',
    75, 90, 'GamerID', '限量版游戏玩家身份NFT，游戏平台统一形象',
    899.00, 1199.00, 1, 'http://example.com/images/gamer_identity.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_003'), 'SPU_SOCIAL_ID_003',
    '这是一款限量版游戏玩家身份NFT，专为游戏爱好者设计，包含游戏头像、横幅、徽章和个性化元素，适用于各大游戏平台和游戏社区，展示您的游戏身份。',
    '游戏身份NFT、区块链所有权证书、多种格式文件包、使用指南',
    '区块链永久认证，资产真实性终身保障，形象更新服务，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_003'), 'SPU_SOCIAL_ID_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"游戏形象设计","创作工具":"Photoshop+3D建模","艺术风格":"游戏风/科幻","包含元素":"头像、横幅、徽章、表情包"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_003'), 'SPU_SOCIAL_ID_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Game Artist","创作时间":"2023-06-15","区块链平台":"Ethereum","发行数量":"90","作品编号":"SOCIAL2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_003'), 'SPU_SOCIAL_ID_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"游戏类型":["FPS","MOBA","RPG","模拟","策略"],"风格":["科幻","奇幻","赛博朋克","复古像素","卡通"]}', 
3, 1, 1, 0);

-- 商品4: 商业品牌身份NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_SOCIAL_ID_004', '商业品牌身份NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '120000'), '120000',
    (SELECT id FROM sys_category WHERE code = '123000'), '123000',
    55, 75, 'BrandID', '限量版商业品牌身份NFT，专业商业形象',
    1499.00, 1899.00, 1, 'http://example.com/images/business_identity.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_004'), 'SPU_SOCIAL_ID_004',
    '这是一款限量版商业品牌身份NFT，专为企业家和商业专业人士设计，包含专业的品牌形象设计，帮助您在数字世界建立专业可信的商业形象。',
    '商业身份NFT、区块链所有权证书、品牌设计文件包、使用指南',
    '区块链永久认证，资产真实性终身保障，形象更新服务，平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_004'), 'SPU_SOCIAL_ID_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"商业形象设计","创作工具":"Adobe Creative Suite","艺术风格":"专业/商务","包含元素":"头像、标志、名片、社交媒体模板"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_004'), 'SPU_SOCIAL_ID_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Business Designer","创作时间":"2023-07-20","区块链平台":"Ethereum","发行数量":"75","作品编号":"SOCIAL2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_004'), 'SPU_SOCIAL_ID_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"行业":["科技","金融","创意","教育","零售"],"风格":["现代简约","专业稳重","创新前卫","传统经典"]}', 
3, 1, 1, 0);

-- 商品5: 虚拟影响者身份NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_SOCIAL_ID_005', '虚拟影响者身份NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '120000'), '120000',
    (SELECT id FROM sys_category WHERE code = '123000'), '123000',
    65, 85, 'InfluencerID', '限量版虚拟影响者身份NFT，打造数字KOL形象',
    1299.00, 1699.00, 1, 'http://example.com/images/influencer_identity.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_005'), 'SPU_SOCIAL_ID_005',
    '这是一款限量版虚拟影响者身份NFT，专为内容创作者和社交媒体影响者设计，包含吸引眼球的形象设计和内容模板，帮助您打造独特的数字KOL形象。',
    '影响者身份NFT、区块链所有权证书、形象设计文件包、内容模板、使用指南',
    '区块链永久认证，资产真实性终身保障，形象更新服务，平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_005'), 'SPU_SOCIAL_ID_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"艺术类型":"影响者形象设计","创作工具":"Photoshop+After Effects","艺术风格":"时尚/前卫","包含元素":"头像、封面、介绍模板、内容框架"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_005'), 'SPU_SOCIAL_ID_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Digital Influencer","创作时间":"2023-08-25","区块链平台":"Ethereum","发行数量":"85","作品编号":"SOCIAL2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_SOCIAL_ID_005'), 'SPU_SOCIAL_ID_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"内容领域":["时尚","科技","生活方式","游戏","美妆"],"风格":["前卫","时尚","专业","休闲","艺术"]}', 
3, 1, 1, 0);


-- ================ 8. 游戏资产 - 游戏道具NFT (131000) ================

-- 商品1: 传奇武器NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_ITEM_001', '传奇武器NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '131000'), '131000',
    85, 100, 'LegendaryGear', '限量版传奇武器NFT，跨游戏平台使用',
    1299.00, 1599.00, 1, 'http://example.com/images/legendary_weapon.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_001'), 'SPU_GAME_ITEM_001',
    '这是一款限量版传奇武器NFT，由游戏艺术家精心打造，拥有独特的外观和特效，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '游戏道具NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_001'), 'SPU_GAME_ITEM_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"道具类型":"武器","创作工具":"Blender+Substance Painter","艺术风格":"奇幻/史诗","多边形数":"20K-30K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_001'), 'SPU_GAME_ITEM_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Weapon Master","创作时间":"2023-04-15","区块链平台":"Ethereum","发行数量":"100","作品编号":"GITEM2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_001'), 'SPU_GAME_ITEM_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"武器类型":["剑","斧","弓","法杖","枪"],"元素属性":["火","冰","雷","暗","光"]}', 
3, 1, 1, 0);

-- 商品2: 稀有防具NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_ITEM_002', '稀有防具NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '131000'), '131000',
    75, 90, 'EpicArmor', '限量版稀有防具NFT，跨游戏平台使用',
    1199.00, 1499.00, 1, 'http://example.com/images/epic_armor.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_002'), 'SPU_GAME_ITEM_002',
    '这是一款限量版稀有防具NFT，由游戏装备设计师精心打造，拥有独特的外观和防护效果，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '游戏道具NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_002'), 'SPU_GAME_ITEM_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"道具类型":"防具","创作工具":"ZBrush+Substance Painter","艺术风格":"奇幻/史诗","多边形数":"25K-35K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_002'), 'SPU_GAME_ITEM_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Armor Smith","创作时间":"2023-05-20","区块链平台":"Ethereum","发行数量":"90","作品编号":"GITEM2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_002'), 'SPU_GAME_ITEM_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"防具类型":["头盔","胸甲","护腕","护腿","盾牌"],"材质风格":["龙鳞","符文钢","暗影织物","光明水晶","远古金属"]}', 
3, 1, 1, 0);

-- 商品3: 魔法宠物NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_ITEM_003', '魔法宠物NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '131000'), '131000',
    80, 95, 'MagicPet', '限量版魔法宠物NFT，跨游戏平台使用',
    1399.00, 1699.00, 1, 'http://example.com/images/magic_pet.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_003'), 'SPU_GAME_ITEM_003',
    '这是一款限量版魔法宠物NFT，由生物设计师精心打造，拥有独特的外观和特殊能力，可在支持NFT资产的多个游戏平台中作为伙伴或坐骑使用，是收藏家和游戏玩家的珍贵资产。',
    '游戏道具NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_003'), 'SPU_GAME_ITEM_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"道具类型":"宠物/伙伴","创作工具":"Maya+Substance Painter","艺术风格":"奇幻/可爱","多边形数":"15K-25K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_003'), 'SPU_GAME_ITEM_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Creature Creator","创作时间":"2023-06-25","区块链平台":"Ethereum","发行数量":"95","作品编号":"GITEM2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_003'), 'SPU_GAME_ITEM_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"生物类型":["龙","凤凰","狮鹫","精灵","幽灵"],"特殊能力":["飞行","治疗","元素掌控","隐形","传送"]}', 
3, 1, 1, 0);

-- 商品4: 神秘法术卷轴NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_ITEM_004', '神秘法术卷轴NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '131000'), '131000',
    70, 85, 'MysticScroll', '限量版神秘法术卷轴NFT，跨游戏平台使用',
    999.00, 1299.00, 1, 'http://example.com/images/mystic_scroll.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_004'), 'SPU_GAME_ITEM_004',
    '这是一款限量版神秘法术卷轴NFT，由魔法设计师精心打造，包含独特的视觉效果和法术动画，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '游戏道具NFT、区块链所有权证书、特效文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_004'), 'SPU_GAME_ITEM_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"道具类型":"法术/技能","创作工具":"After Effects+Unity","艺术风格":"神秘/魔法","特效复杂度":"高"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_004'), 'SPU_GAME_ITEM_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Spell Weaver","创作时间":"2023-07-15","区块链平台":"Ethereum","发行数量":"85","作品编号":"GITEM2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_004'), 'SPU_GAME_ITEM_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"法术类型":["攻击","防御","治疗","控制","召唤"],"元素属性":["火","水","风","土","光","暗","时间"]}', 
3, 1, 1, 0);

-- 商品5: 稀有游戏载具NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_ITEM_005', '稀有游戏载具NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '131000'), '131000',
    65, 80, 'RareVehicle', '限量版稀有游戏载具NFT，跨游戏平台使用',
    1599.00, 1899.00, 1, 'http://example.com/images/rare_vehicle.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_005'), 'SPU_GAME_ITEM_005',
    '这是一款限量版稀有游戏载具NFT，由载具设计师精心打造，拥有独特的外观和特殊功能，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '游戏道具NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_005'), 'SPU_GAME_ITEM_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"道具类型":"载具","创作工具":"3ds Max+Substance Painter","艺术风格":"科幻/奇幻","多边形数":"30K-50K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_005'), 'SPU_GAME_ITEM_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Vehicle Engineer","创作时间":"2023-08-10","区块链平台":"Ethereum","发行数量":"80","作品编号":"GITEM2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_005'), 'SPU_GAME_ITEM_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"载具类型":["飞行器","陆地车辆","水下载具","太空船","机甲"],"特殊功能":["隐形","武装","加速","变形","传送"]}', 
3, 1, 1, 0);


-- ================ 9. 游戏资产 - 游戏角色NFT (132000) ================

-- 商品1: 传奇英雄角色NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_CHAR_001', '传奇英雄角色NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '132000'), '132000',
    60, 100, 'LegendaryHero', '限量版传奇英雄角色NFT，跨游戏平台使用',
    2499.00, 2999.00, 1, 'http://example.com/images/legendary_hero.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_001'), 'SPU_GAME_CHAR_001',
    '这是一款限量版传奇英雄角色NFT，由游戏角色设计师精心打造，拥有独特的外观、技能和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '游戏角色NFT、区块链所有权证书、3D模型文件、角色背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_001'), 'SPU_GAME_CHAR_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"角色类型":"英雄","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"史诗/奇幻","多边形数":"50K-80K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_001'), 'SPU_GAME_CHAR_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Hero Creator","创作时间":"2023-04-05","区块链平台":"Ethereum","发行数量":"100","作品编号":"GCHAR2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_001'), 'SPU_GAME_CHAR_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"职业":["战士","法师","刺客","射手","坦克"],"种族":["人类","精灵","矮人","兽人","龙裔"]}', 
3, 1, 1, 0);

-- 商品2: 稀有怪物角色NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_CHAR_002', '稀有怪物角色NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '132000'), '132000',
    55, 85, 'RareMonster', '限量版稀有怪物角色NFT，跨游戏平台使用',
    1999.00, 2499.00, 1, 'http://example.com/images/rare_monster.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_002'), 'SPU_GAME_CHAR_002',
    '这是一款限量版稀有怪物角色NFT，由生物设计师精心打造，拥有独特的外观、能力和生态背景，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '游戏角色NFT、区块链所有权证书、3D模型文件、角色背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_002'), 'SPU_GAME_CHAR_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"角色类型":"怪物","创作工具":"ZBrush+3ds Max+Substance Painter","艺术风格":"恐怖/奇幻","多边形数":"40K-70K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_002'), 'SPU_GAME_CHAR_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Monster Designer","创作时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"85","作品编号":"GCHAR2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_002'), 'SPU_GAME_CHAR_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"怪物类型":["亡灵","元素","野兽","异形","构造体"],"特殊能力":["腐蚀","隐形","再生","心灵控制","元素操控"]}', 
3, 1, 1, 0);

-- 商品3: 机甲战士角色NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_CHAR_003', '机甲战士角色NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '132000'), '132000',
    65, 90, 'MechWarrior', '限量版机甲战士角色NFT，跨游戏平台使用',
    2299.00, 2799.00, 1, 'http://example.com/images/mech_warrior.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_003'), 'SPU_GAME_CHAR_003',
    '这是一款限量版机甲战士角色NFT，由机械设计师精心打造，拥有独特的外观、武器系统和技术背景，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '游戏角色NFT、区块链所有权证书、3D模型文件、角色背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_003'), 'SPU_GAME_CHAR_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"角色类型":"机甲","创作工具":"3ds Max+Substance Painter","艺术风格":"科幻/机械","多边形数":"60K-90K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_003'), 'SPU_GAME_CHAR_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Mech Engineer","创作时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"90","作品编号":"GCHAR2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_003'), 'SPU_GAME_CHAR_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"机甲类型":["轻型","中型","重型","超重型"],"武器系统":["能量武器","实弹武器","导弹系统","近战武器","特殊武器"]}', 
3, 1, 1, 0);

-- 商品4: 神话生物角色NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_CHAR_004', '神话生物角色NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '132000'), '132000',
    50, 80, 'MythicalBeing', '限量版神话生物角色NFT，跨游戏平台使用',
    2199.00, 2699.00, 1, 'http://example.com/images/mythical_being.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_004'), 'SPU_GAME_CHAR_004',
    '这是一款限量版神话生物角色NFT，由神话概念艺术家精心打造，基于世界各地神话传说，拥有独特的外观、神力和背景故事，可在支持NFT资产的多个游戏平台中使用。',
    '游戏角色NFT、区块链所有权证书、3D模型文件、角色背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_004'), 'SPU_GAME_CHAR_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"角色类型":"神话生物","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"神话/奇幻","多边形数":"45K-75K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_004'), 'SPU_GAME_CHAR_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Myth Creator","创作时间":"2023-07-25","区块链平台":"Ethereum","发行数量":"80","作品编号":"GCHAR2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_004'), 'SPU_GAME_CHAR_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"神话体系":["希腊","北欧","东方","埃及","玛雅"],"神力属性":["创造","毁灭","自然","命运","时间"]}', 
3, 1, 1, 0);

-- 商品5: 未来战士角色NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_CHAR_005', '未来战士角色NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '132000'), '132000',
    70, 95, 'FutureWarrior', '限量版未来战士角色NFT，跨游戏平台使用',
    2399.00, 2899.00, 1, 'http://example.com/images/future_warrior.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_005'), 'SPU_GAME_CHAR_005',
    '这是一款限量版未来战士角色NFT，由科幻概念艺术家精心打造，设定在未来世界，拥有高科技装备和能力，可在支持NFT资产的多个游戏平台中使用。',
    '游戏角色NFT、区块链所有权证书、3D模型文件、角色背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_005'), 'SPU_GAME_CHAR_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"角色类型":"未来战士","创作工具":"Blender+Substance Painter","艺术风格":"科幻/赛博朋克","多边形数":"55K-85K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_005'), 'SPU_GAME_CHAR_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Future Designer","创作时间":"2023-08-30","区块链平台":"Ethereum","发行数量":"95","作品编号":"GCHAR2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_005'), 'SPU_GAME_CHAR_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"战士类型":["基因强化","机械改造","量子战士","纳米技术","心灵能力"],"科技特性":["隐形技术","能量护盾","时间操控","重力控制","生物武器"]}', 
3, 1, 1, 0);


-- ================ 10. 游戏资产 - 游戏土地NFT (133000) ================

-- 商品1: 元宇宙黄金地段NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_LAND_001', '元宇宙黄金地段NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '133000'), '133000',
    40, 100, 'PrimeLand', '限量版元宇宙黄金地段NFT，核心商业区位置',
    9999.00, 12999.00, 1, 'http://example.com/images/prime_land.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_001'), 'SPU_GAME_LAND_001',
    '这是一块限量版元宇宙黄金地段NFT，位于知名元宇宙平台的核心商业区，交通便利，人流量大，适合建设商业设施、展示空间或举办活动，是数字地产投资的优质选择。',
    '虚拟土地NFT、区块链所有权证书、地块坐标文件、开发指南',
    '区块链永久认证，资产真实性终身保障，地块技术支持，平台更新适配';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_001'), 'SPU_GAME_LAND_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"资产类型":"虚拟土地","所属平台":"Decentraland","地块位置":"核心商业区","地块面积":"16x16"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_001'), 'SPU_GAME_LAND_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"开发商":"Meta Estates","发布时间":"2023-04-01","区块链平台":"Ethereum","发行数量":"100","地块编号":"LAND2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_001'), 'SPU_GAME_LAND_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"建筑高度限制":["无限制"],"周边设施":["中央广场","商业中心","活动场所","交通枢纽"],"开发权限":["完全开发权","商业使用权","转售权"]}', 
3, 1, 1, 0);


-- 商品2: 奇幻世界地块NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_LAND_002', '奇幻世界地块NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '133000'), '133000',
    35, 80, 'FantasyLand', '限量版奇幻世界地块NFT，魔法森林区域',
    7999.00, 9999.00, 1, 'http://example.com/images/fantasy_land.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_002'), 'SPU_GAME_LAND_002',
    '这是一块限量版奇幻世界地块NFT，位于知名元宇宙平台的魔法森林区域，环境优美，资源丰富，适合建设奇幻主题场所、游戏副本或收藏展示，是数字地产投资的优质选择。',
    '虚拟土地NFT、区块链所有权证书、地块坐标文件、开发指南',
    '区块链永久认证，资产真实性终身保障，地块技术支持，平台更新适配';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_002'), 'SPU_GAME_LAND_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"资产类型":"虚拟土地","所属平台":"The Sandbox","地块位置":"魔法森林区","地块面积":"12x12"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_002'), 'SPU_GAME_LAND_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"开发商":"Fantasy Realms","发布时间":"2023-05-10","区块链平台":"Ethereum","发行数量":"80","地块编号":"LAND2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_002'), 'SPU_GAME_LAND_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"地形特点":["森林","湖泊","山丘","魔法泉水"],"特殊资源":["魔法水晶","奇幻生物","古代遗迹"],"开发权限":["完全开发权","游戏开发权","转售权"]}', 
3, 1, 1, 0);

-- 商品3: 科幻城市地块NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_LAND_003', '科幻城市地块NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '133000'), '133000',
    45, 90, 'CyberLand', '限量版科幻城市地块NFT，高科技区域',
    8999.00, 10999.00, 1, 'http://example.com/images/cyber_land.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_003'), 'SPU_GAME_LAND_003',
    '这是一块限量版科幻城市地块NFT，位于知名元宇宙平台的高科技区域，未来感十足，适合建设科技展示中心、虚拟实验室或赛博朋克风格场所，是数字地产投资的优质选择。',
    '虚拟土地NFT、区块链所有权证书、地块坐标文件、开发指南',
    '区块链永久认证，资产真实性终身保障，地块技术支持，平台更新适配';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_003'), 'SPU_GAME_LAND_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"资产类型":"虚拟土地","所属平台":"Somnium Space","地块位置":"高科技区","地块面积":"14x14"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_003'), 'SPU_GAME_LAND_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"开发商":"Cyber Estates","发布时间":"2023-06-15","区块链平台":"Ethereum","发行数量":"90","地块编号":"LAND2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_003'), 'SPU_GAME_LAND_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"地形特点":["高楼","全息投影区","能源中心","交通网络"],"特殊资源":["数据节点","能源核心","AI中心"],"开发权限":["完全开发权","科技展示权","转售权"]}', 
3, 1, 1, 0);

-- 商品4: 海洋世界地块NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_LAND_004', '海洋世界地块NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '133000'), '133000',
    30, 75, 'OceanLand', '限量版海洋世界地块NFT，水下王国区域',
    7499.00, 9499.00, 1, 'http://example.com/images/ocean_land.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_004'), 'SPU_GAME_LAND_004',
    '这是一块限量版海洋世界地块NFT，位于知名元宇宙平台的水下王国区域，景色壮观，资源独特，适合建设海洋主题场所、水下探险游戏或展示中心，是数字地产投资的优质选择。',
    '虚拟土地NFT、区块链所有权证书、地块坐标文件、开发指南',
    '区块链永久认证，资产真实性终身保障，地块技术支持，平台更新适配';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_004'), 'SPU_GAME_LAND_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"资产类型":"虚拟土地","所属平台":"Cryptovoxels","地块位置":"水下王国区","地块面积":"10x10"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_004'), 'SPU_GAME_LAND_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"开发商":"Ocean Realms","发布时间":"2023-07-20","区块链平台":"Ethereum","发行数量":"75","地块编号":"LAND2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_004'), 'SPU_GAME_LAND_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"地形特点":["珊瑚礁","深海峡谷","海底洞穴","热液喷口"],"特殊资源":["珍珠","海底宝藏","稀有海洋生物"],"开发权限":["完全开发权","海洋主题开发权","转售权"]}', 
3, 1, 1, 0);

-- 商品5: 太空基地地块NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_LAND_005', '太空基地地块NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '133000'), '133000',
    25, 60, 'SpaceLand', '限量版太空基地地块NFT，星际前哨区域',
    8499.00, 10499.00, 1, 'http://example.com/images/space_land.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_005'), 'SPU_GAME_LAND_005',
    '这是一块限量版太空基地地块NFT，位于知名元宇宙平台的星际前哨区域，视野开阔，资源丰富，适合建设太空主题场所、星际探险游戏或科幻展示中心，是数字地产投资的优质选择。',
    '虚拟土地NFT、区块链所有权证书、地块坐标文件、开发指南',
    '区块链永久认证，资产真实性终身保障，地块技术支持，平台更新适配';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_005'), 'SPU_GAME_LAND_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"资产类型":"虚拟土地","所属平台":"Star Atlas","地块位置":"星际前哨区","地块面积":"15x15"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_005'), 'SPU_GAME_LAND_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"开发商":"Space Pioneers","发布时间":"2023-08-25","区块链平台":"Solana","发行数量":"60","地块编号":"LAND2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_005'), 'SPU_GAME_LAND_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"地形特点":["太空站","陨石带","星际港口","观测站"],"特殊资源":["稀有矿物","外星技术","星际能源"],"开发权限":["完全开发权","太空主题开发权","转售权"]}', 
3, 1, 1, 0);


-- ================ 11. 游戏资产 - 游戏皮肤NFT (134000) ================

-- 商品1: 传奇武器皮肤NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_SKIN_001', '传奇武器皮肤NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '134000'), '134000',
    85, 100, 'LegendarySkin', '限量版传奇武器皮肤NFT，跨游戏平台使用',
    899.00, 1199.00, 1, 'http://example.com/images/legendary_weapon_skin.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_001'), 'SPU_GAME_SKIN_001',
    '这是一款限量版传奇武器皮肤NFT，由游戏艺术家精心打造，拥有独特的外观和特效，可在支持NFT资产的多个游戏平台中使用，为您的游戏武器增添独特魅力。',
    '皮肤NFT、区块链所有权证书、材质文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_001'), 'SPU_GAME_SKIN_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"皮肤类型":"武器皮肤","创作工具":"Substance Painter","艺术风格":"奇幻/史诗","适用武器":"多种"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_001'), 'SPU_GAME_SKIN_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Skin Master","创作时间":"2023-04-10","区块链平台":"Ethereum","发行数量":"100","作品编号":"GSKIN2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_001'), 'SPU_GAME_SKIN_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"皮肤风格":["龙焰","寒冰","暗影","神圣","远古"],"特效":["粒子效果","光晕","轨迹","声音"]}', 
3, 1, 1, 0);


-- 商品2: 稀有角色皮肤NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_SKIN_002', '稀有角色皮肤NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '134000'), '134000',
    80, 95, 'RareSkin', '限量版稀有角色皮肤NFT，跨游戏平台使用',
    999.00, 1299.00, 1, 'http://example.com/images/rare_character_skin.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_002'), 'SPU_GAME_SKIN_002',
    '这是一款限量版稀有角色皮肤NFT，由游戏角色设计师精心打造，拥有独特的外观和动画效果，可在支持NFT资产的多个游戏平台中使用，为您的游戏角色增添独特魅力。',
    '皮肤NFT、区块链所有权证书、材质文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_002'), 'SPU_GAME_SKIN_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"皮肤类型":"角色皮肤","创作工具":"Blender+Substance Painter","艺术风格":"奇幻/科幻","适用角色":"多种"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_002'), 'SPU_GAME_SKIN_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Character Artist","创作时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"95","作品编号":"GSKIN2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_002'), 'SPU_GAME_SKIN_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"皮肤主题":["英雄","恶魔","机械","元素","神话"],"特殊效果":["自定义动画","声音效果","粒子特效","光效"]}', 
3, 1, 1, 0);

-- 商品3: 限定载具皮肤NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_SKIN_003', '限定载具皮肤NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '134000'), '134000',
    70, 85, 'LimitedVehicleSkin', '限量版载具皮肤NFT，跨游戏平台使用',
    799.00, 1099.00, 1, 'http://example.com/images/limited_vehicle_skin.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_003'), 'SPU_GAME_SKIN_003',
    '这是一款限量版载具皮肤NFT，由游戏载具设计师精心打造，拥有独特的外观和特效，可在支持NFT资产的多个游戏平台中使用，为您的游戏载具增添独特魅力。',
    '皮肤NFT、区块链所有权证书、材质文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_003'), 'SPU_GAME_SKIN_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"皮肤类型":"载具皮肤","创作工具":"3ds Max+Substance Painter","艺术风格":"科幻/赛博朋克","适用载具":"多种"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_003'), 'SPU_GAME_SKIN_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Vehicle Designer","创作时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"85","作品编号":"GSKIN2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_003'), 'SPU_GAME_SKIN_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"载具类型":["飞行器","陆地车辆","水下载具","太空船"],"特效":["尾迹","引擎光效","声音","环境交互"]}', 
3, 1, 1, 0);

-- 商品4: 传说级装备皮肤NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_SKIN_004', '传说级装备皮肤NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '134000'), '134000',
    65, 80, 'MythicGearSkin', '限量版传说级装备皮肤NFT，跨游戏平台使用',
    1099.00, 1399.00, 1, 'http://example.com/images/mythic_gear_skin.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_004'), 'SPU_GAME_SKIN_004',
    '这是一款限量版传说级装备皮肤NFT，由游戏装备设计师精心打造，拥有独特的外观和特效，可在支持NFT资产的多个游戏平台中使用，为您的游戏装备增添独特魅力。',
    '皮肤NFT、区块链所有权证书、材质文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_004'), 'SPU_GAME_SKIN_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"皮肤类型":"装备皮肤","创作工具":"ZBrush+Substance Painter","艺术风格":"神话/史诗","适用装备":"多种"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_004'), 'SPU_GAME_SKIN_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Mythic Artist","创作时间":"2023-07-25","区块链平台":"Ethereum","发行数量":"80","作品编号":"GSKIN2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_004'), 'SPU_GAME_SKIN_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"装备类型":["头盔","胸甲","护腕","护腿","武器"],"神话主题":["北欧","希腊","东方","埃及","亚特兰蒂斯"]}', 
3, 1, 1, 0);

-- 商品5: 科幻宠物皮肤NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_SKIN_005', '科幻宠物皮肤NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '134000'), '134000',
    75, 90, 'SciFiPetSkin', '限量版科幻宠物皮肤NFT，跨游戏平台使用',
    699.00, 999.00, 1, 'http://example.com/images/scifi_pet_skin.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_005'), 'SPU_GAME_SKIN_005',
    '这是一款限量版科幻宠物皮肤NFT，由游戏生物设计师精心打造，拥有独特的外观和特效，可在支持NFT资产的多个游戏平台中使用，为您的游戏宠物增添独特魅力。',
    '皮肤NFT、区块链所有权证书、材质文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_005'), 'SPU_GAME_SKIN_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"皮肤类型":"宠物皮肤","创作工具":"Blender+Substance Painter","艺术风格":"科幻/生物科技","适用宠物":"多种"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_005'), 'SPU_GAME_SKIN_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Creature Designer","创作时间":"2023-08-30","区块链平台":"Ethereum","发行数量":"90","作品编号":"GSKIN2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_005'), 'SPU_GAME_SKIN_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"宠物类型":["陆地生物","飞行生物","水生生物","机械生物","能量生物"],"科技特性":["生物发光","机械部件","能量场","全息投影"]}', 
3, 1, 1, 0);


-- ================ 12. 游戏资产 - 游戏装备NFT (135000) ================

-- 商品1: 传奇套装NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_EQUIP_001', '传奇套装NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '135000'), '135000',
    60, 100, 'LegendarySet', '限量版传奇套装NFT，跨游戏平台使用',
    2999.00, 3999.00, 1, 'http://example.com/images/legendary_set.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_001'), 'SPU_GAME_EQUIP_001',
    '这是一套限量版传奇套装NFT，由游戏装备设计师精心打造，包含完整的武器防具套装，拥有独特的外观和特效，可在支持NFT资产的多个游戏平台中使用。',
    '套装NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_001'), 'SPU_GAME_EQUIP_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"装备类型":"全套装备","创作工具":"ZBrush+Substance Painter","艺术风格":"史诗/奇幻","多边形数":"100K-150K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_001'), 'SPU_GAME_EQUIP_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Legendary Smith","创作时间":"2023-04-05","区块链平台":"Ethereum","发行数量":"100","作品编号":"GEQUIP2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_001'), 'SPU_GAME_EQUIP_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"套装部件":["头盔","胸甲","护腕","护腿","武器","盾牌"],"套装主题":["龙骑士","暗夜猎手","圣光守卫","元素使者","远古战神"]}', 
3, 1, 1, 0);


-- 商品2: 稀有武器NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_EQUIP_002', '稀有武器NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '135000'), '135000',
    75, 90, 'RareWeapon', '限量版稀有武器NFT，跨游戏平台使用',
    1999.00, 2499.00, 1, 'http://example.com/images/rare_weapon.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_002'), 'SPU_GAME_EQUIP_002',
    '这是一款限量版稀有武器NFT，由武器设计师精心打造，拥有独特的外观和特效，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '武器NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_002'), 'SPU_GAME_EQUIP_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"装备类型":"武器","创作工具":"Blender+Substance Painter","艺术风格":"史诗/奇幻","多边形数":"30K-50K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_002'), 'SPU_GAME_EQUIP_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Weapon Artisan","创作时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"90","作品编号":"GEQUIP2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_002'), 'SPU_GAME_EQUIP_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"武器类型":["剑","斧","弓","法杖","枪"],"元素属性":["火","冰","雷","暗","光"]}', 
3, 1, 1, 0);

-- 商品3: 神话防具NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_EQUIP_003', '神话防具NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '135000'), '135000',
    65, 85, 'MythicArmor', '限量版神话防具NFT，跨游戏平台使用',
    2499.00, 2999.00, 1, 'http://example.com/images/mythic_armor.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_003'), 'SPU_GAME_EQUIP_003',
    '这是一款限量版神话防具NFT，由装备设计师精心打造，基于古代神话传说，拥有独特的外观和特效，可在支持NFT资产的多个游戏平台中使用。',
    '防具NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_003'), 'SPU_GAME_EQUIP_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"装备类型":"防具","创作工具":"ZBrush+Substance Painter","艺术风格":"神话/史诗","多边形数":"40K-60K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_003'), 'SPU_GAME_EQUIP_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Myth Armorer","创作时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"85","作品编号":"GEQUIP2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_003'), 'SPU_GAME_EQUIP_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"防具部位":["头盔","胸甲","护腕","护腿","披风"],"神话体系":["希腊","北欧","东方","埃及","亚特兰蒂斯"]}', 
3, 1, 1, 0);

-- 商品4: 科幻装备NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_EQUIP_004', '科幻装备NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '135000'), '135000',
    70, 90, 'SciFiGear', '限量版科幻装备NFT，跨游戏平台使用',
    2299.00, 2799.00, 1, 'http://example.com/images/scifi_gear.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_004'), 'SPU_GAME_EQUIP_004',
    '这是一款限量版科幻装备NFT，由未来科技概念设计师精心打造，拥有未来感十足的外观和特效，可在支持NFT资产的多个游戏平台中使用。',
    '装备NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_004'), 'SPU_GAME_EQUIP_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"装备类型":"科技装备","创作工具":"3ds Max+Substance Painter","艺术风格":"科幻/赛博朋克","多边形数":"45K-65K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_004'), 'SPU_GAME_EQUIP_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Future Engineer","创作时间":"2023-07-25","区块链平台":"Ethereum","发行数量":"90","作品编号":"GEQUIP2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_004'), 'SPU_GAME_EQUIP_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"装备功能":["隐形","飞行","能量护盾","增强视觉","武器系统"],"科技特性":["纳米技术","全息投影","能量转换","人工智能","量子技术"]}', 
3, 1, 1, 0);

-- 商品5: 元素法器NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_EQUIP_005', '元素法器NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '135000'), '135000',
    55, 80, 'ElementalArtifact', '限量版元素法器NFT，跨游戏平台使用',
    2199.00, 2699.00, 1, 'http://example.com/images/elemental_artifact.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_005'), 'SPU_GAME_EQUIP_005',
    '这是一款限量版元素法器NFT，由奇幻装备设计师精心打造，蕴含强大的元素力量，拥有独特的外观和特效，可在支持NFT资产的多个游戏平台中使用。',
    '法器NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_005'), 'SPU_GAME_EQUIP_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"装备类型":"法器","创作工具":"Blender+Substance Painter","艺术风格":"奇幻/元素","多边形数":"35K-55K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_005'), 'SPU_GAME_EQUIP_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Elemental Crafter","创作时间":"2023-08-30","区块链平台":"Ethereum","发行数量":"80","作品编号":"GEQUIP2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_005'), 'SPU_GAME_EQUIP_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"法器类型":["法杖","宝珠","符文石","魔法书","神器"],"元素属性":["火","水","风","地","雷","光","暗"]}', 
3, 1, 1, 0);


-- ================ 13. 游戏资产 - 游戏宠物NFT (136000) ================

-- 商品1: 传奇龙宠NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_PET_001', '传奇龙宠NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '136000'), '136000',
    60, 100, 'LegendaryDragon', '限量版传奇龙宠NFT，跨游戏平台使用',
    2499.00, 2999.00, 1, 'http://example.com/images/legendary_dragon.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_001'), 'SPU_GAME_PET_001',
    '这是一款限量版传奇龙宠NFT，由游戏生物设计师精心打造，拥有独特的外观、能力和成长系统，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '宠物NFT、区块链所有权证书、3D模型文件、宠物背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_001'), 'SPU_GAME_PET_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"宠物类型":"龙","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"奇幻/史诗","多边形数":"50K-80K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_001'), 'SPU_GAME_PET_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Dragon Master","创作时间":"2023-04-05","区块链平台":"Ethereum","发行数量":"100","作品编号":"GPET2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_001'), 'SPU_GAME_PET_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"龙种类":["火龙","冰龙","雷龙","暗影龙","神圣龙"],"特殊能力":["飞行","元素吐息","护盾","治疗","召唤"]}', 
3, 1, 1, 0);

-- 商品2: 稀有神兽NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_PET_002', '稀有神兽NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '136000'), '136000',
    55, 85, 'MythicalBeast', '限量版稀有神兽NFT，跨游戏平台使用',
    2299.00, 2799.00, 1, 'http://example.com/images/mythical_beast.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_002'), 'SPU_GAME_PET_002',
    '这是一款限量版稀有神兽NFT，由神话生物设计师精心打造，基于世界各地神话传说，拥有独特的外观、能力和成长系统，可在支持NFT资产的多个游戏平台中使用。',
    '宠物NFT、区块链所有权证书、3D模型文件、宠物背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_002'), 'SPU_GAME_PET_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"宠物类型":"神兽","创作工具":"ZBrush+Blender+Substance Painter","艺术风格":"神话/史诗","多边形数":"45K-75K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_002'), 'SPU_GAME_PET_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Myth Beast Creator","创作时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"85","作品编号":"GPET2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_002'), 'SPU_GAME_PET_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"神兽类型":["凤凰","麒麟","九尾狐","独角兽","海马"],"神话体系":["东方","西方","北欧","埃及","玛雅"]}', 
3, 1, 1, 0);

-- 商品3: 机械宠物NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_PET_003', '机械宠物NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '136000'), '136000',
    65, 90, 'MechPet', '限量版机械宠物NFT，跨游戏平台使用',
    1999.00, 2499.00, 1, 'http://example.com/images/mech_pet.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_003'), 'SPU_GAME_PET_003',
    '这是一款限量版机械宠物NFT，由科幻机械设计师精心打造，拥有独特的外观、功能和升级系统，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '宠物NFT、区块链所有权证书、3D模型文件、宠物背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_003'), 'SPU_GAME_PET_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"宠物类型":"机械生物","创作工具":"3ds Max+Substance Painter","艺术风格":"科幻/机械","多边形数":"40K-70K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_003'), 'SPU_GAME_PET_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Mech Engineer","创作时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"90","作品编号":"GPET2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_003'), 'SPU_GAME_PET_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"机械类型":["四足机械兽","飞行无人机","水下机械鱼","战斗机器人","工程机械"],"特殊功能":["侦察","战斗","采集","辅助","变形"]}', 
3, 1, 1, 0);

-- 商品4: 元素精灵NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_PET_004', '元素精灵NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '136000'), '136000',
    70, 95, 'ElementalSpirit', '限量版元素精灵NFT，跨游戏平台使用',
    1899.00, 2399.00, 1, 'http://example.com/images/elemental_spirit.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_004'), 'SPU_GAME_PET_004',
    '这是一款限量版元素精灵NFT，由奇幻生物设计师精心打造，拥有独特的元素属性、外观和能力，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '宠物NFT、区块链所有权证书、3D模型文件、宠物背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_004'), 'SPU_GAME_PET_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"宠物类型":"元素精灵","创作工具":"Blender+Substance Painter","艺术风格":"奇幻/元素","多边形数":"35K-65K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_004'), 'SPU_GAME_PET_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Elemental Artist","创作时间":"2023-07-25","区块链平台":"Ethereum","发行数量":"95","作品编号":"GPET2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_004'), 'SPU_GAME_PET_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"元素类型":["火","水","风","地","雷","光","暗"],"精灵形态":["人形","兽形","鸟形","鱼形","植物形"]}', 
3, 1, 1, 0);

-- 商品5: 外星生物NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_PET_005', '外星生物NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '136000'), '136000',
    50, 80, 'AlienCreature', '限量版外星生物NFT，跨游戏平台使用',
    2099.00, 2599.00, 1, 'http://example.com/images/alien_creature.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_005'), 'SPU_GAME_PET_005',
    '这是一款限量版外星生物NFT，由科幻生物设计师精心打造，拥有独特的外观、能力和进化系统，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '宠物NFT、区块链所有权证书、3D模型文件、宠物背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_005'), 'SPU_GAME_PET_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"宠物类型":"外星生物","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"科幻/异形","多边形数":"45K-75K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_005'), 'SPU_GAME_PET_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Alien Designer","创作时间":"2023-08-30","区块链平台":"Ethereum","发行数量":"80","作品编号":"GPET2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_005'), 'SPU_GAME_PET_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"生物类型":["昆虫型","爬行型","哺乳型","植物型","晶体型"],"特殊能力":["心灵感应","变形","隐形","再生","能量操控"]}', 
3, 1, 1, 0);


-- ================ 14. 游戏资产 - 游戏道具NFT (137000) ================

-- 商品1: 传奇魔法卷轴NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_ITEM_001', '传奇魔法卷轴NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '137000'), '137000',
    60, 100, 'LegendaryScroll', '限量版传奇魔法卷轴NFT，跨游戏平台使用',
    1499.00, 1999.00, 1, 'http://example.com/images/legendary_scroll.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_001'), 'SPU_GAME_ITEM_001',
    '这是一款限量版传奇魔法卷轴NFT，由游戏道具设计师精心打造，拥有独特的外观和特效，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '道具NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_001'), 'SPU_GAME_ITEM_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"道具类型":"魔法卷轴","创作工具":"Blender+Substance Painter","艺术风格":"奇幻/古代","多边形数":"15K-25K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_001'), 'SPU_GAME_ITEM_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Scroll Master","创作时间":"2023-04-10","区块链平台":"Ethereum","发行数量":"100","作品编号":"GITEM2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_001'), 'SPU_GAME_ITEM_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"卷轴类型":["召唤卷轴","传送卷轴","变形卷轴","元素卷轴","神圣卷轴"],"魔法效果":["召唤生物","空间传送","形态变化","元素爆发","神圣净化"]}', 
3, 1, 1, 0);

-- 商品2: 神秘宝箱NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_ITEM_002', '神秘宝箱NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '137000'), '137000',
    75, 90, 'MysteryChest', '限量版神秘宝箱NFT，跨游戏平台使用',
    1299.00, 1799.00, 1, 'http://example.com/images/mystery_chest.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_002'), 'SPU_GAME_ITEM_002',
    '这是一款限量版神秘宝箱NFT，由游戏道具设计师精心打造，拥有独特的外观和开启动画，可在支持NFT资产的多个游戏平台中使用，开启后有机会获得稀有游戏物品。',
    '道具NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_002'), 'SPU_GAME_ITEM_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"道具类型":"宝箱","创作工具":"Blender+Substance Painter","艺术风格":"奇幻/宝藏","多边形数":"20K-30K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_002'), 'SPU_GAME_ITEM_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Treasure Maker","创作时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"90","作品编号":"GITEM2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_002'), 'SPU_GAME_ITEM_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"宝箱类型":["古代宝箱","海盗宝箱","龙族宝箱","精灵宝箱","机械宝箱"],"稀有度":["普通","稀有","史诗","传说","神话"]}', 
3, 1, 1, 0);

-- 商品3: 魔法药水NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_ITEM_003', '魔法药水NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '137000'), '137000',
    85, 95, 'MagicPotion', '限量版魔法药水NFT，跨游戏平台使用',
    999.00, 1499.00, 1, 'http://example.com/images/magic_potion.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_003'), 'SPU_GAME_ITEM_003',
    '这是一款限量版魔法药水NFT，由游戏道具设计师精心打造，拥有独特的外观和粒子效果，可在支持NFT资产的多个游戏平台中使用，为角色提供各种增益效果。',
    '道具NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_003'), 'SPU_GAME_ITEM_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"道具类型":"药水","创作工具":"Blender+Substance Painter","艺术风格":"奇幻/炼金","多边形数":"10K-20K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_003'), 'SPU_GAME_ITEM_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Potion Master","创作时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"95","作品编号":"GITEM2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_003'), 'SPU_GAME_ITEM_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"药水类型":["治疗药水","魔力药水","力量药水","敏捷药水","抗性药水"],"效果持续时间":["短效","中效","长效","永久"]}', 
3, 1, 1, 0);

-- 商品4: 神器碎片NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_ITEM_004', '神器碎片NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '137000'), '137000',
    65, 85, 'ArtifactShard', '限量版神器碎片NFT，跨游戏平台使用',
    1799.00, 2299.00, 1, 'http://example.com/images/artifact_shard.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_004'), 'SPU_GAME_ITEM_004',
    '这是一款限量版神器碎片NFT，由游戏道具设计师精心打造，拥有独特的外观和能量效果，可在支持NFT资产的多个游戏平台中使用，收集完整套碎片可以合成强大神器。',
    '道具NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_004'), 'SPU_GAME_ITEM_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"道具类型":"神器碎片","创作工具":"ZBrush+Substance Painter","艺术风格":"史诗/神话","多边形数":"15K-25K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_004'), 'SPU_GAME_ITEM_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Artifact Creator","创作时间":"2023-07-25","区块链平台":"Ethereum","发行数量":"85","作品编号":"GITEM2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_004'), 'SPU_GAME_ITEM_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"神器类型":["武器神器","防具神器","饰品神器","法器神器","混合神器"],"碎片稀有度":["普通碎片","稀有碎片","史诗碎片","传说碎片"]}', 
3, 1, 1, 0);

-- 商品5: 科技装置NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_ITEM_005', '科技装置NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '137000'), '137000',
    70, 90, 'TechGadget', '限量版科技装置NFT，跨游戏平台使用',
    1599.00, 2099.00, 1, 'http://example.com/images/tech_gadget.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_005'), 'SPU_GAME_ITEM_005',
    '这是一款限量版科技装置NFT，由科幻道具设计师精心打造，拥有未来感十足的外观和特效，可在支持NFT资产的多个游戏平台中使用，为角色提供各种科技增强能力。',
    '道具NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_005'), 'SPU_GAME_ITEM_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"道具类型":"科技装置","创作工具":"3ds Max+Substance Painter","艺术风格":"科幻/赛博朋克","多边形数":"25K-40K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_005'), 'SPU_GAME_ITEM_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Tech Engineer","创作时间":"2023-08-30","区块链平台":"Ethereum","发行数量":"90","作品编号":"GITEM2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_005'), 'SPU_GAME_ITEM_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"装置类型":["扫描仪","能量发生器","传送装置","黑客工具","防御系统"],"科技特性":["隐形","扫描","能量操控","时空干扰","信息处理"]}', 
3, 1, 1, 0);

-- ================ 15. 游戏资产 - 游戏建筑NFT (138000) ================

-- 商品1: 奇幻城堡NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_BUILD_001', '奇幻城堡NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '138000'), '138000',
    40, 100, 'FantasyCastle', '限量版奇幻城堡NFT，跨游戏平台使用',
    4999.00, 5999.00, 1, 'http://example.com/images/fantasy_castle.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_001'), 'SPU_GAME_BUILD_001',
    '这是一款限量版奇幻城堡NFT，由游戏建筑设计师精心打造，拥有独特的外观和内部结构，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '建筑NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_001'), 'SPU_GAME_BUILD_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"建筑类型":"城堡","创作工具":"Blender+Substance Painter","艺术风格":"奇幻/中世纪","多边形数":"200K-300K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_001'), 'SPU_GAME_BUILD_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Castle Architect","创作时间":"2023-04-05","区块链平台":"Ethereum","发行数量":"100","作品编号":"GBUILD2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_001'), 'SPU_GAME_BUILD_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"建筑风格":["哥特式","罗马式","拜占庭式","东方式","精灵式"],"建筑规模":["小型","中型","大型","超大型"],"功能区域":["主堡","庭院","塔楼","城墙","地下室"]}', 
3, 1, 1, 0);

-- 商品2: 未来城市建筑NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_BUILD_002', '未来城市建筑NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '138000'), '138000',
    35, 90, 'FutureCity', '限量版未来城市建筑NFT，跨游戏平台使用',
    4599.00, 5599.00, 1, 'http://example.com/images/future_city.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_002'), 'SPU_GAME_BUILD_002',
    '这是一款限量版未来城市建筑NFT，由科幻建筑设计师精心打造，拥有未来感十足的外观和内部结构，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '建筑NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_002'), 'SPU_GAME_BUILD_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"建筑类型":"未来建筑","创作工具":"3ds Max+Substance Painter","艺术风格":"科幻/赛博朋克","多边形数":"250K-350K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_002'), 'SPU_GAME_BUILD_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Future Architect","创作时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"90","作品编号":"GBUILD2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_002'), 'SPU_GAME_BUILD_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"建筑风格":["高科技","生态融合","极简主义","浮空","地下"],"建筑规模":["小型","中型","大型","超大型"],"功能区域":["居住区","商业区","研究区","娱乐区","能源中心"]}', 
3, 1, 1, 0);

-- 商品3: 神秘神殿NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_BUILD_003', '神秘神殿NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '138000'), '138000',
    45, 85, 'MysticalTemple', '限量版神秘神殿NFT，跨游戏平台使用',
    4799.00, 5799.00, 1, 'http://example.com/images/mystical_temple.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_003'), 'SPU_GAME_BUILD_003',
    '这是一款限量版神秘神殿NFT，由古代建筑设计师精心打造，融合多种古代文明风格，拥有独特的外观和内部结构，可在支持NFT资产的多个游戏平台中使用。',
    '建筑NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_003'), 'SPU_GAME_BUILD_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"建筑类型":"神殿","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"古代/神秘","多边形数":"180K-280K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_003'), 'SPU_GAME_BUILD_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Temple Builder","创作时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"85","作品编号":"GBUILD2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_003'), 'SPU_GAME_BUILD_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"神殿风格":["埃及","玛雅","希腊","东方","亚特兰蒂斯"],"建筑规模":["小型","中型","大型","超大型"],"功能区域":["主殿","祭坛","密室","地下墓穴","藏宝室"]}', 
3, 1, 1, 0);

-- 商品4: 浮空岛屿NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_BUILD_004', '浮空岛屿NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '138000'), '138000',
    30, 80, 'FloatingIsland', '限量版浮空岛屿NFT，跨游戏平台使用',
    5299.00, 6299.00, 1, 'http://example.com/images/floating_island.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_004'), 'SPU_GAME_BUILD_004',
    '这是一款限量版浮空岛屿NFT，由奇幻环境设计师精心打造，拥有独特的地形和生态系统，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '建筑NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_004'), 'SPU_GAME_BUILD_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"建筑类型":"浮空岛屿","创作工具":"World Machine+Blender+Substance Painter","艺术风格":"奇幻/自然","多边形数":"300K-400K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_004'), 'SPU_GAME_BUILD_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Island Creator","创作时间":"2023-07-25","区块链平台":"Ethereum","发行数量":"80","作品编号":"GBUILD2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_004'), 'SPU_GAME_BUILD_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"岛屿风格":["热带","极地","沙漠","森林","火山"],"岛屿规模":["小型","中型","大型","超大型"],"地形特征":["瀑布","悬崖","洞穴","湖泊","奇观"]}', 
3, 1, 1, 0);

-- 商品5: 古代遗迹NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_BUILD_005', '古代遗迹NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '138000'), '138000',
    25, 75, 'AncientRuins', '限量版古代遗迹NFT，跨游戏平台使用',
    4399.00, 5399.00, 1, 'http://example.com/images/ancient_ruins.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_005'), 'SPU_GAME_BUILD_005',
    '这是一款限量版古代遗迹NFT，由历史建筑设计师精心打造，拥有独特的风化外观和神秘氛围，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '建筑NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_005'), 'SPU_GAME_BUILD_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"建筑类型":"遗迹","创作工具":"ZBrush+Blender+Substance Painter","艺术风格":"古代/神秘","多边形数":"220K-320K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_005'), 'SPU_GAME_BUILD_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Ruins Architect","创作时间":"2023-08-30","区块链平台":"Ethereum","发行数量":"75","作品编号":"GBUILD2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_005'), 'SPU_GAME_BUILD_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"遗迹风格":["罗马","玛雅","亚特兰蒂斯","东方","未知文明"],"遗迹规模":["小型","中型","大型","超大型"],"特殊区域":["祭坛","图书馆","宝库","机关室","传送门"]}', 
3, 1, 1, 0);


-- ================ 16. 游戏资产 - 游戏载具NFT (139000) ================

-- 商品1: 传奇飞船NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_VEHICLE_001', '传奇飞船NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '139000'), '139000',
    50, 100, 'LegendarySpaceship', '限量版传奇飞船NFT，跨游戏平台使用',
    3999.00, 4999.00, 1, 'http://example.com/images/legendary_spaceship.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_001'), 'SPU_GAME_VEHICLE_001',
    '这是一款限量版传奇飞船NFT，由科幻载具设计师精心打造，拥有独特的外观和性能，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '载具NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_001'), 'SPU_GAME_VEHICLE_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"载具类型":"飞船","创作工具":"3ds Max+Substance Painter","艺术风格":"科幻/未来","多边形数":"80K-120K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_001'), 'SPU_GAME_VEHICLE_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Spaceship Engineer","创作时间":"2023-04-05","区块链平台":"Ethereum","发行数量":"100","作品编号":"GVEHICLE2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_001'), 'SPU_GAME_VEHICLE_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"飞船类型":["战斗舰","探索舰","运输舰","旗舰","侦察舰"],"飞船规模":["小型","中型","大型","超大型"],"特殊功能":["隐形","跃迁","能量护盾","武器系统","采矿系统"]}', 
3, 1, 1, 0);

-- 商品2: 战斗机甲NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_VEHICLE_002', '战斗机甲NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '139000'), '139000',
    45, 90, 'BattleMech', '限量版战斗机甲NFT，跨游戏平台使用',
    3799.00, 4799.00, 1, 'http://example.com/images/battle_mech.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_002'), 'SPU_GAME_VEHICLE_002',
    '这是一款限量版战斗机甲NFT，由机械设计师精心打造，拥有独特的外观和武器系统，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '载具NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_002'), 'SPU_GAME_VEHICLE_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"载具类型":"机甲","创作工具":"ZBrush+3ds Max+Substance Painter","艺术风格":"科幻/机械","多边形数":"100K-150K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_002'), 'SPU_GAME_VEHICLE_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Mech Engineer","创作时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"90","作品编号":"GVEHICLE2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_002'), 'SPU_GAME_VEHICLE_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"机甲类型":["轻型机甲","中型机甲","重型机甲","超重型机甲","特种机甲"],"武器系统":["能量武器","实弹武器","导弹系统","近战武器","特殊武器"]}', 
3, 1, 1, 0);

-- 商品3: 奇幻坐骑NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_VEHICLE_003', '奇幻坐骑NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '139000'), '139000',
    55, 85, 'FantasyMount', '限量版奇幻坐骑NFT，跨游戏平台使用',
    2999.00, 3999.00, 1, 'http://example.com/images/fantasy_mount.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_003'), 'SPU_GAME_VEHICLE_003',
    '这是一款限量版奇幻坐骑NFT，由生物设计师精心打造，拥有独特的外观和特殊能力，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '载具NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_003'), 'SPU_GAME_VEHICLE_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"载具类型":"坐骑","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"奇幻/神话","多边形数":"60K-90K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_003'), 'SPU_GAME_VEHICLE_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Mount Creator","创作时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"85","作品编号":"GVEHICLE2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_003'), 'SPU_GAME_VEHICLE_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"坐骑类型":["飞行坐骑","陆地坐骑","水中坐骑","元素坐骑","神话坐骑"],"特殊能力":["飞行","高速移动","水下呼吸","元素抗性","隐形"]}', 
3, 1, 1, 0);

-- 商品4: 赛车NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_VEHICLE_004', '赛车NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '139000'), '139000',
    60, 95, 'RacingCar', '限量版赛车NFT，跨游戏平台使用',
    2799.00, 3799.00, 1, 'http://example.com/images/racing_car.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_004'), 'SPU_GAME_VEHICLE_004',
    '这是一款限量版赛车NFT，由汽车设计师精心打造，拥有独特的外观和性能参数，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '载具NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_004'), 'SPU_GAME_VEHICLE_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"载具类型":"赛车","创作工具":"3ds Max+Substance Painter","艺术风格":"现代/未来","多边形数":"70K-100K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_004'), 'SPU_GAME_VEHICLE_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Car Designer","创作时间":"2023-07-25","区块链平台":"Ethereum","发行数量":"95","作品编号":"GVEHICLE2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_004'), 'SPU_GAME_VEHICLE_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"赛车类型":["F1赛车","拉力赛车","街头赛车","未来赛车","越野赛车"],"性能特点":["高速","加速","操控","越野","耐久"]}', 
3, 1, 1, 0);

-- 商品5: 潜水艇NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_VEHICLE_005', '潜水艇NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '139000'), '139000',
    40, 80, 'Submarine', '限量版潜水艇NFT，跨游戏平台使用',
    3599.00, 4599.00, 1, 'http://example.com/images/submarine.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_005'), 'SPU_GAME_VEHICLE_005',
    '这是一款限量版潜水艇NFT，由海洋载具设计师精心打造，拥有独特的外观和深海探索能力，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '载具NFT、区块链所有权证书、3D模型文件、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_005'), 'SPU_GAME_VEHICLE_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"载具类型":"潜水艇","创作工具":"3ds Max+Substance Painter","艺术风格":"科幻/海洋","多边形数":"75K-110K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_005'), 'SPU_GAME_VEHICLE_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Submarine Engineer","创作时间":"2023-08-30","区块链平台":"Ethereum","发行数量":"80","作品编号":"GVEHICLE2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_VEHICLE_005'), 'SPU_GAME_VEHICLE_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"潜水艇类型":["探索型","战斗型","科研型","运输型","混合型"],"特殊功能":["深海潜行","声呐系统","武器系统","采集系统","隐形系统"]}', 
3, 1, 1, 0);

-- ================ 17. 游戏资产 - 游戏土地NFT (140000) ================

-- 商品1: 虚拟世界地块NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_LAND_001', '虚拟世界地块NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '140000'), '140000',
    30, 100, 'VirtualLand', '限量版虚拟世界地块NFT，元宇宙核心资产',
    9999.00, 12999.00, 1, 'http://example.com/images/virtual_land.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_001'), 'SPU_GAME_LAND_001',
    '这是一款限量版虚拟世界地块NFT，位于知名元宇宙平台的核心区域，拥有独特的地理位置和开发权限，可用于建造虚拟建筑、开展商业活动或举办活动，是元宇宙投资者的珍贵资产。',
    '土地NFT、区块链所有权证书、地块坐标文件、开发指南',
    '区块链永久认证，资产真实性终身保障，平台持续更新支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_001'), 'SPU_GAME_LAND_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"资产类型":"虚拟土地","所属平台":"Decentraland","土地面积":"16x16米","最大建筑高度":"无限制"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_001'), 'SPU_GAME_LAND_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"发行方":"Metaverse Holdings","发行时间":"2023-04-05","区块链平台":"Ethereum","发行数量":"100","地块编号":"LAND2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_001'), 'SPU_GAME_LAND_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"地块位置":["中心区","商业区","娱乐区","艺术区","住宅区"],"周边设施":["传送门","公共广场","知名建筑","交通枢纽","自然景观"]}', 
3, 1, 1, 0);


-- 商品2: 游戏世界岛屿NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_LAND_002', '游戏世界岛屿NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '140000'), '140000',
    25, 90, 'GameIsland', '限量版游戏世界岛屿NFT，元宇宙稀有资产',
    8999.00, 11999.00, 1, 'http://example.com/images/game_island.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_002'), 'SPU_GAME_LAND_002',
    '这是一款限量版游戏世界岛屿NFT，位于知名游戏平台的海洋世界中，拥有独特的地形和资源分布，可用于建造基地、开发资源或创建专属游戏玩法，是游戏投资者的珍贵资产。',
    '土地NFT、区块链所有权证书、岛屿坐标文件、开发指南',
    '区块链永久认证，资产真实性终身保障，平台持续更新支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_002'), 'SPU_GAME_LAND_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"资产类型":"游戏岛屿","所属平台":"Atlas Earth","土地面积":"500x500米","最大建筑数量":"50"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_002'), 'SPU_GAME_LAND_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"发行方":"Game World Holdings","发行时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"90","地块编号":"LAND2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_002'), 'SPU_GAME_LAND_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"岛屿类型":["热带岛屿","火山岛屿","冰川岛屿","沙漠岛屿","森林岛屿"],"资源丰富度":["稀缺","一般","丰富","极其丰富"],"特殊地形":["山脉","湖泊","洞穴","瀑布","峡谷"]}', 
3, 1, 1, 0);

-- 商品3: 虚拟商业地产NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_LAND_003', '虚拟商业地产NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '140000'), '140000',
    20, 85, 'VirtualEstate', '限量版虚拟商业地产NFT，元宇宙商业资产',
    12999.00, 15999.00, 1, 'http://example.com/images/virtual_estate.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_003'), 'SPU_GAME_LAND_003',
    '这是一款限量版虚拟商业地产NFT，位于知名元宇宙平台的商业区核心位置，拥有独特的商业价值和流量优势，可用于开设虚拟店铺、举办活动或出租获利，是元宇宙商业投资者的珍贵资产。',
    '土地NFT、区块链所有权证书、地产坐标文件、商业开发指南',
    '区块链永久认证，资产真实性终身保障，平台持续更新支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_003'), 'SPU_GAME_LAND_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"资产类型":"商业地产","所属平台":"The Sandbox","土地面积":"24x24米","最大建筑高度":"100米"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_003'), 'SPU_GAME_LAND_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"发行方":"Virtual Estate Group","发行时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"85","地块编号":"LAND2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_003'), 'SPU_GAME_LAND_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"地产位置":["商业中心","购物区","娱乐区","展览区","金融区"],"客流量":["低","中","高","极高"],"周边配套":["交通枢纽","知名品牌","公共设施","活动场所","景观"]}', 
3, 1, 1, 0);

-- 商品4: 游戏资源矿区NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_LAND_004', '游戏资源矿区NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '140000'), '140000',
    35, 80, 'ResourceMine', '限量版游戏资源矿区NFT，游戏经济核心资产',
    7999.00, 9999.00, 1, 'http://example.com/images/resource_mine.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_004'), 'SPU_GAME_LAND_004',
    '这是一款限量版游戏资源矿区NFT，位于知名游戏平台的资源丰富区域，拥有独特的资源分布和产出效率，可用于采集游戏资源、建造生产设施或出租获利，是游戏经济投资者的珍贵资产。',
    '土地NFT、区块链所有权证书、矿区坐标文件、资源开发指南',
    '区块链永久认证，资产真实性终身保障，平台持续更新支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_004'), 'SPU_GAME_LAND_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"资产类型":"资源矿区","所属平台":"Axie Infinity","土地面积":"300x300米","资源产出效率":"150%"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_004'), 'SPU_GAME_LAND_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"发行方":"Resource Holdings","发行时间":"2023-07-25","区块链平台":"Ethereum","发行数量":"80","地块编号":"LAND2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_004'), 'SPU_GAME_LAND_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"矿区类型":["金属矿区","能源矿区","宝石矿区","魔法矿区","混合矿区"],"资源种类":["稀有金属","能源晶体","宝石原石","魔法精华","混合资源"],"开采难度":["简单","中等","困难","极难"]}', 
3, 1, 1, 0);

-- 商品5: 虚拟农场NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_LAND_005', '虚拟农场NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '140000'), '140000',
    40, 75, 'VirtualFarm', '限量版虚拟农场NFT，游戏生产类资产',
    6999.00, 8999.00, 1, 'http://example.com/images/virtual_farm.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_005'), 'SPU_GAME_LAND_005',
    '这是一款限量版虚拟农场NFT，位于知名游戏平台的肥沃地区，拥有独特的土壤条件和气候特点，可用于种植作物、饲养动物或建造农业设施，是游戏生产类投资者的珍贵资产。',
    '土地NFT、区块链所有权证书、农场坐标文件、农业生产指南',
    '区块链永久认证，资产真实性终身保障，平台持续更新支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_005'), 'SPU_GAME_LAND_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"资产类型":"农场土地","所属平台":"Farm World","土地面积":"400x400米","土壤肥沃度":"A级"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_005'), 'SPU_GAME_LAND_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"发行方":"Farm Holdings","发行时间":"2023-08-30","区块链平台":"Ethereum","发行数量":"75","地块编号":"LAND2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_005'), 'SPU_GAME_LAND_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"农场类型":["种植农场","牧场","果园","混合农场","特种农场"],"气候类型":["温带","热带","寒带","干旱","湿润"],"水源条件":["河流","湖泊","地下水","雨水","灌溉系统"]}', 
3, 1, 1, 0);


-- ================ 18. 游戏资产 - 游戏角色NFT (141000) ================

-- 商品1: 传奇英雄角色NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_CHAR_001', '传奇英雄角色NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '141000'), '141000',
    60, 100, 'LegendaryHero', '限量版传奇英雄角色NFT，跨游戏平台使用',
    5999.00, 7999.00, 1, 'http://example.com/images/legendary_hero.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_001'), 'SPU_GAME_CHAR_001',
    '这是一款限量版传奇英雄角色NFT，由知名角色设计师精心打造，拥有独特的外观、技能和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '角色NFT、区块链所有权证书、3D模型文件、角色背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_001'), 'SPU_GAME_CHAR_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"角色类型":"英雄","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"奇幻/史诗","多边形数":"100K-150K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_001'), 'SPU_GAME_CHAR_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Hero Creator","创作时间":"2023-04-05","区块链平台":"Ethereum","发行数量":"100","作品编号":"GCHAR2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_001'), 'SPU_GAME_CHAR_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"职业类型":["战士","法师","刺客","射手","辅助"],"稀有度":["普通","稀有","史诗","传说","神话"],"特殊能力":["群体控制","高爆发","生存能力","辅助增益","特殊机制"]}', 
3, 1, 1, 0);

-- 商品2: 神话生物角色NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_CHAR_002', '神话生物角色NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '141000'), '141000',
    55, 90, 'MythicalCreature', '限量版神话生物角色NFT，跨游戏平台使用',
    5599.00, 7599.00, 1, 'http://example.com/images/mythical_creature.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_002'), 'SPU_GAME_CHAR_002',
    '这是一款限量版神话生物角色NFT，由生物设计师精心打造，基于各国神话传说创作，拥有独特的外观、能力和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '角色NFT、区块链所有权证书、3D模型文件、角色背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_002'), 'SPU_GAME_CHAR_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"角色类型":"神话生物","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"神话/古典","多边形数":"120K-170K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_002'), 'SPU_GAME_CHAR_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Myth Creator","创作时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"90","作品编号":"GCHAR2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_002'), 'SPU_GAME_CHAR_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"神话体系":["希腊","北欧","东方","埃及","美洲"],"生物类型":["人形","兽形","混合体","元素体","神灵"],"特殊能力":["元素掌控","形态变化","预言","治愈","毁灭"]}', 
3, 1, 1, 0);

-- 商品3: 未来战士角色NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_CHAR_003', '未来战士角色NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '141000'), '141000',
    65, 85, 'FutureWarrior', '限量版未来战士角色NFT，跨游戏平台使用',
    5799.00, 7799.00, 1, 'http://example.com/images/future_warrior.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_003'), 'SPU_GAME_CHAR_003',
    '这是一款限量版未来战士角色NFT，由科幻角色设计师精心打造，拥有未来感十足的外观、高科技装备和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '角色NFT、区块链所有权证书、3D模型文件、角色背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_003'), 'SPU_GAME_CHAR_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"角色类型":"未来战士","创作工具":"ZBrush+3ds Max+Substance Painter","艺术风格":"科幻/赛博朋克","多边形数":"110K-160K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_003'), 'SPU_GAME_CHAR_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Future Creator","创作时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"85","作品编号":"GCHAR2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_003'), 'SPU_GAME_CHAR_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"战士类型":["机械增强","基因改造","AI融合","纳米技术","量子战士"],"装备等级":["标准","高级","精英","原型","实验性"],"特殊能力":["隐形","时间操控","能量武器","黑客技术","增强感官"]}', 
3, 1, 1, 0);

-- 商品4: 魔法师角色NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_CHAR_004', '魔法师角色NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '141000'), '141000',
    70, 95, 'MagicWizard', '限量版魔法师角色NFT，跨游戏平台使用',
    5499.00, 7499.00, 1, 'http://example.com/images/magic_wizard.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_004'), 'SPU_GAME_CHAR_004',
    '这是一款限量版魔法师角色NFT，由奇幻角色设计师精心打造，拥有独特的外观、法术系统和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '角色NFT、区块链所有权证书、3D模型文件、角色背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_004'), 'SPU_GAME_CHAR_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"角色类型":"魔法师","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"奇幻/神秘","多边形数":"90K-140K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_004'), 'SPU_GAME_CHAR_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Wizard Creator","创作时间":"2023-07-25","区块链平台":"Ethereum","发行数量":"95","作品编号":"GCHAR2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_004'), 'SPU_GAME_CHAR_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"魔法流派":["元素魔法","召唤魔法","幻术魔法","时空魔法","禁忌魔法"],"法师等级":["学徒","正式法师","大法师","奥术师","传奇法师"],"特殊能力":["元素掌控","召唤生物","幻术","时空扭曲","魔法研究"]}', 
3, 1, 1, 0);

-- 商品5: 异形生物角色NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_CHAR_005', '异形生物角色NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '141000'), '141000',
    50, 80, 'AlienCreature', '限量版异形生物角色NFT，跨游戏平台使用',
    5899.00, 7899.00, 1, 'http://example.com/images/alien_creature.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_005'), 'SPU_GAME_CHAR_005',
    '这是一款限量版异形生物角色NFT，由外星生物设计师精心打造，拥有独特的外观、特殊能力和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '角色NFT、区块链所有权证书、3D模型文件、角色背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_005'), 'SPU_GAME_CHAR_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"角色类型":"异形生物","创作工具":"ZBrush+Blender+Substance Painter","艺术风格":"科幻/异形","多边形数":"130K-180K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_005'), 'SPU_GAME_CHAR_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Alien Creator","创作时间":"2023-08-30","区块链平台":"Ethereum","发行数量":"80","作品编号":"GCHAR2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CHAR_005'), 'SPU_GAME_CHAR_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"生物类型":["昆虫型","爬行型","哺乳型","晶体型","能量型"],"生物等级":["幼体","成熟体","完全体","变异体","终极体"],"特殊能力":["适应性","再生","心灵感应","分泌物","能量操控"]}', 
3, 1, 1, 0);


-- ================ 19. 游戏资产 - 游戏宠物NFT (142000) ================

-- 商品1: 传奇龙宠NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_PET_001', '传奇龙宠NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '142000'), '142000',
    60, 100, 'LegendaryDragon', '限量版传奇龙宠NFT，跨游戏平台使用',
    2999.00, 3999.00, 1, 'http://example.com/images/legendary_dragon.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_001'), 'SPU_GAME_PET_001',
    '这是一款限量版传奇龙宠NFT，由宠物设计师精心打造，拥有独特的外观、技能和成长系统，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '宠物NFT、区块链所有权证书、3D模型文件、宠物背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_001'), 'SPU_GAME_PET_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"宠物类型":"龙","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"奇幻/史诗","多边形数":"80K-120K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_001'), 'SPU_GAME_PET_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Dragon Designer","创作时间":"2023-04-05","区块链平台":"Ethereum","发行数量":"100","作品编号":"GPET2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_001'), 'SPU_GAME_PET_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"龙种类型":["火龙","冰龙","雷龙","风龙","暗影龙"],"成长阶段":["幼龙","成年龙","古龙","神龙"],"特殊能力":["元素吐息","飞行","护盾","治愈","召唤"]}', 
3, 1, 1, 0);


-- 商品2: 神秘精灵宠物NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_PET_002', '神秘精灵宠物NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '142000'), '142000',
    55, 90, 'MysticalFairy', '限量版神秘精灵宠物NFT，跨游戏平台使用',
    2799.00, 3799.00, 1, 'http://example.com/images/mystical_fairy.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_002'), 'SPU_GAME_PET_002',
    '这是一款限量版神秘精灵宠物NFT，由精灵设计师精心打造，拥有独特的外观、魔法能力和成长系统，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '宠物NFT、区块链所有权证书、3D模型文件、宠物背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_002'), 'SPU_GAME_PET_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"宠物类型":"精灵","创作工具":"ZBrush+Blender+Substance Painter","艺术风格":"奇幻/梦幻","多边形数":"60K-90K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_002'), 'SPU_GAME_PET_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Fairy Designer","创作时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"90","作品编号":"GPET2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_002'), 'SPU_GAME_PET_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"精灵类型":["光明精灵","自然精灵","水系精灵","风系精灵","暗影精灵"],"成长阶段":["幼精灵","成熟精灵","高等精灵","精灵长老"],"特殊能力":["治愈","自然操控","隐形","预言","元素掌控"]}', 
3, 1, 1, 0);

-- 商品3: 机械宠物NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_PET_003', '机械宠物NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '142000'), '142000',
    65, 85, 'MechanicalPet', '限量版机械宠物NFT，跨游戏平台使用',
    2899.00, 3899.00, 1, 'http://example.com/images/mechanical_pet.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_003'), 'SPU_GAME_PET_003',
    '这是一款限量版机械宠物NFT，由机械设计师精心打造，拥有独特的外观、功能模块和升级系统，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '宠物NFT、区块链所有权证书、3D模型文件、宠物背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_003'), 'SPU_GAME_PET_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"宠物类型":"机械宠物","创作工具":"3ds Max+Substance Painter","艺术风格":"科幻/机械","多边形数":"70K-100K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_003'), 'SPU_GAME_PET_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Mech Pet Designer","创作时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"85","作品编号":"GPET2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_003'), 'SPU_GAME_PET_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"机械类型":["四足机械","飞行机械","水陆两用","多功能","微型机械"],"科技等级":["基础型","高级型","实验型","原型机","未来型"],"特殊功能":["扫描","修复","战斗","侦察","资源收集"]}', 
3, 1, 1, 0);

-- 商品4: 幻兽宠物NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_PET_004', '幻兽宠物NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '142000'), '142000',
    70, 95, 'MythicalBeast', '限量版幻兽宠物NFT，跨游戏平台使用',
    2699.00, 3699.00, 1, 'http://example.com/images/mythical_beast.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_004'), 'SPU_GAME_PET_004',
    '这是一款限量版幻兽宠物NFT，由生物设计师精心打造，融合多种神话生物特征，拥有独特的外观、能力和成长系统，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '宠物NFT、区块链所有权证书、3D模型文件、宠物背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_004'), 'SPU_GAME_PET_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"宠物类型":"幻兽","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"奇幻/混合","多边形数":"75K-110K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_004'), 'SPU_GAME_PET_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Beast Designer","创作时间":"2023-07-25","区块链平台":"Ethereum","发行数量":"95","作品编号":"GPET2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_004'), 'SPU_GAME_PET_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"幻兽类型":["奇美拉","麒麟","九尾狐","独角兽","海妖"],"稀有度":["普通","稀有","史诗","传说","神话"],"特殊能力":["变形","元素操控","幻术","治愈","预言"]}', 
3, 1, 1, 0);

-- 商品5: 元素精灵宠物NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_PET_005', '元素精灵宠物NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '142000'), '142000',
    50, 80, 'ElementalSpirit', '限量版元素精灵宠物NFT，跨游戏平台使用',
    2599.00, 3599.00, 1, 'http://example.com/images/elemental_spirit.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_005'), 'SPU_GAME_PET_005',
    '这是一款限量版元素精灵宠物NFT，由元素设计师精心打造，代表自然界的基本元素，拥有独特的外观、元素能力和成长系统，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '宠物NFT、区块链所有权证书、3D模型文件、宠物背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_005'), 'SPU_GAME_PET_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"宠物类型":"元素精灵","创作工具":"Blender+Substance Painter","艺术风格":"元素/抽象","多边形数":"50K-80K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_005'), 'SPU_GAME_PET_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Elemental Designer","创作时间":"2023-08-30","区块链平台":"Ethereum","发行数量":"80","作品编号":"GPET2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_PET_005'), 'SPU_GAME_PET_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"元素类型":["火元素","水元素","土元素","风元素","雷元素"],"纯净度":["基础","纯净","高纯","完美","原初"],"特殊能力":["元素操控","环境适应","元素转化","元素吸收","元素爆发"]}', 
3, 1, 1, 0);


-- ================ 20. 游戏资产 - 游戏装备NFT (143000) ================

-- 商品1: 传奇武器NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_EQUIP_001', '传奇武器NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '143000'), '143000',
    60, 100, 'LegendaryWeapon', '限量版传奇武器NFT，跨游戏平台使用',
    1999.00, 2999.00, 1, 'http://example.com/images/legendary_weapon.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_001'), 'SPU_GAME_EQUIP_001',
    '这是一款限量版传奇武器NFT，由武器设计师精心打造，拥有独特的外观、特殊效果和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '装备NFT、区块链所有权证书、3D模型文件、装备背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_001'), 'SPU_GAME_EQUIP_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"装备类型":"武器","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"奇幻/史诗","多边形数":"50K-80K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_001'), 'SPU_GAME_EQUIP_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Weapon Designer","创作时间":"2023-04-05","区块链平台":"Ethereum","发行数量":"100","作品编号":"GEQUIP2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_001'), 'SPU_GAME_EQUIP_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"武器类型":["剑","斧","弓","法杖","匕首"],"稀有度":["普通","稀有","史诗","传说","神话"],"特殊效果":["元素伤害","吸血","暴击强化","穿透","范围攻击"]}', 
3, 1, 1, 0);

-- 商品2: 神话防具NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_EQUIP_002', '神话防具NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '143000'), '143000',
    55, 90, 'MythicalArmor', '限量版神话防具NFT，跨游戏平台使用',
    1899.00, 2899.00, 1, 'http://example.com/images/mythical_armor.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_002'), 'SPU_GAME_EQUIP_002',
    '这是一款限量版神话防具NFT，由防具设计师精心打造，基于各国神话传说创作，拥有独特的外观、防护能力和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '装备NFT、区块链所有权证书、3D模型文件、装备背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_002'), 'SPU_GAME_EQUIP_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"装备类型":"防具","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"神话/古典","多边形数":"60K-90K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_002'), 'SPU_GAME_EQUIP_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Armor Designer","创作时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"90","作品编号":"GEQUIP2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_002'), 'SPU_GAME_EQUIP_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"防具类型":["头盔","胸甲","护腿","护臂","全套"],"神话体系":["希腊","北欧","东方","埃及","美洲"],"特殊效果":["元素抗性","生命恢复","伤害反弹","移动速度","技能强化"]}', 
3, 1, 1, 0);

-- 商品3: 未来科技装备NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_EQUIP_003', '未来科技装备NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '143000'), '143000',
    65, 85, 'FutureTech', '限量版未来科技装备NFT，跨游戏平台使用',
    2099.00, 3099.00, 1, 'http://example.com/images/future_tech.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_003'), 'SPU_GAME_EQUIP_003',
    '这是一款限量版未来科技装备NFT，由科幻装备设计师精心打造，拥有未来感十足的外观、高科技功能和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '装备NFT、区块链所有权证书、3D模型文件、装备背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_003'), 'SPU_GAME_EQUIP_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"装备类型":"科技装备","创作工具":"3ds Max+Substance Painter","艺术风格":"科幻/未来","多边形数":"70K-100K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_003'), 'SPU_GAME_EQUIP_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Tech Designer","创作时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"85","作品编号":"GEQUIP2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_003'), 'SPU_GAME_EQUIP_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"装备类型":["外骨骼","能量武器","隐形装置","增强义肢","纳米装甲"],"科技等级":["现代","近未来","远未来","黑科技","外星科技"],"特殊功能":["增强力量","隐形","飞行","能量护盾","生命维持"]}', 
3, 1, 1, 0);

-- 商品4: 魔法饰品NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_EQUIP_004', '魔法饰品NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '143000'), '143000',
    70, 95, 'MagicalAccessory', '限量版魔法饰品NFT，跨游戏平台使用',
    1799.00, 2799.00, 1, 'http://example.com/images/magical_accessory.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_004'), 'SPU_GAME_EQUIP_004',
    '这是一款限量版魔法饰品NFT，由奇幻饰品设计师精心打造，拥有独特的外观、魔法效果和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '装备NFT、区块链所有权证书、3D模型文件、装备背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_004'), 'SPU_GAME_EQUIP_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"装备类型":"饰品","创作工具":"ZBrush+Blender+Substance Painter","艺术风格":"奇幻/神秘","多边形数":"40K-70K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_004'), 'SPU_GAME_EQUIP_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Accessory Designer","创作时间":"2023-07-25","区块链平台":"Ethereum","发行数量":"95","作品编号":"GEQUIP2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_004'), 'SPU_GAME_EQUIP_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"饰品类型":["戒指","项链","耳环","手镯","护符"],"魔法属性":["火","水","土","风","光暗"],"特殊效果":["属性增强","技能冷却","资源获取","经验加成","稀有掉落"]}', 
3, 1, 1, 0);

-- 商品5: 远古神器NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_EQUIP_005', '远古神器NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '143000'), '143000',
    50, 80, 'AncientRelic', '限量版远古神器NFT，跨游戏平台使用',
    2199.00, 3199.00, 1, 'http://example.com/images/ancient_relic.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_005'), 'SPU_GAME_EQUIP_005',
    '这是一款限量版远古神器NFT，由神器设计师精心打造，基于远古文明传说创作，拥有独特的外观、神秘力量和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '装备NFT、区块链所有权证书、3D模型文件、装备背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_005'), 'SPU_GAME_EQUIP_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"装备类型":"神器","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"远古/神秘","多边形数":"80K-120K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_005'), 'SPU_GAME_EQUIP_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Relic Designer","创作时间":"2023-08-30","区块链平台":"Ethereum","发行数量":"80","作品编号":"GEQUIP2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_EQUIP_005'), 'SPU_GAME_EQUIP_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"神器类型":["权杖","神剑","圣盾","王冠","神秘宝珠"],"文明来源":["亚特兰蒂斯","利莫里亚","埃及","玛雅","巴比伦"],"特殊能力":["时间操控","空间扭曲","生死掌控","元素主宰","心灵支配"]}', 
3, 1, 1, 0);

-- ================ 21. 游戏资产 - 游戏皮肤NFT (144000) ================

-- 商品1: 传奇英雄皮肤NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_SKIN_001', '传奇英雄皮肤NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '144000'), '144000',
    60, 100, 'LegendarySkin', '限量版传奇英雄皮肤NFT，跨游戏平台使用',
    1499.00, 2499.00, 1, 'http://example.com/images/legendary_skin.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_001'), 'SPU_GAME_SKIN_001',
    '这是一款限量版传奇英雄皮肤NFT，由皮肤设计师精心打造，拥有独特的外观、特效和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '皮肤NFT、区块链所有权证书、3D模型文件、皮肤背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_001'), 'SPU_GAME_SKIN_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"皮肤类型":"英雄皮肤","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"奇幻/史诗","多边形数":"80K-120K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_001'), 'SPU_GAME_SKIN_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Skin Designer","创作时间":"2023-04-05","区块链平台":"Ethereum","发行数量":"100","作品编号":"GSKIN2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_001'), 'SPU_GAME_SKIN_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"适用角色类型":["战士","法师","刺客","射手","辅助"],"稀有度":["普通","稀有","史诗","传说","神话"],"特殊效果":["技能特效","移动特效","语音特效","击杀特效","复活特效"]}', 
3, 1, 1, 0);

-- 商品2: 科幻载具皮肤NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_SKIN_002', '科幻载具皮肤NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '144000'), '144000',
    55, 90, 'SciFiVehicleSkin', '限量版科幻载具皮肤NFT，跨游戏平台使用',
    1399.00, 2399.00, 1, 'http://example.com/images/scifi_vehicle_skin.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_002'), 'SPU_GAME_SKIN_002',
    '这是一款限量版科幻载具皮肤NFT，由载具设计师精心打造，拥有未来感十足的外观、特效和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '皮肤NFT、区块链所有权证书、3D模型文件、皮肤背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_002'), 'SPU_GAME_SKIN_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"皮肤类型":"载具皮肤","创作工具":"3ds Max+Substance Painter","艺术风格":"科幻/未来","多边形数":"70K-110K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_002'), 'SPU_GAME_SKIN_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Vehicle Skin Designer","创作时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"90","作品编号":"GSKIN2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_002'), 'SPU_GAME_SKIN_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"适用载具类型":["飞行器","陆地车辆","水上载具","太空飞船","机甲"],"科技风格":["赛博朋克","太空歌剧","后启示录","军事科技","生物科技"],"特殊效果":["引擎特效","武器特效","能量场","光影效果","声音效果"]}', 
3, 1, 1, 0);

-- 商品3: 魔法武器皮肤NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_SKIN_003', '魔法武器皮肤NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '144000'), '144000',
    65, 85, 'MagicalWeaponSkin', '限量版魔法武器皮肤NFT，跨游戏平台使用',
    1599.00, 2599.00, 1, 'http://example.com/images/magical_weapon_skin.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_003'), 'SPU_GAME_SKIN_003',
    '这是一款限量版魔法武器皮肤NFT，由武器设计师精心打造，拥有奇幻风格的外观、魔法特效和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '皮肤NFT、区块链所有权证书、3D模型文件、皮肤背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_003'), 'SPU_GAME_SKIN_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"皮肤类型":"武器皮肤","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"奇幻/魔法","多边形数":"50K-80K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_003'), 'SPU_GAME_SKIN_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Magical Weapon Designer","创作时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"85","作品编号":"GSKIN2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_003'), 'SPU_GAME_SKIN_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"适用武器类型":["法杖","魔剑","符文弓","元素匕首","神秘卷轴"],"魔法元素":["火","水","土","风","光暗"],"特殊效果":["元素轨迹","施法特效","充能特效","命中特效","持有姿态"]}', 
3, 1, 1, 0);

-- 商品4: 神话生物皮肤NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_SKIN_004', '神话生物皮肤NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '144000'), '144000',
    70, 95, 'MythicalCreatureSkin', '限量版神话生物皮肤NFT，跨游戏平台使用',
    1699.00, 2699.00, 1, 'http://example.com/images/mythical_creature_skin.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_004'), 'SPU_GAME_SKIN_004',
    '这是一款限量版神话生物皮肤NFT，由生物设计师精心打造，基于各国神话传说创作，拥有独特的外观、动画效果和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '皮肤NFT、区块链所有权证书、3D模型文件、皮肤背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_004'), 'SPU_GAME_SKIN_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"皮肤类型":"生物皮肤","创作工具":"ZBrush+Maya+Substance Painter","艺术风格":"神话/古典","多边形数":"90K-130K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_004'), 'SPU_GAME_SKIN_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Mythical Creature Designer","创作时间":"2023-07-25","区块链平台":"Ethereum","发行数量":"95","作品编号":"GSKIN2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_004'), 'SPU_GAME_SKIN_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"适用生物类型":["龙","凤凰","独角兽","海妖","奇美拉"],"神话体系":["希腊","北欧","东方","埃及","美洲"],"特殊效果":["形态变化","环境互动","光影效果","音效","粒子效果"]}', 
3, 1, 1, 0);

-- 商品5: 机械装甲皮肤NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_SKIN_005', '机械装甲皮肤NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '144000'), '144000',
    50, 80, 'MechanicalArmorSkin', '限量版机械装甲皮肤NFT，跨游戏平台使用',
    1599.00, 2599.00, 1, 'http://example.com/images/mechanical_armor_skin.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_005'), 'SPU_GAME_SKIN_005',
    '这是一款限量版机械装甲皮肤NFT，由装甲设计师精心打造，拥有精密机械感的外观、动态部件和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '皮肤NFT、区块链所有权证书、3D模型文件、皮肤背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_005'), 'SPU_GAME_SKIN_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"皮肤类型":"装甲皮肤","创作工具":"3ds Max+Substance Painter","艺术风格":"机械/工业","多边形数":"85K-125K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_005'), 'SPU_GAME_SKIN_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Mechanical Armor Designer","创作时间":"2023-08-30","区块链平台":"Ethereum","发行数量":"80","作品编号":"GSKIN2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_SKIN_005'), 'SPU_GAME_SKIN_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"适用装甲类型":["轻型装甲","中型装甲","重型装甲","动力装甲","飞行装甲"],"机械风格":["工业风","军事风","未来风","蒸汽朋克","生物机械"],"特殊效果":["机械运动","能量流动","散热系统","武器展示","驾驶舱视角"]}', 
3, 1, 1, 0);


-- ================ 22. 游戏资产 - 游戏道具NFT (145000) ================

-- 商品1: 传奇魔法卷轴NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_ITEM_001', '传奇魔法卷轴NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '145000'), '145000',
    60, 100, 'LegendaryScroll', '限量版传奇魔法卷轴NFT，跨游戏平台使用',
    999.00, 1999.00, 1, 'http://example.com/images/legendary_scroll.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_001'), 'SPU_GAME_ITEM_001',
    '这是一款限量版传奇魔法卷轴NFT，由道具设计师精心打造，拥有独特的外观、魔法效果和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '道具NFT、区块链所有权证书、3D模型文件、道具背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_001'), 'SPU_GAME_ITEM_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"道具类型":"魔法卷轴","创作工具":"Photoshop+Substance Painter","艺术风格":"奇幻/古典","使用次数":"无限"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_001'), 'SPU_GAME_ITEM_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Scroll Designer","创作时间":"2023-04-05","区块链平台":"Ethereum","发行数量":"100","作品编号":"GITEM2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_001'), 'SPU_GAME_ITEM_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"魔法类型":["召唤魔法","元素魔法","变形魔法","治愈魔法","禁忌魔法"],"稀有度":["普通","稀有","史诗","传说","神话"],"使用效果":["召唤生物","元素攻击","变形","治愈","时空扭曲"]}', 
3, 1, 1, 0);


-- 商品2: 神秘宝箱NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_ITEM_002', '神秘宝箱NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '145000'), '145000',
    55, 90, 'MysteryChest', '限量版神秘宝箱NFT，跨游戏平台使用',
    899.00, 1899.00, 1, 'http://example.com/images/mystery_chest.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_002'), 'SPU_GAME_ITEM_002',
    '这是一款限量版神秘宝箱NFT，由道具设计师精心打造，拥有独特的外观、开启机制和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '道具NFT、区块链所有权证书、3D模型文件、道具背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_002'), 'SPU_GAME_ITEM_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"道具类型":"宝箱","创作工具":"ZBrush+Substance Painter","艺术风格":"奇幻/神秘","使用次数":"1次"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_002'), 'SPU_GAME_ITEM_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Chest Designer","创作时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"90","作品编号":"GITEM2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_002'), 'SPU_GAME_ITEM_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"宝箱类型":["普通宝箱","稀有宝箱","史诗宝箱","传说宝箱","神话宝箱"],"开启方式":["钥匙开启","密码开启","谜题开启","时间开启","特定条件开启"],"可能获得":["装备","宠物","皮肤","货币","特殊道具"]}', 
3, 1, 1, 0);

-- 商品3: 高级药水NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_ITEM_003', '高级药水NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '145000'), '145000',
    65, 85, 'PremiumPotion', '限量版高级药水NFT，跨游戏平台使用',
    799.00, 1799.00, 1, 'http://example.com/images/premium_potion.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_003'), 'SPU_GAME_ITEM_003',
    '这是一款限量版高级药水NFT，由炼金术师精心打造，拥有独特的外观、效果和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '道具NFT、区块链所有权证书、3D模型文件、道具背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_003'), 'SPU_GAME_ITEM_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"道具类型":"药水","创作工具":"Blender+Substance Painter","艺术风格":"奇幻/炼金","使用次数":"无限"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_003'), 'SPU_GAME_ITEM_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Potion Designer","创作时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"85","作品编号":"GITEM2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_003'), 'SPU_GAME_ITEM_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"药水类型":["治疗药水","增益药水","变形药水","抗性药水","特殊效果药水"],"药水品质":["普通","高级","精良","完美","神话"],"使用效果":["生命恢复","属性提升","形态变化","伤害减免","特殊能力"]}', 
3, 1, 1, 0);

-- 商品4: 魔法符文NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_ITEM_004', '魔法符文NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '145000'), '145000',
    70, 95, 'MagicalRune', '限量版魔法符文NFT，跨游戏平台使用',
    899.00, 1899.00, 1, 'http://example.com/images/magical_rune.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_004'), 'SPU_GAME_ITEM_004',
    '这是一款限量版魔法符文NFT，由符文大师精心打造，拥有独特的外观、魔法效果和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '道具NFT、区块链所有权证书、3D模型文件、道具背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_004'), 'SPU_GAME_ITEM_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"道具类型":"符文","创作工具":"Photoshop+Substance Designer","艺术风格":"神秘/古代","使用次数":"无限"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_004'), 'SPU_GAME_ITEM_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Rune Designer","创作时间":"2023-07-25","区块链平台":"Ethereum","发行数量":"95","作品编号":"GITEM2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_004'), 'SPU_GAME_ITEM_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"符文类型":["攻击符文","防御符文","增益符文","控制符文","特殊符文"],"符文体系":["北欧","精灵","矮人","龙族","远古"],"使用效果":["武器强化","防具强化","技能强化","特殊能力","被动效果"]}', 
3, 1, 1, 0);

-- 商品5: 传送门道具NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_ITEM_005', '传送门道具NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '145000'), '145000',
    50, 80, 'PortalItem', '限量版传送门道具NFT，跨游戏平台使用',
    999.00, 1999.00, 1, 'http://example.com/images/portal_item.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_005'), 'SPU_GAME_ITEM_005',
    '这是一款限量版传送门道具NFT，由空间法师精心打造，拥有独特的外观、传送效果和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '道具NFT、区块链所有权证书、3D模型文件、道具背景故事、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_005'), 'SPU_GAME_ITEM_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"道具类型":"传送门","创作工具":"Maya+Substance Painter","艺术风格":"魔法/科幻","使用次数":"无限"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_005'), 'SPU_GAME_ITEM_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Portal Designer","创作时间":"2023-08-30","区块链平台":"Ethereum","发行数量":"80","作品编号":"GITEM2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_ITEM_005'), 'SPU_GAME_ITEM_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"传送类型":["地点传送","维度传送","时间传送","随机传送","指定传送"],"传送范围":["短距离","中距离","长距离","跨地图","跨服务器"],"特殊效果":["群体传送","物品传送","记忆传送","隐形传送","紧急逃脱"]}', 
3, 1, 1, 0);


-- ================ 23. 游戏资产 - 游戏土地NFT (146000) ================

-- 商品1: 虚拟世界地块NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_LAND_001', '虚拟世界地块NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '146000'), '146000',
    60, 100, 'VirtualLand', '限量版虚拟世界地块NFT，跨游戏平台使用',
    9999.00, 19999.00, 1, 'http://example.com/images/virtual_land.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_001'), 'SPU_GAME_LAND_001',
    '这是一款限量版虚拟世界地块NFT，由地块设计师精心打造，拥有独特的位置、资源和开发潜力，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '地块NFT、区块链所有权证书、3D模型文件、地块背景资料、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_001'), 'SPU_GAME_LAND_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"地块类型":"虚拟世界地块","创作工具":"Unity+Blender","艺术风格":"开放世界","面积":"16x16"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_001'), 'SPU_GAME_LAND_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"发行方":"Metaverse Holdings","发行时间":"2023-04-05","区块链平台":"Ethereum","发行数量":"100","地块编号":"LAND2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_001'), 'SPU_GAME_LAND_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"位置类型":["中心区","商业区","娱乐区","住宅区","边缘区"],"资源丰富度":["稀少","一般","丰富","极其丰富","独特资源"],"开发权限":["建筑","商业","活动","广告","API接入"]}', 
3, 1, 1, 0);


-- 商品2: 魔法森林地块NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_LAND_002', '魔法森林地块NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '146000'), '146000',
    55, 90, 'MagicalForest', '限量版魔法森林地块NFT，跨游戏平台使用',
    8999.00, 18999.00, 1, 'http://example.com/images/magical_forest.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_002'), 'SPU_GAME_LAND_002',
    '这是一款限量版魔法森林地块NFT，由地块设计师精心打造，拥有独特的魔法生态系统、稀有资源和开发潜力，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '地块NFT、区块链所有权证书、3D模型文件、地块背景资料、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_002'), 'SPU_GAME_LAND_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"地块类型":"魔法森林地块","创作工具":"Unity+Blender","艺术风格":"奇幻/自然","面积":"24x24"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_002'), 'SPU_GAME_LAND_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"发行方":"Fantasy Realms","发行时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"90","地块编号":"LAND2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_002'), 'SPU_GAME_LAND_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"森林类型":["古老森林","精灵森林","魔法树林","神秘丛林","荧光森林"],"魔法元素":["自然魔法","元素魔法","生命魔法","时空魔法","混沌魔法"],"特殊资源":["魔法水晶","生命之树","魔法生物","药草","远古遗迹"]}', 
3, 1, 1, 0);

-- 商品3: 未来城市地块NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_LAND_003', '未来城市地块NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '146000'), '146000',
    65, 85, 'FutureCity', '限量版未来城市地块NFT，跨游戏平台使用',
    9599.00, 19599.00, 1, 'http://example.com/images/future_city.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_003'), 'SPU_GAME_LAND_003',
    '这是一款限量版未来城市地块NFT，由地块设计师精心打造，拥有未来科技风格的建筑、高科技设施和开发潜力，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '地块NFT、区块链所有权证书、3D模型文件、地块背景资料、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_003'), 'SPU_GAME_LAND_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"地块类型":"未来城市地块","创作工具":"Unity+3ds Max","艺术风格":"科幻/未来","面积":"32x32"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_003'), 'SPU_GAME_LAND_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"发行方":"Future Developments","发行时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"85","地块编号":"LAND2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_003'), 'SPU_GAME_LAND_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"城市区域":["高科技区","商业中心","居住区","娱乐区","工业区"],"科技设施":["能源中心","传送站","AI中心","研究所","太空港"],"开发权限":["建筑","商业","活动","广告","API接入"]}', 
3, 1, 1, 0);

-- 商品4: 远古遗迹地块NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_LAND_004', '远古遗迹地块NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '146000'), '146000',
    70, 95, 'AncientRuins', '限量版远古遗迹地块NFT，跨游戏平台使用',
    8799.00, 18799.00, 1, 'http://example.com/images/ancient_ruins.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_004'), 'SPU_GAME_LAND_004',
    '这是一款限量版远古遗迹地块NFT，由地块设计师精心打造，拥有神秘的远古文明遗迹、宝藏和开发潜力，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '地块NFT、区块链所有权证书、3D模型文件、地块背景资料、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_004'), 'SPU_GAME_LAND_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"地块类型":"远古遗迹地块","创作工具":"Unity+ZBrush","艺术风格":"古代/神秘","面积":"20x20"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_004'), 'SPU_GAME_LAND_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"发行方":"Ancient Discoveries","发行时间":"2023-07-25","区块链平台":"Ethereum","发行数量":"95","地块编号":"LAND2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_004'), 'SPU_GAME_LAND_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"遗迹类型":["神庙","宫殿","城市","金字塔","地下迷宫"],"文明来源":["亚特兰蒂斯","利莫里亚","埃及","玛雅","巴比伦"],"特殊资源":["古代文物","神秘能量","失落知识","远古材料","神器碎片"]}', 
3, 1, 1, 0);

-- 商品5: 浮空岛屿地块NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_LAND_005', '浮空岛屿地块NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '146000'), '146000',
    50, 80, 'FloatingIsland', '限量版浮空岛屿地块NFT，跨游戏平台使用',
    9299.00, 19299.00, 1, 'http://example.com/images/floating_island.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_005'), 'SPU_GAME_LAND_005',
    '这是一款限量版浮空岛屿地块NFT，由地块设计师精心打造，拥有独特的悬浮在空中的岛屿、特殊资源和开发潜力，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '地块NFT、区块链所有权证书、3D模型文件、地块背景资料、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_005'), 'SPU_GAME_LAND_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"地块类型":"浮空岛屿地块","创作工具":"Unity+Blender","艺术风格":"奇幻/空中","面积":"28x28"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_005'), 'SPU_GAME_LAND_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"发行方":"Sky Domains","发行时间":"2023-08-30","区块链平台":"Ethereum","发行数量":"80","地块编号":"LAND2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_LAND_005'), 'SPU_GAME_LAND_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"岛屿类型":["自然岛屿","魔法岛屿","科技岛屿","混合岛屿","远古岛屿"],"高度层级":["低空","中空","高空","极高空","天界"],"特殊资源":["浮空晶体","云雾精华","风元素","天空矿物","飞行生物"]}', 
3, 1, 1, 0);


-- ================ 24. 游戏资产 - 游戏建筑NFT (147000) ================

-- 商品1: 奇幻城堡建筑NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_BUILD_001', '奇幻城堡建筑NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '147000'), '147000',
    60, 100, 'FantasyCastle', '限量版奇幻城堡建筑NFT，跨游戏平台使用',
    7999.00, 17999.00, 1, 'http://example.com/images/fantasy_castle.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_001'), 'SPU_GAME_BUILD_001',
    '这是一款限量版奇幻城堡建筑NFT，由建筑设计师精心打造，拥有独特的外观、内部结构和功能，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '建筑NFT、区块链所有权证书、3D模型文件、建筑背景资料、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_001'), 'SPU_GAME_BUILD_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"建筑类型":"城堡","创作工具":"3ds Max+ZBrush+Substance Painter","艺术风格":"奇幻/中世纪","多边形数":"150K-250K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_001'), 'SPU_GAME_BUILD_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Castle Designer","创作时间":"2023-04-05","区块链平台":"Ethereum","发行数量":"100","作品编号":"GBUILD2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_001'), 'SPU_GAME_BUILD_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"城堡风格":["哥特式","罗马式","拜占庭式","东方式","混合式"],"规模":["小型堡垒","中型城堡","大型要塞","皇家宫殿","传奇巨城"],"特殊功能":["防御系统","魔法系统","生产系统","交易系统","传送系统"]}', 
3, 1, 1, 0);


-- 商品2: 未来科技建筑NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_BUILD_002', '未来科技建筑NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '147000'), '147000',
    55, 90, 'FuturisticTech', '限量版未来科技建筑NFT，跨游戏平台使用',
    7599.00, 17599.00, 1, 'http://example.com/images/futuristic_tech.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_002'), 'SPU_GAME_BUILD_002',
    '这是一款限量版未来科技建筑NFT，由建筑设计师精心打造，拥有未来感十足的外观、高科技内部结构和功能，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '建筑NFT、区块链所有权证书、3D模型文件、建筑背景资料、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_002'), 'SPU_GAME_BUILD_002', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"建筑类型":"科技建筑","创作工具":"3ds Max+Substance Painter","艺术风格":"科幻/未来","多边形数":"180K-280K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_002'), 'SPU_GAME_BUILD_002',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Tech Building Designer","创作时间":"2023-05-15","区块链平台":"Ethereum","发行数量":"90","作品编号":"GBUILD2023002"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_002'), 'SPU_GAME_BUILD_002',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"建筑类型":["研究中心","能源设施","居住区","太空港","AI中心"],"科技风格":["赛博朋克","太空时代","生物科技","量子科技","纳米科技"],"特殊功能":["能源生产","研究加成","自动化系统","防御系统","传送系统"]}', 
3, 1, 1, 0);

-- 商品3: 东方神庙建筑NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_BUILD_003', '东方神庙建筑NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '147000'), '147000',
    65, 85, 'OrientalTemple', '限量版东方神庙建筑NFT，跨游戏平台使用',
    6999.00, 16999.00, 1, 'http://example.com/images/oriental_temple.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_003'), 'SPU_GAME_BUILD_003',
    '这是一款限量版东方神庙建筑NFT，由建筑设计师精心打造，拥有东方古典风格的外观、精致的内部结构和功能，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '建筑NFT、区块链所有权证书、3D模型文件、建筑背景资料、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_003'), 'SPU_GAME_BUILD_003', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"建筑类型":"神庙","创作工具":"Maya+ZBrush+Substance Painter","艺术风格":"东方/古典","多边形数":"160K-260K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_003'), 'SPU_GAME_BUILD_003',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Temple Designer","创作时间":"2023-06-20","区块链平台":"Ethereum","发行数量":"85","作品编号":"GBUILD2023003"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_003'), 'SPU_GAME_BUILD_003',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"神庙风格":["中国","日本","韩国","泰国","印度"],"规模":["小型祠堂","中型神庙","大型寺院","皇家庙宇","圣地"],"特殊功能":["修炼系统","冥想系统","治疗系统","祝福系统","传承系统"]}', 
3, 1, 1, 0);

-- 商品4: 水下城市建筑NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_BUILD_004', '水下城市建筑NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '147000'), '147000',
    70, 95, 'UnderwaterCity', '限量版水下城市建筑NFT，跨游戏平台使用',
    7299.00, 17299.00, 1, 'http://example.com/images/underwater_city.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_004'), 'SPU_GAME_BUILD_004',
    '这是一款限量版水下城市建筑NFT，由建筑设计师精心打造，拥有独特的水下建筑风格、防水系统和功能，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '建筑NFT、区块链所有权证书、3D模型文件、建筑背景资料、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_004'), 'SPU_GAME_BUILD_004', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"建筑类型":"水下城市","创作工具":"Blender+Substance Painter","艺术风格":"海洋/科幻","多边形数":"200K-300K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_004'), 'SPU_GAME_BUILD_004',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Underwater Architect","创作时间":"2023-07-25","区块链平台":"Ethereum","发行数量":"95","作品编号":"GBUILD2023004"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_004'), 'SPU_GAME_BUILD_004',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"城市类型":["穹顶城市","气泡城市","珊瑚城市","沉船改造","深海基地"],"水下环境":["浅海","珊瑚礁","深海","海沟","海底火山"],"特殊功能":["氧气系统","水压调节","海洋资源采集","水下交通","防御系统"]}', 
3, 1, 1, 0);

-- 商品5: 魔法学院建筑NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_BUILD_005', '魔法学院建筑NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '147000'), '147000',
    50, 80, 'MagicAcademy', '限量版魔法学院建筑NFT，跨游戏平台使用',
    7499.00, 17499.00, 1, 'http://example.com/images/magic_academy.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_005'), 'SPU_GAME_BUILD_005',
    '这是一款限量版魔法学院建筑NFT，由建筑设计师精心打造，拥有神秘的魔法学院风格、魔法系统和功能，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '建筑NFT、区块链所有权证书、3D模型文件、建筑背景资料、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_005'), 'SPU_GAME_BUILD_005', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"建筑类型":"魔法学院","创作工具":"3ds Max+ZBrush+Substance Painter","艺术风格":"奇幻/哥特","多边形数":"190K-290K"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_005'), 'SPU_GAME_BUILD_005',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Magic Academy Designer","创作时间":"2023-08-30","区块链平台":"Ethereum","发行数量":"80","作品编号":"GBUILD2023005"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_BUILD_005'), 'SPU_GAME_BUILD_005',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"学院风格":["古典魔法","元素魔法","禁忌魔法","自然魔法","混合魔法"],"规模":["小型学院","中型学院","大型学院","魔法大学","传奇学府"],"特殊功能":["魔法研究","魔法训练","魔法图书馆","魔法实验室","魔法传送"]}', 
3, 1, 1, 0);

-- ================ 25. 游戏资产 - 游戏货币NFT (148000) ================

-- 商品1: 传奇金币NFT
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_GAME_CURR_001', '传奇金币NFT',
    (SELECT id FROM sys_category WHERE code = '100000'), '100000',
    (SELECT id FROM sys_category WHERE code = '130000'), '130000',
    (SELECT id FROM sys_category WHERE code = '148000'), '148000',
    60, 100, 'LegendaryCoin', '限量版传奇金币NFT，跨游戏平台使用',
    499.00, 999.00, 1, 'http://example.com/images/legendary_coin.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CURR_001'), 'SPU_GAME_CURR_001',
    '这是一款限量版传奇金币NFT，由货币设计师精心打造，拥有独特的外观、价值和背景故事，可在支持NFT资产的多个游戏平台中使用，是收藏家和游戏玩家的珍贵资产。',
    '货币NFT、区块链所有权证书、3D模型文件、货币背景资料、使用指南',
    '区块链永久认证，资产真实性终身保障，新游戏平台适配支持';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
-- 基础属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CURR_001'), 'SPU_GAME_CURR_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"货币类型":"金币","创作工具":"ZBrush+Substance Painter","艺术风格":"奇幻/古典","面额":"1000"}', 
1, 1, 1, 1),

-- 销售属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CURR_001'), 'SPU_GAME_CURR_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Coin Designer","创作时间":"2023-04-05","区块链平台":"Ethereum","发行数量":"100","作品编号":"GCURR2023001"}', 
2, 1, 1, 1),

-- 规格属性
((SELECT id FROM sys_product_spu WHERE code = 'SPU_GAME_CURR_001'), 'SPU_GAME_CURR_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"金币材质":["黄金","白银","铂金","秘银","魔法合金"],"稀有度":["普通","稀有","史诗","传说","神话"],"特殊效果":["幸运加成","交易加成","经验加成","掉落加成","声望加成"]}', 
3, 1, 1, 0);


-- ================ 1. 文档模板 (210000) ================

-- 1.1 Word模板 (211000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_DOC_WORD_001', '高级商务报告Word模板',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '210000'), '210000',
    (SELECT id FROM sys_category WHERE code = '211000'), '211000',
    156, 1000, 'BusinessPro', '专业商务报告Word模板，包含完整排版和数据图表样式',
    29.90, 59.90, 1, 'http://example.com/images/word_template.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_WORD_001'), 'SPU_DOC_WORD_001',
    '这是一套专业的商务报告Word模板，包含完整的章节样式、段落样式、图表样式等。适用于年度报告、项目报告、商业计划书等商务文档。支持Word 2016及以上版本。',
    'Word模板文件、样式使用说明、图表使用教程、商业授权证书',
    '终身更新服务、一对一排版指导、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_WORD_001'), 'SPU_DOC_WORD_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"文件格式":"docx","页数":"50+","兼容版本":"Word 2016+","模板类型":"商务报告"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_WORD_001'), 'SPU_DOC_WORD_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Template Master","更新日期":"2024-01-15","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_WORD_001'), 'SPU_DOC_WORD_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"风格":["简约","商务","专业","现代"],"颜色主题":["蓝色","灰色","红色"],"适用场景":["年度报告","项目报告","商业计划书","调研报告"]}', 
3, 1, 1, 0);

-- 1.2 Excel模板 (212000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_DOC_EXCEL_001', '财务分析Excel模板套装',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '210000'), '210000',
    (SELECT id FROM sys_category WHERE code = '212000'), '212000',
    234, 1000, 'FinancePro', '专业财务分析Excel模板，包含多种财务报表和分析工具',
    39.90, 79.90, 1, 'http://example.com/images/excel_template.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_EXCEL_001'), 'SPU_DOC_EXCEL_001',
    '这是一套专业的财务分析Excel模板套装，包含资产负债表、利润表、现金流量表等多个财务报表模板，以及各类财务分析工具。所有公式和函数都已设置完善，支持数据自动计算和图表生成。',
    'Excel模板文件包、使用说明书、视频教程、商业授权证书',
    '终身更新服务、财务分析指导、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_EXCEL_001'), 'SPU_DOC_EXCEL_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"文件格式":"xlsx","工作表数":"20+","兼容版本":"Excel 2016+","模板类型":"财务分析"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_EXCEL_001'), 'SPU_DOC_EXCEL_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Finance Expert","更新日期":"2024-01-20","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_EXCEL_001'), 'SPU_DOC_EXCEL_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"报表类型":["资产负债表","利润表","现金流量表","财务分析"],"功能特点":["自动计算","图表生成","数据分析","报表打印"],"适用对象":["财务人员","管理层","创业者","学生"]}', 
3, 1, 1, 0);

-- 1.3 PPT模板 (213000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_DOC_PPT_001', '创意商务PPT模板合集',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '210000'), '210000',
    (SELECT id FROM sys_category WHERE code = '213000'), '213000',
    312, 1000, 'CreativePro', '高端创意商务PPT模板，包含50套精美主题',
    49.90, 99.90, 1, 'http://example.com/images/ppt_template.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_PPT_001'), 'SPU_DOC_PPT_001',
    '这是一套高端创意商务PPT模板合集，包含50套不同风格的主题模板。每套模板都包含完整的母版、配色方案、图表样式等。适用于商务演示、项目汇报、营销策划等场景。',
    'PPT模板文件包、字体包、图标素材、使用教程、商业授权证书',
    '终身更新服务、一对一设计指导、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_PPT_001'), 'SPU_DOC_PPT_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"文件格式":"pptx","页数":"1000+","兼容版本":"PowerPoint 2016+","模板数量":"50套"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_PPT_001'), 'SPU_DOC_PPT_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"PPT Master","更新日期":"2024-01-25","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_PPT_001'), 'SPU_DOC_PPT_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"风格类型":["商务","创意","简约","科技"],"内容类型":["商务演示","项目汇报","营销策划","教育培训"],"特色功能":["动画效果","母版设计","图表模板","图标素材"]}', 
3, 1, 1, 0);

-- 1.4 PDF模板 (214000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_DOC_PDF_001', '智能PDF表单模板',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '210000'), '210000',
    (SELECT id FROM sys_category WHERE code = '214000'), '214000',
    178, 1000, 'FormPro', '专业PDF表单模板，支持自动填充和数据收集',
    34.90, 69.90, 1, 'http://example.com/images/pdf_template.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_PDF_001'), 'SPU_DOC_PDF_001',
    '这是一套专业的PDF智能表单模板，包含多种常用表单类型，支持表单自动填充、数据收集和导出功能。适用于问卷调查、报名登记、评估表等场景。',
    'PDF模板文件、使用说明、开发文档、商业授权证书',
    '终身技术支持、表单定制服务、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_PDF_001'), 'SPU_DOC_PDF_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"文件格式":"pdf","表单数量":"30+","兼容版本":"Adobe Acrobat DC+","类型":"智能表单"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_PDF_001'), 'SPU_DOC_PDF_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Form Expert","更新日期":"2024-01-30","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_PDF_001'), 'SPU_DOC_PDF_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"表单类型":["调查问卷","报名表","评估表","申请表"],"功能特点":["自动填充","数据收集","表单验证","数据导出"],"适用场景":["企业管理","教育培训","市场调研","活动策划"]}', 
3, 1, 1, 0);

-- 1.5 其它模板 (215000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_DOC_OTHER_001', '多格式文档模板套装',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '210000'), '210000',
    (SELECT id FROM sys_category WHERE code = '215000'), '215000',
    145, 1000, 'DocPro', '综合性文档模板套装，支持多种文档格式',
    59.90, 119.90, 1, 'http://example.com/images/other_template.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_OTHER_001'), 'SPU_DOC_OTHER_001',
    '这是一套综合性文档模板套装，支持包括Markdown、LaTeX、HTML等多种文档格式。包含学术论文、技术文档、网页模板等多种类型，满足不同场景的文档需求。',
    '多格式模板文件包、配置文件、使用教程、商业授权证书',
    '终身更新服务、技术支持、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_OTHER_001'), 'SPU_DOC_OTHER_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"支持格式":"Markdown/LaTeX/HTML","模板数量":"100+","主题风格":"20+","类型":"综合模板"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_OTHER_001'), 'SPU_DOC_OTHER_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Template Team","更新日期":"2024-02-01","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_DOC_OTHER_001'), 'SPU_DOC_OTHER_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"文档类型":["学术论文","技术文档","网页模板","电子书"],"编辑器支持":["VS Code","Typora","TeXstudio","Sublime Text"],"应用场景":["学术写作","技术文档","网站建设","电子出版"]}', 
3, 1, 1, 0);

-- ================ 2. 图片素材 (220000) ================

-- 2.1 壁纸 (221000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_IMG_WALL_001', '4K科幻风格壁纸合集',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '220000'), '220000',
    (SELECT id FROM sys_category WHERE code = '221000'), '221000',
    423, 1000, 'WallpaperPro', '精选4K科幻风格壁纸，适用于桌面和移动设备',
    19.90, 39.90, 1, 'http://example.com/images/wallpaper_collection.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_IMG_WALL_001'), 'SPU_IMG_WALL_001',
    '这是一套精心制作的4K科幻风格壁纸合集，包含100张高质量壁纸。涵盖未来城市、太空探索、机械科技等多个主题，支持各种屏幕尺寸，提供桌面端和移动端适配版本。',
    '壁纸压缩包、分类目录、预览图、使用说明、商业授权证书',
    '免费更新服务、分辨率定制、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_IMG_WALL_001'), 'SPU_IMG_WALL_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"图片格式":"JPG/PNG","数量":"100张","分辨率":"3840x2160","类型":"科幻壁纸"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_IMG_WALL_001'), 'SPU_IMG_WALL_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Wallpaper Master","更新日期":"2024-02-05","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_IMG_WALL_001'), 'SPU_IMG_WALL_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"主题风格":["未来城市","太空探索","机械科技","赛博朋克"],"适用设备":["电脑桌面","手机壁纸","平板设备","智能电视"],"色彩风格":["炫彩","暗黑","霓虹","简约"]}', 
3, 1, 1, 0);

-- 2.2 头像 (222000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_IMG_AVATAR_001', '二次元风格头像设计集',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '220000'), '220000',
    (SELECT id FROM sys_category WHERE code = '222000'), '222000',
    567, 1000, 'AvatarArt', '精美二次元风格头像，适用于社交媒体',
    15.90, 29.90, 1, 'http://example.com/images/avatar_collection.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_IMG_AVATAR_001'), 'SPU_IMG_AVATAR_001',
    '这是一套精心设计的二次元风格头像合集，包含50个独特设计的头像。每个头像都经过精心绘制，风格清新可爱，适合用于各类社交媒体平台。提供多种尺寸版本。',
    '头像原文件、不同尺寸版本、设计源文件、商业授权证书',
    '定制服务、尺寸调整、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_IMG_AVATAR_001'), 'SPU_IMG_AVATAR_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"图片格式":"PNG/PSD","数量":"50个","尺寸":"1024x1024","类型":"二次元头像"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_IMG_AVATAR_001'), 'SPU_IMG_AVATAR_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Avatar Artist","更新日期":"2024-02-10","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_IMG_AVATAR_001'), 'SPU_IMG_AVATAR_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"人物风格":["可爱","清新","治愈","酷炫"],"表情类型":["开心","伤心","生气","惊讶"],"适用平台":["微信","QQ","微博","抖音"]}', 
3, 1, 1, 0);

-- 2.3 海报 (223000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_IMG_POSTER_001', '现代简约商业海报模板',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '220000'), '220000',
    (SELECT id FROM sys_category WHERE code = '223000'), '223000',
    345, 1000, 'PosterPro', '现代简约风格商业海报模板，适用于各类营销活动',
    29.90, 59.90, 1, 'http://example.com/images/poster_collection.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_IMG_POSTER_001'), 'SPU_IMG_POSTER_001',
    '这是一套现代简约风格的商业海报模板，包含30个不同主题的设计。每个模板都提供多种尺寸，支持在线编辑，适合各类商业营销活动使用。包含社交媒体、展览展示、促销活动等多种规格。',
    '海报模板文件、PSD源文件、字体包、商业授权证书',
    '终身更新服务、设计指导、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_IMG_POSTER_001'), 'SPU_IMG_POSTER_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"文件格式":"PSD/AI","数量":"30个","尺寸":"多种规格","类型":"商业海报"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_IMG_POSTER_001'), 'SPU_IMG_POSTER_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Poster Designer","更新日期":"2024-02-15","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_IMG_POSTER_001'), 'SPU_IMG_POSTER_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"设计风格":["简约","时尚","商务","创意"],"应用场景":["社交媒体","展览展示","促销活动","企业宣传"],"尺寸规格":["A4","A3","方形","横版","竖版"]}', 
3, 1, 1, 0);

-- 2.4 插画 (224000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_IMG_ILLUST_001', '手绘风格商业插画集',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '220000'), '220000',
    (SELECT id FROM sys_category WHERE code = '224000'), '224000',
    289, 1000, 'IllustArt', '精美手绘风格商业插画，适用于品牌营销',
    39.90, 79.90, 1, 'http://example.com/images/illustration_collection.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_IMG_ILLUST_001'), 'SPU_IMG_ILLUST_001',
    '这是一套精心创作的手绘风格商业插画集，包含20幅原创插画作品。每幅作品都以独特的手绘风格呈现，适合用于品牌营销、产品包装、社交媒体等多种商业场景。提供源文件支持个性化定制。',
    '插画原文件、矢量源文件、设计说明、商业授权证书',
    '修改服务、定制服务、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_IMG_ILLUST_001'), 'SPU_IMG_ILLUST_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"文件格式":"AI/EPS/PNG","数量":"20幅","分辨率":"300DPI","类型":"商业插画"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_IMG_ILLUST_001'), 'SPU_IMG_ILLUST_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"设计师":"Illustration Master","更新日期":"2024-02-20","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_IMG_ILLUST_001'), 'SPU_IMG_ILLUST_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"插画风格":["手绘","水彩","线描","扁平"],"应用场景":["品牌营销","产品包装","社交媒体","企业宣传"],"主题类型":["人物","场景","产品","概念"]}', 
3, 1, 1, 0);


-- ================ 3. 音乐素材 (230000) ================

-- 3.1 背景音乐 (231000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_MUSIC_BGM_001', '轻音乐背景音乐合集',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '230000'), '230000',
    (SELECT id FROM sys_category WHERE code = '231000'), '231000',
    678, 1000, 'MusicPro', '优质轻音乐背景音乐，适用于视频制作和商业场景',
    49.90, 99.90, 1, 'http://example.com/images/bgm_collection.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_BGM_001'), 'SPU_MUSIC_BGM_001',
    '这是一套精选的轻音乐背景音乐合集，包含50首高品质音乐作品。涵盖钢琴、吉他、弦乐等多种风格，适合用于视频配乐、商业空间、广告制作等场景。所有作品均提供多种时长版本。',
    '音乐文件包、使用说明、版权证书、商业授权证书',
    '版权保障、定制剪辑、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_BGM_001'), 'SPU_MUSIC_BGM_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"音频格式":"WAV/MP3","数量":"50首","采样率":"48kHz","时长":"2-5分钟"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_BGM_001'), 'SPU_MUSIC_BGM_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"作曲家":"Music Master","发行日期":"2024-02-25","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_BGM_001'), 'SPU_MUSIC_BGM_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"音乐风格":["轻音乐","钢琴","吉他","弦乐"],"情感氛围":["温馨","欢快","舒缓","优雅"],"适用场景":["视频配乐","商业空间","广告制作","企业宣传"]}', 
3, 1, 1, 0);

-- 3.2 配乐相关 (232000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_MUSIC_SCORE_001', '电影配乐精选集',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '230000'), '230000',
    (SELECT id FROM sys_category WHERE code = '232000'), '232000',
    456, 1000, 'ScorePro', '专业电影配乐素材，适用于影视制作',
    79.90, 159.90, 1, 'http://example.com/images/score_collection.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_SCORE_001'), 'SPU_MUSIC_SCORE_001',
    '这是一套专业的电影配乐素材集，包含30首史诗级配乐作品。每首作品都经过专业制作和混音，配有完整的乐器轨道，适合用于电影、预告片、游戏等影视制作。',
    '配乐文件包、分轨文件、工程文件、商业授权证书',
    '版权保障、混音指导、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_SCORE_001'), 'SPU_MUSIC_SCORE_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"音频格式":"WAV/AIFF","数量":"30首","采样率":"96kHz","位深度":"24bit"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_SCORE_001'), 'SPU_MUSIC_SCORE_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"作曲家":"Score Master","发行日期":"2024-03-01","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_SCORE_001'), 'SPU_MUSIC_SCORE_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"配乐风格":["史诗","悬疑","动作","情感"],"乐器构成":["管弦乐","打击乐","合成器","人声"],"适用场景":["电影配乐","预告片","游戏配乐","广告片"]}', 
3, 1, 1, 0);

-- 3.3 音乐节拍 (233000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_MUSIC_BEAT_001', '现代音乐节拍素材包',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '230000'), '230000',
    (SELECT id FROM sys_category WHERE code = '233000'), '233000',
    345, 1000, 'BeatPro', '专业音乐节拍素材，适用于音乐制作',
    39.90, 79.90, 1, 'http://example.com/images/beat_collection.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_BEAT_001'), 'SPU_MUSIC_BEAT_001',
    '这是一套现代音乐节拍素材包，包含100个独特的节拍样本。涵盖多种流行音乐风格，每个节拍都提供完整的音轨分离，适合用于音乐制作、混音等场景。',
    '节拍样本包、MIDI文件、工程文件、商业授权证书',
    '终身更新服务、制作指导、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_BEAT_001'), 'SPU_MUSIC_BEAT_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"音频格式":"WAV/MIDI","数量":"100个","采样率":"44.1kHz","BPM范围":"80-160"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_BEAT_001'), 'SPU_MUSIC_BEAT_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"制作人":"Beat Master","发行日期":"2024-03-05","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_BEAT_001'), 'SPU_MUSIC_BEAT_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"节拍风格":["Hip Hop","Trap","Pop","EDM"],"声音类型":["鼓组","打击乐","效果器","合成器"],"适用场景":["音乐制作","混音","现场表演","广告配乐"]}', 
3, 1, 1, 0);

-- 3.4 自然声音 (234000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_MUSIC_NATURE_001', '自然环境音效合集',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '230000'), '230000',
    (SELECT id FROM sys_category WHERE code = '234000'), '234000',
    234, 1000, 'NaturePro', '高品质自然环境音效，适用于影视制作和冥想放松',
    29.90, 59.90, 1, 'http://example.com/images/nature_sound_collection.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_NATURE_001'), 'SPU_MUSIC_NATURE_001',
    '这是一套高品质自然环境音效合集，包含200个自然声音样本。涵盖雨声、海浪、鸟鸣、森林等多种自然环境音效，采用专业录音设备采集，适合用于影视制作、冥想放松等场景。',
    '音效文件包、场景说明、使用指南、商业授权证书',
    '音效定制、场景混音、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_NATURE_001'), 'SPU_MUSIC_NATURE_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"音频格式":"WAV/MP3","数量":"200个","采样率":"96kHz","录音设备":"专业级"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_NATURE_001'), 'SPU_MUSIC_NATURE_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"录音师":"Nature Master","发行日期":"2024-03-10","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_NATURE_001'), 'SPU_MUSIC_NATURE_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"环境类型":["雨声","海浪","鸟鸣","森林"],"时长范围":["短片段","循环音效","长环境音","氛围音效"],"适用场景":["影视制作","冥想放松","游戏音效","环境布置"]}', 
3, 1, 1, 0);

-- 3.5 其它音乐 (235000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_MUSIC_OTHER_001', '综合音效素材库',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '230000'), '230000',
    (SELECT id FROM sys_category WHERE code = '235000'), '235000',
    189, 1000, 'SoundPro', '多样化音效素材库，满足各类创作需求',
    69.90, 139.90, 1, 'http://example.com/images/sound_collection.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_OTHER_001'), 'SPU_MUSIC_OTHER_001',
    '这是一套综合音效素材库，包含500个多样化音效。涵盖生活场景、电子音效、转场音效等多个类别，满足各类创作需求。所有音效均可商用，提供多种格式版本。',
    '音效素材包、分类目录、使用教程、商业授权证书',
    '素材定制、技术支持、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_OTHER_001'), 'SPU_MUSIC_OTHER_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"音频格式":"WAV/MP3/OGG","数量":"500个","采样率":"48kHz","分类":"综合音效"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_OTHER_001'), 'SPU_MUSIC_OTHER_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"制作团队":"Sound Team","发行日期":"2024-03-15","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_MUSIC_OTHER_001'), 'SPU_MUSIC_OTHER_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"音效类型":["生活场景","电子音效","转场音效","UI音效"],"时长类型":["短音效","中等音效","长音效","循环音效"],"应用领域":["视频制作","游戏开发","APP开发","多媒体创作"]}', 
3, 1, 1, 0);


-- ================ 4. 视频素材 (240000) ================

-- 4.1 广告视频 (241000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_VIDEO_AD_001', '商业广告视频素材包',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '240000'), '240000',
    (SELECT id FROM sys_category WHERE code = '241000'), '241000',
    567, 1000, 'AdPro', '高质量商业广告视频素材，适用于各类营销场景',
    89.90, 179.90, 1, 'http://example.com/images/ad_video_collection.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_AD_001'), 'SPU_VIDEO_AD_001',
    '这是一套专业的商业广告视频素材包，包含30个精选广告视频模板。涵盖产品展示、品牌宣传、活动推广等多种场景，支持自定义编辑，适合各类商业营销使用。所有素材均为4K分辨率。',
    '视频素材包、项目源文件、音效包、商业授权证书',
    '定制服务、技术指导、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_AD_001'), 'SPU_VIDEO_AD_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"视频格式":"MP4/MOV","数量":"30个","分辨率":"4K","时长":"15-60秒"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_AD_001'), 'SPU_VIDEO_AD_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"制作团队":"Ad Team","发行日期":"2024-03-20","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_AD_001'), 'SPU_VIDEO_AD_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"广告类型":["产品展示","品牌宣传","活动推广","社交媒体"],"风格类型":["时尚","科技","简约","奢华"],"适用平台":["电视","网站","社交媒体","户外大屏"]}', 
3, 1, 1, 0);

-- 4.2 宣传片 (242000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_VIDEO_PROMO_001', '企业宣传片模板',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '240000'), '240000',
    (SELECT id FROM sys_category WHERE code = '242000'), '242000',
    345, 1000, 'PromoPro', '专业企业宣传片模板，展现品牌形象',
    99.90, 199.90, 1, 'http://example.com/images/promo_video_collection.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_PROMO_001'), 'SPU_VIDEO_PROMO_001',
    '这是一套专业的企业宣传片模板，包含20个精心设计的场景模板。适合企业形象展示、产品介绍、发展历程等内容制作，提供完整的项目文件，支持深度定制。',
    '视频模板文件、项目源文件、配乐素材、商业授权证书',
    '场景定制、剪辑指导、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_PROMO_001'), 'SPU_VIDEO_PROMO_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"视频格式":"MP4/AE Project","数量":"20个","分辨率":"4K","时长":"3-5分钟"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_PROMO_001'), 'SPU_VIDEO_PROMO_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"制作团队":"Promo Team","发行日期":"2024-03-25","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_PROMO_001'), 'SPU_VIDEO_PROMO_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"内容类型":["企业介绍","产品展示","发展历程","团队风采"],"风格类型":["商务","科技","创意","人文"],"适用行业":["科技","金融","制造","服务"]}', 
3, 1, 1, 0);

-- 4.3 教学视频 (243000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_VIDEO_EDU_001', '在线教育课程模板',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '240000'), '240000',
    (SELECT id FROM sys_category WHERE code = '243000'), '243000',
    456, 1000, 'EduPro', '专业在线教育视频模板，适用于各类课程制作',
    69.90, 139.90, 1, 'http://example.com/images/edu_video_collection.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_EDU_001'), 'SPU_VIDEO_EDU_001',
    '这是一套专业的在线教育视频模板，包含25个教学场景模板。涵盖课程开场、知识讲解、练习测试等多个环节，提供丰富的教学元素和动画效果，适合各类在线课程制作。',
    '视频模板文件、教学元素包、动画素材、商业授权证书',
    '模板定制、技术支持、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_EDU_001'), 'SPU_VIDEO_EDU_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"视频格式":"MP4/AE Project","数量":"25个","分辨率":"2K","时长":"10-30分钟"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_EDU_001'), 'SPU_VIDEO_EDU_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"制作团队":"Edu Team","发行日期":"2024-03-30","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_EDU_001'), 'SPU_VIDEO_EDU_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"课程类型":["知识讲解","技能培训","语言教学","考试辅导"],"教学元素":["图表动画","字幕特效","转场效果","互动元素"],"适用对象":["中小学","高等教育","职业培训","企业培训"]}', 
3, 1, 1, 0);

-- 4.4 动画视频 (244000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_VIDEO_ANIM_001', 'MG动画模板套装',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '240000'), '240000',
    (SELECT id FROM sys_category WHERE code = '244000'), '244000',
    234, 1000, 'AnimPro', '专业MG动画模板，适用于创意视频制作',
    79.90, 159.90, 1, 'http://example.com/images/animation_collection.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ANIM_001'), 'SPU_VIDEO_ANIM_001',
    '这是一套专业的MG动画模板套装，包含40个创意动画场景。提供丰富的动画元素和转场效果，适合制作产品介绍、流程演示、数据可视化等创意视频内容。',
    'AE项目文件、动画元素包、音效素材、商业授权证书',
    '动画定制、技术指导、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ANIM_001'), 'SPU_VIDEO_ANIM_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"项目格式":"AE Project","场景数量":"40个","分辨率":"4K","帧率":"60fps"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ANIM_001'), 'SPU_VIDEO_ANIM_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"制作团队":"Animation Team","发行日期":"2024-04-01","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_ANIM_001'), 'SPU_VIDEO_ANIM_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"动画类型":["MG动画","图标动画","文字动画","场景动画"],"风格类型":["扁平化","等距","手绘","科技"],"应用场景":["产品介绍","流程演示","数据展示","品牌宣传"]}', 
3, 1, 1, 0);

-- 4.5 其它视频 (245000)
INSERT INTO `sys_product_spu` (
    `code`, `name`, `category1_id`, `category1_code`, 
    `category2_id`, `category2_code`, 
    `category3_id`, `category3_code`,
    `total_sales`, `total_stock`, `brand`, `description`,
    `price`, `real_price`, `status`, `images`,
    `created_at`, `updated_at`, `is_deleted`, `creator`, `updator`
) SELECT 
    'SPU_VIDEO_OTHER_001', '综合视频素材库',
    (SELECT id FROM sys_category WHERE code = '200000'), '200000',
    (SELECT id FROM sys_category WHERE code = '240000'), '240000',
    (SELECT id FROM sys_category WHERE code = '245000'), '245000',
    189, 1000, 'VideoPro', '多样化视频素材库，满足各类创作需求',
    129.90, 259.90, 1, 'http://example.com/images/video_collection.png',
    NOW(), NOW(), 0, 'admin', 'admin';

INSERT INTO `sys_product_spu_detail` (
    `product_spu_id`, `product_spu_code`, `detail`, `packing_list`, `after_sale`
) SELECT 
    (SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_OTHER_001'), 'SPU_VIDEO_OTHER_001',
    '这是一套综合视频素材库，包含100个多样化视频素材。涵盖实拍素材、特效素材、转场素材等多个类别，满足各类视频创作需求。所有素材均为4K分辨率，提供多种格式版本。',
    '视频素材包、特效元素包、使用教程、商业授权证书',
    '素材定制、技术支持、7天退换保障';

INSERT INTO `sys_product_spu_attr_params` (
    `product_spu_id`, `product_spu_code`, `code`, `name`, 
    `attr_type`, `value_type`, `value`, `sort`, `status`, `is_required`, `is_generic`
) VALUES 
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_OTHER_001'), 'SPU_VIDEO_OTHER_001', 
'BASIC_ATTRS', '基础属性', 1, 3, 
'{"视频格式":"MP4/MOV/ProRes","数量":"100个","分辨率":"4K","帧率":"24-60fps"}', 
1, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_OTHER_001'), 'SPU_VIDEO_OTHER_001',
'SALE_ATTRS', '销售属性', 2, 3, 
'{"制作团队":"Video Team","发行日期":"2024-04-05","授权类型":"商业授权","使用期限":"永久"}', 
2, 1, 1, 1),
((SELECT id FROM sys_product_spu WHERE code = 'SPU_VIDEO_OTHER_001'), 'SPU_VIDEO_OTHER_001',
'SPEC_ATTRS', '规格属性', 3, 3, 
'{"素材类型":["实拍素材","特效素材","转场素材","背景素材"],"使用场景":["影视制作","直播制作","短视频","演示视频"],"风格类型":["商务","生活","自然","创意"]}', 
3, 1, 1, 0);
