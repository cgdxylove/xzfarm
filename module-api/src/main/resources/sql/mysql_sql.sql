
create table `user_t` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uname` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `password` char(32) NOT NULL COMMENT '密码',
  `country_id` int(11) NOT NULL,
  `sex` int(1) DEFAULT NULL COMMENT '0女1男',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `email` varchar(100) NOT NULL COMMENT '邮箱地址',
  `phone` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `placement_id` bigint(20) DEFAULT NULL COMMENT '推荐人id',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1正常   2锁定   3黑名单',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000010000 DEFAULT CHARSET=utf8 COMMENT='会员表';


CREATE TABLE `user_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `ec_total` double(10,2) DEFAULT '0.00' COMMENT '电子币总额',
  `update_time` datetime DEFAULT NULL COMMENT '最后一次更新时间',
  `create_time` datetime NOT NULL COMMENT '用户创建时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1正常   2锁定   3黑名单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='用户电子币表';

CREATE TABLE `log_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL ,
  `operate_type` int(11) DEFAULT NULL COMMENT '1 提现 ，2 代币支付，3 下级购买，提成 4，管理员充值',
  `operate_no` varchar(32) DEFAULT NULL COMMENT '操作号',
  `old_amount` double(10,2) DEFAULT NULL COMMENT '操作前金额',
  `operate_amount` double(10,2) DEFAULT NULL COMMENT '操作金额',
  `new_amount` double(10,2) DEFAULT NULL COMMENT '操作后金额',
  `operator_id` bigint(20) DEFAULT NULL COMMENT '操作人ID',
  `operator_name` varchar(150) DEFAULT NULL COMMENT '操作人姓名',
  `operator_type` int(11) DEFAULT NULL COMMENT '操作人类型:1,用户 2，管理员',
  `description` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63652 DEFAULT CHARSET=utf8 COMMENT='财务记录';

CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT  NULL  COMMENT '用户id',
  `contacts` varchar(200) DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(15) DEFAULT NULL COMMENT '联系人电话',
  `country_id` int(11) DEFAULT 1  COMMENT '默认中国',
  `province_id` int(11) DEFAULT NULL COMMENT '省份id',
  `city_id` int(11) DEFAULT NULL COMMENT '城市id',
  `zip_code` varchar(30) DEFAULT NULL COMMENT '邮政编码',
  `addr` varchar(200) DEFAULT NULL COMMENT '收货详情地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY idx_uid (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='用户预设地址表';


CREATE TABLE `order_t` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(32) NOT NULL COMMENT '订单编号',
  `user_id` bigint(20) NOT NULL COMMENT '会员id',
  `order_status` int(11) NOT NULL COMMENT '1未付款  2待发货 3已发货 4已收货 5取消 6订单审核中',
  `product_amount` double(8,2) NOT NULL COMMENT '订单产品原价',
  `discount_amount` double(8,2) DEFAULT NULL COMMENT '折扣',
  `product_amount_pay` double(8,2) DEFAULT NULL COMMENT '订单产品实际价格-折后价',
  `tax_fee` double(8,2) DEFAULT NULL COMMENT '总税',
  `freight_fee` double(8,2) DEFAULT NULL COMMENT '总运费',
  `order_amount` double(8,2) NOT NULL COMMENT '订单总金额-包括产品、税、运费',
  `order_amount_local` double(8,2) DEFAULT NULL COMMENT '订单总金额-包括产品、税、运费',
  `order_pv` double(8,2) DEFAULT NULL COMMENT '订单pv',
  `pay_type` int(11) DEFAULT NULL COMMENT '支付方式',
  `take_type` int(11) NOT NULL DEFAULT '2' COMMENT '1.邮寄 2.定点自提 3,县城内部送货上门',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注留言',
  `seckill_id` int(11) DEFAULT NULL COMMENT '秒杀Id',
  `order_time` datetime DEFAULT NULL COMMENT '下单时间',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `contacts` varchar(200) DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(15) DEFAULT NULL COMMENT '联系人电话',
  `country_id` int(11) DEFAULT 1 COMMENT '国家id，默认中国',
  `province_id` int(11) DEFAULT NULL COMMENT '省份id',
  `city_id` int(11) DEFAULT NULL COMMENT '城市id',
  `addr` varchar(200) DEFAULT NULL COMMENT '收货详情地址',
  `zip_code` varchar(30) DEFAULT NULL COMMENT '邮政编码',
   PRIMARY KEY (`id`),
   KEY  idx_pid (`province_id`),
   KEY idx_cid (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='订单表';

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_type` int(11) DEFAULT NULL COMMENT '1：产品 2产品包',
  `product_id` int(11) DEFAULT NULL COMMENT '产品id  产品包id  ',
  `product_name` varchar(100) DEFAULT NULL COMMENT '产品名称',
  `spec_id` int(11) DEFAULT NULL COMMENT '商品规格id',
  `spec_name` varchar(100) DEFAULT NULL COMMENT '规格名称',
  `product_price` double(8,2) DEFAULT NULL COMMENT '标价',
  `product_pv` double(8,2) DEFAULT NULL COMMENT '产品pv',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `is_gift` int(1) DEFAULT 0 COMMENT '0 非赠品  1 赠品',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `pv_status` int(1) DEFAULT 0 COMMENT '商品pv值是否结算，0未结算 ，1结算',
  PRIMARY KEY (`id`),
  KEY idx_orderid (order_id),
  KEY idx_proid (`product_id`),
  KEY idx_specid (`spec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='订单详情表';


CREATE TABLE `pro_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级节点',
  `category_name` varchar(100) DEFAULT NULL COMMENT '类别名称',
  `sort_no` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`),
   KEY  idx_pid (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COMMENT='产品类别表,只支持一级子菜单';


CREATE TABLE `pro_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(20) DEFAULT NULL COMMENT '商品编码',
  `product_name` varchar(100) DEFAULT NULL COMMENT '初始产品名称',
  `category_id` int(11) NOT NULL COMMENT '所属类别id',
  `status` int(11) NOT NULL COMMENT '是否有效： 0初始，1上架，2下架,3废弃',
  `sort_no` int(11) NOT NULL COMMENT '排序号',
  `expiration` int(11) DEFAULT NULL COMMENT '产品保质期数 单位/月',
  PRIMARY KEY (`id`),
  KEY idx_categoryid (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COMMENT='产品表，包括产品和赠品';


drop table if exists `pro_gift_details`;
  CREATE TABLE `pro_gift_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gift_id` int(11) NOT NULL ,
  `product_id` int(11) NOT NULL ,
  `spec_id` int(11) DEFAULT NULL COMMENT '规格ID',
  `status` int(11) DEFAULT NULL COMMENT '状态 1正常 0删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY (`gift_id`),
  KEY idx_p_sid (`product_id`,`spec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='赠品详情表';

CREATE TABLE `pro_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `spec_name` varchar(50) NOT NULL COMMENT '规格名称',
  `spec_sum` varchar(50) NOT NULL COMMENT '规格计量',
--   `weight` float DEFAULT NULL COMMENT '产品重量，单位g',
--   `volume` float DEFAULT NULL COMMENT '产品体积，单位ml',
  `status` int(11) DEFAULT NULL COMMENT '是否有效',
   `sort_no` int(11) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8 COMMENT='产品规格表，规格名称使用规格id进行关联';

CREATE TABLE `pro_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `spec_id` int(11) DEFAULT NULL COMMENT '规格编码',
  `store_type` int(11) DEFAULT NULL COMMENT '0产品库存 1赠品库存',
  `store_num` int(11) DEFAULT NULL COMMENT '库存总量',
  `store_num_usable` int(11) DEFAULT NULL COMMENT '库存可用',
  `store_num_freezen` int(11) DEFAULT NULL COMMENT '库存冻结，比如秒杀需要50件，则先冻结50件库存',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_product_type` (`product_id`,`spec_id`,`store_type`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8 COMMENT='库存表，与产品、规格相关';



CREATE TABLE `pro_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `spec_id` int(11) DEFAULT NULL COMMENT '规格编码',
  `retail_price` double(10,2) NOT NULL COMMENT '统一零售价',
  `pv` double(10,2) NOT NULL COMMENT 'pv值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='产品价格表';


CREATE TABLE `pro_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(200) NOT NULL COMMENT '产品图片地址',
  `object_id` int(11) NOT NULL COMMENT 'banner图ID：产品ID，类别ID，产品包ID，赠品表ID',
  `image_type` int(11) NOT NULL COMMENT '字典表图片的类型code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='图片表';

CREATE TABLE `pro_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL COMMENT '国家id',
  `package_code` varchar(20) NOT NULL COMMENT '产品包编码',
  `category_id` int(11) DEFAULT NULL COMMENT '所属类别id',
  `package_name` varchar(100) DEFAULT NULL COMMENT '产品包名称',
  `package_pv` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '产品包pv',
  `purchase_price` double(10,2) DEFAULT '0.00' COMMENT '产品包内容原价格',
  `current_price` double(10,2) DEFAULT '0.00' COMMENT '产品包现价',
  `description` text COMMENT '产品包说明',
  `sort_no` int(11) NOT NULL COMMENT '排序号',
  `status` int(11) DEFAULT NULL COMMENT '0初始，1上架，2下架,3废弃',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='产品包表';

CREATE TABLE `pro_package_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL COMMENT '产品包id',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `spec_id` int(11) DEFAULT NULL,
  `product_num` int(11) NOT NULL COMMENT '产品数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=753 DEFAULT CHARSET=utf8 COMMENT='产品产品包关联表';


CREATE TABLE `promo_promotion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '促销名称',
  `promo_type` int(11) DEFAULT NULL COMMENT '促销类型-1.单品让利促销  2.按订单满金额 3，按产品满数量 4，赠品 ',
  `promo_target` int(11) DEFAULT NULL COMMENT '单品让利促销，商品id，product_id',
  `overlap` int(1) DEFAULT NULL COMMENT '是否支持重叠，1可重叠，0不可重叠',
  `multiple_value` int(11) DEFAULT NULL COMMENT '阶梯促销减价',
  `threshold` int(11) DEFAULT NULL COMMENT '满多少-阀值（元、件）',
  `promo_value` double(10,2) DEFAULT NULL COMMENT '促销提供的价值(减价)',
  `gift_id` int(11) DEFAULT NULL COMMENT '赠品id',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` int(11) DEFAULT NULL COMMENT '活动状态-0禁用、1启用、2初始、3结束(数据库存)、4手动结束（删除）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8 COMMENT='促销主表(与秒杀表分开)';

CREATE TABLE `user_shopping_cart` (
  `user_id` bigint(20) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '产品id，固定产品包id',
  `spec_id` int(11) DEFAULT NULL COMMENT '规格id',
  `product_type` int(11) DEFAULT NULL COMMENT '20360001：产品 20360002产品包 ',
  `number` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
   KEY idx_userid (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='购物车';


CREATE TABLE `order_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `seq_no` varchar(32) DEFAULT NULL COMMENT '交易号',
  `pay_status` int(11) DEFAULT NULL COMMENT '交易状态  1，正在支付（第三方支付之前） 2 支付成功 3，支付失败 ',
  `pay_type` int(11) DEFAULT NULL  COMMENT '1,支付宝 2，微信 3,其他途径。。。' ,
  `pay_amount` double(8,2) DEFAULT NULL COMMENT '支付金额' ,
  `order_amount` double(8,2) DEFAULT NULL COMMENT '订单金额',
  `callback_time` datetime DEFAULT NULL COMMENT '订单支付时间(第三方支付时间)',
  `callback_code` varchar(20) DEFAULT NULL  COMMENT '订单支付码',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY idx_oid (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='订单支付表';




CREATE TABLE `pro_seckill` (
  `seckill_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL COMMENT '活动产品ID',
  `product_type` int(11) DEFAULT NULL COMMENT '20360001：产品 20360002产品包',
  `spec_id` int(11) DEFAULT NULL COMMENT '规格ID',
  `price` double(8,2) DEFAULT NULL COMMENT '原价',
  `promo_price` double(8,2) DEFAULT NULL COMMENT '秒杀价',
  `store_num` int(11) DEFAULT NULL COMMENT '库存数量',
  `saled_num` int(11) DEFAULT NULL COMMENT '秒杀结束后，已售数量',
  `start_time` datetime DEFAULT NULL COMMENT '秒杀开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '秒杀结束时间',
  `description` text COMMENT '秒杀活动说明',
  `status` int(11) DEFAULT NULL COMMENT '活动状态-0初始、1启用、2结束(数据库存)、3禁用，4手动结束（删除）',

  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`seckill_id`),
  KEY  idx_pid (product_id),
  KEY  idx_sid (spec_id),
  KEY  idx_st (start_time),
  KEY  idx_et (end_time),
  KEY  idx_sid_st_et (seckill_id,start_time,end_time)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 COMMENT='秒杀产品表';


CREATE TABLE `seckill_detail_1`(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seckill_id` int(11)   NOT NULL COMMENT '秒杀活动的ID',
  `user_id` bigint(20) NOT NULL ,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY  idx_u_s (user_id,seckill_id)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='seckill_detail_秒杀产品id --秒杀详情分表操作，防止重复秒杀';


-- 泗洪县，定点自提表
CREATE TABLE `sys_address_fixed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT 1  COMMENT '默认中国',
  `province_id` int(11) DEFAULT NULL COMMENT '省份id',
  `city_id` int(11) DEFAULT NULL COMMENT '城市id',
  `zip_code` varchar(30) DEFAULT NULL COMMENT '邮政编码',
  `addr` varchar(200) DEFAULT NULL COMMENT '收货详情地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COMMENT='本地县城自提，地点表';


-- 全国地址表
