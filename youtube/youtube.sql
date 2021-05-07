-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `youtube`;
CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8 ;
USE `youtube` ;

-- -----------------------------------------------------
-- Table `youtube`.`genders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`genders` (
  `id_gender` INT NOT NULL AUTO_INCREMENT,
  `gender` VARCHAR(45) NULL,
  PRIMARY KEY (`id_gender`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `birth_date` DATE NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(45) NOT NULL,
  `genders_id_gender` INT NOT NULL,
  PRIMARY KEY (`id_user`),
  INDEX `fk_users_genders_idx` (`genders_id_gender` ASC) ,
  CONSTRAINT `fk_users_genders`
    FOREIGN KEY (`genders_id_gender`)
    REFERENCES `youtube`.`genders` (`id_gender`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`settings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`settings` (
  `id_setting` INT NOT NULL AUTO_INCREMENT,
  `setting_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_setting`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`videos` (
  `id_video` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(120) NOT NULL,
  `description` VARCHAR(250) NOT NULL,
  `size` DECIMAL(8,2) NOT NULL,
  `file_name` VARCHAR(120) NOT NULL,
  `duration` DECIMAL(7,2) NOT NULL,
  `thumbnail` VARCHAR(120) NOT NULL,
  `views` INT NOT NULL,
  `likes` INT NOT NULL,
  `dislikes` INT NOT NULL,
  `publication_date_time` DATETIME NOT NULL,
  `settings_id_setting` INT NOT NULL,
  `users_id_user` INT NOT NULL,
  PRIMARY KEY (`id_video`),
  INDEX `fk_videos_settings1_idx` (`settings_id_setting` ASC) ,
  INDEX `fk_videos_users1_idx` (`users_id_user` ASC) ,
  CONSTRAINT `fk_videos_settings1`
    FOREIGN KEY (`settings_id_setting`)
    REFERENCES `youtube`.`settings` (`id_setting`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_videos_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `youtube`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`tags` (
  `id_tag` INT NOT NULL,
  `tag_name` VARCHAR(45) NOT NULL,
  `videos_id_video` INT NOT NULL,
  PRIMARY KEY (`id_tag`),
  INDEX `fk_tags_videos1_idx` (`videos_id_video` ASC) ,
  CONSTRAINT `fk_tags_videos1`
    FOREIGN KEY (`videos_id_video`)
    REFERENCES `youtube`.`videos` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`channels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`channels` (
  `id_channel` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(250) NOT NULL,
  `creation_date` TIMESTAMP NOT NULL,
  `users_id_user` INT NOT NULL,
  PRIMARY KEY (`id_channel`),
  INDEX `fk_channels_users1_idx` (`users_id_user` ASC) ,
  CONSTRAINT `fk_channels_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `youtube`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`subscriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`subscriptions` (
  `id_subscription` INT NOT NULL AUTO_INCREMENT,
  `users_id_user` INT NOT NULL,
  `channels_id_channel` INT NOT NULL,
  PRIMARY KEY (`id_subscription`),
  INDEX `fk_subscriptions_users1_idx` (`users_id_user` ASC) ,
  INDEX `fk_subscriptions_channels1_idx` (`channels_id_channel` ASC) ,
  CONSTRAINT `fk_subscriptions_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `youtube`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subscriptions_channels1`
    FOREIGN KEY (`channels_id_channel`)
    REFERENCES `youtube`.`channels` (`id_channel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`like_status_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`like_status_types` (
  `id_like_status_type` INT NOT NULL AUTO_INCREMENT,
  `status_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_like_status_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`likes_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`likes_status` (
  `id_like` INT NOT NULL,
  `like_status_types_id_like_status_type` INT NOT NULL,
  `users_id_user` INT NOT NULL,
  `videos_id_video` INT NOT NULL,
  PRIMARY KEY (`id_like`),
  INDEX `fk_likes_status_like_status_types1_idx` (`like_status_types_id_like_status_type` ASC) ,
  INDEX `fk_likes_status_users1_idx` (`users_id_user` ASC) ,
  INDEX `fk_likes_status_videos1_idx` (`videos_id_video` ASC) ,
  CONSTRAINT `fk_likes_status_like_status_types1`
    FOREIGN KEY (`like_status_types_id_like_status_type`)
    REFERENCES `youtube`.`like_status_types` (`id_like_status_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_status_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `youtube`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_status_videos1`
    FOREIGN KEY (`videos_id_video`)
    REFERENCES `youtube`.`videos` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`likes` (
  `id_like` INT NOT NULL AUTO_INCREMENT,
  `like_date_time` TIMESTAMP NOT NULL,
  `users_id_user` INT NOT NULL,
  `videos_id_video` INT NOT NULL,
  PRIMARY KEY (`id_like`),
  INDEX `fk_likes_users1_idx` (`users_id_user` ASC) ,
  INDEX `fk_likes_videos1_idx` (`videos_id_video` ASC) ,
  CONSTRAINT `fk_likes_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `youtube`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_videos1`
    FOREIGN KEY (`videos_id_video`)
    REFERENCES `youtube`.`videos` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`dislikes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`dislikes` (
  `id_dislike` INT NOT NULL AUTO_INCREMENT,
  `dislike_date_time` TIMESTAMP NULL,
  `users_id_user` INT NOT NULL,
  `videos_id_video` INT NOT NULL,
  PRIMARY KEY (`id_dislike`),
  INDEX `fk_dislikes_users1_idx` (`users_id_user` ASC) ,
  INDEX `fk_dislikes_videos1_idx` (`videos_id_video` ASC) ,
  CONSTRAINT `fk_dislikes_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `youtube`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dislikes_videos1`
    FOREIGN KEY (`videos_id_video`)
    REFERENCES `youtube`.`videos` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`playlist_settings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`playlist_settings` (
  `id_playlist_setting` INT NOT NULL AUTO_INCREMENT,
  `playlist_setting_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_playlist_setting`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`playlists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`playlists` (
  `id_playlist` INT NOT NULL AUTO_INCREMENT,
  `name` DATE NOT NULL,
  `playlist_settings_id_playlist_setting` INT NOT NULL,
  `users_id_user` INT NOT NULL,
  `videos_id_video` INT NOT NULL,
  PRIMARY KEY (`id_playlist`),
  INDEX `fk_playlists_playlist_settings1_idx` (`playlist_settings_id_playlist_setting` ASC) ,
  INDEX `fk_playlists_users1_idx` (`users_id_user` ASC) ,
  INDEX `fk_playlists_videos1_idx` (`videos_id_video` ASC) ,
  CONSTRAINT `fk_playlists_playlist_settings1`
    FOREIGN KEY (`playlist_settings_id_playlist_setting`)
    REFERENCES `youtube`.`playlist_settings` (`id_playlist_setting`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlists_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `youtube`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlists_videos1`
    FOREIGN KEY (`videos_id_video`)
    REFERENCES `youtube`.`videos` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`comments` (
  `id_comment` INT NOT NULL AUTO_INCREMENT,
  `comment` LONGTEXT NOT NULL,
  `users_id_user` INT NOT NULL,
  `videos_id_video` INT NOT NULL,
  `date_time` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id_comment`),
  INDEX `fk_comments_users1_idx` (`users_id_user` ASC) ,
  INDEX `fk_comments_videos1_idx` (`videos_id_video` ASC) ,
  CONSTRAINT `fk_comments_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `youtube`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_videos1`
    FOREIGN KEY (`videos_id_video`)
    REFERENCES `youtube`.`videos` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`comment_like_status_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`comment_like_status_type` (
  `id_comment_like_status_type` INT NOT NULL,
  `status_type` VARCHAR(45) NULL,
  PRIMARY KEY (`id_comment_like_status_type`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`comment_like_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `youtube`.`comment_like_status` (
  `id_comment_like_status` INT NOT NULL AUTO_INCREMENT,
  `date_time` TIMESTAMP NOT NULL,
  `users_id_user` INT NOT NULL,
  `comments_id_comment` INT NOT NULL,
  `comment_like_status_type_id_comment_like_status_type` INT NOT NULL,
  PRIMARY KEY (`id_comment_like_status`),
  INDEX `fk_comment_like_status_users1_idx` (`users_id_user` ASC) ,
  INDEX `fk_comment_like_status_comments1_idx` (`comments_id_comment` ASC) ,
  INDEX `fk_comment_like_status_comment_like_status_type1_idx` (`comment_like_status_type_id_comment_like_status_type` ASC) ,
  CONSTRAINT `fk_comment_like_status_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `youtube`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_like_status_comments1`
    FOREIGN KEY (`comments_id_comment`)
    REFERENCES `youtube`.`comments` (`id_comment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_like_status_comment_like_status_type1`
    FOREIGN KEY (`comment_like_status_type_id_comment_like_status_type`)
    REFERENCES `youtube`.`comment_like_status_type` (`id_comment_like_status_type`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
