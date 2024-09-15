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
CREATE SCHEMA IF NOT EXISTS `neighborhooddb` DEFAULT CHARACTER SET utf8 ;
USE `neighborhooddb` ;

-- -----------------------------------------------------
-- Table `neighborhood`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `neighborhood` ;

CREATE TABLE IF NOT EXISTS `neighborhood` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` TEXT NULL,
  `city` VARCHAR(50) NULL,
  `state` VARCHAR(50) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event` ;

CREATE TABLE IF NOT EXISTS `event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `image_url` VARCHAR(2000) NULL,
  `enabled` TINYINT NULL,
  `neighborhood_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_neighborhood1_idx` (`neighborhood_id` ASC) VISIBLE,
  CONSTRAINT `fk_event_neighborhood1`
    FOREIGN KEY (`neighborhood_id`)
    REFERENCES `neighborhood` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` TEXT NULL,
  `street` VARCHAR(100) NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `resident`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `resident` ;

CREATE TABLE IF NOT EXISTS `resident` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NULL,
  `email` VARCHAR(100) NULL,
  `image_url` VARCHAR(2000) NULL,
  `username` VARCHAR(50) NULL,
  `password` VARCHAR(50) NULL,
  `neighborhood_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_resident_neighborhood1_idx` (`neighborhood_id` ASC) VISIBLE,
  CONSTRAINT `fk_resident_neighborhood1`
    FOREIGN KEY (`neighborhood_id`)
    REFERENCES `neighborhood` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `event_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `event_comment` ;

CREATE TABLE IF NOT EXISTS `event_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `content` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  `resident_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_comment_resident1_idx` (`resident_id` ASC) VISIBLE,
  CONSTRAINT `fk_event_comment_resident1`
    FOREIGN KEY (`resident_id`)
    REFERENCES `resident` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


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
    REFERENCES `event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_has_location_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS neighbor@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'neighbor'@'localhost' IDENTIFIED BY 'neighbor';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'neighbor'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `neighborhood`
-- -----------------------------------------------------
START TRANSACTION;
USE `neighborhooddb`;
INSERT INTO `neighborhood` (`id`, `name`, `description`, `city`, `state`) VALUES (1, 'The Breakers', 'Gated community located just 6 miles south of Denver!', 'Englewood', 'Colorado');

COMMIT;


-- -----------------------------------------------------
-- Data for table `event`
-- -----------------------------------------------------
START TRANSACTION;
USE `neighborhooddb`;
INSERT INTO `event` (`id`, `name`, `description`, `create_date`, `last_update`, `image_url`, `enabled`, `neighborhood_id`) VALUES (1, 'Block Party', 'We\'re shutting down the block! Community leaders will be shutting down the block of Virginia Avenue (approved vehicles permitted) for community members to enjoy a fun filled party on the block. Food and drinks will be provided and there will be a live DJ with plenty of games and chances to win prizes!', '2024-09-06', '2024-09-06', 'https://images.nymag.com/guides/everything/blockparties130715_1_560.jpg', 1, 1);
INSERT INTO `event` (`id`, `name`, `description`, `create_date`, `last_update`, `image_url`, `enabled`, `neighborhood_id`) VALUES (2, 'Pool Party', 'Come join us for a day at the pool! ', '2024-09-06', '2024-09-06', 'https://media-api.xogrp.com/images/6259875e-0312-43bc-8a48-96215e0c4ccc~cr_22.0.2187.1450?quality=50', 1, 1);
INSERT INTO `event` (`id`, `name`, `description`, `create_date`, `last_update`, `image_url`, `enabled`, `neighborhood_id`) VALUES (3, 'Holiday Party', 'If you need somewhere to go during the holidays, come join your community at any of our holiday parties.', '2024-09-06', '2024-09-06', 'https://interhampers.com.au/cdn/shop/articles/tessa-rampersad-5toRIWF2GUY-unsplash.jpg?v=1695792870&width=1200', 1, 1);
INSERT INTO `event` (`id`, `name`, `description`, `create_date`, `last_update`, `image_url`, `enabled`, `neighborhood_id`) VALUES (4, 'Sports Day', 'Sports day on the field! All equipment will be provided by community leaders. There will be volleyball, kickball, and more!', '2024-09-06', '2024-09-06', 'https://wearecardinals.com/wp-content/uploads/2020/04/u1Re9qgMfM8d6kumlW85PS6s55jQh5fbdmppgQsP.jpeg', 1, 1);
INSERT INTO `event` (`id`, `name`, `description`, `create_date`, `last_update`, `image_url`, `enabled`, `neighborhood_id`) VALUES (5, 'BBQ', 'As the name states, we are having a BBQ! Community leaders will be cooking their favorite BBQ dishes and sides, but feel free to bring any dishes or sides of your own.', '2024-09-06', '2024-09-06', 'https://www.adamsgrilleprincefrederick.com/wp-content/uploads/2018/06/backyard-bbq.gif', 1, 1);
INSERT INTO `event` (`id`, `name`, `description`, `create_date`, `last_update`, `image_url`, `enabled`, `neighborhood_id`) VALUES (6, 'Garage Sale', 'Don\'t let all that extra stuff clutter your home, come down to the event center and sell any unwanted items. You\'ll never know who wants your unwanted items!', '2024-09-06', '2024-09-06', 'https://prod-cdn.storespace.com/images/default-source/blogpostsimages/garage-sale-with-various-items.jpg?sfvrsn=9d63cc20_0', 1, 1);
INSERT INTO `event` (`id`, `name`, `description`, `create_date`, `last_update`, `image_url`, `enabled`, `neighborhood_id`) VALUES (7, 'Cultural Food Festival', 'This is your chance to try different foods from around the world! ', '2024-09-06', '2024-09-06', 'https://static.euronews.com/articles/stories/07/61/61/58/1920x1080_cmsv2_bc594186-8ff2-5815-b4b4-c9b46d45142b-7616158.jpg', 1, 1);
INSERT INTO `event` (`id`, `name`, `description`, `create_date`, `last_update`, `image_url`, `enabled`, `neighborhood_id`) VALUES (8, 'Game Night', 'Come join us for game night! Choose from pool, darts, shuffle board, board games, video games, and more!', '2024-09-06', '2024-09-06', 'https://images.squarespace-cdn.com/content/v1/5542b308e4b07e74b9ce8154/1584492247563-EWKE5V45VGWLX6MM1OFR/game-night.jpg?format=2500w', 1, 1);
INSERT INTO `event` (`id`, `name`, `description`, `create_date`, `last_update`, `image_url`, `enabled`, `neighborhood_id`) VALUES (9, 'Movie Night', 'Movie night at the event center is a great way to have a laid back evening. Our big screen projectors and surround sound will have you feeling like you are watching a movie at the theatre!', '2024-09-06', '2024-09-06', 'https://www.hebrewnational.com/sites/g/files/qyyrlu276/files/images/articles/62bce0c336f6f0c2e6a42c66cc09fa97-main.jpg', 1, 1);
INSERT INTO `event` (`id`, `name`, `description`, `create_date`, `last_update`, `image_url`, `enabled`, `neighborhood_id`) VALUES (10, 'Salsa Night', 'Salsa dancing or salsa dip? Both! Dance the night away and then chips and salsa to end the night. Bring your best salsa dip for the salsa competition. The winner will receieve a $250 Visa giftcard, so don\'t just bring your best foot forward to the dancefloor, bring your best salsa dip!', '2024-09-06', '2024-09-06', 'https://media.istockphoto.com/id/542111772/vector/salsa-night.jpg?s=612x612&w=0&k=20&c=tKex2GCqt6Lq-6MIxsoFcvNJEtI5f2NT1wnFSurPyt0=', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `neighborhooddb`;
INSERT INTO `location` (`id`, `name`, `description`, `street`, `image_url`) VALUES (1, 'Community Center', 'The Community Center is right in the middle of the neighborhood. Majority of the big main events are held at this location.', '123 Fake St Bldg 1', 'https://www.lakeforestca.gov/sites/default/files/lake-forest/departments/community-center.jpg');
INSERT INTO `location` (`id`, `name`, `description`, `street`, `image_url`) VALUES (2, 'North Event Center', 'The North Event Center is located just north of the Community Center. It is a much smaller building that has pool tables, dart boards and much more.! This is the perfect place for game nights and smaller events.', '1738 N Picadilly Rd Bldg 1', 'https://www.spccs1.co.uk/articles/images/SBG%20Marylebone/My%20Post%20(2).jpg');
INSERT INTO `location` (`id`, `name`, `description`, `street`, `image_url`) VALUES (3, 'South Event Center', 'The South  Event Center is located at the southern most part of the neighborhood. It is a fairly sized building with a lot of open space. Typically, this event center is used for the neighborhood garage sale or any other event requiring ample space indoors.', '350 S Ida Dr Bldg 1', 'https://ohio.org/static/uploads/0688y000004OQwUAAW.jpg');
INSERT INTO `location` (`id`, `name`, `description`, `street`, `image_url`) VALUES (4, 'Recreation Center', 'The Recreation Center is the perfect place for all your fitness needs! From free weights to smith machines, stationary bikes and treadmills, basketball court, indoor pool and an even bigger outdoor pool with a lazy river! We host plenty of pool parties here during the summer months! ', '123 Fake St Bldg 2', 'https://images.squarespace-cdn.com/content/v1/5a67be3b12abd9bafb39125a/1623293097638-YYAEBJRKY9S9SQDBHQSB/Farmers+Branch+Recreation+Center+1+Quorum.jpg?format=1500w');
INSERT INTO `location` (`id`, `name`, `description`, `street`, `image_url`) VALUES (5, 'Washington Park', 'Washington park is right across the street from the Recreation Center. It is also a much bigger park than our smaller Cheeseman Park. We have both sand and grass volleyball nets setup as well as outdoor basketball courts. We host plenty of Sports Day events here.', '200 Fake St', 'https://www.tclf.org/sites/default/files/thumbnails/image/WashingtonPark_feature_BrianThomson_2015.jpg');
INSERT INTO `location` (`id`, `name`, `description`, `street`, `image_url`) VALUES (6, 'Cheeseman Park', 'Located right next to our South Event Center, Cheeseman Park is the perfect spot for a BBQ. We have ten gazeebos each with their own grill and abundance of tables and seats. There are two playgrounds for the kids to run around in. The grass area is much smaller compared to Washington Park, but there is still plenty of room to play sports on.', '351 S Ida Dr', 'https://www.oconomowoc-wi.gov/ImageRepository/Document?documentID=9811');
INSERT INTO `location` (`id`, `name`, `description`, `street`, `image_url`) VALUES (7, 'E Virginia Ave', 'Our block parties are always held on the block of E Virginia Ave. Community leaders shutdown the road so community members can safely enjoy the party!', 'E Virginia Ave', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `resident`
-- -----------------------------------------------------
START TRANSACTION;
USE `neighborhooddb`;
INSERT INTO `resident` (`id`, `first_name`, `last_name`, `email`, `image_url`, `username`, `password`, `neighborhood_id`) VALUES (1, 'Peyton', 'Manning', 'peyton.manning@gmail.com', NULL, 'Manning', 'Manning', 1);

COMMIT;

