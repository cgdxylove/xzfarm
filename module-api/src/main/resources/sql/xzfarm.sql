/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : xzfarm

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2020-03-23 22:00:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for log_account
-- ----------------------------
DROP TABLE IF EXISTS `log_account`;
CREATE TABLE `log_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
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

-- ----------------------------
-- Records of log_account
-- ----------------------------

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
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
  `is_gift` int(1) DEFAULT '0' COMMENT '0 非赠品  1 赠品',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `pv_status` int(1) DEFAULT '0' COMMENT '商品pv值是否结算，0未结算 ，1结算',
  PRIMARY KEY (`id`),
  KEY `idx_orderid` (`order_id`),
  KEY `idx_proid` (`product_id`),
  KEY `idx_specid` (`spec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of order_details
-- ----------------------------

-- ----------------------------
-- Table structure for order_pay
-- ----------------------------
DROP TABLE IF EXISTS `order_pay`;
CREATE TABLE `order_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `seq_no` varchar(32) DEFAULT NULL COMMENT '交易号',
  `pay_status` int(11) DEFAULT NULL COMMENT '交易状态  1，正在支付（第三方支付之前） 2 支付成功 3，支付失败 ',
  `pay_type` int(11) DEFAULT NULL COMMENT '1,支付宝 2，微信 3,其他途径。。。',
  `pay_amount` double(8,2) DEFAULT NULL COMMENT '支付金额',
  `order_amount` double(8,2) DEFAULT NULL COMMENT '订单金额',
  `callback_time` datetime DEFAULT NULL COMMENT '订单支付时间(第三方支付时间)',
  `callback_code` varchar(20) DEFAULT NULL COMMENT '订单支付码',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_oid` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单支付表';

-- ----------------------------
-- Records of order_pay
-- ----------------------------

-- ----------------------------
-- Table structure for order_t
-- ----------------------------
DROP TABLE IF EXISTS `order_t`;
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
  `country_id` int(11) DEFAULT '1' COMMENT '国家id，默认中国',
  `province_id` int(11) DEFAULT NULL COMMENT '省份id',
  `city_id` int(11) DEFAULT NULL COMMENT '城市id',
  `addr` varchar(200) DEFAULT NULL COMMENT '收货详情地址',
  `zip_code` varchar(30) DEFAULT NULL COMMENT '邮政编码',
  PRIMARY KEY (`id`),
  KEY `idx_pid` (`province_id`),
  KEY `idx_cid` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of order_t
-- ----------------------------

-- ----------------------------
-- Table structure for promo_promotion
-- ----------------------------
DROP TABLE IF EXISTS `promo_promotion`;
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

-- ----------------------------
-- Records of promo_promotion
-- ----------------------------

