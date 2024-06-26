/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50623
 Source Host           : localhost:3306
 Source Schema         : store

 Target Server Type    : MySQL
 Target Server Version : 50623
 File Encoding         : 65001

 Date: 12/11/2022 21:31:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '手机');
INSERT INTO `category` VALUES (2, '电视机');
INSERT INTO `category` VALUES (3, '保护套');
INSERT INTO `category` VALUES (4, '保护膜');
INSERT INTO `category` VALUES (5, '充电器');
INSERT INTO `category` VALUES (6, '充电宝');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_num` int(11) NOT NULL,
  `product_price` double NOT NULL,
  `order_time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_user_id`(`user_id`) USING BTREE,
  INDEX `orderpro_id`(`product_id`) USING BTREE,
  CONSTRAINT `order_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orderpro_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_picture` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_price` double NOT NULL,
  `product_selling_price` double NOT NULL,
  `product_num` int(11) NOT NULL,
  `product_sales` int(11) NOT NULL,
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `pro_category_id`(`category_id`) USING BTREE,
  CONSTRAINT `pro_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'Redmi K30', 1, '120Hz流速屏，全速热爱', '120Hz高帧率流速屏/ 索尼6400万前后六摄 / 6.67\'小孔径全面屏 / 最高可选8GB+256GB大存储 / 高通骁龙730G处理器 / 3D四曲面玻璃机身 / 4500mAh+27W快充 / 多功能NFC', 'public/imgs/phone/Redmi-k30.png', 2000, 1599, 10, 0);
INSERT INTO `product` VALUES (2, 'Redmi K30 5G', 1, '双模5G,120Hz流速屏', '双模5G / 三路并发 / 高通骁龙765G / 7nm 5G低功耗处理器 / 120Hz高帧率流速屏 / 6.67\'小孔径全面屏 / 索尼6400万前后六摄 / 最高可选8GB+256GB大存储 / 4500mAh+30W快充 / 3D四曲面玻璃机身 / 多功能NFC', 'public/imgs/phone/Redmi-k30-5G.png', 2599, 2599, 10, 0);
INSERT INTO `product` VALUES (3, '小米CC9 Pro', 1, '1亿像素,五摄四闪', '1亿像素主摄 / 全场景五摄像头 / 四闪光灯 / 3200万自拍 / 10 倍混合光学变焦，50倍数字变焦 / 5260mAh ⼤电量 / 标配 30W疾速快充 / ⼩米⾸款超薄屏下指纹 / 德国莱茵低蓝光认证 / 多功能NFC / 红外万能遥控 / 1216超线性扬声器', 'public/imgs/phone/Mi-CC9.png', 2799, 2599, 20, 0);
INSERT INTO `product` VALUES (4, 'Redmi 8', 1, '5000mAh超长续航', '5000mAh超长续航 / 高通骁龙439八核处理器 / 4GB+64GB', 'public/imgs/phone/Redmi-8.png', 799, 699, 20, 0);
INSERT INTO `product` VALUES (5, 'Redmi 8A', 1, '5000mAh超长续航', '5000mAh超长续航 / 高通骁龙439八核处理器 / 4GB+64GB / 1200万AI后置相机', 'public/imgs/phone/Redmi-8A.png', 599, 699, 20, 0);
INSERT INTO `product` VALUES (6, 'Redmi Note8 Pro', 1, '6400万全场景四摄', '6400万四摄小金刚拍照新旗舰超强解析力，超震撼', 'public/imgs/phone/Redmi-Note8-pro.png', 1399, 1199, 20, 0);
INSERT INTO `product` VALUES (7, 'Redmi Note8', 1, '千元4800万四摄', '千元4800万四摄 | 高通骁龙665 | 小金刚品质保证', 'public/imgs/phone/Redmi-Note8.png', 999, 999, 20, 0);
INSERT INTO `product` VALUES (8, 'Redmi 7A', 1, '小巧大电量 持久流畅', '小巧大电量，持久又流畅骁龙8核高性能处理器 | 4000mAh超长续航 | AI人脸解锁 | 整机防泼溅', 'public/imgs/phone/Redmi-7A.png', 599, 539, 20, 0);
INSERT INTO `product` VALUES (9, '小米电视4A 32英寸', 2, '人工智能系统，高清液晶屏', '小米电视4A 32英寸 | 64位四核处理器 | 1GB+4GB大内存 | 人工智能系统', 'public/imgs/appliance/MiTv-4A-32.png', 799, 799, 10, 0);
INSERT INTO `product` VALUES (10, '小米全面屏电视E55A', 2, '全面屏设计，人工智能语音', '全面屏设计 | 内置小爱同学 | 4K + HDR | 杜比DTS | PatchWall | 海量内容 | 2GB + 8GB大存储 | 64位四核处理器', 'public/imgs/appliance/MiTv-E55A.png', 2099, 1899, 10, 0);
INSERT INTO `product` VALUES (11, '小米全面屏电视E65A', 2, '全面屏设计，人工智能语音', '人工智能语音系统 | 海量影视内容 | 4K 超高清屏 | 杜比音效 | 64位四核处理器 | 2GB + 8GB大存储', 'public/imgs/appliance/MiTv-E65A.png', 3999, 2799, 10, 0);
INSERT INTO `product` VALUES (12, '小米电视4X 43英寸', 2, 'FHD全高清屏，人工智能语音', '人工智能语音系统 | FHD全高清屏 | 64位四核处理器 | 海量片源 | 1GB+8GB大内存 | 钢琴烤漆', 'public/imgs/appliance/MiTv-4X-43.png', 1499, 1299, 10, 0);
INSERT INTO `product` VALUES (13, '小米电视4C 55英寸', 2, '4K HDR，人工智能系统', '人工智能 | 大内存 | 杜比音效 | 超窄边 | 4K HDR | 海量片源 | 纤薄机身| 钢琴烤漆', 'public/imgs/appliance/MiTv-4C-55.png', 1999, 1799, 10, 0);
INSERT INTO `product` VALUES (14, '小米电视4A 65英寸', 2, '4K HDR，人工智能系统', '人工智能 | 大内存 | 杜比音效 | 超窄边 | 4K HDR | 海量片源 | 纤薄机身| 钢琴烤漆', 'public/imgs/appliance/MiTv-4A-65.png', 2999, 2799, 10, 0);
INSERT INTO `product` VALUES (15, '小米壁画电视 65英寸', 2, '壁画外观，全面屏，远场语音', '纯平背板 | 通体13.9mm | 远场语音 | 4K+HDR | 杜比+DTS | 画框模式 | 内置小爱同学 | PatchWall | SoundBar+低音炮 | 四核处理器+大存储', 'public/imgs/appliance/MiTv-ArtTv-65.png', 6999, 6999, 10, 0);
INSERT INTO `product` VALUES (16, 'Redmi K20/ K20 Pro 怪力魔王保护壳', 3, '怪力魔王专属定制', '优选PC材料，强韧张力，经久耐用 / 精选开孔，全面贴合机身 / 手感轻薄细腻，舒适无负担 / 三款颜色可选，彰显个性，与众不同', 'public/imgs/accessory/protectingShell-RedMi-K20&pro.png', 39, 39, 20, 10);
INSERT INTO `product` VALUES (17, '小米9 ARE U OK保护壳', 3, '一个与众不同的保护壳', '彰显独特个性 / 轻薄无负担 / 优选PC材料 / 贴合机身 / 潮流五色', 'public/imgs/accessory/protectingShell-Mi-9.png', 49, 39, 20, 10);
INSERT INTO `product` VALUES (18, '小米CC9&小米CC9美图定制版 标准高透贴膜', 4, '高清透亮，耐磨性强', '耐磨性强，防护更出众 / 疏油疏水，有效抗水抗脏污 / 高清透亮，保留了原生屏幕的亮丽颜色和清晰度 / 操作灵敏，智能吸附 / 进口高端PET材质，裸机般手感', 'public/imgs/accessory/protectingMen-Mi-CC9.png', 19, 19, 20, 9);
INSERT INTO `product` VALUES (19, '小米CC9e 标准高透贴膜', 4, '高清透亮，耐磨性强', '耐磨性强，防护更出众 / 疏油疏水，有效抗水抗脏污 / 高清透亮，保留了原生屏幕的亮丽颜色和清晰度 / 操作灵敏，智能吸附 / 进口高端PET材质，裸机般手感', 'public/imgs/accessory/protectingMen-Mi-CC9e.png', 19, 19, 20, 9);
INSERT INTO `product` VALUES (20, '小米USB充电器30W快充版（1A1C）', 5, '多一种接口，多一种选择', '双口输出 / 30W 输出 / 可折叠插脚 / 小巧便携', 'public/imgs/accessory/charger-30w.png', 59, 59, 20, 8);
INSERT INTO `product` VALUES (21, '小米USB充电器快充版（18W）', 5, '安卓、苹果设备均可使用', '支持QC3.0设备充电 / 支持iOS设备充电/ 美观耐用', 'public/imgs/accessory/charger-18w.png', 29, 29, 20, 8);
INSERT INTO `product` VALUES (22, '小米USB充电器60W快充版（6口）', 5, '6口输出，USB-C输出接口', '6口输出 / USB-C输出接口 / 支持QC3.0快充协议 / 总输出功率60W', 'public/imgs/accessory/charger-60w.png', 129, 129, 20, 0);
INSERT INTO `product` VALUES (23, '小米USB充电器36W快充版（2口）', 5, '6多重安全保护，小巧便携', '双USB输出接口 / 支持QC3.0快充协议 / 多重安全保护 / 小巧便携', 'public/imgs/accessory/charger-36w.png', 59, 59, 20, 0);
INSERT INTO `product` VALUES (24, '小米车载充电器快充版', 5, '让爱车成为移动充电站', 'QC3.0 双口输出 / 智能温度控制 / 5重安全保护 / 兼容iOS&Android设备', 'public/imgs/accessory/charger-car.png', 69, 69, 20, 0);
INSERT INTO `product` VALUES (25, '小米车载充电器快充版(37W)', 5, '双口快充，车载充电更安全', '单口27W 快充 / 双口输出 / 多重安全保护', 'public/imgs/accessory/charger-car-37w.png', 49, 49, 20, 0);
INSERT INTO `product` VALUES (26, '小米二合一移动电源（充电器）', 5, '一个设备多种用途', '5000mAh充沛电量 / 多协议快充 / USB 口输出', 'public/imgs/accessory/charger-tio.png', 99, 99, 20, 0);
INSERT INTO `product` VALUES (27, '小米无线充电宝青春版10000mAh', 6, '能量满满，无线有线都能充', '10000mAh大容量 / 支持边充边放 / 有线无线都能充 / 双向快充', 'public/imgs/accessory/charger-10000mAh.png', 129, 129, 20, 8);

-- ----------------------------
-- Table structure for product_picture
-- ----------------------------
DROP TABLE IF EXISTS `product_picture`;
CREATE TABLE `product_picture`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_picture` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `propicture_id`(`product_id`) USING BTREE,
  CONSTRAINT `propicture_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of product_picture
-- ----------------------------
INSERT INTO `product_picture` VALUES (1, 1, 'public/imgs/phone/picture/Redmi-k30-1.png');
INSERT INTO `product_picture` VALUES (2, 1, 'public/imgs/phone/picture/Redmi-k30-2.png');
INSERT INTO `product_picture` VALUES (3, 1, 'public/imgs/phone/picture/Redmi-k30-3.png');
INSERT INTO `product_picture` VALUES (4, 1, 'public/imgs/phone/picture/Redmi-k30-4.png');
INSERT INTO `product_picture` VALUES (5, 1, 'public/imgs/phone/picture/Redmi-k30-5.png');
INSERT INTO `product_picture` VALUES (6, 2, 'public/imgs/phone/picture/Redmi K30 5G-1.jpg');
INSERT INTO `product_picture` VALUES (7, 2, 'public/imgs/phone/picture/Redmi K30 5G-2.jpg');
INSERT INTO `product_picture` VALUES (8, 2, 'public/imgs/phone/picture/Redmi K30 5G-3.jpg');
INSERT INTO `product_picture` VALUES (9, 2, 'public/imgs/phone/picture/Redmi K30 5G-4.jpg');
INSERT INTO `product_picture` VALUES (10, 2, 'public/imgs/phone/picture/Redmi K30 5G-5.jpg');
INSERT INTO `product_picture` VALUES (11, 3, 'public/imgs/phone/picture/MI CC9 Pro-1.jpg');
INSERT INTO `product_picture` VALUES (12, 3, 'public/imgs/phone/picture/MI CC9 Pro-2.jpg');
INSERT INTO `product_picture` VALUES (13, 3, 'public/imgs/phone/picture/MI CC9 Pro-3.jpg');
INSERT INTO `product_picture` VALUES (14, 3, 'public/imgs/phone/picture/MI CC9 Pro-4.jpg');
INSERT INTO `product_picture` VALUES (15, 3, 'public/imgs/phone/picture/MI CC9 Pro-5.jpg');
INSERT INTO `product_picture` VALUES (16, 3, 'public/imgs/phone/picture/MI CC9 Pro-6.jpg');
INSERT INTO `product_picture` VALUES (17, 4, 'public/imgs/phone/picture/Redmi 8-1.jpg');
INSERT INTO `product_picture` VALUES (18, 4, 'public/imgs/phone/picture/Redmi 8-2.jpg');
INSERT INTO `product_picture` VALUES (19, 4, 'public/imgs/phone/picture/Redmi 8-3.jpg');
INSERT INTO `product_picture` VALUES (20, 4, 'public/imgs/phone/picture/Redmi 8-4.jpg');
INSERT INTO `product_picture` VALUES (21, 4, 'public/imgs/phone/picture/Redmi 8-5.jpg');
INSERT INTO `product_picture` VALUES (22, 5, 'public/imgs/phone/picture/Redmi 8A-1.jpg');
INSERT INTO `product_picture` VALUES (23, 6, 'public/imgs/phone/picture/Redmi Note8 Pro-1.png');
INSERT INTO `product_picture` VALUES (24, 6, 'public/imgs/phone/picture/Redmi Note8 Pro-2.png');
INSERT INTO `product_picture` VALUES (25, 6, 'public/imgs/phone/picture/Redmi Note8 Pro-3.png');
INSERT INTO `product_picture` VALUES (26, 6, 'public/imgs/phone/picture/Redmi Note8 Pro-4.png');
INSERT INTO `product_picture` VALUES (27, 6, 'public/imgs/phone/picture/Redmi Note8 Pro-5.png');
INSERT INTO `product_picture` VALUES (28, 7, 'public/imgs/phone/picture/Redmi Note8-1.jpg');
INSERT INTO `product_picture` VALUES (29, 7, 'public/imgs/phone/picture/Redmi Note8-2.jpg');
INSERT INTO `product_picture` VALUES (30, 7, 'public/imgs/phone/picture/Redmi Note8-3.jpg');
INSERT INTO `product_picture` VALUES (31, 7, 'public/imgs/phone/picture/Redmi Note8-4.jpg');
INSERT INTO `product_picture` VALUES (32, 7, 'public/imgs/phone/picture/Redmi Note8-5.jpg');
INSERT INTO `product_picture` VALUES (33, 8, 'public/imgs/phone/picture/Redmi 7A-1.jpg');
INSERT INTO `product_picture` VALUES (34, 8, 'public/imgs/phone/picture/Redmi 7A-2.jpg');
INSERT INTO `product_picture` VALUES (35, 8, 'public/imgs/phone/picture/Redmi 7A-3.jpg');
INSERT INTO `product_picture` VALUES (36, 8, 'public/imgs/phone/picture/Redmi 7A-4.jpg');
INSERT INTO `product_picture` VALUES (37, 8, 'public/imgs/phone/picture/Redmi 7A-5.jpg');
INSERT INTO `product_picture` VALUES (38, 9, 'public/imgs/phone/picture/MiTv-4A-32-1.jpg');
INSERT INTO `product_picture` VALUES (39, 9, 'public/imgs/phone/picture/MiTv-4A-32-2.jpg');
INSERT INTO `product_picture` VALUES (40, 9, 'public/imgs/phone/picture/MiTv-4A-32-3.jpg');
INSERT INTO `product_picture` VALUES (41, 9, 'public/imgs/phone/picture/MiTv-4A-32-4.jpg');
INSERT INTO `product_picture` VALUES (42, 10, 'public/imgs/phone/picture/MiTv-E55A-1.jpg');
INSERT INTO `product_picture` VALUES (43, 10, 'public/imgs/phone/picture/MiTv-E55A-2.jpg');
INSERT INTO `product_picture` VALUES (44, 10, 'public/imgs/phone/picture/MiTv-E55A-3.jpg');
INSERT INTO `product_picture` VALUES (45, 10, 'public/imgs/phone/picture/MiTv-E55A-4.jpg');
INSERT INTO `product_picture` VALUES (46, 11, 'public/imgs/phone/picture/MiTv-E65A-1.jpg');
INSERT INTO `product_picture` VALUES (47, 11, 'public/imgs/phone/picture/MiTv-E65A-2.jpg');
INSERT INTO `product_picture` VALUES (48, 11, 'public/imgs/phone/picture/MiTv-E65A-3.jpg');
INSERT INTO `product_picture` VALUES (49, 11, 'public/imgs/phone/picture/MiTv-E65A-4.jpg');
INSERT INTO `product_picture` VALUES (50, 12, 'public/imgs/phone/picture/MiTv-4X 43-1.jpg');
INSERT INTO `product_picture` VALUES (51, 12, 'public/imgs/phone/picture/MiTv-4X 43-2.jpg');
INSERT INTO `product_picture` VALUES (52, 12, 'public/imgs/phone/picture/MiTv-4X 43-3.jpg');
INSERT INTO `product_picture` VALUES (53, 13, 'public/imgs/phone/picture/MiTv-4C 55-1.jpg');
INSERT INTO `product_picture` VALUES (54, 13, 'public/imgs/phone/picture/MiTv-4C 55-2.jpg');
INSERT INTO `product_picture` VALUES (55, 13, 'public/imgs/phone/picture/MiTv-4C 55-3.jpg');
INSERT INTO `product_picture` VALUES (56, 14, 'public/imgs/phone/picture/MiTv-4A 65-1.jpg');
INSERT INTO `product_picture` VALUES (57, 15, 'public/imgs/phone/picture/MiTv-ArtTv-65-1.jpg');
INSERT INTO `product_picture` VALUES (58, 16, 'public/imgs/phone/picture/protectingShell-RedMi-K20&pro-1.jpg');
INSERT INTO `product_picture` VALUES (59, 17, 'public/imgs/phone/picture/protectingShell-Mi-9-1.jpg');
INSERT INTO `product_picture` VALUES (60, 17, 'public/imgs/phone/picture/protectingShell-Mi-9-2.jpg');
INSERT INTO `product_picture` VALUES (61, 18, 'public/imgs/phone/picture/protectingMen-Mi-CC9-1.jpg');
INSERT INTO `product_picture` VALUES (62, 19, 'public/imgs/phone/picture/protectingMen-Mi-CC9e-1.jpg');
INSERT INTO `product_picture` VALUES (63, 20, 'public/imgs/phone/picture/charger-30w-1.jpg');
INSERT INTO `product_picture` VALUES (64, 20, 'public/imgs/phone/picture/charger-30w-2.jpg');
INSERT INTO `product_picture` VALUES (65, 20, 'public/imgs/phone/picture/charger-30w-3.jpg');
INSERT INTO `product_picture` VALUES (66, 20, 'public/imgs/phone/picture/charger-30w-4.jpg');
INSERT INTO `product_picture` VALUES (67, 21, 'public/imgs/phone/picture/charger-18w-1.jpg');
INSERT INTO `product_picture` VALUES (68, 21, 'public/imgs/phone/picture/charger-18w-2.jpg');
INSERT INTO `product_picture` VALUES (69, 21, 'public/imgs/phone/picture/charger-18w-3.jpg');
INSERT INTO `product_picture` VALUES (70, 22, 'public/imgs/phone/picture/charger-60w-1.jpg');
INSERT INTO `product_picture` VALUES (71, 22, 'public/imgs/phone/picture/charger-60w-2.jpg');
INSERT INTO `product_picture` VALUES (72, 22, 'public/imgs/phone/picture/charger-60w-3.jpg');
INSERT INTO `product_picture` VALUES (73, 22, 'public/imgs/phone/picture/charger-60w-4.jpg');
INSERT INTO `product_picture` VALUES (74, 23, 'public/imgs/phone/picture/charger-36w-1.jpg');
INSERT INTO `product_picture` VALUES (75, 23, 'public/imgs/phone/picture/charger-36w-2.jpg');
INSERT INTO `product_picture` VALUES (76, 23, 'public/imgs/phone/picture/charger-36w-3.jpg');
INSERT INTO `product_picture` VALUES (77, 23, 'public/imgs/phone/picture/charger-36w-4.jpg');
INSERT INTO `product_picture` VALUES (78, 23, 'public/imgs/phone/picture/charger-36w-5.jpg');
INSERT INTO `product_picture` VALUES (79, 24, 'public/imgs/phone/picture/charger-car-1.jpg');
INSERT INTO `product_picture` VALUES (80, 24, 'public/imgs/phone/picture/charger-car-2.jpg');
INSERT INTO `product_picture` VALUES (81, 24, 'public/imgs/phone/picture/charger-car-3.jpg');
INSERT INTO `product_picture` VALUES (82, 24, 'public/imgs/phone/picture/charger-car-4.jpg');
INSERT INTO `product_picture` VALUES (83, 24, 'public/imgs/phone/picture/charger-car-5.jpg');
INSERT INTO `product_picture` VALUES (84, 24, 'public/imgs/phone/picture/charger-car-6.jpg');
INSERT INTO `product_picture` VALUES (85, 25, 'public/imgs/phone/picture/charger-car-37w-1.jpg');
INSERT INTO `product_picture` VALUES (86, 25, 'public/imgs/phone/picture/charger-car-37w-2.jpg');
INSERT INTO `product_picture` VALUES (87, 25, 'public/imgs/phone/picture/charger-car-37w-3.jpg');
INSERT INTO `product_picture` VALUES (88, 25, 'public/imgs/phone/picture/charger-car-37w-4.jpg');
INSERT INTO `product_picture` VALUES (89, 25, 'public/imgs/phone/picture/charger-car-37w-5.jpg');
INSERT INTO `product_picture` VALUES (90, 26, 'public/imgs/phone/picture/charger-tio-1.jpg');
INSERT INTO `product_picture` VALUES (91, 26, 'public/imgs/phone/picture/charger-tio-2.jpg');
INSERT INTO `product_picture` VALUES (92, 26, 'public/imgs/phone/picture/charger-tio-3.jpg');
INSERT INTO `product_picture` VALUES (93, 26, 'public/imgs/phone/picture/charger-tio-4.jpg');
INSERT INTO `product_picture` VALUES (94, 26, 'public/imgs/phone/picture/charger-tio-5.jpg');
INSERT INTO `product_picture` VALUES (95, 27, 'public/imgs/phone/picture/charger-10000mAh-1.jpg');
INSERT INTO `product_picture` VALUES (96, 27, 'public/imgs/phone/picture/charger-10000mAh-2.jpg');
INSERT INTO `product_picture` VALUES (97, 27, 'public/imgs/phone/picture/charger-10000mAh-3.jpg');
INSERT INTO `product_picture` VALUES (98, 27, 'public/imgs/phone/picture/charger-10000mAh-4.jpg');
INSERT INTO `product_picture` VALUES (99, 27, 'public/imgs/phone/picture/charger-10000mAh-5.jpg');

-- ----------------------------
-- Table structure for shoppingcart
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sc_user_id`(`user_id`) USING BTREE,
  INDEX `sc_product_id`(`product_id`) USING BTREE,
  CONSTRAINT `sc_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sc_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------

-- ----------------------------
-- Table structure for slideshow
-- ----------------------------
DROP TABLE IF EXISTS `slideshow`;
CREATE TABLE `slideshow`  (
  `carousel_id` int(11) NOT NULL AUTO_INCREMENT,
  `imgPath` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of slideshow
-- ----------------------------
INSERT INTO `slideshow` VALUES (1, 'public/imgs/cms_1.jpg');
INSERT INTO `slideshow` VALUES (2, 'public/imgs/cms_2.jpg');
INSERT INTO `slideshow` VALUES (3, 'public/imgs/cms_3.jpg');
INSERT INTO `slideshow` VALUES (4, 'public/imgs/cms_4.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `userName`(`userName`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'asdasd', 'asdasd');

SET FOREIGN_KEY_CHECKS = 1;
