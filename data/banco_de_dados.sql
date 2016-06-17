-- MySQL Script generated by MySQL Workbench
-- 06/16/16 11:25:59
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sistemaSix
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sistemaSix
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sistemaSix` ;
USE `sistemaSix` ;

-- -----------------------------------------------------
-- Table `sistemaSix`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaSix`.`roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaSix`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaSix`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `password` CHAR(128) NOT NULL,
  `salt` CHAR(128) NOT NULL,
  `role_id` INT NOT NULL,
  `status` INT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_role_id_idx` (`role_id` ASC),
  CONSTRAINT `user_role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `sistemaSix`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaSix`.`login_attempts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaSix`.`login_attempts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `login_attempts_user_id_idx` (`user_id` ASC),
  CONSTRAINT `login_attempts_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `sistemaSix`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sistemaSix`.`recoveries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sistemaSix`.`recoveries` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `token` VARCHAR(255) NOT NULL,
  `status` INT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `passwords_user_id_idx` (`user_id` ASC),
  CONSTRAINT `passwords_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `sistemaSix`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
