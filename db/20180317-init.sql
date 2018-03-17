create database mini_erp;

use mini_erp;

drop table IF EXISTS `customers`;

create table customers(
	id bigint(21) NOT NULL AUTO_INCREMENT COMMENT '自增客户id',
	name varchar(128) NOT NULL DEFAULT '' COMMENT '客户名称',
	mobile varchar(64) NOT NULL DEFAULT '' COMMENT '电话号码',
	mobile_sign bigint(21) NOT NULL DEFAULT 0 COMMENT '电话号码签名',
	wechat varchar(128) NOT NULL DEFAULT '' COMMENT '微信号',
	gender tinyint NOT NULL DEFAULT 0 COMMENT '性别:0 未知,1男,2女',
	address varchar(512) NOT NULL DEFAULT '' COMMENT '地址',
	status tinyint NOT NULL DEFAULT 0 COMMENT '状态: -1删除, 0服务中, 128服务已完成',
	tag int NOT NULL DEFAULT 0 COMMENT '用户分类,具体如下:',
	saleman varchar(64) NOT NULL DEFAULT '' COMMENT '客户的售后, 关联users表中account',
	create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
	modify_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
	delete_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '删除时间',
	end_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '服务完成时间',
	revisit_time timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '下次回访时间',
	operator varchar(64) NOT NULL DEFAULT '' COMMENT '更新记录的工作人员',
	manager varchar(64) NOT NULL DEFAULT '' COMMENT '修改的管理员',
	PRIMARY KEY(id),
	INDEX (mobile_sign, mobile),
	INDEX (status),
	INDEX (name),
	INDEX (create_time),
	INDEX (end_time)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table IF EXISTS `users`;
create table users(
	id bigint(21) NOT NULL AUTO_INCREMENT COMMENT '自增id',
	account varchar(128) NOT NULL DEFAULT '' COMMENT '账户',
	secret varchar(512) NOT NULL DEFAULT '' COMMENT '加密后密码',
	name varchar(128) NOT NULL DEFAULT '' COMMENT '用户名称',
	mobile varchar(64) NOT NULL DEFAULT '' COMMENT '电话号码',
	mobile_bat varchar(64) NOT NULL DEFAULT '' COMMENT '备用电话号码',
	wechat varchar(128) NOT NULL DEFAULT '' COMMENT '微信号',
	qq varchar(128) NOT NULL DEFAULT '' COMMENT 'QQ号',
	status tinyint NOT NULL DEFAULT 0 COMMENT '状态: -1删除, 0有效',
	permission tinyint NOT NULL DEFAULT 0 COMMENT '权限: 0普通员工, 1管理员',
	mobile_sign bigint(21) NOT NULL DEFAULT 0 COMMENT '电话号码签名',
	create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
	modify_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
	delete_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '删除时间',
	manager varchar(64) NOT NULL DEFAULT '' COMMENT '修改的管理员',
	PRIMARY KEY(id),
	UNIQUE INDEX(account)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table IF EXISTS `consume_records`;
create table consume_records(
	id bigint(21) NOT NULL AUTO_INCREMENT COMMENT '自增id',
	customer_id bigint(21) NOT NULL DEFAULT 0 COMMENT '客户id',
	status tinyint NOT NULL DEFAULT 0 COMMENT '状态: -1删除, 0有效',
	content varchar(4096) DEFAULT NULL comment '消费记录',
	ammount float NOT NULL DEFAULT 0 COMMENT '金额',
	create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
	modify_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
	operator varchar(64) NOT NULL DEFAULT '' COMMENT '更新记录的工作人员',
	manager varchar(64) NOT NULL DEFAULT '' COMMENT '修改的管理员',
	PRIMARY KEY (id),
	INDEX (customer_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table IF EXISTS `followup_records`;
create table followup_records (
	id bigint(21) NOT NULL AUTO_INCREMENT COMMENT '自增id',
	customer_id bigint(21) NOT NULL DEFAULT 0 COMMENT '客户id',
	status tinyint NOT NULL DEFAULT 0 COMMENT '状态: -1删除, 0有效',
	content varchar(4096) DEFAULT NULL comment '消费记录',
	create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
	modify_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
	operator varchar(64) NOT NULL DEFAULT '' COMMENT '更新记录的工作人员',
	manager varchar(64) NOT NULL DEFAULT '' COMMENT '修改的管理员',
	PRIMARY KEY (id),
	INDEX (customer_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


drop table IF EXISTS `goods`;
create table goods (
	id bigint(21) NOT NULL AUTO_INCREMENT COMMENT '自增id',
	name varchar(512) NOT NULL DEFAULT '' COMMENT '货品名称',
	price float NOT NULL DEFAULT 0 COMMENT '货品价格',
	create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
	modify_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
	operator varchar(64) NOT NULL DEFAULT '' COMMENT '更新记录的工作人员',
	manager varchar(64) NOT NULL DEFAULT '' COMMENT '修改的管理员',
	PRIMARY KEY (id),
	INDEX (name)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

drop table IF EXISTS `logs`;
create table logs (
	id bigint(21) NOT NULL AUTO_INCREMENT COMMENT '自增id',
	type tinyint NOT NULL DEFAULT 0 COMMENT '操作类型',
	msg varchar(512) NOT NULL DEFAULT '' COMMENT '操作内容',
	create_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;




