-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 26, 2024 at 02:08 AM
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
  `soil_moisture` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `environment_data`
--

INSERT INTO `environment_data` (`id`, `temperature`, `humidity`, `soil_moisture`, `created_at`, `updated_at`) VALUES
(3, 28.00, 59.60, 13.00, '2024-10-24 19:29:57', '2024-10-24 19:29:57'),
(4, 27.80, 60.80, 9.00, '2024-10-24 19:30:08', '2024-10-24 19:30:08'),
(5, 27.70, 60.70, 9.00, '2024-10-24 19:30:19', '2024-10-24 19:30:19'),
(6, 27.70, 60.10, 9.00, '2024-10-24 19:30:31', '2024-10-24 19:30:31'),
(7, 27.80, 59.50, 9.00, '2024-10-24 19:30:43', '2024-10-24 19:30:43'),
(8, 27.70, 60.00, 9.00, '2024-10-24 19:30:54', '2024-10-24 19:30:54'),
(9, 27.70, 60.00, 9.00, '2024-10-24 19:31:06', '2024-10-24 19:31:06'),
(10, 27.60, 59.70, 8.00, '2024-10-24 19:31:16', '2024-10-24 19:31:16'),
(11, 27.70, 59.50, 9.00, '2024-10-24 19:31:28', '2024-10-24 19:31:28'),
(12, 27.60, 60.30, 9.00, '2024-10-24 19:31:40', '2024-10-24 19:31:40'),
(13, 27.60, 59.90, 8.00, '2024-10-24 19:31:51', '2024-10-24 19:31:51'),
(14, 27.50, 60.20, 8.00, '2024-10-24 19:32:03', '2024-10-24 19:32:03'),
(15, 27.60, 60.40, 8.00, '2024-10-24 19:32:15', '2024-10-24 19:32:15'),
(16, 27.50, 60.10, 8.00, '2024-10-24 19:32:26', '2024-10-24 19:32:26'),
(17, 27.50, 60.80, 8.00, '2024-10-24 19:32:37', '2024-10-24 19:32:37'),
(18, 27.60, 60.60, 8.00, '2024-10-24 19:32:49', '2024-10-24 19:32:49'),
(19, 27.50, 60.30, 8.00, '2024-10-24 19:33:01', '2024-10-24 19:33:01'),
(20, 27.50, 59.90, 8.00, '2024-10-24 19:33:11', '2024-10-24 19:33:11'),
(21, 27.40, 59.40, 7.00, '2024-10-24 19:33:22', '2024-10-24 19:33:22'),
(22, 27.40, 59.50, 8.00, '2024-10-24 19:33:33', '2024-10-24 19:33:33'),
(23, 27.40, 59.90, 8.00, '2024-10-24 19:33:44', '2024-10-24 19:33:44'),
(24, 27.40, 59.30, 12.00, '2024-10-24 19:34:11', '2024-10-24 19:34:11'),
(25, 27.20, 60.00, 9.00, '2024-10-24 19:35:03', '2024-10-24 19:35:03'),
(26, 27.10, 60.20, 8.00, '2024-10-24 19:35:54', '2024-10-24 19:35:54'),
(27, 27.10, 61.10, 8.00, '2024-10-24 19:36:46', '2024-10-24 19:36:46'),
(28, 27.20, 60.80, 18.00, '2024-10-24 19:37:37', '2024-10-24 19:37:37'),
(29, 27.20, 63.90, 9.00, '2024-10-24 19:38:28', '2024-10-24 19:38:28'),
(30, 27.20, 60.00, 9.00, '2024-10-24 19:39:19', '2024-10-24 19:39:19'),
(31, 27.20, 59.90, 9.00, '2024-10-24 19:40:11', '2024-10-24 19:40:11'),
(32, 27.20, 60.20, 9.00, '2024-10-24 19:41:02', '2024-10-24 19:41:02'),
(33, 27.10, 60.00, 9.00, '2024-10-24 19:41:53', '2024-10-24 19:41:53'),
(34, 27.00, 59.70, 9.00, '2024-10-24 19:42:45', '2024-10-24 19:42:45'),
(35, 26.90, 60.40, 9.00, '2024-10-24 19:43:36', '2024-10-24 19:43:36'),
(36, 26.90, 60.40, 9.00, '2024-10-24 19:44:28', '2024-10-24 19:44:28'),
(37, 27.20, 64.60, 7.00, '2024-10-24 20:20:56', '2024-10-24 20:20:56'),
(38, 27.20, 64.60, 7.00, '2024-10-24 20:21:48', '2024-10-24 20:21:48'),
(39, 27.20, 64.30, 7.00, '2024-10-24 20:22:39', '2024-10-24 20:22:39'),
(40, 27.20, 63.70, 17.00, '2024-10-24 20:23:10', '2024-10-24 20:23:10'),
(41, 27.10, 65.20, 7.00, '2024-10-24 20:24:01', '2024-10-24 20:24:01'),
(42, 27.20, 64.50, 7.00, '2024-10-24 20:24:53', '2024-10-24 20:24:53'),
(43, 27.10, 64.40, 18.00, '2024-10-24 20:25:58', '2024-10-24 20:25:58'),
(44, 27.10, 63.80, 7.00, '2024-10-24 20:27:00', '2024-10-24 20:27:00'),
(45, 26.90, 63.70, 6.00, '2024-10-24 20:28:05', '2024-10-24 20:28:05'),
(46, 26.70, 63.90, 6.00, '2024-10-24 20:29:06', '2024-10-24 20:29:06'),
(47, 26.60, 64.40, 6.00, '2024-10-24 20:30:08', '2024-10-24 20:30:08'),
(48, 26.60, 64.40, 6.00, '2024-10-24 20:31:09', '2024-10-24 20:31:09'),
(49, 26.40, 65.00, 6.00, '2024-10-24 20:36:39', '2024-10-24 20:36:39'),
(50, 26.40, 65.40, 6.00, '2024-10-24 20:37:40', '2024-10-24 20:37:40'),
(51, 26.40, 65.00, 6.00, '2024-10-24 20:38:43', '2024-10-24 20:38:43'),
(52, 26.40, 64.70, 6.00, '2024-10-24 20:39:46', '2024-10-24 20:39:46'),
(53, 26.40, 64.80, 6.00, '2024-10-24 20:40:48', '2024-10-24 20:40:48'),
(54, 26.40, 64.90, 6.00, '2024-10-24 20:41:50', '2024-10-24 20:41:50');

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
(11, '2024_10_05_070811_create_environment_data_table', 4);

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

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'admin', 'admin@admin.com', NULL, '$2y$10$WTJRIQzN2NDTm5P2APek7ej2Jf0SSZj0Ce9NwSoqxlsNz.kR0Blfi', NULL, '2024-10-24 20:06:23', '2024-10-24 20:06:23');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
