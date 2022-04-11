CREATE DATABASE IF NOT EXISTS dev_portfolio;
USE dev_portfolio;

CREATE TABLE `admins` (
	`email`	VARCHAR(60)	NOT NULL,
	`password`	CHAR(64)	NOT NULL	COMMENT 'SHA-256 알고리즘, 길이 고정 64자',
	`salt`	CHAR(10)	NOT NULL	COMMENT '길이 고정 10자',
	`created`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP(),

	PRIMARY KEY (`email`)
);

CREATE TABLE `headers` (
	`no`	INT UNSIGNED	NOT NULL	AUTO_INCREMENT	COMMENT '일련 번호',
	`title`	VARCHAR(30)	NOT NULL,
	`logo_url`	VARCHAR(255)	NOT NULL,

	PRIMARY KEY (`no`)
);

CREATE TABLE `channels_in_header` (
	`no`	INT UNSIGNED	NOT NULL	AUTO_INCREMENT	COMMENT '일련 번호',
	`header_no`	INT UNSIGNED	NOT NULL,
	`name`	VARCHAR(20)	NOT NULL,
	`url`	VARCHAR(255)	NOT NULL,

	PRIMARY KEY (`no`),
  FOREIGN KEY (`header_no`)
  REFERENCES `headers` (`no`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `tech_stacks` (
	`no`	INT UNSIGNED	NOT NULL	AUTO_INCREMENT	COMMENT '일련 번호',
	`name`	VARCHAR(20)	NOT NULL,
	`gauge`	INT	NOT NULL,

	PRIMARY KEY (`no`)
);

CREATE TABLE `contacts` (
	`no`	INT UNSIGNED	NOT NULL	AUTO_INCREMENT	COMMENT '일련 번호',
	`title`	VARCHAR(20)	NOT NULL,
	`sub_title`	VARCHAR(50)	NOT NULL,
	`button_text`	VARCHAR(20)	NOT NULL,

	PRIMARY KEY (`no`)
);

CREATE TABLE `channels_in_contact` (
	`no`	INT UNSIGNED	NOT NULL	AUTO_INCREMENT	COMMENT '일련 번호',
	`contact_no`	INT UNSIGNED	NOT NULL,
	`name`	VARCHAR(20)	NOT NULL,
	`url`	VARCHAR(255)	NOT NULL,

	PRIMARY KEY (`no`),
  FOREIGN KEY (`contact_no`)
  REFERENCES `contacts` (`no`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `user_infos` (
	`no`	INT UNSIGNED	NOT NULL	AUTO_INCREMENT	COMMENT '일련 번호',
	`contact_no`	INT UNSIGNED	NOT NULL,
	`title`	VARCHAR(40)	NOT NULL,
	`description`	VARCHAR(100)	NOT NULL,

	PRIMARY KEY (`no`),
  FOREIGN KEY (`contact_no`)
  REFERENCES `contacts` (`no`) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE `projects` (
	`no`	INT UNSIGNED	NOT NULL	AUTO_INCREMENT	COMMENT '일련 번호',
	`title`	VARCHAR(30)	NOT NULL,
	`sub_title`	VARCHAR(100)	NULL,
	`description`	TEXT	NULL	COMMENT '65535자 이하',

	PRIMARY KEY (`no`)
);

CREATE TABLE `short_introductions` (
	`no`	INT UNSIGNED	NOT NULL	AUTO_INCREMENT	COMMENT '일련 번호',
	`title`	VARCHAR(30)	NOT NULL,
	`description`	VARCHAR(300)	NOT NULL,

	PRIMARY KEY (`no`)
);

CREATE TABLE `histories` (
	`no`	INT UNSIGNED	NOT NULL	AUTO_INCREMENT	COMMENT '일련 번호',
	`start_date`	DATE	NOT NULL,
	`end_date`	DATE	NULL,
	`description`	VARCHAR(100)	NOT NULL,
	`progress_flag`	TINYINT(1)	NOT NULL	COMMENT '0: 끝남 1: 진행중',

	PRIMARY KEY (`no`)
);

CREATE TABLE `careers` (
	`no`	INT UNSIGNED	NOT NULL	AUTO_INCREMENT	COMMENT '일련 번호',
	`start_date`	DATE	NOT NULL,
	`end_date`	DATE	NULL,
	`description`	VARCHAR(100)	NOT NULL,
	`progress_flag`	TINYINT(1)	NOT NULL	COMMENT '0: 끝남 1: 진행중',

	PRIMARY KEY (`no`)
);

CREATE TABLE `visitor_comments` (
	`no`	INT UNSIGNED	NOT NULL	AUTO_INCREMENT	COMMENT '일련 번호',
	`visitor_nickname`	VARCHAR(20)	NULL	DEFAULT "익명",
	`password`	VARCHAR(30)	NOT NULL,
	`description`	VARCHAR(500)	NOT NULL,
	`created`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP()	COMMENT '현재 시간',
	`updated`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP()	COMMENT '현재 시간, 처음 데이터는 생성일과 같다.',

	PRIMARY KEY (`no`)
);

CREATE TABLE `visitor_countors` (
	`no`	INT UNSIGNED	NOT NULL	AUTO_INCREMENT	COMMENT '일련 번호',
	`count`	INT UNSIGNED	NULL	DEFAULT 0,

	PRIMARY KEY (`no`)
);
