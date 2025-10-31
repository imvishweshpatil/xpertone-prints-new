-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2025 at 03:57 PM
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
-- Database: `u705255933_xpertone_print`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `email`, `password`) VALUES
(0, 'admin@example.com', '$2b$10$Nq7B77ExTvnmciDjsZ7EaO1m0VSfjZmCR3SlylpqiBQ2OCKquGHki');

-- --------------------------------------------------------

--
-- Table structure for table `checkout_orders`
--

CREATE TABLE `checkout_orders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `vat` decimal(10,2) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `email`, `phone`, `message`, `submitted_at`) VALUES
(9, 'admin Khubaib77', 'admin@gmail.com', '03000000000', 'test ONly', '2025-10-07 17:55:43');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_title` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `circulation` int(11) NOT NULL,
  `series` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `front_file` varchar(255) NOT NULL,
  `back_file` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(50) NOT NULL,
  `customer_location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_title`, `quantity`, `circulation`, `series`, `total_price`, `front_file`, `back_file`, `created_at`, `customer_name`, `customer_email`, `customer_phone`, `customer_location`) VALUES
(54, NULL, 'Door Hanger Butterfly Design(Matt Lamination 350gsm)', 500, 500, 2, 278.00, '1759760743940-Screenshot 2025-08-18 134452.png', '1759760743948-Screenshot 2025-08-18 134437.png', '2025-10-06 14:25:43', '', '', '', ''),
(55, NULL, 'Matt Lamination 350Gsm', 1000, 1000, 1, 32.00, '1759761187641-Screenshot 2025-08-18 134437.png', '1759761187646-Screenshot 2025-08-18 134452.png', '2025-10-06 14:33:07', '', '', '', ''),
(56, NULL, 'Art Paper 400gsm (Without Lamination)', 1000, 1000, 2, 52.00, '1759845567201-Screenshot 2025-09-23 110446.png', '1759845567224-Screenshot 2025-09-23 110446.png', '2025-10-07 13:59:27', '', '', '', ''),
(57, NULL, 'Rounded Corner PETT Glossy Lamination 760mic', 1000, 1000, 2, 134.00, '1759850752311-Screenshot 2025-08-26 060401.png', '1759850752328-Screenshot 2025-08-26 060401.png', '2025-10-07 15:25:52', '', '', '', ''),
(58, NULL, 'Car Mat - 4 Color (Glossy 135 gsm)', 1000, 1000, 2, 248.00, '1759936734666-Screenshot 2025-08-18 134437.png', '1759936734675-Screenshot 2025-08-18 134437.png', '2025-10-08 15:18:54', 'admin Khubaib77', 'admin@gmail.com', '03000000000', 'SAHIWAL'),
(59, NULL, 'Car Mat - 4 Color (Glossy 135 gsm)', 1000, 1000, 2, 248.00, '1759938219587-cloud-and-platforms Image ooo2.jpg', '1759938222510-EâArchiving Image 000 .jpg', '2025-10-08 15:43:44', '', '', '', ''),
(60, NULL, 'Matt Lamination 400 Gsm', 2000, 1000, 4, 148.00, '1760511337018-WhatsApp Image 2025-06-28 at 6.49.07 AM.jpeg', '1760511337595-WhatsApp Image 2025-10-14 at 10.32.05.jpeg', '2025-10-15 06:55:38', '', '', '', ''),
(61, 9, 'Glossy Lamination 400gsm', 1000, 1000, 2, 46.00, '1761572863688-Screenshot 2025-08-18 134452.png', '1761572863694-Screenshot 2025-08-18 134452.png', '2025-10-27 13:47:43', 'test', 'admin@gmail.com', '03000000000', 'Chak92 6/R');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `label` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `dimensions` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `printing_process`
--

CREATE TABLE `printing_process` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `current_stage` enum('Prepress','Printing','Collating','Binding','Trimming','Packaging','Completed') DEFAULT 'Prepress',
  `notes` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `printing_process`
--

