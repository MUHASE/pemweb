-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2024 at 05:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `glowcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(4, 'Cleansers', 'Products for cleaning skin and removing makeup', '2024-06-10 07:45:11', '2024-06-10 07:45:11'),
(5, 'Moisturizers', 'Products to hydrate and protect the skin', '2024-06-10 07:45:11', '2024-06-10 07:45:11'),
(6, 'Serums', 'Concentrated formulas to target specific skin concerns', '2024-06-10 07:45:11', '2024-06-10 07:45:11'),
(7, 'Sunscreen', 'Products to protect the skin from UV damage', '2024-06-10 07:45:11', '2024-06-10 07:45:11'),
(8, 'Treatments', 'Products to treat specific issues like acne or aging', '2024-06-10 07:45:11', '2024-06-10 07:45:11');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` enum('pending','processed','shipped','delivered','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 319.98, 'processed', '2024-06-10 04:15:51', '2024-06-10 04:15:51'),
(2, 3, 499.99, 'pending', '2024-06-10 04:15:51', '2024-06-10 04:15:51'),
(3, 1, 799.99, 'shipped', '2024-06-10 04:15:51', '2024-06-11 11:38:46'),
(9, 4, 100.00, 'shipped', '2024-06-11 14:57:37', '2024-06-11 14:57:37');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `category_id`, `image`, `created_at`, `updated_at`) VALUES
(16, 'Gentle Skin Cleanser', 'A soft cleanser for all skin types', 19.99, 4, 'dummy_image1.jpg', '2024-06-10 07:49:04', '2024-06-10 07:49:04'),
(17, 'Daily Moisturizer', 'Keeps skin hydrated throughout the day', 25.99, 5, 'dummy_image2.jpg', '2024-06-10 07:49:04', '2024-06-10 07:49:04'),
(18, 'Vitamin C Serum', 'Brightens and firms skin with daily use', 35.50, 6, 'dummy_image3.jpg', '2024-06-10 07:49:04', '2024-06-10 07:49:04'),
(19, 'Broad Spectrum SPF 50', 'Full protection against UVA and UVB rays', 22.50, 7, 'dummy_image4.jpg', '2024-06-10 07:49:04', '2024-06-10 07:49:04'),
(20, 'Acne Spot Treatment', 'Fast-acting solution for breakouts', 15.00, 8, 'dummy_image5.jpg', '2024-06-10 07:49:04', '2024-06-10 07:49:04'),
(21, 'retinol', 'untuk mengeksfoliasi', 123.00, 6, 'uploads/powdermask.jpg', '2024-06-11 12:01:14', '2024-06-11 12:01:14'),
(22, 'azarine', 'untuk melindungi dari sinar matahari', 55.00, 7, 'uploads/adsi-Mengubah Informasi Pribadi.drawio (2).png', '2024-06-11 14:37:39', '2024-06-11 14:37:39');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'Glowcare Admin Panel', '2024-06-10 04:15:51', '2024-06-10 04:15:51'),
(2, 'admin_email', 'admin@glowcare.com', '2024-06-10 04:15:51', '2024-06-10 04:15:51'),
(3, 'items_per_page', '10', '2024-06-10 04:15:51', '2024-06-10 04:15:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` enum('manajer','staff') DEFAULT 'staff',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `role`, `created_at`, `name`) VALUES
(1, 'manager1', 'password1', 'manager1@example.com', 'manajer', '2024-06-10 04:15:51', NULL),
(2, 'staff1', 'password2', 'staff1@example.com', 'staff', '2024-06-10 04:15:51', NULL),
(3, 'staff2', 'password3', 'staff2@example.com', 'staff', '2024-06-10 04:15:51', NULL),
(4, 'intan', 'password11', 'manager2@example.com', 'manajer', '2024-06-11 14:30:21', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
