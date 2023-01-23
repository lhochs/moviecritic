-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema movie_critic_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema movie_critic_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movie_critic_db` DEFAULT CHARACTER SET utf8 ;
USE `movie_critic_db` ;

-- -----------------------------------------------------
-- Table `movie_critic_db`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie_critic_db`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(255) NULL,
  `full_name` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(255) NULL,
  `created_at` DATETIME NULL DEFAULT (NOW()),
  `updated_at` DATETIME NULL DEFAULT (NOW()),
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie_critic_db`.`movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie_critic_db`.`movies` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `imdb_link` TEXT(65535) NULL,
  `title` VARCHAR(255) NULL,
  `imdb_score` FLOAT NULL,
  `description` TEXT(65535) NULL,
  `genre` VARCHAR(255) NULL,
  `imdb_movie_poster` TEXT(65535) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie_critic_db`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie_critic_db`.`review` (
  `id` INT NOT NULL,
  `rating` SMALLINT(2) NULL,
  `review` VARCHAR(65535) NULL,
  `created_at` VARCHAR(45) NULL,
  `updated_at` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `movie_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_review_users_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_review_movies1_idx` (`movie_id` ASC) VISIBLE,
  CONSTRAINT `fk_review_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `movie_critic_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_movies1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie_critic_db`.`movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie_critic_db`.`watchlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie_critic_db`.`watchlist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `movie_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_watchlist_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_watchlist_movies1_idx` (`movie_id` ASC) VISIBLE,
  CONSTRAINT `fk_watchlist_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `movie_critic_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_watchlist_movies1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie_critic_db`.`movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movie_critic_db`.`likes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movie_critic_db`.`likes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `movie_id` INT NOT NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW(),
  PRIMARY KEY (`id`),
  INDEX `fk_likes_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_likes_movies1_idx` (`movie_id` ASC) VISIBLE,
  CONSTRAINT `fk_likes_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `movie_critic_db`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_movies1`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movie_critic_db`.`movies` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
