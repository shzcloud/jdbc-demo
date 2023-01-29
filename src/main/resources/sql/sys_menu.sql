SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键',
  `root_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '根id',
  `parent_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '父id',
  `level` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '层级',
  `tag` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标识',
  `app_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '应用程序名',
  `location` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '位置',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `sort` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `icon` bigint NULL DEFAULT NULL COMMENT '图标资源id',
  `path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路径',
  `expanded` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否展开',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `AK_ux_sys_menu_ux`(`parent_id`, `name`, `path`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统菜单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (6221189572067327, NULL, NULL, 1, '1', 'DEFAULT', 'DEFAULT', '首页', 0, 6307522719121408, '/index', b'1');
INSERT INTO `sys_menu` VALUES (6221189572067328, NULL, NULL, 1, '2', 'DEFAULT', 'DEFAULT', '系统设置', 1, 6229759349358592, NULL, b'1');
INSERT INTO `sys_menu` VALUES (6221189577179136, 6221189572067328, 6221189572067328, 2, '2.0', 'DEFAULT', 'DEFAULT', 'API管理', 0, 6229668727619584, '/api', b'0');
INSERT INTO `sys_menu` VALUES (6221189577179137, 6221189572067328, 6221189572067328, 2, '2.1', 'DEFAULT', 'DEFAULT', '菜单管理', 1, 6229787442020352, '/menu', b'0');
INSERT INTO `sys_menu` VALUES (6221189577179138, 6221189572067328, 6221189572067328, 2, '2.2', 'DEFAULT', 'DEFAULT', '角色管理', 2, 6229674395697152, '/role', b'0');
INSERT INTO `sys_menu` VALUES (6221189577179139, 6221189572067328, 6221189572067328, 2, '2.3', 'DEFAULT', 'DEFAULT', '账户管理', 3, 6229750851567616, '/user', b'0');
INSERT INTO `sys_menu` VALUES (6221189577179140, 6221189572067328, 6221189572067328, 2, '2.4', 'DEFAULT', 'DEFAULT', '配置管理', 4, 6230039685103616, '/config', b'0');
INSERT INTO `sys_menu` VALUES (6221189577179141, 6221189572067328, 6221189572067328, 2, '2.5', 'DEFAULT', 'DEFAULT', '字典管理', 5, 6229701801934848, NULL, b'0');
INSERT INTO `sys_menu` VALUES (6221189577179142, 6221189572067328, 6221189572067328, 2, '2.6', 'DEFAULT', 'DEFAULT', '监控管理', 6, 6229716061519872, NULL, b'0');
INSERT INTO `sys_menu` VALUES (6221189577179143, 6221189572067328, 6221189572067328, 2, '2.7', 'DEFAULT', 'DEFAULT', '任务管理', 7, 6229893107548160, '/task', b'0');
INSERT INTO `sys_menu` VALUES (6221189577179144, 6221189572067328, 6221189572067328, 2, '2.8', 'DEFAULT', 'DEFAULT', '资源管理', 8, 6229814153838592, '/resource', b'0');
INSERT INTO `sys_menu` VALUES (6221189577179145, 6221189572067328, 6221189572067328, 2, '2.9', 'DEFAULT', 'DEFAULT', '安全管理', 9, 6229839593209856, NULL, b'0');
INSERT INTO `sys_menu` VALUES (6221189577179147, 6221189572067328, 6221189572067328, 2, '2.B', 'DEFAULT', 'DEFAULT', '位置管理', 10, 6229851661926400, NULL, b'0');
INSERT INTO `sys_menu` VALUES (6221189577179148, 6221189572067328, 6221189572067328, 2, '2.C', 'DEFAULT', 'DEFAULT', '映射管理', 11, 6229857774600192, NULL, b'0');
INSERT INTO `sys_menu` VALUES (6221189582290944, 6221189572067328, 6221189577179141, 3, '2.5.0', 'DEFAULT', 'DEFAULT', '字典类型', 0, 6230056184578048, '/dictType', b'0');
INSERT INTO `sys_menu` VALUES (6221189582290945, 6221189572067328, 6221189577179141, 3, '2.5.1', 'DEFAULT', 'DEFAULT', '字典数据', 1, 6230047796887552, '/dictData', b'0');
INSERT INTO `sys_menu` VALUES (6221189586616320, 6221189572067328, 6221189577179142, 3, '2.6.0', 'DEFAULT', 'DEFAULT', '系统监控', 0, 6229720585469952, '/sysMonitor', b'0');
INSERT INTO `sys_menu` VALUES (6221189586616321, 6221189572067328, 6221189577179142, 3, '2.6.1', 'DEFAULT', 'DEFAULT', '缓存监控', 1, 6229723891630080, NULL, b'0');
INSERT INTO `sys_menu` VALUES (6221189589499905, 6221189572067328, 6221189586616321, 4, '2.6.1.0', 'DEFAULT', 'DEFAULT', 'Redis', 0, 6230083550445568, '/redisCache', b'0');
INSERT INTO `sys_menu` VALUES (6221189592907776, 6221189572067328, 6221189577179145, 3, '2.9.0', 'DEFAULT', 'DEFAULT', '密钥管理', 0, 6229840889118720, '/secret', b'0');
INSERT INTO `sys_menu` VALUES (6221189592907777, 6221189572067328, 6221189577179145, 3, '2.9.1', 'DEFAULT', 'DEFAULT', 'IP管理', 1, 6229843310673920, NULL, b'0');
INSERT INTO `sys_menu` VALUES (6221189595791360, 6221189572067328, 6221189592907777, 4, '2.9.1.0', 'DEFAULT', 'DEFAULT', '黑名单', 0, 6229844726251520, '/ipBlacklist', b'0');
INSERT INTO `sys_menu` VALUES (6221189595791361, 6221189572067328, 6221189592907777, 4, '2.9.1.1', 'DEFAULT', 'DEFAULT', '白名单', 1, 6229845801435136, '/ipWhitelist', b'0');
INSERT INTO `sys_menu` VALUES (6221189601165312, 6221189572067328, 6221189577179147, 3, '2.B.0', 'DEFAULT', 'DEFAULT', '位置类型', 0, 6230008505958400, '/locationType', b'0');
INSERT INTO `sys_menu` VALUES (6221189601165313, 6221189572067328, 6221189577179147, 3, '2.B.1', 'DEFAULT', 'DEFAULT', '位置数据', 1, 6229902272495616, '/locationData', b'0');
INSERT INTO `sys_menu` VALUES (6221189604704256, 6221189572067328, 6221189577179148, 3, '2.C.0', 'DEFAULT', 'DEFAULT', '映射类型', 0, 6229981521379328, '/mapType', b'0');
INSERT INTO `sys_menu` VALUES (6221189604704257, 6221189572067328, 6221189577179148, 3, '2.C.1', 'DEFAULT', 'DEFAULT', '映射数据', 1, 6229999607087104, '/mapData', b'0');
INSERT INTO `sys_menu` VALUES (6309875679363072, 6221189572067328, 6221189577179142, 3, '2.6.2', 'DEFAULT', 'DEFAULT', 'Druid', 2, 6318761814261760, '/druid', b'0');
INSERT INTO `sys_menu` VALUES (6343597807763456, 6221189572067328, 6221189572067328, 2, '2.D', 'DEFAULT', 'DEFAULT', '系统访问记录', 12, 6343614559420416, '/visitRecord', b'0');
INSERT INTO `sys_menu` VALUES (6389724623273984, 6221189572067328, 6221189572067328, 2, '2.E', 'DEFAULT', 'DEFAULT', '系统日志', 13, 6389863331659776, '/log', b'0');
INSERT INTO `sys_menu` VALUES (6445171007291392, NULL, NULL, 1, '3', 'DEFAULT', 'DEFAULT', '知识库', 2, 6445183188992000, NULL, b'0');
INSERT INTO `sys_menu` VALUES (6445187212115968, 6445171007291392, 6445171007291392, 2, '3.0', 'DEFAULT', 'DEFAULT', '算法', 0, 6445214792286208, '/algorithm', b'0');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编码',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `sort` int UNSIGNED NOT NULL DEFAULT 10 COMMENT '排序',
  `icon` bigint NULL DEFAULT NULL COMMENT '图标资源id',
  `path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '/login' COMMENT '路径',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `AK_ux_sys_role_code`(`code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (6218793046376448, 'DBA', '数据库管理员', 0, 6229592198610944, '/admin');