-- ----------------------------
-- Table structure for pro_category
-- ----------------------------
DROP TABLE IF EXISTS `pro_category`;
CREATE TABLE `pro_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别id',
  `parent_id` int(11) DEFAULT NULL COMMENT '父级节点',
  `category_name` varchar(100) DEFAULT NULL COMMENT '类别名称',
  `sort_no` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '是否有效',
  PRIMARY KEY (`id`),
  KEY `idx_pid` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COMMENT='产品类别表,只支持一级子菜单';

-- ----------------------------
-- Records of pro_category
-- ----------------------------

-- ----------------------------
-- Table structure for pro_gift_details
-- ----------------------------
DROP TABLE IF EXISTS `pro_gift_details`;
CREATE TABLE `pro_gift_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gift_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `spec_id` int(11) DEFAULT NULL COMMENT '规格ID',
  `status` int(11) DEFAULT NULL COMMENT '状态 1正常 0删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `gift_id` (`gift_id`),
  KEY `idx_p_sid` (`product_id`,`spec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赠品详情表';

-- ----------------------------
-- Records of pro_gift_details
-- ----------------------------

-- ----------------------------
-- Table structure for pro_images
-- ----------------------------
DROP TABLE IF EXISTS `pro_images`;
CREATE TABLE `pro_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(200) NOT NULL COMMENT '产品图片地址',
  `object_id` int(11) NOT NULL COMMENT 'banner图ID：产品ID，类别ID，产品包ID，赠品表ID',
  `image_type` int(11) NOT NULL COMMENT '字典表图片的类型code',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='图片表';

-- ----------------------------
-- Records of pro_images
-- ----------------------------
INSERT INTO `pro_images` VALUES ('1', 'https://pics4.baidu.com/feed/3812b31bb051f819aa7eae5438f62feb2e73e71a.jpeg', '1', '1');
INSERT INTO `pro_images` VALUES ('2', 'https://pics0.baidu.com/feed/241f95cad1c8a78624a4fbcc834bac3b71cf502b.jpeg?token=98fca1dfe474531bd9ccaadab1c93d55', '1', '2');
INSERT INTO `pro_images` VALUES ('3', 'https://pics2.baidu.com/feed/377adab44aed2e73854a0ad56343c48d86d6fa75.jpeg?token=d1294192580ed043af2e5fe872ce3be0', '1', '2');
INSERT INTO `pro_images` VALUES ('4', 'https://pics5.baidu.com/feed/0e2442a7d933c8959e33fced345116f68302009b.jpeg?token=1bb56194a05aaac0e34cce786ba0884e', '2', '2');
INSERT INTO `pro_images` VALUES ('5', 'https://pics7.baidu.com/feed/3801213fb80e7bec492b204cc86cdc3e9a506b76.jpeg?token=d9504ce5a2f718bb8008d096205dd03b', '2', '2');

-- ----------------------------
-- Table structure for pro_package
-- ----------------------------
DROP TABLE IF EXISTS `pro_package`;
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

-- ----------------------------
-- Records of pro_package
-- ----------------------------
INSERT INTO `pro_package` VALUES ('1', '1', '1', '2', '产品包1', '10.00', '100.00', '90.00', null, '1', '1');

-- ----------------------------
-- Table structure for pro_package_product
-- ----------------------------
DROP TABLE IF EXISTS `pro_package_product`;
CREATE TABLE `pro_package_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_id` int(11) NOT NULL COMMENT '产品包id',
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `spec_id` int(11) DEFAULT NULL,
  `product_num` int(11) NOT NULL COMMENT '产品数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=753 DEFAULT CHARSET=utf8 COMMENT='产品产品包关联表';

-- ----------------------------
-- Records of pro_package_product
-- ----------------------------

-- ----------------------------
-- Table structure for pro_price
-- ----------------------------
DROP TABLE IF EXISTS `pro_price`;
CREATE TABLE `pro_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '产品ID',
  `spec_id` int(11) DEFAULT NULL COMMENT '规格编码',
  `retail_price` double(10,2) NOT NULL COMMENT '统一零售价',
  `pv` double(10,2) NOT NULL COMMENT 'pv值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品价格表';

-- ----------------------------
-- Records of pro_price
-- ----------------------------

-- ----------------------------
-- Table structure for pro_product
-- ----------------------------
DROP TABLE IF EXISTS `pro_product`;
CREATE TABLE `pro_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_code` varchar(20) DEFAULT NULL COMMENT '商品编码',
  `product_name` varchar(100) DEFAULT NULL COMMENT '初始产品名称',
  `category_id` int(11) NOT NULL COMMENT '所属类别id',
  `expiration` int(11) DEFAULT NULL COMMENT '产品保质期数 单位/天',
  `description` varchar(255) DEFAULT NULL COMMENT '产品说明',
  `sort_no` int(11) NOT NULL COMMENT '排序号',
  `status` int(11) NOT NULL COMMENT '是否有效： 0初始，1上架，2下架,3废弃',
  PRIMARY KEY (`id`),
  KEY `idx_categoryid` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COMMENT='产品表，包括产品和赠品';

-- ----------------------------
-- Records of pro_product
-- ----------------------------
INSERT INTO `pro_product` VALUES ('1', '1', '产品1', '1', null, null, '1', '1');
INSERT INTO `pro_product` VALUES ('2', '2', '产品2', '2', null, null, '2', '1');

-- ----------------------------
-- Table structure for pro_seckill
-- ----------------------------
DROP TABLE IF EXISTS `pro_seckill`;
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
  KEY `idx_pid` (`product_id`),
  KEY `idx_sid` (`spec_id`),
  KEY `idx_st` (`start_time`),
  KEY `idx_et` (`end_time`),
  KEY `idx_sid_st_et` (`seckill_id`,`start_time`,`end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 COMMENT='秒杀产品表';

-- ----------------------------
-- Records of pro_seckill
-- ----------------------------
INSERT INTO `pro_seckill` VALUES ('1', '1', '1', '1', '100.00', '60.00', '100', '0', '2020-03-19 21:55:10', '2020-03-24 13:30:14', null, '1', '2020-03-19 21:55:25');
INSERT INTO `pro_seckill` VALUES ('2', '1', '2', null, '200.00', '160.00', '100', '0', '2020-03-19 22:56:14', '2020-03-24 01:56:20', null, '1', '2020-03-19 21:56:34');

-- ----------------------------
-- Table structure for pro_spec
-- ----------------------------
DROP TABLE IF EXISTS `pro_spec`;
CREATE TABLE `pro_spec` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `spec_name` varchar(50) NOT NULL COMMENT '规格名称',
  `spec_sum` int(50) NOT NULL COMMENT '规格计量',
  `status` int(11) DEFAULT NULL COMMENT '是否有效',
  `sort_no` int(11) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8 COMMENT='产品规格表，规格名称使用规格id进行关联';

-- ----------------------------
-- Records of pro_spec
-- ----------------------------
INSERT INTO `pro_spec` VALUES ('1', '1', '斤', '1', '1', '1');
INSERT INTO `pro_spec` VALUES ('2', '2', '带（1kg/带）', '2', '1', '2');

-- ----------------------------
-- Table structure for pro_store
-- ----------------------------
DROP TABLE IF EXISTS `pro_store`;
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

-- ----------------------------
-- Records of pro_store
-- ----------------------------
INSERT INTO `pro_store` VALUES ('1', '1', '1', '1', '500', '400', '100');
INSERT INTO `pro_store` VALUES ('2', '2', '2', '1', '500', '400', '100');

-- ----------------------------
-- Table structure for seckill_detail
-- ----------------------------
DROP TABLE IF EXISTS `seckill_detail`;
CREATE TABLE `seckill_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seckill_id` int(11) NOT NULL COMMENT '秒杀活动的ID',
  `status` int(1) DEFAULT NULL COMMENT '是否有效',
  `user_id` bigint(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_u_s` (`user_id`,`seckill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10502 DEFAULT CHARSET=utf8 COMMENT='seckill_detail_秒杀产品id --秒杀详情分表操作，防止重复秒杀';

-- ----------------------------
-- Records of seckill_detail
-- ----------------------------
INSERT INTO `seckill_detail` VALUES ('10102', '1', null, '0', '2020-03-18 23:45:02');
INSERT INTO `seckill_detail` VALUES ('10103', '1', null, '1', '2020-03-18 23:45:02');
INSERT INTO `seckill_detail` VALUES ('10104', '1', null, '2', '2020-03-18 23:45:02');
INSERT INTO `seckill_detail` VALUES ('10105', '1', null, '3', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10106', '1', null, '4', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10107', '1', null, '5', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10108', '1', null, '6', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10109', '1', null, '7', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10110', '1', null, '8', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10111', '1', null, '9', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10112', '1', null, '10', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10113', '1', null, '11', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10114', '1', null, '12', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10115', '1', null, '13', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10116', '1', null, '14', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10117', '1', null, '15', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10118', '1', null, '16', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10119', '1', null, '17', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10120', '1', null, '18', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10121', '1', null, '19', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10122', '1', null, '20', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10123', '1', null, '21', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10124', '1', null, '22', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10125', '1', null, '23', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10126', '1', null, '24', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10127', '1', null, '25', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10128', '1', null, '26', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10129', '1', null, '27', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10130', '1', null, '28', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10131', '1', null, '29', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10132', '1', null, '30', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10133', '1', null, '31', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10134', '1', null, '32', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10135', '1', null, '33', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10136', '1', null, '34', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10137', '1', null, '35', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10138', '1', null, '36', '2020-03-18 23:45:03');
INSERT INTO `seckill_detail` VALUES ('10139', '1', null, '37', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10140', '1', null, '38', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10141', '1', null, '39', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10142', '1', null, '40', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10143', '1', null, '41', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10144', '1', null, '42', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10145', '1', null, '43', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10146', '1', null, '44', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10147', '1', null, '45', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10148', '1', null, '46', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10149', '1', null, '47', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10150', '1', null, '48', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10151', '1', null, '49', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10152', '1', null, '50', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10153', '1', null, '51', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10154', '1', null, '52', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10155', '1', null, '53', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10156', '1', null, '54', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10157', '1', null, '55', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10158', '1', null, '56', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10159', '1', null, '57', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10160', '1', null, '58', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10161', '1', null, '59', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10162', '1', null, '60', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10163', '1', null, '61', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10164', '1', null, '62', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10165', '1', null, '63', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10166', '1', null, '64', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10167', '1', null, '65', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10168', '1', null, '66', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10169', '1', null, '67', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10170', '1', null, '68', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10171', '1', null, '69', '2020-03-18 23:45:04');
INSERT INTO `seckill_detail` VALUES ('10172', '1', null, '70', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10173', '1', null, '71', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10174', '1', null, '72', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10175', '1', null, '73', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10176', '1', null, '74', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10177', '1', null, '75', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10178', '1', null, '76', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10179', '1', null, '77', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10180', '1', null, '78', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10181', '1', null, '79', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10182', '1', null, '80', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10183', '1', null, '81', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10184', '1', null, '82', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10185', '1', null, '83', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10186', '1', null, '84', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10187', '1', null, '85', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10188', '1', null, '86', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10189', '1', null, '87', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10190', '1', null, '88', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10191', '1', null, '89', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10192', '1', null, '90', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10193', '1', null, '91', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10194', '1', null, '92', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10195', '1', null, '93', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10196', '1', null, '94', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10197', '1', null, '95', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10198', '1', null, '96', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10199', '1', null, '97', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10200', '1', null, '98', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10201', '1', null, '99', '2020-03-18 23:45:05');
INSERT INTO `seckill_detail` VALUES ('10202', '1', null, '0', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10203', '1', null, '1', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10204', '1', null, '2', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10205', '1', null, '3', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10206', '1', null, '4', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10207', '1', null, '5', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10208', '1', null, '6', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10209', '1', null, '7', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10210', '1', null, '8', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10211', '1', null, '9', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10212', '1', null, '10', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10213', '1', null, '11', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10214', '1', null, '12', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10215', '1', null, '13', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10216', '1', null, '14', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10217', '1', null, '15', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10218', '1', null, '16', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10219', '1', null, '17', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10220', '1', null, '18', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10221', '1', null, '19', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10222', '1', null, '20', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10223', '1', null, '21', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10224', '1', null, '22', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10225', '1', null, '23', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10226', '1', null, '24', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10227', '1', null, '25', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10228', '1', null, '26', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10229', '1', null, '27', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10230', '1', null, '28', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10231', '1', null, '29', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10232', '1', null, '30', '2020-03-20 15:15:31');
INSERT INTO `seckill_detail` VALUES ('10233', '1', null, '31', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10234', '1', null, '32', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10235', '1', null, '33', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10236', '1', null, '34', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10237', '1', null, '35', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10238', '1', null, '36', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10239', '1', null, '37', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10240', '1', null, '38', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10241', '1', null, '39', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10242', '1', null, '40', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10243', '1', null, '41', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10244', '1', null, '42', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10245', '1', null, '43', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10246', '1', null, '44', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10247', '1', null, '45', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10248', '1', null, '46', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10249', '1', null, '47', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10250', '1', null, '48', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10251', '1', null, '49', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10252', '1', null, '50', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10253', '1', null, '51', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10254', '1', null, '52', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10255', '1', null, '53', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10256', '1', null, '54', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10257', '1', null, '55', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10258', '1', null, '56', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10259', '1', null, '57', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10260', '1', null, '58', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10261', '1', null, '59', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10262', '1', null, '60', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10263', '1', null, '61', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10264', '1', null, '62', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10265', '1', null, '63', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10266', '1', null, '64', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10267', '1', null, '65', '2020-03-20 15:15:32');
INSERT INTO `seckill_detail` VALUES ('10268', '1', null, '66', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10269', '1', null, '67', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10270', '1', null, '68', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10271', '1', null, '69', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10272', '1', null, '70', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10273', '1', null, '71', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10274', '1', null, '72', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10275', '1', null, '73', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10276', '1', null, '74', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10277', '1', null, '75', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10278', '1', null, '76', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10279', '1', null, '77', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10280', '1', null, '78', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10281', '1', null, '79', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10282', '1', null, '80', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10283', '1', null, '81', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10284', '1', null, '82', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10285', '1', null, '83', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10286', '1', null, '84', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10287', '1', null, '85', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10288', '1', null, '86', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10289', '1', null, '87', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10290', '1', null, '88', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10291', '1', null, '89', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10292', '1', null, '90', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10293', '1', null, '91', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10294', '1', null, '92', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10295', '1', null, '93', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10296', '1', null, '94', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10297', '1', null, '95', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10298', '1', null, '96', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10299', '1', null, '97', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10300', '1', null, '98', '2020-03-20 15:15:33');
INSERT INTO `seckill_detail` VALUES ('10301', '1', null, '99', '2020-03-20 15:15:34');
INSERT INTO `seckill_detail` VALUES ('10302', '1', null, '0', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10303', '1', null, '1', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10304', '1', null, '2', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10305', '1', null, '3', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10306', '1', null, '4', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10307', '1', null, '5', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10308', '1', null, '6', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10309', '1', null, '7', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10310', '1', null, '8', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10311', '1', null, '9', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10312', '1', null, '10', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10313', '1', null, '11', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10314', '1', null, '12', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10315', '1', null, '13', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10316', '1', null, '14', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10317', '1', null, '15', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10318', '1', null, '16', '2020-03-20 15:22:29');
INSERT INTO `seckill_detail` VALUES ('10319', '1', null, '17', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10320', '1', null, '18', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10321', '1', null, '19', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10322', '1', null, '20', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10323', '1', null, '21', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10324', '1', null, '22', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10325', '1', null, '23', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10326', '1', null, '24', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10327', '1', null, '25', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10328', '1', null, '26', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10329', '1', null, '27', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10330', '1', null, '28', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10331', '1', null, '29', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10332', '1', null, '30', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10333', '1', null, '31', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10334', '1', null, '32', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10335', '1', null, '33', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10336', '1', null, '34', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10337', '1', null, '35', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10338', '1', null, '36', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10339', '1', null, '37', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10340', '1', null, '38', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10341', '1', null, '39', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10342', '1', null, '40', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10343', '1', null, '41', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10344', '1', null, '42', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10345', '1', null, '43', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10346', '1', null, '44', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10347', '1', null, '45', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10348', '1', null, '46', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10349', '1', null, '47', '2020-03-20 15:22:30');
INSERT INTO `seckill_detail` VALUES ('10350', '1', null, '48', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10351', '1', null, '49', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10352', '1', null, '50', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10353', '1', null, '51', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10354', '1', null, '52', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10355', '1', null, '53', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10356', '1', null, '54', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10357', '1', null, '55', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10358', '1', null, '56', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10359', '1', null, '57', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10360', '1', null, '58', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10361', '1', null, '59', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10362', '1', null, '60', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10363', '1', null, '61', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10364', '1', null, '62', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10365', '1', null, '63', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10366', '1', null, '64', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10367', '1', null, '65', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10368', '1', null, '66', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10369', '1', null, '67', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10370', '1', null, '68', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10371', '1', null, '69', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10372', '1', null, '70', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10373', '1', null, '71', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10374', '1', null, '72', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10375', '1', null, '73', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10376', '1', null, '74', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10377', '1', null, '75', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10378', '1', null, '76', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10379', '1', null, '77', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10380', '1', null, '78', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10381', '1', null, '79', '2020-03-20 15:22:31');
INSERT INTO `seckill_detail` VALUES ('10382', '1', null, '80', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10383', '1', null, '81', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10384', '1', null, '82', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10385', '1', null, '83', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10386', '1', null, '84', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10387', '1', null, '85', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10388', '1', null, '86', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10389', '1', null, '87', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10390', '1', null, '88', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10391', '1', null, '89', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10392', '1', null, '90', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10393', '1', null, '91', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10394', '1', null, '92', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10395', '1', null, '93', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10396', '1', null, '94', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10397', '1', null, '95', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10398', '1', null, '96', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10399', '1', null, '97', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10400', '1', null, '98', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10401', '1', null, '99', '2020-03-20 15:22:32');
INSERT INTO `seckill_detail` VALUES ('10402', '1', null, '0', '2020-03-20 15:24:03');
INSERT INTO `seckill_detail` VALUES ('10403', '1', null, '1', '2020-03-20 15:24:03');
INSERT INTO `seckill_detail` VALUES ('10404', '1', null, '2', '2020-03-20 15:24:03');
INSERT INTO `seckill_detail` VALUES ('10405', '1', null, '3', '2020-03-20 15:24:03');
INSERT INTO `seckill_detail` VALUES ('10406', '1', null, '4', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10407', '1', null, '5', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10408', '1', null, '6', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10409', '1', null, '7', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10410', '1', null, '8', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10411', '1', null, '9', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10412', '1', null, '10', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10413', '1', null, '11', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10414', '1', null, '12', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10415', '1', null, '13', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10416', '1', null, '14', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10417', '1', null, '15', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10418', '1', null, '16', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10419', '1', null, '17', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10420', '1', null, '18', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10421', '1', null, '19', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10422', '1', null, '20', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10423', '1', null, '21', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10424', '1', null, '22', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10425', '1', null, '23', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10426', '1', null, '24', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10427', '1', null, '25', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10428', '1', null, '26', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10429', '1', null, '27', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10430', '1', null, '28', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10431', '1', null, '29', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10432', '1', null, '30', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10433', '1', null, '31', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10434', '1', null, '32', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10435', '1', null, '33', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10436', '1', null, '34', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10437', '1', null, '35', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10438', '1', null, '36', '2020-03-20 15:24:04');
INSERT INTO `seckill_detail` VALUES ('10439', '1', null, '37', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10440', '1', null, '38', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10441', '1', null, '39', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10442', '1', null, '40', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10443', '1', null, '41', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10444', '1', null, '42', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10445', '1', null, '43', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10446', '1', null, '44', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10447', '1', null, '45', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10448', '1', null, '46', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10449', '1', null, '47', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10450', '1', null, '48', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10451', '1', null, '49', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10452', '1', null, '50', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10453', '1', null, '51', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10454', '1', null, '52', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10455', '1', null, '53', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10456', '1', null, '54', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10457', '1', null, '55', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10458', '1', null, '56', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10459', '1', null, '57', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10460', '1', null, '58', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10461', '1', null, '59', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10462', '1', null, '60', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10463', '1', null, '61', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10464', '1', null, '62', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10465', '1', null, '63', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10466', '1', null, '64', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10467', '1', null, '65', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10468', '1', null, '66', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10469', '1', null, '67', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10470', '1', null, '68', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10471', '1', null, '69', '2020-03-20 15:24:05');
INSERT INTO `seckill_detail` VALUES ('10472', '1', null, '70', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10473', '1', null, '71', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10474', '1', null, '72', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10475', '1', null, '73', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10476', '1', null, '74', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10477', '1', null, '75', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10478', '1', null, '76', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10479', '1', null, '77', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10480', '1', null, '78', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10481', '1', null, '79', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10482', '1', null, '80', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10483', '1', null, '81', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10484', '1', null, '82', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10485', '1', null, '83', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10486', '1', null, '84', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10487', '1', null, '85', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10488', '1', null, '86', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10489', '1', null, '87', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10490', '1', null, '88', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10491', '1', null, '89', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10492', '1', null, '90', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10493', '1', null, '91', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10494', '1', null, '92', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10495', '1', null, '93', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10496', '1', null, '94', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10497', '1', null, '95', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10498', '1', null, '96', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10499', '1', null, '97', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10500', '1', null, '98', '2020-03-20 15:24:06');
INSERT INTO `seckill_detail` VALUES ('10501', '1', null, '99', '2020-03-20 15:24:06');

-- ----------------------------
-- Table structure for seckill_detail_1
-- ----------------------------
DROP TABLE IF EXISTS `seckill_detail_1`;
CREATE TABLE `seckill_detail_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seckill_id` int(11) NOT NULL COMMENT '秒杀活动的ID',
  `user_id` bigint(20) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_u_s` (`user_id`,`seckill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='seckill_detail_秒杀产品id --秒杀详情分表操作，防止重复秒杀';

-- ----------------------------
-- Records of seckill_detail_1
-- ----------------------------

-- ----------------------------
-- Table structure for sys_address_fixed
-- ----------------------------
DROP TABLE IF EXISTS `sys_address_fixed`;
CREATE TABLE `sys_address_fixed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT '1' COMMENT '默认中国',
  `province_id` int(11) DEFAULT NULL COMMENT '省份id',
  `city_id` int(11) DEFAULT NULL COMMENT '城市id',
  `zip_code` varchar(30) DEFAULT NULL COMMENT '邮政编码',
  `addr` varchar(200) DEFAULT NULL COMMENT '收货详情地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='本地县城自提，地点表';

-- ----------------------------
-- Records of sys_address_fixed
-- ----------------------------

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('5', 'name', 'value', '2020-03-19 08:59:34');
INSERT INTO `test` VALUES ('6', 'name', 'value', '2020-03-19 08:59:34');
INSERT INTO `test` VALUES ('7', 'name', 'value', '2020-03-19 08:59:34');
INSERT INTO `test` VALUES ('8', 'name', 'value', '2020-03-19 08:59:34');
INSERT INTO `test` VALUES ('9', 'name', 'value', '2020-03-19 08:59:34');
INSERT INTO `test` VALUES ('10', 'name', 'value', '2020-03-19 08:59:34');
INSERT INTO `test` VALUES ('11', 'name', 'value', '2020-03-19 08:59:34');
INSERT INTO `test` VALUES ('12', 'name', 'value', '2020-03-19 08:59:34');
INSERT INTO `test` VALUES ('13', 'name', 'value', '2020-03-19 08:59:34');
INSERT INTO `test` VALUES ('14', 'name', 'value', '2020-03-19 08:59:34');
INSERT INTO `test` VALUES ('15', 'name', 'value', '2020-03-19 08:59:34');
INSERT INTO `test` VALUES ('16', 'name', 'value', '2020-03-19 08:59:34');
INSERT INTO `test` VALUES ('17', 'name', 'value', '2020-03-19 08:59:34');
INSERT INTO `test` VALUES ('18', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('19', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('20', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('21', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('22', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('23', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('24', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('25', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('26', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('27', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('28', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('29', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('30', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('31', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('32', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('33', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('34', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('35', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('36', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('37', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('38', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('39', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('40', 'name', 'value', '2020-03-19 08:59:35');
INSERT INTO `test` VALUES ('41', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('42', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('43', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('44', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('45', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('46', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('47', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('48', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('49', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('50', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('51', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('52', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('53', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('54', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('55', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('56', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('57', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('58', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('59', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('60', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('61', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('62', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('63', 'name', 'value', '2020-03-19 08:59:36');
INSERT INTO `test` VALUES ('64', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('65', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('66', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('67', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('68', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('69', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('70', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('71', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('72', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('73', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('74', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('75', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('76', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('77', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('78', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('79', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('80', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('81', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('82', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('83', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('84', 'name', 'value', '2020-03-19 08:59:37');
INSERT INTO `test` VALUES ('85', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('86', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('87', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('88', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('89', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('90', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('91', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('92', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('93', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('94', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('95', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('96', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('97', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('98', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('99', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('100', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('101', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('102', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('103', 'name', 'value', '2020-03-19 08:59:38');
INSERT INTO `test` VALUES ('104', 'name', 'value', '2020-03-19 08:59:38');

-- ----------------------------
-- Table structure for user_account
-- ----------------------------
DROP TABLE IF EXISTS `user_account`;
CREATE TABLE `user_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `ec_total` double(10,2) DEFAULT '0.00' COMMENT '电子币总额',
  `update_time` datetime DEFAULT NULL COMMENT '最后一次更新时间',
  `create_time` datetime NOT NULL COMMENT '用户创建时间',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1正常   2锁定   3黑名单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户电子币表';

-- ----------------------------
-- Records of user_account
-- ----------------------------

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `contacts` varchar(200) DEFAULT NULL COMMENT '联系人',
  `mobile` varchar(15) DEFAULT NULL COMMENT '联系人电话',
  `country_id` int(11) DEFAULT '1' COMMENT '默认中国',
  `province_id` int(11) DEFAULT NULL COMMENT '省份id',
  `city_id` int(11) DEFAULT NULL COMMENT '城市id',
  `zip_code` varchar(30) DEFAULT NULL COMMENT '邮政编码',
  `addr` varchar(200) DEFAULT NULL COMMENT '收货详情地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户预设地址表';

-- ----------------------------
-- Records of user_address
-- ----------------------------

-- ----------------------------
-- Table structure for user_shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `user_shopping_cart`;
CREATE TABLE `user_shopping_cart` (
  `user_id` bigint(20) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '产品id，固定产品包id',
  `spec_id` int(11) DEFAULT NULL COMMENT '规格id',
  `product_type` int(11) DEFAULT NULL COMMENT '20360001：产品 20360002产品包 ',
  `number` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  KEY `idx_userid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of user_shopping_cart
-- ----------------------------

-- ----------------------------
-- Table structure for user_t
-- ----------------------------
DROP TABLE IF EXISTS `user_t`;
CREATE TABLE `user_t` (
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

-- ----------------------------
-- Records of user_t
-- ----------------------------
