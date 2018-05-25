-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Carrito
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Carrito
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Carrito` DEFAULT CHARACTER SET utf8 ;
USE `Carrito` ;

-- -----------------------------------------------------
-- Table `Carrito`.`Articulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Carrito`.`Articulo` ;

CREATE TABLE IF NOT EXISTS `Carrito`.`Articulo` (
  `idArticulo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `precio` FLOAT NULL,
  `thumbnail` INT NULL,
  PRIMARY KEY (`idArticulo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Carrito`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Carrito`.`usuario` ;

CREATE TABLE IF NOT EXISTS `Carrito`.`usuario` (
  `idusuario` INT NOT NULL,
  `correo` VARCHAR(45) NULL,
  `clave` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Carrito`.`Carrito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Carrito`.`Carrito` ;

CREATE TABLE IF NOT EXISTS `Carrito`.`Carrito` (
  `idCarrito` INT NOT NULL AUTO_INCREMENT,
  `usuario_idusuario` INT NOT NULL,
  PRIMARY KEY (`idCarrito`),
  INDEX `fk_Carrito_usuario1_idx` (`usuario_idusuario` ASC),
  CONSTRAINT `fk_Carrito_usuario1`
    FOREIGN KEY (`usuario_idusuario`)
    REFERENCES `Carrito`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Carrito`.`CarritoArticulo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Carrito`.`CarritoArticulo` ;

CREATE TABLE IF NOT EXISTS `Carrito`.`CarritoArticulo` (
  `idCarrito` INT NOT NULL,
  `idArticulo` INT NOT NULL,
  PRIMARY KEY (`idCarrito`, `idArticulo`),
  INDEX `fk_Carrito_has_Articulo_Articulo1_idx` (`idArticulo` ASC),
  INDEX `fk_Carrito_has_Articulo_Carrito_idx` (`idCarrito` ASC),
  CONSTRAINT `fk_Carrito_has_Articulo_Carrito`
    FOREIGN KEY (`idCarrito`)
    REFERENCES `Carrito`.`Carrito` (`idCarrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Carrito_has_Articulo_Articulo1`
    FOREIGN KEY (`idArticulo`)
    REFERENCES `Carrito`.`Articulo` (`idArticulo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into Articulo (nombre,precio,thumbnail) values('Accesorio',12000,0);
insert into Articulo (nombre,precio,thumbnail) values('Accesorio 2',15000,1);
insert into Articulo (nombre,precio,thumbnail) values('Headset',20000,2);
insert into Articulo (nombre,precio,thumbnail) values('Estuche',5000,3);
insert into Articulo (nombre,precio,thumbnail) values('Estuche 2',10000,4);
insert into usuario (correo,clave,tipo) values('admin@gmail.com','12345','admin');
insert into usuario (correo,clave,tipo) values('user@gmail.com','12345','user');
