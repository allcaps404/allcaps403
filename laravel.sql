-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 03, 2024 at 12:25 AM
-- Server version: 5.7.33
-- PHP Version: 8.1.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `environment_data`
--

CREATE TABLE `environment_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `temperature` double(8,2) NOT NULL,
  `humidity` double(8,2) NOT NULL,
  `avg_soil_moisture` int(11) NOT NULL,
  `soil_moisture_1` float(8,2) NOT NULL,
  `soil_moisture_2` float(8,2) NOT NULL,
  `soil_moisture_3` float(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `environment_data`
--

INSERT INTO `environment_data` (`id`, `temperature`, `humidity`, `avg_soil_moisture`, `soil_moisture_1`, `soil_moisture_2`, `soil_moisture_3`, `created_at`, `updated_at`) VALUES
(1, 43.80, 40.90, 76, 0.00, 0.00, 0.00, '2024-12-01 19:23:54', '2024-12-01 19:23:54'),
(2, 44.10, 38.80, 78, 0.00, 0.00, 0.00, '2024-12-01 19:25:54', '2024-12-01 19:25:54'),
(3, 44.30, 39.60, 82, 0.00, 0.00, 0.00, '2024-12-01 19:27:54', '2024-12-01 19:27:54'),
(4, 44.50, 36.00, 82, 0.00, 0.00, 0.00, '2024-12-01 19:29:54', '2024-12-01 19:29:54');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(6, '2024_10_08_034940_create_posts_table', 3),
(7, '2014_10_12_000000_create_users_table', 4),
(8, '2014_10_12_100000_create_password_reset_tokens_table', 4),
(9, '2019_08_19_000000_create_failed_jobs_table', 4),
(10, '2019_12_14_000001_create_personal_access_tokens_table', 4),
(11, '2024_10_05_070811_create_environment_data_table', 4),
(12, '2024_11_05_101833_create_settings_table', 5),
(13, '2024_11_06_054817_add_temperature_to_settings', 6),
(14, '2024_11_08_044319_add_soilmoisture_to_settings', 7),
(16, '2024_11_08_061044_add_automatic_to_settings', 8),
(17, '2024_11_12_105302_add_avg_soil_moisture_to_environment_data_table', 9),
(18, '2024_11_12_105725_add_avg_soil_moisture_to_environment_data_table', 10),
(20, '2024_11_14_103647_add_role_to_users_table', 11),
(21, '2024_11_16_070651_create_notifications_table', 12),
(23, '2024_11_17_054239_add_soil_moisture_to_environment_data_table', 13),
(24, '2024_11_18_093418_create_arduino_statuses_table', 14),
(25, '2024_11_18_101158_create_arduino_statuses_table', 15),
(26, '2024_11_18_103232_create_notifications_table', 16),
(27, '2024_11_23_063417_create_notifications_table', 17);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.67}', NULL, '2024-12-01 18:43:31', '2024-12-01 18:43:31'),
(2, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.67}', NULL, '2024-12-01 18:43:31', '2024-12-01 18:43:31'),
(3, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.67}', NULL, '2024-12-01 18:43:31', '2024-12-01 18:43:31'),
(4, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":41.2,\"humidity\":44.8,\"soil_moisture\":0}', NULL, '2024-12-01 18:43:32', '2024-12-01 18:43:32'),
(5, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":41.2,\"humidity\":44.8,\"soil_moisture\":0}', NULL, '2024-12-01 18:43:32', '2024-12-01 18:43:32'),
(6, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":41.2,\"humidity\":44.8,\"soil_moisture\":0}', NULL, '2024-12-01 18:43:32', '2024-12-01 18:43:32'),
(7, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:44:02', '2024-12-01 18:44:02'),
(8, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:44:02', '2024-12-01 18:44:02'),
(9, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:44:02', '2024-12-01 18:44:02'),
(10, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.8,\"humidity\":45.9,\"soil_moisture\":0}', NULL, '2024-12-01 18:44:03', '2024-12-01 18:44:03'),
(11, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.8,\"humidity\":45.9,\"soil_moisture\":0}', NULL, '2024-12-01 18:44:03', '2024-12-01 18:44:03'),
(12, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.8,\"humidity\":45.9,\"soil_moisture\":0}', NULL, '2024-12-01 18:44:03', '2024-12-01 18:44:03'),
(13, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:44:32', '2024-12-01 18:44:32'),
(14, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:44:32', '2024-12-01 18:44:32'),
(15, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:44:32', '2024-12-01 18:44:32'),
(16, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.5,\"humidity\":46.9,\"soil_moisture\":0}', NULL, '2024-12-01 18:44:34', '2024-12-01 18:44:34'),
(17, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.5,\"humidity\":46.9,\"soil_moisture\":0}', NULL, '2024-12-01 18:44:34', '2024-12-01 18:44:34'),
(18, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.5,\"humidity\":46.9,\"soil_moisture\":0}', NULL, '2024-12-01 18:44:34', '2024-12-01 18:44:34'),
(19, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33}', NULL, '2024-12-01 18:45:03', '2024-12-01 18:45:03'),
(20, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33}', NULL, '2024-12-01 18:45:03', '2024-12-01 18:45:03'),
(21, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33}', NULL, '2024-12-01 18:45:03', '2024-12-01 18:45:03'),
(22, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.7,\"humidity\":46.9,\"soil_moisture\":0}', NULL, '2024-12-01 18:45:04', '2024-12-01 18:45:04'),
(23, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.7,\"humidity\":46.9,\"soil_moisture\":0}', NULL, '2024-12-01 18:45:04', '2024-12-01 18:45:04'),
(24, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.7,\"humidity\":46.9,\"soil_moisture\":0}', NULL, '2024-12-01 18:45:04', '2024-12-01 18:45:04'),
(25, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:45:34', '2024-12-01 18:45:34'),
(26, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:45:34', '2024-12-01 18:45:34'),
(27, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:45:34', '2024-12-01 18:45:34'),
(28, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.6,\"humidity\":45.8,\"soil_moisture\":0}', NULL, '2024-12-01 18:45:35', '2024-12-01 18:45:35'),
(29, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.6,\"humidity\":45.8,\"soil_moisture\":0}', NULL, '2024-12-01 18:45:35', '2024-12-01 18:45:35'),
(30, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.6,\"humidity\":45.8,\"soil_moisture\":0}', NULL, '2024-12-01 18:45:35', '2024-12-01 18:45:35'),
(31, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:46:04', '2024-12-01 18:46:04'),
(32, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:46:04', '2024-12-01 18:46:04'),
(33, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:46:04', '2024-12-01 18:46:04'),
(34, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.3,\"humidity\":47.1,\"soil_moisture\":0}', NULL, '2024-12-01 18:46:05', '2024-12-01 18:46:05'),
(35, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.3,\"humidity\":47.1,\"soil_moisture\":0}', NULL, '2024-12-01 18:46:05', '2024-12-01 18:46:05'),
(36, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.3,\"humidity\":47.1,\"soil_moisture\":0}', NULL, '2024-12-01 18:46:05', '2024-12-01 18:46:05'),
(37, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.67}', NULL, '2024-12-01 18:46:35', '2024-12-01 18:46:35'),
(38, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.67}', NULL, '2024-12-01 18:46:35', '2024-12-01 18:46:35'),
(39, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.67}', NULL, '2024-12-01 18:46:35', '2024-12-01 18:46:35'),
(40, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.4,\"humidity\":48.5,\"soil_moisture\":0}', NULL, '2024-12-01 18:46:36', '2024-12-01 18:46:36'),
(41, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.4,\"humidity\":48.5,\"soil_moisture\":0}', NULL, '2024-12-01 18:46:36', '2024-12-01 18:46:36'),
(42, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.4,\"humidity\":48.5,\"soil_moisture\":0}', NULL, '2024-12-01 18:46:36', '2024-12-01 18:46:36'),
(43, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:47:05', '2024-12-01 18:47:05'),
(44, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:47:05', '2024-12-01 18:47:05'),
(45, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:47:05', '2024-12-01 18:47:05'),
(46, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.7,\"humidity\":47.9,\"soil_moisture\":0}', NULL, '2024-12-01 18:47:07', '2024-12-01 18:47:07'),
(47, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.7,\"humidity\":47.9,\"soil_moisture\":0}', NULL, '2024-12-01 18:47:07', '2024-12-01 18:47:07'),
(48, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.7,\"humidity\":47.9,\"soil_moisture\":0}', NULL, '2024-12-01 18:47:07', '2024-12-01 18:47:07'),
(49, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.8,\"humidity\":45.6,\"soil_moisture\":0}', NULL, '2024-12-01 18:47:37', '2024-12-01 18:47:37'),
(50, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.8,\"humidity\":45.6,\"soil_moisture\":0}', NULL, '2024-12-01 18:47:37', '2024-12-01 18:47:37'),
(51, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.8,\"humidity\":45.6,\"soil_moisture\":0}', NULL, '2024-12-01 18:47:37', '2024-12-01 18:47:37'),
(52, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.67}', NULL, '2024-12-01 18:47:39', '2024-12-01 18:47:39'),
(53, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.67}', NULL, '2024-12-01 18:47:39', '2024-12-01 18:47:39'),
(54, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.67}', NULL, '2024-12-01 18:47:39', '2024-12-01 18:47:39'),
(55, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33}', NULL, '2024-12-01 18:48:07', '2024-12-01 18:48:07'),
(56, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33}', NULL, '2024-12-01 18:48:07', '2024-12-01 18:48:07'),
(57, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33}', NULL, '2024-12-01 18:48:07', '2024-12-01 18:48:07'),
(58, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.6,\"humidity\":46.7,\"soil_moisture\":0}', NULL, '2024-12-01 18:48:08', '2024-12-01 18:48:08'),
(59, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.6,\"humidity\":46.7,\"soil_moisture\":0}', NULL, '2024-12-01 18:48:08', '2024-12-01 18:48:08'),
(60, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.6,\"humidity\":46.7,\"soil_moisture\":0}', NULL, '2024-12-01 18:48:08', '2024-12-01 18:48:08'),
(61, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33}', NULL, '2024-12-01 18:48:37', '2024-12-01 18:48:37'),
(62, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33}', NULL, '2024-12-01 18:48:37', '2024-12-01 18:48:37'),
(63, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33}', NULL, '2024-12-01 18:48:37', '2024-12-01 18:48:37'),
(64, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.5,\"humidity\":47.8,\"soil_moisture\":0}', NULL, '2024-12-01 18:48:39', '2024-12-01 18:48:39'),
(65, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.5,\"humidity\":47.8,\"soil_moisture\":0}', NULL, '2024-12-01 18:48:39', '2024-12-01 18:48:39'),
(66, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.5,\"humidity\":47.8,\"soil_moisture\":0}', NULL, '2024-12-01 18:48:39', '2024-12-01 18:48:39'),
(67, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:49:08', '2024-12-01 18:49:08'),
(68, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:49:08', '2024-12-01 18:49:08'),
(69, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:49:08', '2024-12-01 18:49:08'),
(70, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.8,\"humidity\":47.8,\"soil_moisture\":0}', NULL, '2024-12-01 18:49:09', '2024-12-01 18:49:09'),
(71, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.8,\"humidity\":47.8,\"soil_moisture\":0}', NULL, '2024-12-01 18:49:09', '2024-12-01 18:49:09'),
(72, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":40.8,\"humidity\":47.8,\"soil_moisture\":0}', NULL, '2024-12-01 18:49:09', '2024-12-01 18:49:09'),
(73, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:49:38', '2024-12-01 18:49:38'),
(74, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:49:38', '2024-12-01 18:49:38'),
(75, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":33.33}', NULL, '2024-12-01 18:49:38', '2024-12-01 18:49:38'),
(76, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":41.1,\"humidity\":47.6,\"soil_moisture\":0}', NULL, '2024-12-01 18:49:40', '2024-12-01 18:49:40'),
(77, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":41.1,\"humidity\":47.6,\"soil_moisture\":0}', NULL, '2024-12-01 18:49:40', '2024-12-01 18:49:40'),
(78, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":41.1,\"humidity\":47.6,\"soil_moisture\":0}', NULL, '2024-12-01 18:49:40', '2024-12-01 18:49:40'),
(79, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":41.5,\"humidity\":48.7,\"soil_moisture\":0}', NULL, '2024-12-01 18:50:10', '2024-12-01 18:50:10'),
(80, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":41.5,\"humidity\":48.7,\"soil_moisture\":0}', NULL, '2024-12-01 18:50:10', '2024-12-01 18:50:10'),
(81, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":41.5,\"humidity\":48.7,\"soil_moisture\":0}', NULL, '2024-12-01 18:50:10', '2024-12-01 18:50:10'),
(82, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":2.67}', NULL, '2024-12-01 18:50:40', '2024-12-01 18:50:40'),
(83, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":2.67}', NULL, '2024-12-01 18:50:40', '2024-12-01 18:50:40'),
(84, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":2.67}', NULL, '2024-12-01 18:50:40', '2024-12-01 18:50:40'),
(85, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":2.67}', NULL, '2024-12-01 18:51:10', '2024-12-01 18:51:10'),
(86, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":2.67}', NULL, '2024-12-01 18:51:10', '2024-12-01 18:51:10'),
(87, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":2.67}', NULL, '2024-12-01 18:51:10', '2024-12-01 18:51:10'),
(88, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.5,\"humidity\":46.2,\"soil_moisture\":0}', NULL, '2024-12-01 18:51:11', '2024-12-01 18:51:11'),
(89, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.5,\"humidity\":46.2,\"soil_moisture\":0}', NULL, '2024-12-01 18:51:11', '2024-12-01 18:51:11'),
(90, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.5,\"humidity\":46.2,\"soil_moisture\":0}', NULL, '2024-12-01 18:51:11', '2024-12-01 18:51:11'),
(91, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":22}', NULL, '2024-12-01 18:57:43', '2024-12-01 18:57:43'),
(92, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":22}', NULL, '2024-12-01 18:57:43', '2024-12-01 18:57:43'),
(93, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":22}', NULL, '2024-12-01 18:57:43', '2024-12-01 18:57:43'),
(94, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.8,\"humidity\":46.7,\"soil_moisture\":0}', NULL, '2024-12-01 18:57:43', '2024-12-01 18:57:43'),
(95, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.8,\"humidity\":46.7,\"soil_moisture\":0}', NULL, '2024-12-01 18:57:43', '2024-12-01 18:57:43'),
(96, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.8,\"humidity\":46.7,\"soil_moisture\":0}', NULL, '2024-12-01 18:57:43', '2024-12-01 18:57:43'),
(97, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.3,\"humidity\":43.1,\"soil_moisture\":0}', NULL, '2024-12-01 18:58:13', '2024-12-01 18:58:13'),
(98, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":24.67}', NULL, '2024-12-01 18:58:13', '2024-12-01 18:58:13'),
(99, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.3,\"humidity\":43.1,\"soil_moisture\":0}', NULL, '2024-12-01 18:58:14', '2024-12-01 18:58:14'),
(100, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":24.67}', NULL, '2024-12-01 18:58:15', '2024-12-01 18:58:15'),
(101, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.3,\"humidity\":43.1,\"soil_moisture\":0}', NULL, '2024-12-01 18:58:15', '2024-12-01 18:58:15'),
(102, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":24.67}', NULL, '2024-12-01 18:58:15', '2024-12-01 18:58:15'),
(103, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":22}', NULL, '2024-12-01 18:58:44', '2024-12-01 18:58:44'),
(104, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":22}', NULL, '2024-12-01 18:58:44', '2024-12-01 18:58:44'),
(105, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":22}', NULL, '2024-12-01 18:58:44', '2024-12-01 18:58:44'),
(106, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.2,\"humidity\":40.2,\"soil_moisture\":0}', NULL, '2024-12-01 18:58:44', '2024-12-01 18:58:44'),
(107, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.2,\"humidity\":40.2,\"soil_moisture\":0}', NULL, '2024-12-01 18:58:44', '2024-12-01 18:58:44'),
(108, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.2,\"humidity\":40.2,\"soil_moisture\":0}', NULL, '2024-12-01 18:58:44', '2024-12-01 18:58:44'),
(109, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":21.33}', NULL, '2024-12-01 18:59:15', '2024-12-01 18:59:15'),
(110, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":21.33}', NULL, '2024-12-01 18:59:15', '2024-12-01 18:59:15'),
(111, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":21.33}', NULL, '2024-12-01 18:59:15', '2024-12-01 18:59:15'),
(112, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43,\"humidity\":40.8,\"soil_moisture\":0}', NULL, '2024-12-01 18:59:15', '2024-12-01 18:59:15'),
(113, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43,\"humidity\":40.8,\"soil_moisture\":0}', NULL, '2024-12-01 18:59:15', '2024-12-01 18:59:15'),
(114, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43,\"humidity\":40.8,\"soil_moisture\":0}', NULL, '2024-12-01 18:59:15', '2024-12-01 18:59:15'),
(115, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.2,\"humidity\":40.9,\"soil_moisture\":0}', NULL, '2024-12-01 18:59:45', '2024-12-01 18:59:45'),
(116, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.2,\"humidity\":40.9,\"soil_moisture\":0}', NULL, '2024-12-01 18:59:45', '2024-12-01 18:59:45'),
(117, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":21}', NULL, '2024-12-01 18:59:45', '2024-12-01 18:59:45'),
(118, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.2,\"humidity\":40.9,\"soil_moisture\":0}', NULL, '2024-12-01 18:59:45', '2024-12-01 18:59:45'),
(119, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":21}', NULL, '2024-12-01 18:59:45', '2024-12-01 18:59:45'),
(120, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":21}', NULL, '2024-12-01 18:59:45', '2024-12-01 18:59:45'),
(121, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":40.1,\"soil_moisture\":0}', NULL, '2024-12-01 19:00:15', '2024-12-01 19:00:15'),
(122, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":40.1,\"soil_moisture\":0}', NULL, '2024-12-01 19:00:15', '2024-12-01 19:00:15'),
(123, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":40.1,\"soil_moisture\":0}', NULL, '2024-12-01 19:00:15', '2024-12-01 19:00:15'),
(124, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":21.33}', NULL, '2024-12-01 19:00:15', '2024-12-01 19:00:15'),
(125, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":21.33}', NULL, '2024-12-01 19:00:15', '2024-12-01 19:00:15'),
(126, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":21.33}', NULL, '2024-12-01 19:00:15', '2024-12-01 19:00:15'),
(127, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":20.67}', NULL, '2024-12-01 19:00:46', '2024-12-01 19:00:46'),
(128, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":20.67}', NULL, '2024-12-01 19:00:46', '2024-12-01 19:00:46'),
(129, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":20.67}', NULL, '2024-12-01 19:00:46', '2024-12-01 19:00:46'),
(130, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":41.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:00:46', '2024-12-01 19:00:46'),
(131, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":41.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:00:46', '2024-12-01 19:00:46'),
(132, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":41.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:00:46', '2024-12-01 19:00:46'),
(133, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":20.33}', NULL, '2024-12-01 19:01:17', '2024-12-01 19:01:17'),
(134, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":20.33}', NULL, '2024-12-01 19:01:17', '2024-12-01 19:01:17'),
(135, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":20.33}', NULL, '2024-12-01 19:01:17', '2024-12-01 19:01:17'),
(136, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":20.67}', NULL, '2024-12-01 19:01:47', '2024-12-01 19:01:47'),
(137, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":20.67}', NULL, '2024-12-01 19:01:47', '2024-12-01 19:01:47'),
(138, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":20.67}', NULL, '2024-12-01 19:01:47', '2024-12-01 19:01:47'),
(139, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.8,\"humidity\":41.9,\"soil_moisture\":0}', NULL, '2024-12-01 19:01:47', '2024-12-01 19:01:47'),
(140, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.8,\"humidity\":41.9,\"soil_moisture\":0}', NULL, '2024-12-01 19:01:47', '2024-12-01 19:01:47'),
(141, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.8,\"humidity\":41.9,\"soil_moisture\":0}', NULL, '2024-12-01 19:01:47', '2024-12-01 19:01:47'),
(142, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":20.33}', NULL, '2024-12-01 19:02:18', '2024-12-01 19:02:18'),
(143, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":20.33}', NULL, '2024-12-01 19:02:18', '2024-12-01 19:02:18'),
(144, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":20.33}', NULL, '2024-12-01 19:02:18', '2024-12-01 19:02:18'),
(145, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.7,\"humidity\":42,\"soil_moisture\":0}', NULL, '2024-12-01 19:02:18', '2024-12-01 19:02:18'),
(146, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.7,\"humidity\":42,\"soil_moisture\":0}', NULL, '2024-12-01 19:02:18', '2024-12-01 19:02:18'),
(147, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.7,\"humidity\":42,\"soil_moisture\":0}', NULL, '2024-12-01 19:02:18', '2024-12-01 19:02:18'),
(148, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":23.33}', NULL, '2024-12-01 19:02:48', '2024-12-01 19:02:48'),
(149, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":23.33}', NULL, '2024-12-01 19:02:48', '2024-12-01 19:02:48'),
(150, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":23.33}', NULL, '2024-12-01 19:02:48', '2024-12-01 19:02:48'),
(151, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.5,\"humidity\":42.6,\"soil_moisture\":0}', NULL, '2024-12-01 19:02:48', '2024-12-01 19:02:48'),
(152, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.5,\"humidity\":42.6,\"soil_moisture\":0}', NULL, '2024-12-01 19:02:48', '2024-12-01 19:02:48'),
(153, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.5,\"humidity\":42.6,\"soil_moisture\":0}', NULL, '2024-12-01 19:02:48', '2024-12-01 19:02:48'),
(154, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":23.67}', NULL, '2024-12-01 19:03:24', '2024-12-01 19:03:24'),
(155, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":23.67}', NULL, '2024-12-01 19:03:24', '2024-12-01 19:03:24'),
(156, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":23.67}', NULL, '2024-12-01 19:03:24', '2024-12-01 19:03:24'),
(157, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.7,\"humidity\":41.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:03:24', '2024-12-01 19:03:24'),
(158, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.7,\"humidity\":41.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:03:24', '2024-12-01 19:03:24'),
(159, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.7,\"humidity\":41.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:03:24', '2024-12-01 19:03:24'),
(160, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.8,\"humidity\":42.9,\"soil_moisture\":0}', NULL, '2024-12-01 19:03:55', '2024-12-01 19:03:55'),
(161, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.8,\"humidity\":42.9,\"soil_moisture\":0}', NULL, '2024-12-01 19:03:55', '2024-12-01 19:03:55'),
(162, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":24}', NULL, '2024-12-01 19:03:55', '2024-12-01 19:03:55'),
(163, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.8,\"humidity\":42.9,\"soil_moisture\":0}', NULL, '2024-12-01 19:03:55', '2024-12-01 19:03:55'),
(164, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":24}', NULL, '2024-12-01 19:03:55', '2024-12-01 19:03:55'),
(165, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":24}', NULL, '2024-12-01 19:03:55', '2024-12-01 19:03:55'),
(166, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":23.67}', NULL, '2024-12-01 19:04:26', '2024-12-01 19:04:26'),
(167, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":23.67}', NULL, '2024-12-01 19:04:26', '2024-12-01 19:04:26'),
(168, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Pump triggered due to low soil moisture\",\"relay\":\"Relay 1\",\"temperature\":0,\"humidity\":0,\"soil_moisture\":23.67}', NULL, '2024-12-01 19:04:26', '2024-12-01 19:04:26'),
(169, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43,\"humidity\":40.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:04:45', '2024-12-01 19:04:45'),
(170, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43,\"humidity\":40.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:04:45', '2024-12-01 19:04:45'),
(171, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43,\"humidity\":40.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:04:45', '2024-12-01 19:04:45'),
(172, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43,\"humidity\":40.8,\"soil_moisture\":0}', NULL, '2024-12-01 19:05:10', '2024-12-01 19:05:10'),
(173, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43,\"humidity\":40.8,\"soil_moisture\":0}', NULL, '2024-12-01 19:05:10', '2024-12-01 19:05:10'),
(174, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43,\"humidity\":40.8,\"soil_moisture\":0}', NULL, '2024-12-01 19:05:10', '2024-12-01 19:05:10'),
(175, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":40.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:05:41', '2024-12-01 19:05:41'),
(176, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":40.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:05:41', '2024-12-01 19:05:41'),
(177, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":40.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:05:41', '2024-12-01 19:05:41');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
(178, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.2,\"humidity\":41.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:06:11', '2024-12-01 19:06:11'),
(179, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.2,\"humidity\":41.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:06:11', '2024-12-01 19:06:11'),
(180, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.2,\"humidity\":41.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:06:11', '2024-12-01 19:06:11'),
(181, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.5,\"humidity\":41.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:06:42', '2024-12-01 19:06:42'),
(182, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.5,\"humidity\":41.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:06:42', '2024-12-01 19:06:42'),
(183, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.5,\"humidity\":41.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:06:42', '2024-12-01 19:06:42'),
(184, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.5,\"humidity\":40.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:07:13', '2024-12-01 19:07:13'),
(185, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.5,\"humidity\":40.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:07:13', '2024-12-01 19:07:13'),
(186, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.5,\"humidity\":40.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:07:13', '2024-12-01 19:07:13'),
(187, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.4,\"humidity\":40.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:07:46', '2024-12-01 19:07:46'),
(188, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.4,\"humidity\":40.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:07:46', '2024-12-01 19:07:46'),
(189, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.4,\"humidity\":40.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:07:46', '2024-12-01 19:07:46'),
(190, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.6,\"humidity\":40,\"soil_moisture\":0}', NULL, '2024-12-01 19:08:14', '2024-12-01 19:08:14'),
(191, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.6,\"humidity\":40,\"soil_moisture\":0}', NULL, '2024-12-01 19:08:14', '2024-12-01 19:08:14'),
(192, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.6,\"humidity\":40,\"soil_moisture\":0}', NULL, '2024-12-01 19:08:14', '2024-12-01 19:08:14'),
(193, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.8,\"humidity\":39.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:08:45', '2024-12-01 19:08:45'),
(194, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.8,\"humidity\":39.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:08:45', '2024-12-01 19:08:45'),
(195, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.8,\"humidity\":39.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:08:45', '2024-12-01 19:08:45'),
(196, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.7,\"humidity\":39.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:09:15', '2024-12-01 19:09:15'),
(197, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.7,\"humidity\":39.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:09:15', '2024-12-01 19:09:15'),
(198, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.7,\"humidity\":39.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:09:15', '2024-12-01 19:09:15'),
(199, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.9,\"humidity\":39.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:09:46', '2024-12-01 19:09:46'),
(200, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.9,\"humidity\":39.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:09:46', '2024-12-01 19:09:46'),
(201, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.9,\"humidity\":39.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:09:46', '2024-12-01 19:09:46'),
(202, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.9,\"humidity\":39,\"soil_moisture\":0}', NULL, '2024-12-01 19:10:16', '2024-12-01 19:10:16'),
(203, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.9,\"humidity\":39,\"soil_moisture\":0}', NULL, '2024-12-01 19:10:16', '2024-12-01 19:10:16'),
(204, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.9,\"humidity\":39,\"soil_moisture\":0}', NULL, '2024-12-01 19:10:16', '2024-12-01 19:10:16'),
(205, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44,\"humidity\":40.8,\"soil_moisture\":0}', NULL, '2024-12-01 19:10:47', '2024-12-01 19:10:47'),
(206, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44,\"humidity\":40.8,\"soil_moisture\":0}', NULL, '2024-12-01 19:10:47', '2024-12-01 19:10:47'),
(207, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44,\"humidity\":40.8,\"soil_moisture\":0}', NULL, '2024-12-01 19:10:47', '2024-12-01 19:10:47'),
(208, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.1,\"humidity\":41.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:11:17', '2024-12-01 19:11:17'),
(209, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.1,\"humidity\":41.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:11:17', '2024-12-01 19:11:17'),
(210, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.1,\"humidity\":41.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:11:17', '2024-12-01 19:11:17'),
(211, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.3,\"humidity\":40,\"soil_moisture\":0}', NULL, '2024-12-01 19:11:48', '2024-12-01 19:11:48'),
(212, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.3,\"humidity\":40,\"soil_moisture\":0}', NULL, '2024-12-01 19:11:48', '2024-12-01 19:11:48'),
(213, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.3,\"humidity\":40,\"soil_moisture\":0}', NULL, '2024-12-01 19:11:48', '2024-12-01 19:11:48'),
(214, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.4,\"humidity\":39.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:12:18', '2024-12-01 19:12:18'),
(215, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.4,\"humidity\":39.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:12:18', '2024-12-01 19:12:18'),
(216, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.4,\"humidity\":39.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:12:18', '2024-12-01 19:12:18'),
(217, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.4,\"humidity\":39.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:12:49', '2024-12-01 19:12:49'),
(218, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.4,\"humidity\":39.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:12:49', '2024-12-01 19:12:49'),
(219, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.4,\"humidity\":39.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:12:49', '2024-12-01 19:12:49'),
(220, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.5,\"humidity\":39.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:13:19', '2024-12-01 19:13:19'),
(221, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.5,\"humidity\":39.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:13:19', '2024-12-01 19:13:19'),
(222, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.5,\"humidity\":39.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:13:19', '2024-12-01 19:13:19'),
(223, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.4,\"humidity\":37.2,\"soil_moisture\":0}', NULL, '2024-12-01 19:13:50', '2024-12-01 19:13:50'),
(224, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.4,\"humidity\":37.2,\"soil_moisture\":0}', NULL, '2024-12-01 19:13:50', '2024-12-01 19:13:50'),
(225, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.4,\"humidity\":37.2,\"soil_moisture\":0}', NULL, '2024-12-01 19:13:50', '2024-12-01 19:13:50'),
(226, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.3,\"humidity\":37.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:14:21', '2024-12-01 19:14:21'),
(227, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.3,\"humidity\":37.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:14:21', '2024-12-01 19:14:21'),
(228, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.3,\"humidity\":37.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:14:21', '2024-12-01 19:14:21'),
(229, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.3,\"humidity\":37.8,\"soil_moisture\":0}', NULL, '2024-12-01 19:14:52', '2024-12-01 19:14:52'),
(230, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.3,\"humidity\":37.8,\"soil_moisture\":0}', NULL, '2024-12-01 19:14:52', '2024-12-01 19:14:52'),
(231, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.3,\"humidity\":37.8,\"soil_moisture\":0}', NULL, '2024-12-01 19:14:52', '2024-12-01 19:14:52'),
(232, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":40,\"soil_moisture\":0}', NULL, '2024-12-01 19:15:23', '2024-12-01 19:15:23'),
(233, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":40,\"soil_moisture\":0}', NULL, '2024-12-01 19:15:23', '2024-12-01 19:15:23'),
(234, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":40,\"soil_moisture\":0}', NULL, '2024-12-01 19:15:23', '2024-12-01 19:15:23'),
(235, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.5,\"humidity\":42.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:15:52', '2024-12-01 19:15:52'),
(236, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.5,\"humidity\":42.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:15:52', '2024-12-01 19:15:52'),
(237, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.5,\"humidity\":42.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:15:52', '2024-12-01 19:15:52'),
(238, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.2,\"humidity\":41.2,\"soil_moisture\":0}', NULL, '2024-12-01 19:16:23', '2024-12-01 19:16:23'),
(239, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.2,\"humidity\":41.2,\"soil_moisture\":0}', NULL, '2024-12-01 19:16:23', '2024-12-01 19:16:23'),
(240, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.2,\"humidity\":41.2,\"soil_moisture\":0}', NULL, '2024-12-01 19:16:23', '2024-12-01 19:16:23'),
(241, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.3,\"humidity\":41.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:16:53', '2024-12-01 19:16:53'),
(242, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.3,\"humidity\":41.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:16:53', '2024-12-01 19:16:53'),
(243, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.3,\"humidity\":41.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:16:53', '2024-12-01 19:16:53'),
(244, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.3,\"humidity\":41.8,\"soil_moisture\":0}', NULL, '2024-12-01 19:17:24', '2024-12-01 19:17:24'),
(245, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.3,\"humidity\":41.8,\"soil_moisture\":0}', NULL, '2024-12-01 19:17:24', '2024-12-01 19:17:24'),
(246, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.3,\"humidity\":41.8,\"soil_moisture\":0}', NULL, '2024-12-01 19:17:24', '2024-12-01 19:17:24'),
(247, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.5,\"humidity\":41.6,\"soil_moisture\":0}', NULL, '2024-12-01 19:17:54', '2024-12-01 19:17:54'),
(248, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.5,\"humidity\":41.6,\"soil_moisture\":0}', NULL, '2024-12-01 19:17:54', '2024-12-01 19:17:54'),
(249, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.5,\"humidity\":41.6,\"soil_moisture\":0}', NULL, '2024-12-01 19:17:54', '2024-12-01 19:17:54'),
(250, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.9,\"humidity\":42.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:18:25', '2024-12-01 19:18:25'),
(251, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.9,\"humidity\":42.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:18:25', '2024-12-01 19:18:25'),
(252, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.9,\"humidity\":42.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:18:25', '2024-12-01 19:18:25'),
(253, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.8,\"humidity\":42.9,\"soil_moisture\":0}', NULL, '2024-12-01 19:18:56', '2024-12-01 19:18:56'),
(254, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.8,\"humidity\":42.9,\"soil_moisture\":0}', NULL, '2024-12-01 19:18:56', '2024-12-01 19:18:56'),
(255, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.8,\"humidity\":42.9,\"soil_moisture\":0}', NULL, '2024-12-01 19:18:56', '2024-12-01 19:18:56'),
(256, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.2,\"humidity\":40.1,\"soil_moisture\":0}', NULL, '2024-12-01 19:19:26', '2024-12-01 19:19:26'),
(257, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.2,\"humidity\":40.1,\"soil_moisture\":0}', NULL, '2024-12-01 19:19:26', '2024-12-01 19:19:26'),
(258, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.2,\"humidity\":40.1,\"soil_moisture\":0}', NULL, '2024-12-01 19:19:26', '2024-12-01 19:19:26'),
(259, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.4,\"humidity\":38,\"soil_moisture\":0}', NULL, '2024-12-01 19:20:27', '2024-12-01 19:20:27'),
(260, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.4,\"humidity\":38,\"soil_moisture\":0}', NULL, '2024-12-01 19:20:27', '2024-12-01 19:20:27'),
(261, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.4,\"humidity\":38,\"soil_moisture\":0}', NULL, '2024-12-01 19:20:27', '2024-12-01 19:20:27'),
(262, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":39.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:20:58', '2024-12-01 19:20:58'),
(263, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":39.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:20:58', '2024-12-01 19:20:58'),
(264, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":39.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:20:58', '2024-12-01 19:20:58'),
(265, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":40.1,\"soil_moisture\":0}', NULL, '2024-12-01 19:21:28', '2024-12-01 19:21:28'),
(266, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":40.1,\"soil_moisture\":0}', NULL, '2024-12-01 19:21:28', '2024-12-01 19:21:28'),
(267, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.1,\"humidity\":40.1,\"soil_moisture\":0}', NULL, '2024-12-01 19:21:28', '2024-12-01 19:21:28'),
(268, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.7,\"humidity\":41.1,\"soil_moisture\":0}', NULL, '2024-12-01 19:21:59', '2024-12-01 19:21:59'),
(269, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.7,\"humidity\":41.1,\"soil_moisture\":0}', NULL, '2024-12-01 19:21:59', '2024-12-01 19:21:59'),
(270, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.7,\"humidity\":41.1,\"soil_moisture\":0}', NULL, '2024-12-01 19:21:59', '2024-12-01 19:21:59'),
(271, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.7,\"humidity\":43,\"soil_moisture\":0}', NULL, '2024-12-01 19:22:29', '2024-12-01 19:22:29'),
(272, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.7,\"humidity\":43,\"soil_moisture\":0}', NULL, '2024-12-01 19:22:29', '2024-12-01 19:22:29'),
(273, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":42.7,\"humidity\":43,\"soil_moisture\":0}', NULL, '2024-12-01 19:22:29', '2024-12-01 19:22:29'),
(274, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43,\"humidity\":43.5,\"soil_moisture\":0}', NULL, '2024-12-01 19:23:00', '2024-12-01 19:23:00'),
(275, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43,\"humidity\":43.5,\"soil_moisture\":0}', NULL, '2024-12-01 19:23:00', '2024-12-01 19:23:00'),
(276, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43,\"humidity\":43.5,\"soil_moisture\":0}', NULL, '2024-12-01 19:23:00', '2024-12-01 19:23:00'),
(277, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.3,\"humidity\":42.6,\"soil_moisture\":0}', NULL, '2024-12-01 19:23:31', '2024-12-01 19:23:31'),
(278, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.3,\"humidity\":42.6,\"soil_moisture\":0}', NULL, '2024-12-01 19:23:31', '2024-12-01 19:23:31'),
(279, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.3,\"humidity\":42.6,\"soil_moisture\":0}', NULL, '2024-12-01 19:23:31', '2024-12-01 19:23:31'),
(280, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.9,\"humidity\":39,\"soil_moisture\":0}', NULL, '2024-12-01 19:24:01', '2024-12-01 19:24:01'),
(281, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.9,\"humidity\":39,\"soil_moisture\":0}', NULL, '2024-12-01 19:24:01', '2024-12-01 19:24:01'),
(282, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":43.9,\"humidity\":39,\"soil_moisture\":0}', NULL, '2024-12-01 19:24:01', '2024-12-01 19:24:01'),
(283, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44,\"humidity\":40.9,\"soil_moisture\":0}', NULL, '2024-12-01 19:24:31', '2024-12-01 19:24:31'),
(284, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44,\"humidity\":40.9,\"soil_moisture\":0}', NULL, '2024-12-01 19:24:31', '2024-12-01 19:24:31'),
(285, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44,\"humidity\":40.9,\"soil_moisture\":0}', NULL, '2024-12-01 19:24:31', '2024-12-01 19:24:31'),
(286, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.1,\"humidity\":38.5,\"soil_moisture\":0}', NULL, '2024-12-01 19:25:02', '2024-12-01 19:25:02'),
(287, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.1,\"humidity\":38.5,\"soil_moisture\":0}', NULL, '2024-12-01 19:25:02', '2024-12-01 19:25:02'),
(288, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.1,\"humidity\":38.5,\"soil_moisture\":0}', NULL, '2024-12-01 19:25:02', '2024-12-01 19:25:02'),
(289, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.2,\"humidity\":38.2,\"soil_moisture\":0}', NULL, '2024-12-01 19:25:33', '2024-12-01 19:25:33'),
(290, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.2,\"humidity\":38.2,\"soil_moisture\":0}', NULL, '2024-12-01 19:25:33', '2024-12-01 19:25:33'),
(291, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.2,\"humidity\":38.2,\"soil_moisture\":0}', NULL, '2024-12-01 19:25:33', '2024-12-01 19:25:33'),
(292, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.2,\"humidity\":39,\"soil_moisture\":0}', NULL, '2024-12-01 19:26:03', '2024-12-01 19:26:03'),
(293, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.2,\"humidity\":39,\"soil_moisture\":0}', NULL, '2024-12-01 19:26:03', '2024-12-01 19:26:03'),
(294, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.2,\"humidity\":39,\"soil_moisture\":0}', NULL, '2024-12-01 19:26:03', '2024-12-01 19:26:03'),
(295, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.3,\"humidity\":40.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:26:33', '2024-12-01 19:26:33'),
(296, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.3,\"humidity\":40.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:26:33', '2024-12-01 19:26:33'),
(297, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.3,\"humidity\":40.3,\"soil_moisture\":0}', NULL, '2024-12-01 19:26:33', '2024-12-01 19:26:33'),
(298, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.2,\"humidity\":38.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:27:03', '2024-12-01 19:27:03'),
(299, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.2,\"humidity\":38.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:27:03', '2024-12-01 19:27:03'),
(300, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.2,\"humidity\":38.4,\"soil_moisture\":0}', NULL, '2024-12-01 19:27:03', '2024-12-01 19:27:03'),
(301, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.4,\"humidity\":38.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:27:34', '2024-12-01 19:27:34'),
(302, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.4,\"humidity\":38.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:27:34', '2024-12-01 19:27:34'),
(303, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.4,\"humidity\":38.7,\"soil_moisture\":0}', NULL, '2024-12-01 19:27:34', '2024-12-01 19:27:34'),
(304, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.5,\"humidity\":39.6,\"soil_moisture\":0}', NULL, '2024-12-01 19:28:04', '2024-12-01 19:28:04'),
(305, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.5,\"humidity\":39.6,\"soil_moisture\":0}', NULL, '2024-12-01 19:28:04', '2024-12-01 19:28:04'),
(306, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.5,\"humidity\":39.6,\"soil_moisture\":0}', NULL, '2024-12-01 19:28:04', '2024-12-01 19:28:04'),
(307, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.7,\"humidity\":38.8,\"soil_moisture\":0}', NULL, '2024-12-01 19:28:35', '2024-12-01 19:28:35'),
(308, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.7,\"humidity\":38.8,\"soil_moisture\":0}', NULL, '2024-12-01 19:28:35', '2024-12-01 19:28:35'),
(309, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.7,\"humidity\":38.8,\"soil_moisture\":0}', NULL, '2024-12-01 19:28:35', '2024-12-01 19:28:35'),
(310, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.9,\"humidity\":37.1,\"soil_moisture\":0}', NULL, '2024-12-01 19:29:07', '2024-12-01 19:29:07'),
(311, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.9,\"humidity\":37.1,\"soil_moisture\":0}', NULL, '2024-12-01 19:29:07', '2024-12-01 19:29:07'),
(312, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.9,\"humidity\":37.1,\"soil_moisture\":0}', NULL, '2024-12-01 19:29:07', '2024-12-01 19:29:07'),
(313, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.8,\"humidity\":37.2,\"soil_moisture\":0}', NULL, '2024-12-01 19:29:37', '2024-12-01 19:29:37'),
(314, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.8,\"humidity\":37.2,\"soil_moisture\":0}', NULL, '2024-12-01 19:29:37', '2024-12-01 19:29:37'),
(315, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.8,\"humidity\":37.2,\"soil_moisture\":0}', NULL, '2024-12-01 19:29:37', '2024-12-01 19:29:37'),
(316, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 4, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.5,\"humidity\":36.9,\"soil_moisture\":0}', NULL, '2024-12-01 19:30:08', '2024-12-01 19:30:08'),
(317, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 7, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.5,\"humidity\":36.9,\"soil_moisture\":0}', NULL, '2024-12-01 19:30:08', '2024-12-01 19:30:08'),
(318, 'App\\Notifications\\RelayTriggeredNotification', 'App\\Models\\User', 10, '{\"message\":\"Fogger triggered due to high temperature and low humidity\",\"relay\":\"Relay 2\",\"temperature\":44.5,\"humidity\":36.9,\"soil_moisture\":0}', NULL, '2024-12-01 19:30:08', '2024-12-01 19:30:08');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('admin@admin.com', '$2y$10$Amw/FpgYAVsbEz9mTFwFS.XS7XjMaSWbexcWHHi8swiWDN0vg80fS', '2024-10-22 22:47:29');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'admin', 'admin', 'admin@gmail.com', NULL, '$2y$10$qj.HUDAvbbNTQA8JzYVOD.NeoYPWko73esq6pSzVX6StIlIKwWg/K', NULL, '2024-10-25 19:05:36', '2024-11-28 04:51:59'),
(7, 'user', 'user', 'user@gmail.com', NULL, '$2y$10$VnUaUIrhSpyPH6nzL4XYp.fNmNw6zdQ0JMsEh2aTQ03izNGfychSK', NULL, '2024-10-26 03:57:58', '2024-11-28 05:03:46'),
(10, 'user', 'Alpha', 'alpha@gmail.com', NULL, '$2y$10$AXLm5Oc0I.l7BPjCzunLD.8OIuXrSrcWJYDZ4VP053VOUclTE.r8q', NULL, '2024-12-01 04:11:42', '2024-12-01 04:11:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `environment_data`
--
ALTER TABLE `environment_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `environment_data`
--
ALTER TABLE `environment_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
