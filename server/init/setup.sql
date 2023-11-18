CREATE TABLE IF NOT EXISTS `db`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_username` VARCHAR(45) NOT NULL,
  `user_fname` VARCHAR(45) NULL,
  `user_sname` VARCHAR(45) NULL,
  `user_status` varchar(45) DEFAULT 'ENABLED',
  `user_role` varchar(45) DEFAULT 'CUSTOMER',
  `user_houseno` VARCHAR(45) NULL,
  `user_address1` VARCHAR(45) NULL,
  `user_address2` VARCHAR(45) NULL,
  `user_city` VARCHAR(45) NULL,
  `user_county` VARCHAR(45) NULL,
  `user_country` VARCHAR(45) NULL,
  `user_postcode` VARCHAR(45) NULL,
  `user_telephone` VARCHAR(45) NULL,
  `user_mobile` VARCHAR(45) NULL,
  `user_password` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`))
COMMENT = 'Holds user data for map app';
SET @user_id = 1,
	@user_username = 'globaladmin',
	@user_fname = 'Global',
	@user_sname = 'Admin',
	@user_password = 'globaladmin',
	@user_role = 'ADMINISTRATOR';
INSERT INTO user
	(user_id, user_username, user_fname, user_sname, user_role)
VALUES
	(@user_id, @user_username, @user_fname, @user_sname, @user_role)
ON DUPLICATE KEY UPDATE
	user_username = @user_username,
	user_fname = @user_fname,
	user_sname = @user_sname,
	user_password = @user_password,
	User_role = @user_role;
CREATE TABLE `point` (
  `point_id` int NOT NULL AUTO_INCREMENT,
  `point_name` varchar(45) DEFAULT NULL,
  `point_desc` varchar(45) DEFAULT NULL,
  `point_cat` varchar(45) DEFAULT NULL,
  `point_lat` decimal(10,8) NOT NULL,
  `point_lon` decimal(11,8) NOT NULL,
  `point_owner` int DEFAULT '1',
  PRIMARY KEY (`point_id`),
  KEY `fk_owner_idx` (`point_owner`),
  CONSTRAINT `fk_owner` FOREIGN KEY (`point_owner`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Holds map points for map app';
SET @point_id = 1,
	@point_name = '1',
	@point_lat = '50.0',
	@point_lon = '1.0',
	@point_owner = '1';
INSERT INTO point
	(point_id, point_name, point_lat, point_lon, point_owner)
VALUES
	(@point_id, @point_name, @point_lat, @point_lon, @point_owner)
ON DUPLICATE KEY UPDATE
	point_name = @point_name,
	point_lat = @point_lat,
	point_lon = @point_lon,
	point_owner = @point_owner;