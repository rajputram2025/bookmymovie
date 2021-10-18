-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 18, 2021 at 05:35 PM
-- Server version: 5.7.35-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sqaureboat`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `movie_id` varchar(500) NOT NULL,
  `time_slot` varchar(500) NOT NULL,
  `sheet_numbers` varchar(500) DEFAULT NULL,
  `booking_watch_date` varchar(500) NOT NULL,
  `total_amt` varchar(500) NOT NULL,
  `user_id` varchar(500) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `movie_id`, `time_slot`, `sheet_numbers`, `booking_watch_date`, `total_amt`, `user_id`, `created_at`, `updated_at`) VALUES
(1, '1', '09:00:00-12:00:00', '1,2', '2021-10-17', '200', '1', '2021-10-17 14:52:05', NULL),
(2, '1', '09:00:00-12:00:00', '4,8', '2021-10-17', '200', '1', '2021-10-17 14:52:05', NULL),
(3, '1', '09:00:00-12:00:00', '9', '2021-10-17', '100', '1', '2021-10-17 14:52:05', NULL),
(4, '2', '09:00:00-12:00:00', '6160', '2021-10-18', '200', '1', '2021-10-18 02:36:39', '2021-10-18 02:36:39'),
(5, '2', '09:00:00-12:00:00', '54', '2021-10-18', '100', '1', '2021-10-18 03:37:50', '2021-10-18 03:37:50'),
(6, '2', '09:00:00-12:00:00', '63', '2021-10-18', '100', '1', '2021-10-18 03:51:58', '2021-10-18 03:51:58'),
(7, '2', '09:00:00-12:00:00', '52', '2021-10-18', '100', '1', '2021-10-18 03:53:15', '2021-10-18 03:53:15'),
(8, '2', '09:00:00-12:00:00', '14', '2021-10-18', '100', '1', '2021-10-18 03:54:46', '2021-10-18 03:54:46'),
(9, '2', '09:00:00-12:00:00', '20', '2021-10-18', '100', '1', '2021-10-18 03:55:43', '2021-10-18 03:55:43'),
(10, '2', '09:00:00-12:00:00', '49', '2021-10-18', '100', '1', '2021-10-18 04:44:26', '2021-10-18 04:44:26'),
(11, '2', '09:00:00-12:00:00', '30', '2021-10-18', '100', '1', '2021-10-18 04:47:06', '2021-10-18 04:47:06'),
(12, '2', '09:00:00-12:00:00', '23', '2021-10-18', '100', '1', '2021-10-18 04:48:06', '2021-10-18 04:48:06'),
(13, '4', '09:00:00-12:00:00', '47', '2021-10-18', '100', '1', '2021-10-18 04:50:48', '2021-10-18 04:50:48'),
(14, '3', '09:00:00-12:00:00', '21', '2021-10-18', '100', '1', '2021-10-18 04:57:00', '2021-10-18 04:57:00'),
(15, '7', '09:00:00-12:00:00', '29', '2021-10-18', '100', '1', '2021-10-18 05:47:12', '2021-10-18 05:47:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `theatres` varchar(500) NOT NULL,
  `description` varchar(500) NOT NULL,
  `imageUrl` varchar(500) NOT NULL,
  `rating` varchar(500) NOT NULL,
  `price` varchar(500) NOT NULL DEFAULT '100',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `theatres`, `description`, `imageUrl`, `rating`, `price`, `created_at`, `updated_at`) VALUES
(1, 'Kingsglaive', 'GIP Mall Noida', 'King Regis, who oversees the land of Lucis, commands his army of soldiers to protect the kingdom from the Niflheim empire\'s plans to steal the sacred crystal.', '/images/Kingsglaive_Final_Fantasy_XV.jpg', '4.5', '100', '2021-10-16 18:30:00', '2021-10-16 18:30:00'),
(2, 'Final Fantasy', 'GIP Mall Noida', 'A scientist makes a last stand on Earth with the help of a ragtag team of soldiers against an invasion of alien phantoms.', '/images/Final_Fantasy_Spirits_Within.jpg', '5', '100', '2021-10-16 18:30:00', '2021-10-16 18:30:00'),
(3, 'Ghost In The Shell', 'GIP Mall Noida', 'A scientist makes a last stand on Earth with the help of a ragtag team of soldiers against an invasion of alien phantoms.', '/images/Ghost_In_The_Shell_2_0.jpg', '4', '100', '2021-10-16 18:30:00', '2021-10-16 18:30:00'),
(4, 'Appleseed Alpha', 'GIP Mall Noida', 'A young female soldier Deunan and her cyborg partner Briareos survive through the post World War 3 apocalyptic New York in search of human\'s future hope, the legendary city of Olympus.', '/images/Appleseed_Alpha.jpg', '4', '100', '2021-10-16 18:30:00', '2021-10-16 18:30:00'),
(5, 'Resident Evil', 'GIP Mall Noida', 'Chris Redfield enlists the help of Leon S. Kennedy and Rebecca Chambers to stop a death merchant, with a vengeance, from spreading a deadly virus in New York.', '/images/Resident_Evil_Vendetta.jpg', '4.2', '100', '2021-10-16 18:30:00', '2021-10-16 18:30:00'),
(6, 'Kingsglaive', 'Wave Cinema', 'King Regis, who oversees the land of Lucis, commands his army of soldiers to protect the kingdom from the Niflheim empire\'s plans to steal the sacred crystal.', '/images/Kingsglaive_Final_Fantasy_XV.jpg', '4.5', '100', '2021-10-16 18:30:00', '2021-10-16 18:30:00'),
(7, 'Appleseed Alpha', 'Wave Cinema', 'A young female soldier Deunan and her cyborg partner Briareos survive through the post World War 3 apocalyptic New York in search of human\'s future hope, the legendary city of Olympus.', '/images/Appleseed_Alpha.jpg', '4', '100', '2021-10-16 18:30:00', '2021-10-16 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('pratap11191@gmail.com', '$2y$10$c5AevTU.yd4.3JDmpEvDsOyFO4bjVklMf4k/HsA1scuGVTJ37vV3.', '2021-10-16 03:45:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Ram Pratap', 'pratap11191@gmail.com', 'ram@2022', NULL, '2021-10-16 02:22:50', '2021-10-16 02:22:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
