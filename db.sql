-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Anamakine: localhost
-- Üretim Zamanı: 23 Ağu 2013, 16:09:20
-- Sunucu sürümü: 5.6.12-log
-- PHP Sürümü: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Veritabanı: `projem`
--
CREATE DATABASE IF NOT EXISTS `projem` DEFAULT CHARACTER SET utf8 COLLATE utf8_turkish_ci;
USE `projem`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yetki_eylem`
--

CREATE TABLE IF NOT EXISTS `yetki_eylem` (
  `id` int(11) NOT NULL,
  `isim` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `aciklama` varchar(300) COLLATE utf8_turkish_ci DEFAULT NULL,
  `modul_id` int(11) NOT NULL,
  `aktif` enum('E','H') COLLATE utf8_turkish_ci NOT NULL DEFAULT 'E',
  PRIMARY KEY (`id`),
  UNIQUE KEY `isim` (`isim`),
  KEY `modul_id` (`modul_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yetki_grup`
--

CREATE TABLE IF NOT EXISTS `yetki_grup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isim` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `aciklama` varchar(300) COLLATE utf8_turkish_ci NOT NULL,
  `ebeveyn` int(11) NOT NULL,
  `aktif` enum('E','H') COLLATE utf8_turkish_ci NOT NULL DEFAULT 'E',
  PRIMARY KEY (`id`),
  UNIQUE KEY `isim` (`isim`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yetki_kullanici`
--

CREATE TABLE IF NOT EXISTS `yetki_kullanici` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isim` varchar(20) COLLATE utf8_turkish_ci NOT NULL,
  `adi` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `soyadi` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `mail` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `sifre` varchar(32) COLLATE utf8_turkish_ci NOT NULL,
  `aciklama` varchar(300) COLLATE utf8_turkish_ci NOT NULL,
  `aktif` enum('E','H') COLLATE utf8_turkish_ci NOT NULL DEFAULT 'E',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kimlik` (`isim`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yetki_modul`
--

CREATE TABLE IF NOT EXISTS `yetki_modul` (
  `id` int(11) NOT NULL,
  `kimlik` varchar(30) COLLATE utf8_turkish_ci NOT NULL,
  `aciklama` int(11) DEFAULT NULL,
  `ebeveyn` int(11) DEFAULT NULL,
  `aktif` enum('E','H') COLLATE utf8_turkish_ci NOT NULL DEFAULT 'E',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kimlik` (`kimlik`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yetki_uyelik`
--

CREATE TABLE IF NOT EXISTS `yetki_uyelik` (
  `kullanici_id` int(11) NOT NULL,
  `grup_id` int(11) NOT NULL,
  UNIQUE KEY `kullanici_id` (`kullanici_id`,`grup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yetki_yetkiler`
--

CREATE TABLE IF NOT EXISTS `yetki_yetkiler` (
  `modul_id` int(11) NOT NULL,
  `eylem_id` int(11) NOT NULL,
  `grup_id` int(11) NOT NULL DEFAULT '0',
  `kullanici_id` int(11) NOT NULL DEFAULT '0',
  `erisim` tinyint(4) NOT NULL DEFAULT '1',
  `aktif` enum('E','H') COLLATE utf8_turkish_ci NOT NULL DEFAULT 'E',
  UNIQUE KEY `modul_id` (`modul_id`,`eylem_id`,`grup_id`,`kullanici_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;
