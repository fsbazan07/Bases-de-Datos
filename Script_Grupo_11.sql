-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DHTube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DHTube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DHTube` DEFAULT CHARACTER SET utf8 ;
USE `DHTube` ;

-- -----------------------------------------------------
-- Table `DHTube`.`Codigo_Postal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`Codigo_Postal` (
  `idCodigo_Postal` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(20) NULL,
  PRIMARY KEY (`idCodigo_Postal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`Pais` (
  `idPais` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  PRIMARY KEY (`idPais`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`Avatar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`Avatar` (
  `idAvatar` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `url_img` VARCHAR(255) NULL,
  PRIMARY KEY (`idAvatar`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`Usuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NULL,
  `password` VARCHAR(50) NULL,
  `nombre_usuario` VARCHAR(100) NULL,
  `fecha_nac` DATE NULL,
  `id_pais` INT NULL,
  `id_cod_postal` INT NULL,
  `id_avatar` INT NULL,
  PRIMARY KEY (`idUsuarios`),
  INDEX `FK_usuario_codigo_postal_idx` (`id_cod_postal` ASC) VISIBLE,
  INDEX `FK_usuario_pais_idx` (`id_pais` ASC) VISIBLE,
  INDEX `FK_usuario_avatar_idx` (`id_avatar` ASC) VISIBLE,
  CONSTRAINT `FK_usuario_codigo_postal`
    FOREIGN KEY (`id_cod_postal`)
    REFERENCES `DHTube`.`Codigo_Postal` (`idCodigo_Postal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_usuario_pais`
    FOREIGN KEY (`id_pais`)
    REFERENCES `DHTube`.`Pais` (`idPais`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_usuario_avatar`
    FOREIGN KEY (`id_avatar`)
    REFERENCES `DHTube`.`Avatar` (`idAvatar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`Estado` (
  `idEstado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`Videos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`Videos` (
  `idVideos` INT NOT NULL AUTO_INCREMENT,
  `Titulo` VARCHAR(100) NULL,
  `descripcion` TEXT NULL,
  `tamanio` DECIMAL NULL,
  `nombre_arch_video` VARCHAR(100) NULL,
  `duracion` TIME NULL,
  `imagen` VARCHAR(255) NULL,
  `nro_reproducciones` BIGINT NULL,
  `nro_likes` BIGINT NULL,
  `nro_dislikes` BIGINT NULL,
  `id_estado` INT NULL,
  `id_usuario` INT NULL,
  `fecha_hora_public` DATETIME NULL,
  PRIMARY KEY (`idVideos`),
  INDEX `FK_videos_estado_idx` (`id_estado` ASC) VISIBLE,
  INDEX `FK_videos_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `FK_videos_estado`
    FOREIGN KEY (`id_estado`)
    REFERENCES `DHTube`.`Estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_videos_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `DHTube`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`Canal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`Canal` (
  `idCanal` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `descripcion` TEXT NULL,
  `fecha_creacion` DATE NULL,
  `id_usuario` INT NULL,
  PRIMARY KEY (`idCanal`),
  INDEX `FK_canal_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `FK_canal_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `DHTube`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`Playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`Playlist` (
  `idPlaylist` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL,
  `fecha_creacion` DATE NULL,
  `id_usuario` INT NULL,
  `id_estado` INT NULL,
  PRIMARY KEY (`idPlaylist`),
  INDEX `FK_playlist_estado_idx` (`id_estado` ASC) VISIBLE,
  INDEX `FK_playlist_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `FK_playlist_estado`
    FOREIGN KEY (`id_estado`)
    REFERENCES `DHTube`.`Estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_playlist_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `DHTube`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`Reaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`Reaciones` (
  `idReaciones_Videos` INT NOT NULL AUTO_INCREMENT,
  `reacciones` VARCHAR(20) NULL,
  `fecha_hora_reaccion` DATETIME NULL,
  `id_videos` INT NULL,
  `id_usuario` INT NULL,
  PRIMARY KEY (`idReaciones_Videos`),
  INDEX `FK_reacciones_videos_video_idx` (`id_videos` ASC) VISIBLE,
  INDEX `FK_reacciones_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `FK_reacciones_video`
    FOREIGN KEY (`id_videos`)
    REFERENCES `DHTube`.`Videos` (`idVideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_reacciones_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `DHTube`.`Usuarios` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`Etiqueta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`Etiqueta` (
  `idEtiqueta` INT NOT NULL AUTO_INCREMENT,
  `codigo` INT NULL,
  `nombre` VARCHAR(100) NULL,
  PRIMARY KEY (`idEtiqueta`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`Video_Etiqueta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`Video_Etiqueta` (
  `idVideo_Etiqueta` INT NOT NULL AUTO_INCREMENT,
  `id_video` INT NULL,
  `id_etiqueta` INT NULL,
  PRIMARY KEY (`idVideo_Etiqueta`),
  INDEX `FK_video_etiqueta_video_idx` (`id_video` ASC) VISIBLE,
  INDEX `FK_video_etiqueta_etiqueta_idx` (`id_etiqueta` ASC) VISIBLE,
  CONSTRAINT `FK_video_etiqueta_video`
    FOREIGN KEY (`id_video`)
    REFERENCES `DHTube`.`Videos` (`idVideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_video_etiqueta_etiqueta`
    FOREIGN KEY (`id_etiqueta`)
    REFERENCES `DHTube`.`Etiqueta` (`idEtiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DHTube`.`Video_Playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DHTube`.`Video_Playlist` (
  `idVideo_Playlist` INT NOT NULL AUTO_INCREMENT,
  `id_video` INT NULL,
  `id_playlist` INT NULL,
  PRIMARY KEY (`idVideo_Playlist`),
  INDEX `FK_video_playlist_video_idx` (`id_video` ASC) VISIBLE,
  INDEX `FK_video_playlist_playlist_idx` (`id_playlist` ASC) VISIBLE,
  CONSTRAINT `FK_video_playlist_video`
    FOREIGN KEY (`id_video`)
    REFERENCES `DHTube`.`Videos` (`idVideos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_video_playlist_playlist`
    FOREIGN KEY (`id_playlist`)
    REFERENCES `DHTube`.`Playlist` (`idPlaylist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
