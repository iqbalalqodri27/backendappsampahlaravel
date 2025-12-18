-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for sampah
CREATE DATABASE IF NOT EXISTS `sampah` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sampah`;

-- Dumping structure for table sampah.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sampah.cache: ~0 rows (approximately)

-- Dumping structure for table sampah.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sampah.cache_locks: ~0 rows (approximately)

-- Dumping structure for table sampah.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sampah.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table sampah.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sampah.jobs: ~0 rows (approximately)

-- Dumping structure for table sampah.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sampah.job_batches: ~0 rows (approximately)

-- Dumping structure for table sampah.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sampah.migrations: ~5 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2025_12_09_170151_create_sampah_table', 1),
	(5, '2025_12_09_172119_create_personal_access_tokens_table', 2);

-- Dumping structure for table sampah.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sampah.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table sampah.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sampah.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table sampah.sampahs
CREATE TABLE IF NOT EXISTS `sampahs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `nis` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelas` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_sampah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waktu` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sampah_user_id_foreign` (`user_id`),
  CONSTRAINT `sampah_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sampah.sampahs: ~8 rows (approximately)
INSERT INTO `sampahs` (`id`, `user_id`, `nis`, `nama`, `kelas`, `kategori`, `nama_sampah`, `foto`, `waktu`, `created_at`, `updated_at`) VALUES
	(20, 18, '12345', 'bucin', 'xrpl2', 'botol', 'boto florida', '1765579454.jpg', '2025-12-12 22:44:13', '2025-12-12 15:44:14', '2025-12-12 15:44:14'),
	(21, 18, '3333', 'test', 'test', 'botol', 'botol aqua', '1765579919.jpg', '2025-12-12 22:51:58', '2025-12-12 15:51:59', '2025-12-12 15:51:59'),
	(23, 19, '2', 'azmi', 'x tbsm', 'Sampah Taman', 'paku berkarat', '1765660295.jpg', '2025-12-13 21:11:34', '2025-12-13 14:11:35', '2025-12-13 14:11:35'),
	(24, 19, '2', 'azmi', 'x tbsm', 'Logam', 'logam mulia', '1765660512.jpg', '2025-12-13 21:15:12', '2025-12-13 14:15:12', '2025-12-13 14:15:12'),
	(25, 19, '3', 'azmi', 'x tbsm', 'Karet dan Kulit', 'karet ban', '1765660544.jpg', '2025-12-13 21:15:44', '2025-12-13 14:15:44', '2025-12-13 14:15:44'),
	(26, 9, '1', 'test', 'x tki', 'Plastik - Lembaran', 'bungkus kapal api', '1765661435.jpg', '2025-12-13 21:30:35', '2025-12-13 14:30:35', '2025-12-13 14:30:35'),
	(27, 9, '1', 'test', 'x tkj', 'Sampah B3', 'obat mag', '1765665604.jpg', '2025-12-13 22:39:59', '2025-12-13 15:40:04', '2025-12-13 15:40:04'),
	(29, 20, '2', 'iqbal', 'x rpl', 'Sampah Taman', 'pelaatik makanan', '1765666859.jpg', '2025-12-13 23:00:59', '2025-12-13 16:00:59', '2025-12-13 16:00:59'),
	(30, 20, '3', 'gufron', 'x rpl', 'Sampah Makanan', 'nasi bungkus', '1765667181.jpg', '2025-12-13 23:06:21', '2025-12-13 16:06:21', '2025-12-13 16:06:21'),
	(31, 20, '2', 'iqbal', 'xrpl', 'Kaca', 'kaca kelas peca', '1765667218.jpg', '2025-12-13 23:06:58', '2025-12-13 16:06:58', '2025-12-13 16:06:58');