INSERT INTO `printing_process` (`id`, `order_id`, `customer_name`, `customer_phone`, `current_stage`, `notes`, `updated_at`) VALUES
(1, 21, 'testing22', '03000000000', 'Prepress', NULL, '2025-10-27 13:35:04'),
(2, 61, 'test', '03000000000', 'Prepress', NULL, '2025-10-27 13:47:43'),
(3, 22, 'testing33', '03000000000', 'Prepress', NULL, '2025-10-27 14:03:51'),
(4, 23, 'testing21', '03000000000', 'Prepress', NULL, '2025-10-27 14:11:02'),
(5, 24, 'testing26', '03000000000', 'Prepress', NULL, '2025-10-27 14:57:11');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `label` varchar(300) NOT NULL,
  `image` varchar(255) NOT NULL,
  `quantity_500` varchar(50) NOT NULL,
  `quantity_1000` varchar(50) NOT NULL,
  `category` varchar(100) NOT NULL,
  `dimensions` varchar(255) NOT NULL,
  `size` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `label`, `image`, `quantity_500`, `quantity_1000`, `category`, `dimensions`, `size`) VALUES
(7, 'Matt Lamination 400 Gsm', '4 Color, 2 Sides, Matt Laminated 400 gsm Before Cutting: 9.2 x 5.7cm , After Cutting: 9 x 5.5 cm also you can print in larger sizes up to 34 x 46 cm', '1761325813076-400-Gsm-Matt-Laminated.jpg', '125', '150', 'Business Cards', '400 gsm (57×92 mm)', NULL),
(8, 'Matt Lamination 350Gsm', '4 Color, 2 Sides, Matt Laminated 350 gsm Before Cutting: 9.2 x 5.7cm , After Cutting: 9 x 5.5 cm also you can print in larger sizes up to 34 x 46 cm', '1761325827781-350-Gsm-Matt-Laminated.jpg', '75', '1000', 'Business Cards', '57.000 X 92.000 (57×92 mm)', NULL),
(9, 'Glossy Lamination 400gsm', '4 Color, 2 Sides, Glossy Laminated 400 gsm Before Cutting: 9.2 x 5.7cm , After Cutting: 9 x 5.5 cm also you can print in larger sizes up to 34 x 46 cm', '1751403380450-download (12).png', '19', '39', 'Business Cards', '57.000 X 92.000 (57×92 mm)', NULL),
(11, 'Rounded Corner PETT Gold Glossy Lamination 760mic', '4 Color, 2 Sides, Glossy Paper 350gsm, PET Glossy Laminated 760 mic ,Rounded Corner Before Cutting: 9.5 x 6 cm , After Cutting: 9 x 5.5 cm', '1761325862667-Rounded-Corner-PETT-Gold-Glossy-Lamination-760mic.jpg', '350', '450', 'Business Cards', 'After Cutting 90 x 55 mm (95×60 mm)', NULL),
(12, 'Rounded Corner Gold Foil spot uv Velvet Lamination', 'New : Rounded Corner Gold Foil spot uv Velvet Lamination', '1761325877596-Rounded-Corner-Gold-Foil-spot-uv-Velvet-Lamination.jpg', '350', '450', 'Business Cards', 'After Cutting 90 x 55 mm (60×95 mm)', NULL),
(15, 'Rounded Corner Spot UV Velvet Lamination 760mic', '4 Color, 2 Sidess, Spot UV , Velvet Laminated 760 mic Before Cutting: 9.5 x 6 cm , After Cutting: 9 x 5.5 cm also the areas you select will be Spot UV', '1761325902999-Rounded-Corner-Spot-UV-Velvet-Lamination-760mic.jpg', '250', '350', 'Business Cards', 'After Cutting 90 x 55 mm (60×95 mm)', NULL),
(17, 'Rounded Corner PETT Glossy Lamination 760mic', '4 Color, 2 Sides, Glossy Paper 350gsm, PET Glossy Laminated 760 mic ,Rounded Corner Before Cutting: 9.5 x 6 cm , After Cutting: 9 x 5.5 cm', '1761325932530-Rounded-Corner-PETT-Glossy-Lamination-760mic.jpg', '250', '350', 'Business Cards', 'After Cutting 90 x 55 mm (95×60 mm)', NULL),
(18, 'Rounded Corner Spot UV Matt Lamination 400gsm', '4 Color, 2 Sides, Spot UV ,Rounded Corner Matt Laminated 400 gsm Before Cutting: 9.5 x 6 cm , After Cutting: 9 x 5.5 cm also the areas you select will be Spot UV', '1761325950914-Rounded-Corner-Spot-UV-.jpg', '200', '250', 'Business Cards', 'After Cutting 90 x 55 mm (95×60 mm)', NULL),
(19, 'Spot UV Matt Lamination 400gsm', 'Spot UV Matt Lamination 400gsm', '1761325977435-Rounded-Corner-Spot-UV-Matt-Lamination-400gsm.jpg', '150', '225', 'Business Cards', '57.000 X 92.000 (57×92 mm)', NULL),
(22, 'Gold Foil Matt Lamination 400gsm', '4 Color, 2 Sides, Gold Foil Matt Laminated 400 gsm Before Cutting: 9.2 x 5.7cm , After Cutting: 9 x 5.5 cm also you can print in larger sizes up to 34 x 46 cm', '1761326003397-Gold-Foil-spot-uv-Velvet-Lamination.jpg', '200', '250', 'Premium Business Cards', '57.000 X 92.000 (57×92 mm)', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `safety_orders`
--

CREATE TABLE `safety_orders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_phone` varchar(50) NOT NULL,
  `delivery_location` varchar(255) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `small_qty` int(11) DEFAULT 0,
  `medium_qty` int(11) DEFAULT 0,
  `large_qty` int(11) DEFAULT 0,
  `xl_qty` int(11) DEFAULT 0,
  `total_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `design_image` varchar(255) DEFAULT NULL,
  `design_type` varchar(50) DEFAULT NULL,
  `design_charge` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `safety_orders`
--

INSERT INTO `safety_orders` (`id`, `customer_name`, `customer_email`, `customer_phone`, `delivery_location`, `product_title`, `product_image`, `small_qty`, `medium_qty`, `large_qty`, `xl_qty`, `total_price`, `created_at`, `design_image`, `design_type`, `design_charge`) VALUES
(13, 'admin99', 'admin@gmail.com', '03000000000', 'Main Roadds', 'Cotton Pant Shirt, Empiral, Comfort PS', NULL, 1, 0, 0, 1, 136.34, '2025-10-07 18:22:43', NULL, NULL, 0.00),
(14, 'Waseem Abbas', 'Xpertonecreative@gmail.com', '0554712106', 'Dubai', '( Labour Vest )  EMPIRAL BRIGHT ID, Four Pocket Vest + ID Pocket', NULL, 1, 1, 1, 1, 41.68, '2025-10-08 16:13:59', NULL, NULL, 0.00),
(15, 'Waseem Abbas', 'xpertonecreative@gmail.com', '0554712106', 'Dubai', '( Labour Vest ) EMPIRAL BRIGHT ID, Four Pocket Vest + ID Pocket ', NULL, 2, 2, 2, 0, 62.52, '2025-10-15 11:36:23', NULL, NULL, 0.00),
(16, 'Waseem Abbas', 'Xpertonecreative@gmail.com', '0554712106', 'Dubai', 'SPARTAN II', NULL, 1, 0, 1, 0, 95.84, '2025-10-16 19:08:52', NULL, NULL, 0.00),
(17, 'Waseem Abbas', 'wassem.abbas@xpertonehealth.com', '0526782416', 'Dubai', 'Essential Series – General Yellow Vest', NULL, 1, 1, 1, 0, 45.00, '2025-10-19 15:08:58', NULL, NULL, 0.00),
(18, 'Waseem Abbas', 'wassem.abbas@xpertonehealth.com', '0526782416', 'Dubai', 'Essential Series – General Yellow Vest', NULL, 1, 1, 1, 0, 45.00, '2025-10-19 15:12:48', NULL, NULL, 0.00),
(19, 'testing22', 'admin@gmail.com', '03000000000', 'Mshayrif', '100% Cotton Coverall -240 Gsm', '1761571586955-Screenshot 2025-08-18 134437.png', 1, 0, 0, 0, 55.00, '2025-10-27 13:30:10', '1761571810352.png', NULL, 0.00),
(20, 'testing22', 'admin@gmail.com', '03000000000', 'Mshayrif', '100% Cotton Coverall -240 Gsm', '1761571586955-Screenshot 2025-08-18 134437.png', 1, 0, 0, 0, 55.00, '2025-10-27 13:30:29', '1761571829852.png', NULL, 0.00),
(21, 'testing22', 'admin@gmail.com', '03000000000', 'Mshayrif', '100% Cotton Coverall -240 Gsm', '1761571586955-Screenshot 2025-08-18 134437.png', 1, 0, 0, 0, 55.00, '2025-10-27 13:35:04', '1761572104038.png', NULL, 0.00),
(22, 'testing33', 'admin@gmail.com', '03000000000', 'Bateen Liwa', '100% Cotton Coverall -240 Gsm', '1761571586955-Screenshot 2025-08-18 134437.png', 2, 0, 0, 0, 110.00, '2025-10-27 14:03:51', '1761573831176.png', NULL, 0.00),
(23, 'testing21', 'admin@gmail.com', '03000000000', 'Mshayrif', '100% Cotton Coverall -240 Gsm', '1761571586955-Screenshot 2025-08-18 134437.png', 2, 0, 0, 0, 110.00, '2025-10-27 14:11:02', '1761574262332.png', 'embroidered', 15.00),
(24, 'testing26', 'admin@gmail.com', '03000000000', 'Mshayrif', '100% Cotton Coverall -240 Gsm', '1761571586955-Screenshot 2025-08-18 134437.png', 1, 0, 0, 1, 110.00, '2025-10-27 14:57:11', '1761577031363.png', 'print', 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `safety_products`
--

CREATE TABLE `safety_products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `image` varchar(255) NOT NULL,
  `category` enum('Safety Vest','Safety Jackets','Safety Cargo Trousers','Pant-Shirts-Coveralls','Cargo Trousers','Cargo Trousers','Safety Vest') NOT NULL,
  `size` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`size`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `safety_products`
--

INSERT INTO `safety_products` (`id`, `title`, `label`, `price`, `image`, `category`, `size`) VALUES
(6, 'Elite Series – Engineer Orange/Black Multi-Pocket Safety Vest', 'High-performance reflective vest built for site engineers and field specialists. Made from durable fluorescent orange material with multiple pockets and ID holder. Combines superior visibility, functionality, and comfort for professional use.', 25.00, '1761325710665-E302-Flourescent-Orange-Black.png', 'Safety Vest', '[\"S\",\"M\",\"L\",\"XL\",\"2XL\",\"3XL\",\"4XL\",\"5XL\"]'),
(7, 'Elite Series – Engineer Yellow/Black Multi-Pocket Safety Vest', 'Premium-quality reflective vest designed for engineers and technical professionals. Crafted from durable fluorescent yellow fabric with multiple functional pockets and an ID holder. Provides maximum visibility, comfort, and utility for demanding work envi', 25.00, '1761325571515-E301-Flourescent-Yellow-Black.png', 'Safety Vest', '[\"S\",\"M\",\"L\",\"XL\",\"2XL\",\"3XL\",\"4XL\",\"5XL\"]'),
(10, 'Pro Series – Supervisor Orange Reflective Vest', 'Durable fluorescent orange safety vest with reflective strips for superior visibility. Includes front pockets and ID holder, ideal for on-site supervisors and field leaders.', 20.00, '1761325545928-S202-Orange.png', 'Safety Vest', '[\"S\",\"L\",\"M\",\"XL\",\"2XL\",\"3XL\",\"4XL\",\"5XL\"]'),
(11, 'Pro Series – Supervisor Blue Reflective Vest', 'Stylish blue safety vest with reflective strips for visibility and professionalism. Designed with pockets and ID holder for supervisors managing site operations.', 20.00, '1761325528605-S203-Blue.png', 'Safety Vest', '[\"S\",\"M\",\"L\",\"XL\",\"2XL\",\"3X\",\"4XL\",\"5XL\"]'),
(12, 'Pro Series – Supervisor Red Reflective Vest', 'Bright red reflective vest offering excellent visibility and practical storage. Perfect for supervisors ensuring control and safety across active work zones.', 20.00, '1761325511940-S204-Red.png', 'Safety Vest', '[\"S\",\"L\",\"M\",\"XL\",\"2XL\",\"3XL\",\"4XL\",\"5XL\"]'),
(13, 'Pro Series – Supervisor Yellow Reflective Vest', 'High-visibility yellow vest designed for safety and comfort. Features reflective detailing, multiple pockets, and ID holder for daily supervision tasks.', 20.00, '1761325491548-S201-Fluorescent-yellow.png', 'Safety Vest', '[\"S\",\"M\",\"L\",\"XL\",\"2XL\",\"3XL\",\"4XL\",\"5XL\"]'),
(14, 'Essential Series – General Black Vest', 'High-visibility reflective vest made from durable polyester fluorescent fabric. Features Velcro front closure and reflective strips for maximum safety and visibility. Lightweight, comfortable, and ideal for construction, warehouse, and roadside use.', 15.00, '1761325472070-L106-Black.png', 'Safety Vest', '[\"S\",\"L\",\"M\",\"XL\",\"2XL\",\"3XL\",\"4XL\",\"5XL\"]'),
(15, 'Essential Series – General Orange Vest', 'High-visibility reflective vest made from durable polyester fluorescent fabric. Features Velcro front closure and reflective strips for maximum safety and visibility. Lightweight, comfortable, and ideal for construction, warehouse, and roadside use.', 15.00, '1761325448693-L102-Orange.png', 'Safety Vest', '[\"S\",\"M\",\"L\",\"XL\",\"2XL\",\"3XL\",\"4XL\",\"5XL\"]'),
(16, 'Essential Series – General Blue Vest', 'High-visibility reflective vest made from durable polyester fluorescent fabric. Features Velcro front closure and reflective strips for maximum safety and visibility. Lightweight, comfortable, and ideal for construction, warehouse, and roadside use.', 15.00, '1761325432654-L104-Blue.png', 'Safety Vest', '[\"S\",\"M\",\"L\",\"XL\",\"2XL\",\"3XL\",\"4XL\",\"5XL\"]'),
(17, 'Essential Series – General Red Vest', 'High-visibility reflective vest made from durable polyester fluorescent fabric. Features Velcro front closure and reflective strips for maximum safety and visibility. Lightweight, comfortable, and ideal for construction, warehouse, and roadside use.', 15.00, '1761325412785-L105-Red.png', 'Safety Vest', '[\"S\",\"M\",\"L\",\"XL\",\"2XL\",\"3XL\",\"4XL\",\"5XL\"]'),
(18, 'Essential Series – General Yellow Vest', 'High-visibility reflective vest made from durable polyester fluorescent fabric. Features Velcro front closure and reflective strips for maximum safety and visibility. Lightweight, comfortable, and ideal for construction, warehouse, and roadside use.', 15.00, '1761325386549-L101-Fluorescent-yellow.png', 'Safety Vest', '[\"S\",\"L\",\"M\",\"XL\",\"2XL\",\"3XL\",\"4XL\",\"5XL\"]'),
(24, 'ProGuard Elite-Khaki/Grey', 'Cargo Pants, 100% Cotton Canvas Standard', 65.00, '1761325317821-ProGuard-Elite-Khaki-Grey.png', 'Safety Cargo Trousers', '[\"S\",\"M\",\"L\",\"XL\",\"2XL\",\"3XL\"]'),
(25, 'ProGuard Elite-Royal Blue/Black', 'Cargo Pants, 100% Cotton Canvas Standard', 65.00, '1761325291543-ProGuard-.Royal-Blue-Blackpng.png', 'Safety Cargo Trousers', '[\"S\",\"L\",\"M\",\"XL\",\"2XL\",\"3XL\"]'),
(26, 'ProGuard Elite-Grey/Black', 'Cargo Pants, 100% Cotton Canvas Standard', 65.00, '1761325264618-ProGuard-.Grey-Black.png', 'Safety Cargo Trousers', '[\"S\",\"L\",\"M\",\"XL\",\"2XL\",\"3XL\"]'),
(41, 'ProGuard lite-Grey/Orange', 'Cargo Pants, 65/35 Polyester/Cotton Fabric', 55.00, '1761325230643-ProGuard-Lite-Grey-Orangepng.png', 'Safety Cargo Trousers', '[\"S\",\"L\",\"XL\",\"2XL\",\"3XL\",\"4XL\"]'),
(42, 'ProGuard lite-Khaki/Black', 'Cargo Pants, 65/35 Polyester/Cotton Fabric', 55.00, '1761325097221-ProGuard-Lite-Khaki-Black.png', 'Safety Cargo Trousers', '[\"S\",\"L\",\"XL\",\"2XL\"]'),
(43, 'ProGuard lite - Royal Blue/Black', 'Cargo Pants, 65/35 Polyester/Cotton Fabric', 55.00, '1761325213053-ProGuard-Lite-R.Blue-Black.png', 'Safety Cargo Trousers', '[\"S\",\"M\",\"L\",\"XL\",\"2XL\",\"3XL\",\"4XL\",\"5XL\"]'),
(47, '100% Cotton Pant & Shirt with Reflective - 200 Gsm', 'Front and Back Logo', 55.00, '1761324803098-Cotton-Pant-&-Shirt-with-Reflective---200-Gsm.png', 'Pant-Shirts-Coveralls', '[\"S\",\"M\",\"L\",\"XL\",\"2XL\",\"3XL\",\"4XL\",\"5XL\"]'),
(48, '100% Twill Coverall-180 Gsm', 'Front and Back Logo', 35.00, '1761324775359-Coverall-1.png', 'Pant-Shirts-Coveralls', '[\"S\",\"M\",\"L\",\"XL\",\"2XL\",\"3XL\",\"4XL\",\"5XL\"]'),
(49, '100% Cotton Coverall -200 Gsm', 'Front and Back Logo', 45.00, '1761324756760-Coverall-2.png', 'Pant-Shirts-Coveralls', '[\"S\",\"M\",\"L\",\"XL\",\"2XL\",\"3XL\",\"4XL\",\"5XL\"]'),
(50, '100% Cotton Coverall -240 Gsm', 'Front and Back Logo', 55.00, '1761571586955-Screenshot 2025-08-18 134437.png', 'Pant-Shirts-Coveralls', '[\"S\",\"M\",\"L\",\"XL\",\"2XL\",\"3XL\",\"4XL\",\"5XL\"]');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`) VALUES
(8, 'admin', 'khubaib1145@gmail.com', '$2b$10$tK2xV/9dYcvDPDd7oFPkI.7UNatm4pg5sQZUYd0GFgoVG6duc2gYy', '2025-10-07 18:19:54'),
(9, 'admin', 'ali@test.com', '$2b$10$p64i2ezq9KxZ5i6tSqLfQuxW2jwBUjZWogrj0oR4S6Cp3CPMyFu66', '2025-10-07 19:02:56'),
(10, 'admin', 'admin@gmail.com', '$2b$10$J0qO67dBqbzVg5AgZt8.zOs/nM0uVsa42.NBuRL7/sT7NLHD35yq2', '2025-10-07 19:30:31'),
(11, 'khubaib9202', '295d@gmail.com', '$2b$10$ueYW/9yl0nhbhwb9JPjie./dWJiRiU/1Br7bgjCRoHWnhP3y2/cJC', '2025-10-07 19:33:29'),
(12, 'admin', 'alio@test.com', '$2b$10$UEBX0M4ixBHziq2VfWNBFuJ6i0dJaGoTMWQ/jGXusoVvR5tGbcV8K', '2025-10-07 19:35:16'),
(13, 'admin', 'admin@example.com', '$2b$10$iqNS0akGHsPPMaVh74mEy.B7jnsgQs/fuZCls./akjYRZ57HWH/4e', '2025-10-08 03:22:34'),
(14, 'admin', 'alik@test.com', '$2b$10$mqTqUNAJxaStP90JgxaT2uJ/WJkn5f3XuNDyJBU/NIjGr6f/35joG', '2025-10-08 03:37:58'),
(15, 'admin', 'alikk@test.com', '$2b$10$WIp5Etzmiv3O8mO2dlzPa.nYEINCl5t9OEVaxy4t8cnhw3Ih1WK.q', '2025-10-08 04:51:50'),
(16, 'Khubaib', 'khubaib13@gmail.com', '$2b$10$D9V0xviSViYt1/imWUDii.weeXbEB4PyUzAuNeWoY00.Lg0d0ivc2', '2025-10-08 05:06:46'),
(17, 'Khubaib', 'khubaib15@gmail.com', '$2b$10$1atY8Q9I1DiGJ7urWF9jEe1wn1R4Lo9k7hImWcg8eJh35J9/AwQ86', '2025-10-08 05:08:36'),
(18, 'Khubaib32', '29d@gmail.com', '$2b$10$WdG5mk8dy0AjQrIJuc7nI.w9E.MrjW0trtWMhLjNhNDjmggiYg90m', '2025-10-08 05:15:32'),
(19, 'ali', 'al@test.com', '$2b$10$qBBEGpBn94oQnI6qxiAEfekvpzciZz1tiNLZ2ueHY3lk903heTKKC', '2025-10-08 13:31:36'),
(20, 'admin', 'khubaib11@gmail.com', '$2b$10$5uEb0OCnJh4.OGpZ.QEcAehwdgTvDCdN8LT7Nm4R2aR9KmAJHnSa.', '2025-10-08 19:26:06'),
(21, 'Khubaib', 'khubaib1@gmail.com', '$2b$10$2cUt3Tx2h8yR4AIMEoroB.52ug7H3GCiCZvOfLdbge2X.oOrYsQlC', '2025-10-16 07:25:47'),
(22, 'Operations', 'Operations@Affworld.in', '$2b$10$EutxSZcnT1tYBjZhhH49O..HrR2sccxeBOl1Qtb9UVTNFs45QbP06', '2025-10-24 16:50:27'),
(23, 'Waseem', 'Xpertonecreative@gmail.com', '$2b$10$WuSdvdoK.DdW8D2whOSKUegQ11bOQYrM8JzbDh04U0hIJNdhD.mwC', '2025-10-24 17:18:52'),
(24, 'Mudasar', 'mudasarshakil@gmail.com', '$2b$10$p.rGsIct5TAa0ofeb2kg..Fc5Oq/tqHlDfe2zM5Bi.AcgxRlP66ne', '2025-10-25 09:15:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checkout_orders`
--
ALTER TABLE `checkout_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `printing_process`
--
ALTER TABLE `printing_process`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `safety_orders`
--
ALTER TABLE `safety_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `safety_products`
--
ALTER TABLE `safety_products`
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
-- AUTO_INCREMENT for table `checkout_orders`
--
ALTER TABLE `checkout_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `printing_process`
--
ALTER TABLE `printing_process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `safety_orders`
--
ALTER TABLE `safety_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `safety_products`
--
ALTER TABLE `safety_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