INSERT INTO `sys_role` VALUES (6218793046376449, 'ADMIN', '管理员', 1, 6229601384136704, '/admin');
INSERT INTO `sys_role` VALUES (6218793046376450, 'VIP', '会员', 2, 6229602525642752, '/customer');
INSERT INTO `sys_role` VALUES (6218793046376451, 'RU', '注册用户', 3, 6229603565305856, '/customer');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键',
  `role_id` bigint UNSIGNED NOT NULL COMMENT '角色id',
  `menu_id` bigint UNSIGNED NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统角色菜单关系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (6279802733461504, 6218793046376448, 6221189572067328);
INSERT INTO `sys_role_menu` VALUES (6279802733461505, 6218793046376448, 6221189577179136);
INSERT INTO `sys_role_menu` VALUES (6279802733461506, 6218793046376448, 6221189577179137);
INSERT INTO `sys_role_menu` VALUES (6279802733461507, 6218793046376448, 6221189577179138);
INSERT INTO `sys_role_menu` VALUES (6279802733461508, 6218793046376448, 6221189577179139);
INSERT INTO `sys_role_menu` VALUES (6279802733461509, 6218793046376448, 6221189577179140);
INSERT INTO `sys_role_menu` VALUES (6279802733461510, 6218793046376448, 6221189577179141);
INSERT INTO `sys_role_menu` VALUES (6279802733461511, 6218793046376448, 6221189582290944);
INSERT INTO `sys_role_menu` VALUES (6279802733461512, 6218793046376448, 6221189582290945);
INSERT INTO `sys_role_menu` VALUES (6279802733461513, 6218793046376448, 6221189577179142);
INSERT INTO `sys_role_menu` VALUES (6279802733461514, 6218793046376448, 6221189586616320);
INSERT INTO `sys_role_menu` VALUES (6279802733461515, 6218793046376448, 6221189586616321);
INSERT INTO `sys_role_menu` VALUES (6279802733461517, 6218793046376448, 6221189589499905);
INSERT INTO `sys_role_menu` VALUES (6279802733461518, 6218793046376448, 6221189577179143);
INSERT INTO `sys_role_menu` VALUES (6279802733461519, 6218793046376448, 6221189577179144);
INSERT INTO `sys_role_menu` VALUES (6279802733461520, 6218793046376448, 6221189577179145);
INSERT INTO `sys_role_menu` VALUES (6279802733461521, 6218793046376448, 6221189592907776);
INSERT INTO `sys_role_menu` VALUES (6279802733461522, 6218793046376448, 6221189592907777);
INSERT INTO `sys_role_menu` VALUES (6279802733461523, 6218793046376448, 6221189595791360);
INSERT INTO `sys_role_menu` VALUES (6279802733461524, 6218793046376448, 6221189595791361);
INSERT INTO `sys_role_menu` VALUES (6279802733461525, 6218793046376448, 6221189577179147);
INSERT INTO `sys_role_menu` VALUES (6279802733461526, 6218793046376448, 6221189601165312);
INSERT INTO `sys_role_menu` VALUES (6279802733461527, 6218793046376448, 6221189601165313);
INSERT INTO `sys_role_menu` VALUES (6279802733461528, 6218793046376448, 6221189577179148);
INSERT INTO `sys_role_menu` VALUES (6279802733461529, 6218793046376448, 6221189604704256);
INSERT INTO `sys_role_menu` VALUES (6279802733461530, 6218793046376448, 6221189604704257);
INSERT INTO `sys_role_menu` VALUES (6281321838149632, 6218793046376449, 6221189572067328);
INSERT INTO `sys_role_menu` VALUES (6281321838149633, 6218793046376449, 6221189577179136);
INSERT INTO `sys_role_menu` VALUES (6281321838149634, 6218793046376449, 6221189577179137);
INSERT INTO `sys_role_menu` VALUES (6281321838149635, 6218793046376449, 6221189577179138);
INSERT INTO `sys_role_menu` VALUES (6281321838149636, 6218793046376449, 6221189577179139);
INSERT INTO `sys_role_menu` VALUES (6281321838149637, 6218793046376449, 6221189577179140);
INSERT INTO `sys_role_menu` VALUES (6281321838149638, 6218793046376449, 6221189577179141);
INSERT INTO `sys_role_menu` VALUES (6281321838149639, 6218793046376449, 6221189582290944);
INSERT INTO `sys_role_menu` VALUES (6281321838149640, 6218793046376449, 6221189582290945);
INSERT INTO `sys_role_menu` VALUES (6281321838149641, 6218793046376449, 6221189577179142);
INSERT INTO `sys_role_menu` VALUES (6281321838149642, 6218793046376449, 6221189586616320);
INSERT INTO `sys_role_menu` VALUES (6281321838149643, 6218793046376449, 6221189586616321);
INSERT INTO `sys_role_menu` VALUES (6281321838149645, 6218793046376449, 6221189589499905);
INSERT INTO `sys_role_menu` VALUES (6281321838149646, 6218793046376449, 6221189577179143);
INSERT INTO `sys_role_menu` VALUES (6281321838149647, 6218793046376449, 6221189577179144);
INSERT INTO `sys_role_menu` VALUES (6281321838149648, 6218793046376449, 6221189577179145);
INSERT INTO `sys_role_menu` VALUES (6281321838149649, 6218793046376449, 6221189592907776);
INSERT INTO `sys_role_menu` VALUES (6281321838149650, 6218793046376449, 6221189592907777);
INSERT INTO `sys_role_menu` VALUES (6281321838149651, 6218793046376449, 6221189595791360);
INSERT INTO `sys_role_menu` VALUES (6281321838149652, 6218793046376449, 6221189595791361);
INSERT INTO `sys_role_menu` VALUES (6281321838149653, 6218793046376449, 6221189577179147);
INSERT INTO `sys_role_menu` VALUES (6281321838149654, 6218793046376449, 6221189601165312);
INSERT INTO `sys_role_menu` VALUES (6281321838149655, 6218793046376449, 6221189601165313);
INSERT INTO `sys_role_menu` VALUES (6281321838149656, 6218793046376449, 6221189577179148);
INSERT INTO `sys_role_menu` VALUES (6281321838149657, 6218793046376449, 6221189604704256);
INSERT INTO `sys_role_menu` VALUES (6281321838149658, 6218793046376449, 6221189604704257);
INSERT INTO `sys_role_menu` VALUES (6319092679573504, 6218793046376448, 6309875679363072);
INSERT INTO `sys_role_menu` VALUES (6319092679573505, 6218793046376448, 6221189572067327);
INSERT INTO `sys_role_menu` VALUES (6319094127656960, 6218793046376449, 6309875679363072);
INSERT INTO `sys_role_menu` VALUES (6319094127656961, 6218793046376449, 6221189572067327);
INSERT INTO `sys_role_menu` VALUES (6319109905711104, 6218793046376450, 6221189572067327);
INSERT INTO `sys_role_menu` VALUES (6319110697648128, 6218793046376451, 6221189572067327);
INSERT INTO `sys_role_menu` VALUES (7708470014771200, 6218793046376448, 6343597807763456);
INSERT INTO `sys_role_menu` VALUES (7708470014771201, 6218793046376448, 6389724623273984);
INSERT INTO `sys_role_menu` VALUES (7708470014771202, 6218793046376448, 6445171007291392);
INSERT INTO `sys_role_menu` VALUES (7708470014771203, 6218793046376448, 6445187212115968);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号密码',
  `salt` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加密盐',
  `real_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `nick_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别(0:未知1:男,2:女)',
  `mobile` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `identity` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` bigint NULL DEFAULT NULL COMMENT '头像资源id',
  `state` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'OFF_LINE' COMMENT '状态',
  `open_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '普通用户标识，对当前开发者帐号唯一，一个openid对应一个公众号',
  `union_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户统一标识，针对一个微信开放平台帐号下的应用，同一用户的unionid是唯一的',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `AK_ux_sys_user_username`(`username`) USING BTREE,
  UNIQUE INDEX `AK_ux_sys_user_mobile`(`mobile`) USING BTREE,
  UNIQUE INDEX `AK_ux_sys_user_email`(`email`) USING BTREE,
  UNIQUE INDEX `AK_ux_sys_user_identity`(`identity`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint UNSIGNED NOT NULL COMMENT '主键',
  `userid` bigint UNSIGNED NOT NULL COMMENT '用户id',
  `role_id` bigint UNSIGNED NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统用户角色关系' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
