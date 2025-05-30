-- phpMyAdmin SQL Dump
-- https://www.phpmyadmin.net/
-- Host: 127.0.0.1



SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bike_rental_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bike_list`
--

CREATE TABLE `bike_list` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `bike_model` text NOT NULL,
  `description` text NOT NULL,
  `quantity` tinyint(3) NOT NULL DEFAULT 0,
  `daily_rate` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bike_list`
--

INSERT INTO `bike_list` (`id`, `brand_id`, `category_id`, `bike_model`, `description`, `quantity`, `daily_rate`, `status`, `date_created`, `date_updated`) VALUES
(1, 5, 2, 'BMW R 1250 GS', 'thích hợp đi du lịch', 5, 2500, 1, '2025-05-04 11:22:34', '2025-05-09 11:54:09'),
(2, 2, 2, 'Honda X-ADV 2021', 'thích hợp đi núi đèo', 3, 1500, 1, '2025-05-04 13:11:22', '2025-05-09 14:12:02');

-- --------------------------------------------------------

--
-- Table structure for table `brand_list`
--

CREATE TABLE `brand_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand_list`
--

INSERT INTO `brand_list` (`id`, `name`, `status`, `date_created`) VALUES
(1, 'Kawasaki', 1, '2025-05-13 09:24:03'),
(2, 'Honda', 1, '2025-05-13 09:25:37'),
(3, 'Yamaha', 1, '2025-05-13 09:26:02'),
(4, 'Ducati', 1, '2025-05-13 09:26:11'),
(5, 'BMW', 1, '2025-05-13 09:26:16'),
(6, 'Vespa', 1, '2025-05-13 09:26:41');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Scooter', 'Sample Description', 1, '2025-05-05 09:39:31'),
(2, 'Adventure Bike', 'Adventure Bike Category', 1, '2025-05-05 09:40:06'),
(3, 'Sports Bike', 'Sports Bike Category', 1, '2025-05-05 09:45:32'),
(4, 'Touring Bike', 'Touring Bike Category', 1, '2025-05-05 09:46:06');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `address`, `date_created`) VALUES
(1, 'Nguyen', 'Huy', 'Male', '0383738623', '16012002@gmail.com', 'b8dc042d8cf7deefb0ec6a264c930b02', 'Hanoi', '2025-05-13 14:10:49');

-- --------------------------------------------------------

--
-- Table structure for table `rent_list`
--

CREATE TABLE `rent_list` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `bike_id` int(30) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `rent_days` int(11) NOT NULL DEFAULT 0,
  `amount` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Pending,1=Confirmed,2=Cancelled,3=Picked -up, 4 =Returned',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rent_list`
--

INSERT INTO `rent_list` (`id`, `client_id`, `bike_id`, `date_start`, `date_end`, `rent_days`, `amount`, `status`, `date_created`, `date_updated`) VALUES
(2, 1, 1, '2025-5-15', '2025-5-16', 2, 5000, 0, '2025-5-13 15:30:43', NULL),
(3, 1, 1, '2025-5-15', '2025-5-15', 1, 2500, 0, '2025-5-13 15:31:35', NULL),
(4, 1, 1, '2025-5-14', '2025-5-15', 2, 5000, 0, '2025-5-13 15:32:48', NULL),
(5, 1, 2, '2025-5-19', '2025-5-21', 3, 4500, 2, '2025-5-13 15:33:37', '2025-5-16 16:20:19'),
(6, 1, 2, '2025-5-18', '2025-5-19', 2, 3000, 1, '2025-5-13 15:34:22', '2025-5-16 16:19:37');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Online Motorcycle (Bike) Rental System'),
(6, 'short_name', 'Bike Rental'),
(11, 'logo', 'uploads/1634087520_bike-logo.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1634087520_bike-img-1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', NULL, NULL, 1, '2025-05-10 14:02:37', '2025-05-13 14:02:37'),
(4, 'ngoc', '7bfe8ed9fc8127bfc322b6b24fd13e4d', NULL, NULL, 0, '2025-05-10 14:03:37', '2025-05-13 14:03:37'),
(5, 'huy', 'b8dc042d8cf7deefb0ec6a264c930b02', NULL, NULL, 0, '2025-05-10 14:04:37', '2025-05-13 14:04:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bike_list`
--
ALTER TABLE `bike_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `brand_list`
--
ALTER TABLE `brand_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rent_list`
--
ALTER TABLE `rent_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bike_list`
--
ALTER TABLE `bike_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `brand_list`
--
ALTER TABLE `brand_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rent_list`
--
ALTER TABLE `rent_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
