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