-- Dumping structure for table sampah.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sampah.sessions: ~4 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('A43nstoJCItZ28u1KTRJJUfGavN9aEMEPYb2vZjf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWdYV1JJWDFkcHVYdU84bUhKR0tOSXpsNkxjdk5YZTNJcVc2VkwzTCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1765300546),
	('mfksUqvKobj4LhPWlIjb2NtbxghAH7ew348hoJV8', NULL, '192.168.193.146', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzVpT1VWU2lxZWM3c2RrT3YyUDVuV1pMeG9FaThwdlVXaXJFenp4ZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xOTIuMTY4LjE5My4xNDY6NzAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1765657928),
	('NecGdYpK0qaUaBDY6tGyLp5WShB2E3A72pvkFm3H', NULL, '192.168.54.146', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibk9FelN3VXk5bjVoOTRXczhRN0VGcnRKd3d6WWhWNmk0YTdNeUdVcSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjU0LjE0Njo4MDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765303012),
	('SoCbaPe6CzWykTIF9aKYFiYUq8eAks1jJXUA6v3a', NULL, '192.168.54.146', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTVBSWlmWHI0OHI4U3BDbG41TVhSaUlsSGQ3a0hGSDRrN1piWk1RWiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly8xOTIuMTY4LjU0LjE0Njo4MDAwIjtzOjU6InJvdXRlIjtOO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1765312059),
	('T7caoQw7HiLSW1pHuRCRiqdQ2eE1W1ArMFCD96mG', NULL, '192.168.193.146', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEo3b1N5dHZEQm14ZXZLcEdnR2NBZEg4YTNYTXMxMmR4UDJ6Vm4wVSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xOTIuMTY4LjE5My4xNDY6NzAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1765565534),
	('XUpAJsm2uaLTCR6w7VaCLz60G1qySxVv8PHZ4uYD', NULL, '192.168.193.146', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGdHT01HZVBLQWxsNnJvNFBBVnlGSzdFYWxNRmNHQTh0S3ZYVnczNSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xOTIuMTY4LjE5My4xNDY6ODAwMCI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1765554203);

-- Dumping structure for table sampah.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table sampah.users: ~14 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'iqbal', 'iqbalal@gmail.com', NULL, '$2y$12$vUL4k0tDlOfZgeaSjXfKoexl1e9BO3cnaZa0TC.ekRLg47WjkMTaa', NULL, '2025-12-09 10:56:56', '2025-12-09 10:56:56'),
	(4, 'bale', 'bale@gmail.com', NULL, '$2y$12$0/KeNhalycr4P2TTqSiFxu5j4VV1tuYrI8/w5AV/df1cWvZkBYg0m', NULL, '2025-12-09 10:58:48', '2025-12-09 10:58:48'),
	(6, 'bale2', 'bale2@gmail.com', NULL, '$2y$12$JMU6pccMVeXOXdpMTWDPl.xZ1gBAH2fT/4BzxEpEeJa2/4jjI2ziG', NULL, '2025-12-09 10:59:45', '2025-12-09 10:59:45'),
	(7, 'yayu', 'yayu@gmail.com', NULL, '$2y$12$BOxwD53P0tcjyQB/tGFHw.B/JdqVj1tcGG1NaQL52kP8c4JB1jhxG', NULL, '2025-12-09 11:07:41', '2025-12-09 11:07:41'),
	(8, 'maryani', 'maryani@gmail.com', NULL, '$2y$12$kTkCqyHKo/6icjkZkTqSxeJd.Gb7Ep6RZ88atf2Uw/P1p8FyAoEAe', NULL, '2025-12-09 11:08:56', '2025-12-09 11:08:56'),
	(9, 'test', 'test@gmail.com', NULL, '$2y$12$wCee9EQ1Ct2b3pmUDiJ4FuQVI6.LchchlDkQKRbQ63UYSRtDPIXUO', NULL, '2025-12-09 11:12:33', '2025-12-09 11:12:33'),
	(10, 'test2', 'test2@gmail.com', NULL, '$2y$12$oEmt5CEgQPi7WO9ReImveOXQKlHcREQNCt/dt6FaBwuFIhixdQHs2', NULL, '2025-12-09 11:16:54', '2025-12-09 11:16:54'),
	(11, 'gugah', 'gugah@gmail.com', NULL, '$2y$12$7mR2s4B/G4ud3EpB2HTTTe0yzVVuP1b2KLD45cPjSuBFFTEqvKay.', NULL, '2025-12-09 11:29:26', '2025-12-09 11:29:26'),
	(12, 'bubu', 'bubu@gmai.com', NULL, '$2y$12$83yn9hia.TVTfEtRx8a2muiCFucqi3NFjPxahehtjVE3hKexUq7Sy', NULL, '2025-12-09 12:17:52', '2025-12-09 12:17:52'),
	(13, 'iqbalalqodri', 'ba@gmail.com', NULL, '$2y$12$GAa9ETBrUWE/0Pz0Hx51keV1ONGsfwkzDK6mS6DQ4gy.n1b3aGHEO', NULL, '2025-12-09 12:40:43', '2025-12-09 12:40:43'),
	(14, 'al', 'al@gmail.com', NULL, '$2y$12$BtLowyY62/S0AXxE8.HIV.Crq/Xj4B.fq3jm892j33O4T77TC1IPi', NULL, '2025-12-11 09:01:26', '2025-12-11 09:01:26'),
	(15, 'juki', 'juki@gmail.com', NULL, '$2y$12$U7bnNbf6ekDegPmP97pV6ejsccU.7MdT8f7D6sc2eUJ.wxBbySwfK', NULL, '2025-12-12 09:09:43', '2025-12-12 09:09:43'),
	(16, 'bb', 'bb@gmail.com', NULL, '$2y$12$ZyrZxb28xRxuNFZ83Svpp.lyib8hwXrH/aHoPQtNHh4RB2wrcwdMu', NULL, '2025-12-12 09:17:37', '2025-12-12 09:17:37'),
	(17, 'gg', 'gg@gmail.com', NULL, '$2y$12$VMIVPYFfa1dn9sYnYwuhOukfiy5j2MwwJiFJ4ZLZROppaTYLy9FSe', NULL, '2025-12-12 09:40:01', '2025-12-12 09:40:01'),
	(18, 'bucin', 'bucin@gmail.com', NULL, '$2y$12$PwU5J66SoG1L9..g1FK2oe8KTRv.eJg1GA11NsbXU4C0R3UcXf6pe', NULL, '2025-12-12 15:42:55', '2025-12-12 15:42:55'),
	(19, 'azmi', 'azmi@gmail.com', NULL, '$2y$12$ZV2oDsNUbaMm0Xn4cqMq3OdjhI.kz99EkyUegN.H/0u2ECy5KYepG', NULL, '2025-12-13 14:04:30', '2025-12-13 14:04:30'),
	(20, 'iqbalalqodri', 'iqbalalqodri@gmail.com', NULL, '$2y$12$2R0Sk2h4QFNhAPhWrbxCz.ntnwvDkWBcj7pyjLIi8.fe1m9npMs62', NULL, '2025-12-13 16:00:22', '2025-12-13 16:00:22');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
