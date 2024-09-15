-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema neighborhooddb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `neighborhooddb` ;

-- -----------------------------------------------------
-- Schema neighborhooddb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `neighborhooddb` DEFAULT CHARACTER SET utf8mb3 ;
USE `neighborhooddb` ;

-- -----------------------------------------------------
-- Table `neighborhood`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `neighborhood` ;

CREATE TABLE IF NOT EXISTS `neighborhood` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `city` VARCHAR(50) NULL DEFAULT NULL,
  `state` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `create_date` DATETIME NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  `image_url` VARCHAR(2000) NULL DEFAULT NULL,
  `neighborhood_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_neighborhood1_idx` (`neighborhood_id` ASC) VISIBLE,
  CONSTRAINT `fk_event_neighborhood1`
    FOREIGN KEY (`neighborhood_id`)
    REFERENCES `neighborhood` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `resident`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resident` ;

CREATE TABLE IF NOT EXISTS `resident` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `image_url` VARCHAR(2000) NULL DEFAULT NULL,
  `username` VARCHAR(50) NULL DEFAULT NULL,
  `password` VARCHAR(50) NULL DEFAULT NULL,
  `neighborhood_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_resident_neighborhood1_idx` (`neighborhood_id` ASC) VISIBLE,
  CONSTRAINT `fk_resident_neighborhood1`
    FOREIGN KEY (`neighborhood_id`)
    REFERENCES `neighborhood` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `event_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_comment` ;

CREATE TABLE IF NOT EXISTS `event_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `create_date` DATETIME NULL DEFAULT NULL,
  `last_update` DATETIME NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  `image_url` VARCHAR(2000) NULL DEFAULT NULL,
  `resident_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_comment_resident1_idx` (`resident_id` ASC) VISIBLE,
  CONSTRAINT `fk_event_comment_resident1`
    FOREIGN KEY (`resident_id`)
    REFERENCES `resident` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `street` VARCHAR(100) NULL DEFAULT NULL,
  `image_url` VARCHAR(2000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `event_has_location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_has_location` ;

CREATE TABLE IF NOT EXISTS `event_has_location` (
  `event_id` INT NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`event_id`, `location_id`),
  INDEX `fk_event_has_location_location1_idx` (`location_id` ASC) VISIBLE,
  INDEX `fk_event_has_location_event1_idx` (`event_id` ASC) VISIBLE,
  CONSTRAINT `fk_event_has_location_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `event` (`id`),
  CONSTRAINT `fk_event_has_location_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SET SQL_MODE = '';
DROP USER IF EXISTS neighbor@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'neighbor'@'localhost' IDENTIFIED BY 'neighbor';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'neighbor'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
