-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th7 03, 2025 lúc 04:27 AM
-- Phiên bản máy phục vụ: 8.0.30
-- Phiên bản PHP: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `datn`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint UNSIGNED DEFAULT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'created', 1, 'App\\Domains\\Announcement\\Models\\Announcement', NULL, NULL, '{\"attributes\": {\"area\": null, \"type\": \"info\", \"enabled\": true, \"ends_at\": null, \"message\": \"This is a <strong>Global</strong> announcement that will show on both the frontend and backend. <em>See <strong>AnnouncementSeeder</strong> for more usage examples.</em>\", \"starts_at\": null}}', '2025-07-03 04:10:46', '2025-07-03 04:10:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `address_order`
--

CREATE TABLE `address_order` (
  `id` bigint UNSIGNED NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ward` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `address_order`
--

INSERT INTO `address_order` (`id`, `province`, `district`, `ward`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Lào Cai', 'Huyện Si Ma Cai', 'Thị Trấn Si Ma Cai', 'cccc', '2025-07-03 04:21:52', '2025-07-03 04:21:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint UNSIGNED NOT NULL,
  `area` enum('frontend','backend') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('info','danger','warning','success') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'info',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `starts_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `announcements`
--

INSERT INTO `announcements` (`id`, `area`, `type`, `message`, `enabled`, `starts_at`, `ends_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'info', 'This is a <strong>Global</strong> announcement that will show on both the frontend and backend. <em>See <strong>AnnouncementSeeder</strong> for more usage examples.</em>', 1, NULL, NULL, '2025-07-03 04:10:46', '2025-07-03 04:10:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_detail_id` bigint UNSIGNED NOT NULL,
  `product_quantity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_detail_id`, `product_quantity`, `created_at`, `updated_at`) VALUES
(3, 13, 8, 0, '2025-07-03 04:16:18', '2025-07-03 04:16:18'),
(4, 13, 9, 0, '2025-07-03 04:16:18', '2025-07-03 04:16:18'),
(5, 13, 10, 0, '2025-07-03 04:16:18', '2025-07-03 04:16:18'),
(6, 13, 26, 1, '2025-07-03 04:22:34', '2025-07-03 04:22:34'),
(7, 13, 27, 1, '2025-07-03 04:22:34', '2025-07-03 04:22:34'),
(8, 13, 28, 0, '2025-07-03 04:22:34', '2025-07-03 04:22:34'),
(9, 13, 29, 0, '2025-07-03 04:22:34', '2025-07-03 04:22:34'),
(10, 13, 30, 0, '2025-07-03 04:22:34', '2025-07-03 04:22:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `creator_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nhẫn', 'nhan', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(2, 'Dây chuyền', 'day-chuyen', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(3, 'Vòng tay', 'vong-tay', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(4, 'Khuyên tai', 'khuyen-tai', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(5, 'Đồng hồ', 'dong-ho', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_product`
--

CREATE TABLE `category_product` (
  `id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category_product`
--

INSERT INTO `category_product` (`id`, `category_id`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 5, NULL, NULL),
(6, 1, 6, NULL, NULL),
(7, 1, 7, NULL, NULL),
(8, 1, 8, NULL, NULL),
(9, 1, 9, NULL, NULL),
(10, 1, 10, NULL, NULL),
(11, 1, 11, NULL, NULL),
(12, 1, 12, NULL, NULL),
(13, 1, 13, NULL, NULL),
(14, 1, 14, NULL, NULL),
(15, 1, 15, NULL, NULL),
(16, 2, 16, NULL, NULL),
(17, 2, 17, NULL, NULL),
(18, 2, 18, NULL, NULL),
(19, 2, 19, NULL, NULL),
(20, 2, 20, NULL, NULL),
(21, 2, 21, NULL, NULL),
(22, 2, 22, NULL, NULL),
(23, 2, 23, NULL, NULL),
(24, 2, 24, NULL, NULL),
(25, 2, 25, NULL, NULL),
(26, 3, 26, NULL, NULL),
(27, 3, 27, NULL, NULL),
(28, 3, 28, NULL, NULL),
(29, 3, 29, NULL, NULL),
(30, 3, 30, NULL, NULL),
(31, 3, 31, NULL, NULL),
(32, 3, 32, NULL, NULL),
(33, 3, 33, NULL, NULL),
(34, 3, 34, NULL, NULL),
(35, 3, 35, NULL, NULL),
(36, 3, 36, NULL, NULL),
(37, 3, 37, NULL, NULL),
(38, 3, 38, NULL, NULL),
(39, 3, 39, NULL, NULL),
(40, 3, 40, NULL, NULL),
(41, 4, 41, NULL, NULL),
(42, 4, 42, NULL, NULL),
(43, 4, 43, NULL, NULL),
(44, 4, 44, NULL, NULL),
(45, 4, 45, NULL, NULL),
(46, 4, 46, NULL, NULL),
(47, 4, 47, NULL, NULL),
(48, 4, 48, NULL, NULL),
(49, 5, 49, NULL, NULL),
(50, 5, 50, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `channels`
--

CREATE TABLE `channels` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `channel_user`
--

CREATE TABLE `channel_user` (
  `id` bigint UNSIGNED NOT NULL,
  `channel_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `value` double NOT NULL,
  `expiry_date` date NOT NULL,
  `quantity` int NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date NOT NULL DEFAULT '2025-07-03',
  `description` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `slug`, `type`, `value`, `expiry_date`, `quantity`, `is_active`, `created_at`, `updated_at`, `start_date`, `description`, `deleted_at`) VALUES
(1, 'coupon1', 'coupon1', 0, 10, '2025-07-10', 10, 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', '2025-07-03', 'Use the code and get 10% off your first order at Bio-First.', NULL),
(2, 'coupon2', 'coupon2', 0, 5, '2025-07-10', 10, 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', '2025-07-03', 'Use the code and get 10% off your first order at Bio-First.', NULL),
(3, 'coupon3', 'coupon3', 0, 15, '2025-07-10', 10, 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', '2025-07-03', 'Use the code and get 10% off your first order at Bio-First.', NULL),
(4, 'coupon4', 'coupon4', 0, 20, '2025-07-10', 10, 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', '2025-07-03', 'Use the code and get 10% off your first order at Bio-First.', NULL),
(5, 'coupon5', 'coupon5', 1, 8000, '2025-07-10', 10, 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', '2025-07-03', 'Use the code and get 10% off your first order at Bio-First.', NULL),
(6, 'coupon6', 'coupon6', 1, 10000, '2025-07-10', 10, 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', '2025-07-03', 'Use the code and get 10% off your first order at Bio-First.', NULL),
(7, 'coupon7', 'coupon7', 1, 15000, '2025-07-10', 10, 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', '2025-07-03', 'Use the code and get 10% off your first order at Bio-First.', NULL),
(8, 'coupon8', 'coupon8', 1, 20000, '2025-07-10', 10, 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', '2025-07-03', 'Use the code and get 10% off your first order at Bio-First.', NULL),
(9, 'coupon9', 'coupon9', 1, 25000, '2025-07-10', 10, 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', '2025-07-03', 'Use the code and get 10% off your first order at Bio-First.', NULL),
(10, 'coupon10', 'coupon10', 1, 30000, '2025-07-10', 10, 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', '2025-07-03', 'Use the code and get 10% off your first order at Bio-First.', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupon_order`
--

CREATE TABLE `coupon_order` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `value` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupon_user`
--

CREATE TABLE `coupon_user` (
  `id` bigint UNSIGNED NOT NULL,
  `coupon_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_used` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favourites`
--

CREATE TABLE `favourites` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `media`
--

CREATE TABLE `media` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint UNSIGNED NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `channel_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_02_25_034148_create_permission_tables', 1),
(6, '2020_05_25_021239_create_announcements_table', 1),
(7, '2020_05_29_020244_create_password_histories_table', 1),
(8, '2020_07_06_215139_create_activity_log_table', 1),
(9, '2021_04_05_153840_create_two_factor_authentications_table', 1),
(10, '2023_04_25_161657_create_sessions_table', 1),
(11, '2023_10_16_095220_create_categories_table', 1),
(12, '2023_10_22_160825_create_products_table', 1),
(13, '2023_10_22_161355_create_product_detail_table', 1),
(14, '2023_10_22_162540_create_product_image_table', 1),
(15, '2023_10_22_164100_create_category_product_table', 1),
(16, '2023_11_13_165729_create_coupons_table', 1),
(17, '2023_11_15_150508_modify_description_column_in_coupons_table', 1),
(18, '2023_11_16_163445_create_carts_table', 1),
(19, '2023_12_01_223321_create_orders_table', 1),
(20, '2023_12_01_223329_create_coupon_user_table', 1),
(21, '2023_12_05_205638_add_column_is_used_in_coupon_user_table', 1),
(22, '2023_12_06_210749_delete_column_size_color_price_in_carts_table', 1),
(23, '2023_12_06_211340_create_sales_table', 1),
(24, '2023_12_06_211412_create_product_sale_table', 1),
(25, '2023_12_18_104618_create_address_order_table', 1),
(26, '2023_12_18_104723_modify_orders_table', 1),
(27, '2023_12_18_104748_create_product_order_table', 1),
(28, '2023_12_18_154029_modify_status_in_orders_table', 1),
(29, '2023_12_19_133543_add_column_code_order_in_orders_table', 1),
(30, '2023_12_20_112122_add_column_sub_total_in_orders_table', 1),
(31, '2023_12_20_113154_add_column_product_name_and_product_id_in_product_order_table', 1),
(32, '2023_12_20_134541_delete_sale_column_in_product_detail_table', 1),
(33, '2023_12_27_153037_add_status_column_in_coupons_table', 1),
(34, '2023_12_28_095231_create_staff_table', 1),
(35, '2023_12_28_163612_add_soft_delete_in_staff_table', 1),
(36, '2024_01_02_104211_add_avatar_column_in_users_table', 1),
(37, '2024_01_13_212919_modify_column_bio_in_staff_table', 1),
(38, '2024_01_19_153040_add_type_sale_column_in_product_sale_table', 1),
(39, '2024_01_23_195040_create_channels_table', 1),
(40, '2024_01_23_195101_create_channle_user_table', 1),
(41, '2024_01_23_195114_create_messages_table', 1),
(42, '2024_01_23_195929_create_media_table', 1),
(43, '2024_01_25_133717_add_product_name_column_in_product_order_table', 1),
(44, '2024_01_26_003243_add_soft_delete_in_coupons_table', 1),
(45, '2024_01_26_012629_create_coupon_order_table', 1),
(46, '2024_01_26_013000_add_coupon_order_id_column_in_orders_table', 1),
(47, '2024_01_31_153152_add_product_detail_id_in_product_order_table', 1),
(48, '2024_01_31_174938_add_is_return_order_in_orders_table', 1),
(49, '2024_02_04_160346_create_favourites_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Domains\\Auth\\Models\\User', 1),
(2, 'App\\Domains\\Auth\\Models\\User', 3),
(2, 'App\\Domains\\Auth\\Models\\User', 4),
(2, 'App\\Domains\\Auth\\Models\\User', 5),
(2, 'App\\Domains\\Auth\\Models\\User', 6),
(2, 'App\\Domains\\Auth\\Models\\User', 7),
(3, 'App\\Domains\\Auth\\Models\\User', 8),
(3, 'App\\Domains\\Auth\\Models\\User', 9),
(3, 'App\\Domains\\Auth\\Models\\User', 10),
(3, 'App\\Domains\\Auth\\Models\\User', 11),
(3, 'App\\Domains\\Auth\\Models\\User', 12),
(3, 'App\\Domains\\Auth\\Models\\User', 13);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `code_order` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `address_order_id` bigint UNSIGNED NOT NULL,
  `status` enum('0','1','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `total` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_method` enum('1','2','3') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `sub_total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `coupon_order_id` bigint UNSIGNED DEFAULT NULL,
  `is_return_order` enum('0','1','2') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `status_return_order` enum('0','1','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `code_order`, `user_id`, `address_order_id`, `status`, `total`, `ship`, `customer_name`, `customer_email`, `customer_phone`, `note`, `payment_method`, `sub_total`, `created_at`, `updated_at`, `coupon_order_id`, `is_return_order`, `status_return_order`) VALUES
(1, 'zUAOEtzdgG', 13, 1, '2', '146501', '36501', 'Hung Dao', 'cccc@gmail.com', '0987654321', '', '2', 110000, '2025-07-03 04:21:52', '2025-07-03 04:23:45', NULL, '0', '1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_histories`
--

CREATE TABLE `password_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_histories`
--

INSERT INTO `password_histories` (`id`, `model_type`, `model_id`, `password`, `created_at`, `updated_at`) VALUES
(1, 'App\\Domains\\Auth\\Models\\User', 1, '$2y$10$o6YOV.FdSpfNgJiz4eOjd.ChN530wFE4i5HcQm5jpavOWe4GjyAJ6', '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(2, 'App\\Domains\\Auth\\Models\\User', 2, '$2y$10$eWO65Zl74XeQybo9qU.s4.zureQMg.PA/IV2l8W9qNc5fgNZUmW4i', '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(3, 'App\\Domains\\Auth\\Models\\User', 3, '$2y$10$VIXTyPL2.XaTskmfBLV1A.E3rhs0Fj330QgJeYygr24MGQ.njMUFa', '2025-07-03 04:10:48', '2025-07-03 04:10:48'),
(4, 'App\\Domains\\Auth\\Models\\User', 4, '$2y$10$WW.2X/MDplKGGVcTUziHku6sQwTpnEO9qzHRioF9TwM/Gtcoi4QQa', '2025-07-03 04:10:48', '2025-07-03 04:10:48'),
(5, 'App\\Domains\\Auth\\Models\\User', 5, '$2y$10$QRlyhY9q39Q3INox0Sxmr.YIOg94BVs6Ifsa4WrfBSdsuoc7TexYG', '2025-07-03 04:10:48', '2025-07-03 04:10:48'),
(6, 'App\\Domains\\Auth\\Models\\User', 6, '$2y$10$OM20OKxjO/dBE03gM1IxzuUPrYMScS5F0pWYSnRr6Y6BgEUH/VBfW', '2025-07-03 04:10:48', '2025-07-03 04:10:48'),
(7, 'App\\Domains\\Auth\\Models\\User', 7, '$2y$10$cLJd9JCCNx7FIfNSJ/duq.k/HQOfTYwgZ0p/WnnxkZfvCC/86kBAq', '2025-07-03 04:10:48', '2025-07-03 04:10:48'),
(8, 'App\\Domains\\Auth\\Models\\User', 8, '$2y$10$fyr.iOi/vgr5Dl3wCYLUz.Ty4bNurOhbUgzEMBCJfQjXbFsMAI1Yi', '2025-07-03 04:10:48', '2025-07-03 04:10:48'),
(9, 'App\\Domains\\Auth\\Models\\User', 9, '$2y$10$dGSjzza9QrHmPkZDUHTD2.win2G1cHh6HPBhjnndiCFwmWEPV9ahi', '2025-07-03 04:10:48', '2025-07-03 04:10:48'),
(10, 'App\\Domains\\Auth\\Models\\User', 10, '$2y$10$L7beFl4IVU1OJ6vzXT3FkuW.3f9QRlAtTifxoUV/rPgn1CTxmu6ri', '2025-07-03 04:10:48', '2025-07-03 04:10:48'),
(11, 'App\\Domains\\Auth\\Models\\User', 11, '$2y$10$/PfdoT448DoKOpOAJ9z9HeceY1HGbzXSkoJJshiYOnPtpJ.Kk5MDm', '2025-07-03 04:10:48', '2025-07-03 04:10:48'),
(12, 'App\\Domains\\Auth\\Models\\User', 12, '$2y$10$S/7byiv5m50rJpr61jwYH.8FLe1hcXRKOfPWvNQ6feuW/6JTMwnFu', '2025-07-03 04:10:48', '2025-07-03 04:10:48'),
(13, 'App\\Domains\\Auth\\Models\\User', 13, '$2y$10$RP1jT0tmSOKobRlO3yxG6uY4idZxffzhFWauSx6iI0KJae1ajLzV.', '2025-07-03 04:16:05', '2025-07-03 04:16:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `sort` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `type`, `guard_name`, `name`, `description`, `parent_id`, `sort`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', 'admin.access.user', 'All User Permissions', NULL, 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(2, 'admin', 'web', 'admin.access.user.list', 'View Users', 1, 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(3, 'admin', 'web', 'admin.access.user.deactivate', 'Deactivate Users', 1, 2, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(4, 'admin', 'web', 'admin.access.user.reactivate', 'Reactivate Users', 1, 3, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(5, 'admin', 'web', 'admin.access.user.clear-session', 'Clear User Sessions', 1, 4, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(6, 'admin', 'web', 'admin.access.user.impersonate', 'Impersonate Users', 1, 5, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(7, 'admin', 'web', 'admin.access.user.change-password', 'Change User Passwords', 1, 6, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(8, 'user', 'web', 'user.category', 'Category management', NULL, 2, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(9, 'user', 'web', 'user.category.create', 'Create category', 8, 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(10, 'user', 'web', 'user.category.edit', 'Edit category', 8, 2, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(11, 'user', 'web', 'user.category.view', 'View list category', 8, 3, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(12, 'user', 'web', 'user.category.disabled', 'Disable category', 8, 4, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(13, 'user', 'web', 'user.category.detail', 'Detail category', 8, 5, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(14, 'user', 'web', 'user.category.trash', 'Trash category', 8, 6, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(15, 'user', 'web', 'user.product', 'Product management', NULL, 3, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(16, 'user', 'web', 'user.product.create', 'Create product', 15, 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(17, 'user', 'web', 'user.product.edit', 'Edit product', 15, 2, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(18, 'user', 'web', 'user.product.view', 'View list product', 15, 3, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(19, 'user', 'web', 'user.product.disabled', 'Disable product', 15, 4, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(20, 'user', 'web', 'user.product.detail', 'Detail product', 15, 5, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(21, 'user', 'web', 'user.product.trash', 'Trash product', 15, 6, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(22, 'user', 'web', 'user.management', 'Account management', NULL, 4, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(23, 'user', 'web', 'user.management.staff', 'User management staff', 22, 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(24, 'user', 'web', 'user.management.customer', 'User management customer', 22, 2, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(25, 'user', 'web', 'user.cart', 'Cart management', NULL, 5, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(26, 'user', 'web', 'user.cart.create', 'Create cart', 25, 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(27, 'user', 'web', 'user.cart.edit', 'Edit cart', 25, 2, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(28, 'user', 'web', 'user.cart.view', 'View list cart', 25, 3, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(29, 'user', 'web', 'user.cart.disabled', 'Disable cart', 25, 4, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(30, 'user', 'web', 'user.coupon', 'Coupon management', NULL, 6, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(31, 'user', 'web', 'user.coupon.create', 'Create coupon', 30, 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(32, 'user', 'web', 'user.coupon.edit', 'Edit coupon', 30, 2, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(33, 'user', 'web', 'user.coupon.view', 'View list coupon', 30, 3, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(34, 'user', 'web', 'user.coupon.disabled', 'Disable coupon', 30, 4, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(35, 'user', 'web', 'user.coupon.detail', 'Detail coupon', 30, 5, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(36, 'user', 'web', 'user.order', 'Order management', NULL, 7, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(37, 'user', 'web', 'user.order.create', 'Create order', 36, 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(38, 'user', 'web', 'user.order.edit', 'Edit order', 36, 2, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(39, 'user', 'web', 'user.order.view', 'View list order', 36, 3, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(40, 'user', 'web', 'user.order.disabled', 'Disable order', 36, 4, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(41, 'user', 'web', 'user.order.detail', 'Detail order', 36, 5, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(42, 'user', 'web', 'user.role-permission.management', 'Role - Permission management', NULL, 8, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(43, 'user', 'web', 'user.sale', 'Sale management', NULL, 9, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(44, 'user', 'web', 'user.sale.create', 'Create sale', 43, 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(45, 'user', 'web', 'user.sale.edit', 'Edit sale', 43, 2, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(46, 'user', 'web', 'user.sale.view', 'View list sale', 43, 3, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(47, 'user', 'web', 'user.sale.disabled', 'Disable sale', 43, 4, '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(48, 'user', 'web', 'user.sale.detail', 'Detail sale', 43, 5, '2025-07-03 04:10:46', '2025-07-03 04:10:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `creator_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `creator_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nhẫn Bạc S925 Thăng Long Helios Silver Original', 'nhan-bac-s925-thang-long-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Chế tác kỷ niệm nhân dịp năm mới 2024 Giáp Thìn, lấy cảm hứng từ rồng thời Lý, hình tượng rồng mang nét thuần Việt nhất trong các triều đại xưa.\r\n                            Rồng thời Lý hiện lên với đầy đủ những đặc trưng: Thân rồng uốn nhịp hình sin uyển chuyển quanh đai nhẫn, bờm phất phơ theo gió, râu lượn như sóng nước, miệng ngậm ngọc quý.\r\n                            Cách điệu mây và tre càng thể hiện rõ ý nghĩa của rồng thời Lý, của chiếc nhẫn Thăng long này.\r\n                            Đó chính là khí thế vươn tới trời cao của dân tộc và sự phát triển phồn thịnh của đất nước Việt Nam.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(2, 'Nhẫn Bạc S925 Horus Ring x Tattoo Chair Helios Silver Original', 'nhan-bac-s925-horus-ring-x-tattoo-chair-helios-silver-original', 'Câu chuyện từ nhà thiết kế:\r\nLấy cảm hứng từ vị thần Horus của Ai Cập, Helios đã cùng Tattoo Chair tạo nên chế tác nhẫn mới: Horus!\r\nVới dáng signet quyền lực, mặt nhẫn được chạm khắc tỉ mỉ hình ảnh thần Horus đầu chim ưng, bao quanh bởi phần viền mô phỏng loài rắn sa mạc.\r\nHai bên đai nhẫn nhấn nhá thêm bằng những biểu tượng thiêng liêng trong văn hóa Ai Cập: Ký tự Ankh quyền năng, kim tự tháp bí ẩn và đặc biệt là con mắt Horus - con mắt ngàn năm tượng trưng cho sức mạnh và sự bảo hộ lâu dài.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(3, 'Nhẫn Bạc S925 Combatant Helios Silver Original', 'nhan-bac-s925-combatant-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Không có trận chiến nào dễ dàng, mọi thắng lợi luôn phải đánh đổi bằng mồ hôi, nước mắt và thậm chí là máu.\r\nĐó chính là thông điệp ẩn sau Bloodstone - loại đá tượng trưng cho vệt máu chiến binh, cho lòng dũng cảm được tôi rèn nơi chiến trường.\r\nKhi xưa, Bloodstone cũng được các chiến binh Hy Lạp đem bên mình khi ra trận để tiếp thêm sức mạnh và khả năng chống chịu.\r\nTừ ý nghĩa ấy, Helios đã tạo nên chế tác nhẫn mới Combatant, kết hợp mặt đá Bloodstone cứng cỏi cùng họa tiết kiến trúc Hy Lạp đặc trưng.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(4, 'Nhẫn Bạc S925 Aurora Helios Silver Original', 'nhan-bac-s925-aurora-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Chế tác đầu tiên của năm 2024: Nhẫn Aurora.\r\n                                “Aurora” mang nghĩa là rạng đông, thời khắc đất trời và vạn vật khởi đầu ngày mới với một nguồn sinh khí dồi dào.\r\n                                Chiếc nhẫn mang thiết kế hình thoi cùng họa tiết Lotus độc bản, đại diện cho năng lượng cân bằng và mạnh mẽ nhất.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(5, 'Nhẫn Bạc S925 Sage Ring Helios Silver Original', 'nhan-bac-s925-sage-ring-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Chế tác ra đời dựa trên câu chuyện về Viên đá của nhà hiền triết (Lapis Philosophorum) hay còn gọi là Hòn đá giả kim.\r\n                        Tương truyền, nó là biểu tượng trung tâm của giả kim thuật, tạo nên từ 4 nguyên tố của sự sống Đất - Nước - Lửa - Khí.\r\n                        Người sở hữu có khả năng tạo ra mọi vật chất, chữa lành bách bệnh hay thậm chí nắm giữ chìa khóa của sự bất tử.\r\n                        Cái tên Sage mang nghĩa là nhà hiền triết, đồng thời mặt đá Lapis ở trung tâm cũng gợi nhắc đến tên gọi của đá giả kim trong tiếng Latin.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(6, 'Nhẫn Bạc S925 Legal Helios Silver Original', 'nhan-bac-s925-legal-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Chế tác được thiết kế với mặt nhẫn khắc nổi hình quân vua, kết hợp đường lưới tượng trưng cho các ô cờ đen trắng.\r\nThân nhẫn qua kỹ thuật cut out tỉ mỉ đã trở thành điểm nhấn độc đáo, đậm chất sắc sảo của nghệ thuật Gothic.\r\nLEGAL gợi đến bộ quy tắc, luật chơi trong cờ vua, mang ý nghĩa rằng kỷ luật chính là thói quen của người đàn ông thực thụ.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(7, 'Nhẫn Bạc S925 Pusi Helios Silver Original', 'nhan-bac-s925-pusi-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Chiếc nhẫn Pusi lấy cảm hứng từ đỉnh Phan Xi Păng - đỉnh núi cao nhất tại Việt Nam và cả khu vực Đông Dương.\r\n\r\nHình ảnh ấy được tái hiện bằng những chi tiết chóp núi, đan xen là biểu trưng Lotus khắc nổi sắc nét.\r\n\r\nTượng trưng cho hành trình chinh phục thử thách và vươn tới đỉnh trời, hay nói cách khác là chạm đến những cột mốc vĩ đại trong cuộc sống.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(8, 'Nhẫn thời trang nam nữ Helios Black Heart Ring', 'nhan-thoi-trang-nam-nu-helios-black-heart-ring', 'Câu chuyện của sản phẩm: Black Heart Ring cách điệu từ hình ảnh hoa hướng dương, giữ trọn nét mềm mại và thêm vào tinh thần gai góc, bụi bặm đặc trưng của nghệ thuật Gothic.\r\nChiếc nhẫn được thiết kế với đai nhẫn hở, mang đến trải nghiệm phóng khoáng thoải mái khi đeo.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(9, 'Nhẫn Bạc S925 Clytze Old Detail Helios Silver Original', 'nhan-bac-s925-clytze-old-detail-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Chiếc nhẫn Old Detail lấy cảm hứng từ truyền thuyết về loài hoa hướng dương.\r\nDựa trên nét đặc trưng của kiến trúc Gothic, chế tác được hoàn thiện với đường cut-out sắc khỏe, tạo nên dải hoa văn Sunflower độc đáo.\r\nCái tên Old Detail gợi lên một vẻ đẹp có chút cổ điển nhưng mãi trường tồn, cũng giống như chính tình yêu đôi lứa vậy.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(10, 'Nhẫn Bạc S925 Cro Red Helios Silver Original', 'nhan-bac-s925-cro-red-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Chế tác mang hình ảnh của một con rắn uốn lượn với đôi mắt đỏ rực mê hoặc.\r\nĐây là loài vật tượng trưng cho những ý niệm phức tạp, nó được tôn sùng như một thực thể huyền bí, hiện thân của thánh thần, tái sinh, bảo hộ hoặc sự hủy diệt, cám dỗ, hỗn loạn.\r\nVừa thiêng liêng cũng vừa gây khiếp sợ, ám ảnh, chính vì thế mà tạo nên sức hút hấp dẫn trí tò mò của con người.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(11, 'Nhẫn Bạc S925 Nương Helios Silver Original', 'nhan-bac-s925-nuong-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Mỗi linh hồn con người đều được hoàn thiện bởi 1 nửa ánh sáng và 1 nửa bóng tối.\r\nMột nửa hướng thiện, thanh khiết như đóa sen, trong trẻo tựa thiếu nữ. Một nửa hướng ác, hiểm độc như nọc rắn, khiến người đời phải sợ hãi, dè chừng.\r\nRanh giới ở giữa vốn rất mong manh, chỉ cần không vững vàng, con người sẽ đánh mất bản ngã của mình, sa chân vào màn đêm của sự xấu xa.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(12, 'Nhẫn Bạc S925 Poseidon Helios Silver Original', 'nhan-bac-s925-poseidon-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Nhẫn Poseidon dựa trên vị vua cai quản đại dương trong thần thoại Hy Lạp, có quyền năng thao túng những cơn sóng thần cuộn trào.\r\nNổi bật trên mặt nhẫn là họa tiết đinh ba, vỏ sò, những đường lượn sóng, cùng hai dãy ký tự POSEIDON và ΠΟΣΕΙΔΩΝ - tên của vị thần viết bằng chữ Hy Lạp cổ.\r\nVới form tròn và đường nét khỏe khoắn, chế tác Poseidon mang đến cho anh em vẻ ngoài phóng khoáng, táo bạo đúng với tinh thần khám phá của BST Atlantis.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(13, 'Nhẫn Bạc S925 Dreamy Helios Silver Original', 'nhan-bac-s925-dreamy-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Những định kiến xưa cũ luôn bó buộc vẻ dẹp của người phụ nữ chỉ dừng lại ở việc phải thật dịu dàng, thùy mị.\r\n                                Thế nhưng mọi người biết không, những người phụ nữ thân yêu của chúng ta còn hơn thế nữa. \r\n                                Họ tình cảm, họ mạnh mẽ, họ độc lập. Họ quyến rũ, sắc sảo nhưng vẫn không kém phần mềm mại.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(14, 'Nhẫn Bạc S925 Rome Helios Silver Original', 'nhan-bac-s925-rome-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Lấy cảm hứng từ kỳ quan kiến trúc mang tên đấu trường La Mã.\r\n                                Tái hiện kết cấu độc đáo và bền bỉ qua thời gian của công trình này.\r\n                                Đóng vai trò như một chứng nhân lịch sử, đánh dấu thời đại hoàng kim đế chế La Mã hùng mạnh.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(15, 'Nhẫn Bạc S925 Tea Lotus Helios Silver Original', 'nhan-bac-s925-tea-lotus-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Nằm trong BST Lotus của Helios, chế tác mới nhất dưới đây chắc chắn sẽ không làm anh em thất vọng.\r\n\r\nTea Lotus nổi bật với mặt nhẫn hình tam giác, được kết hợp từ nhiều bông hoa sen sắc sảo. Chính thiết kế này tạo nên cách đeo và phối cực mới mẻ, gây chú ý mạnh mẽ với người xung quanh.\r\n\r\nBằng cách đeo đồng thời cả 2 chiếc, anh em sẽ có ngay một món chế tác mặt hình thoi sắc cạnh, sở hữu nét đẹp vừa khỏe khoắn vừa độc đáo.\r\n\r\nVới tính chất cân xứng của tam giác lẫn hình thoi, Tea Lotus cũng chứa đựng những ý niệm về sự cân bằng, hài hòa giữa mọi yếu tố, khía cạnh trong cuộc sống của ta.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(16, 'Dây chuyền nam Helios Mắt Xích Bạc', 'day-chuyen-nam-helios-mat-xich-bac', 'Dây chuyền là món phụ kiện gần như sẽ thu hút ánh nhìn và để lại ấn tượng rất lớn với người đối diện, thế nên món phụ kiện này là thứ không thế thiếu trong set đồ của bạn.\r\n\r\n1. Yên tâm về chất lượng\r\nCác mẫu Dây chuyền nam, vòng cổ nam  tại Helios được lựa chọn và sàng lọc một cách kĩ càng về chất lượng, với chất liệu và dây được làm từ hợp kim trắng, đá, dây dù... cực kì chắc chắn và bền bỉ theo thời gian.\r\n\r\n2. Mẫu mã đa dạng\r\nLuôn luôn update những mẫu mặt dây chuyền theo mùa, theo trend, theo phong cách của giới trẻ, đã có hơn 100 mẫu dây chuyền cập bên tại Helios, với nhiều chất liệu, kiểu cách. Và không dừng ở con số đó, mỗi ngày Helios đều sẽ tiếp tục update các mẫu sản phẩm mới.\r\n\r\n3. Giá cả hợp lý \r\nĐến với các sản phẩm của Helios, khách hàng có quyền yên tâm về sản phẩm với mức giá mình bỏ ra. Luôn có các event, các ưu đãi cho khách hàng mới, tri ân khách hàng cũ. \r\n\r\nNgoài ra, các sản phẩm của Helios đều có chế độ bảo hành theo từng dòng sản phẩm, chúng tôi làm tất cả để khách hàng có thể yên tâm khi sử dụng sản phẩm tại Helios.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(17, 'Dây chuyền nam, nữ Helios Gravitate DCN200', 'day-chuyen-nam-nu-helios-gravitate-dcn200', 'Dây chuyền là món phụ kiện gần như sẽ thu hút ánh nhìn và để lại ấn tượng rất lớn với người đối diện, thế nên món phụ kiện này là thứ không thế thiếu trong set đồ của bạn.\r\n\r\n1. Yên tâm về chất lượng\r\nCác mẫu Dây chuyền nam, vòng cổ nam  tại Helios được lựa chọn và sàng lọc một cách kĩ càng về chất lượng, với chất liệu và dây được làm từ hợp kim trắng, đá, dây dù... cực kì chắc chắn và bền bỉ theo thời gian.\r\n\r\n2. Mẫu mã đa dạng\r\nLuôn luôn update những mẫu mặt dây chuyền theo mùa, theo trend, theo phong cách của giới trẻ, đã có hơn 100 mẫu dây chuyền cập bên tại Helios, với nhiều chất liệu, kiểu cách. Và không dừng ở con số đó, mỗi ngày Helios đều sẽ tiếp tục update các mẫu sản phẩm mới.\r\n\r\n3. Giá cả hợp lý \r\nĐến với các sản phẩm của Helios, khách hàng có quyền yên tâm về sản phẩm với mức giá mình bỏ ra. Luôn có các event, các ưu đãi cho khách hàng mới, tri ân khách hàng cũ. \r\n\r\nNgoài ra, các sản phẩm của Helios đều có chế độ bảo hành theo từng dòng sản phẩm, chúng tôi làm tất cả để khách hàng có thể yên tâm khi sử dụng sản phẩm tại Helios.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(18, 'Dây Chuyền Bạc S925 Triarchy Helios Silver Original', 'day-chuyen-bac-s925-triarchy-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Tổng lãnh Thiên sứ, hay còn được gọi là Archangels, là những thực thể thiêng liêng dẫn đầu trong cuộc chiến giữa Thiên đàng và Địa ngục. \r\n\r\nBa vị đứng đầu trong hàng ngũ các Archangels là Michael, Gabriel và và Raphael, lần lượt đại diện cho ba ý niệm Bảo vệ - Truyền tin - Chữa lành.\r\n\r\nHọ oai vệ, quyền năng như những chiến binh của trời, sẵn sàng hy sinh để thực hiện nhiệm vụ cao cả của mình, xứng đáng với vị thế thủ lĩnh nơi Thiên đàng.\r\n\r\n3 vị Tổng lãnh Thiên sứ tối cao chính là nguồn cảm hứng cho chế tác dây chuyền Triarchy tại Helios.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(19, 'Dây Chuyền Bạc S925 Chain Helios Rise x Lotus Helios Silver Original', 'day-chuyen-bac-s925-chain-helios-rise-x-lotus-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Dây chuyền Rise x Lotus được thiết kế theo dáng Oval Cable, đặc trưng bởi các mắt xích dày khỏe khoắn và phóng khoáng.\r\n                            Phần khóa cài được chạm khắc tỉ mỉ họa tiết Lotus độc bản của Helios.\r\n                            Tạo nên một điểm nhấn đơn giản mà mạnh mẽ cho bộ trang phục của anh em.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(20, 'Dây Chuyền Bạc S925 Ngọc Trai Smile 50cm Helios Silver Original', 'day-chuyen-bac-s925-ngoc-trai-smile-50cm-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Như chính tên gọi, Smile chỉ đơn giản là biểu tượng cảm xúc mặt cười quen thuộc với chúng ta.\r\nTinh thần phá cách của Helios thể hiện qua việc phủ kín Smile với những viên đá CZ.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(21, 'Dây Chuyền Bạc S925 River Lotus 12mm Helios Silver Original - 50cm DCBN107', 'day-chuyen-bac-s925-river-lotus-12mm-helios-silver-original-50cm-dcbn107', 'Câu chuyện từ nhà thiết kế: Chế tác River Lotus được thiết kế theo dáng vòng Cuban huyền thoại. \r\nThay vì đính đá hay làm trơn, Helios đã chạm khắc tỉ mỉ hoa văn Lotus độc bản lên từng mắt xích nhỏ.\r\nToát lên một vẻ rất ngông, rất chiến khi đeo lên tay.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(22, 'Dây Chuyền Bạc S925 Cuban Twinkle Helios Silver Original', 'day-chuyen-bac-s925-cuban-twinkle-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Cuban Twinkle là chế tác mang đậm tinh thần đường phố và hiphop khi sở hữu dáng Cuban Iced Out chất ngầu và cực phá cách.\r\nTừng mắt xích của dây chuyền đều được đính tỉ mỉ 24 viên đá CZ, tạo nên vẻ ngoài không thể bị lu mờ.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(23, 'Dây Chuyền Bạc S925 Tennis Helios Silver Original', 'day-chuyen-bac-s925-tennis-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Dựa trên thiết kế của một loại trang sức được các vận động viên quần vợt 70s yêu thích, dây chuyền Tennis rất nhẹ, êm, thoải mái dù đeo ở bất cứ đâu.\r\nVẻ lấp lánh bao trọn sợi dây là điểm nhấn cực kỳ thời thượng, giúp anh em flexing mà chẳng cần phải cầu kỳ.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(24, 'Dây Chuyền Bạc S925 Hạt Ngọc Trai Trắng Helios Silver Original', 'day-chuyen-bac-s925-hat-ngoc-trai-trang-helios-silver-original', 'Mô tả\r\nCâu hỏi thường gặp\r\nTại sao nên mua Dây Chuyền Bạc tại HeliSilver?\r\n1. Cam kết về chất lượng\r\nCác mẫu Dây Chuyền Bạc nam, vòng cổ bạc nam tại HeliSilver được lựa chọn và sàng lọc một cách kĩ càng về chất lượng, với chất liệu và dây chuẩn bạc Ý hoặc bạc Thái S925, các họa tiết đính đá... bền bỉ theo thời gian.\r\n\r\n2. Mẫu mã đa dạng\r\nHeliSilver liên tục nghiên cứu và cho ra mắt nhiều mẫu mã Dây Chuyền Bạc nam, mặt Dây Chuyền Bạc nam phù hợp với phong cách, xu hướng thời thời trang của giới trẻ. Xu hướng ưu tiên các mẫu dây chuyền thiết kế giới hạn, mang đậm dấu ấn cá nhân của từng khách, đảm bảo khách hàng sẽ khó tìm thấy chiếc dây chuyền tương tự nào như tại HeliSilver có!\r\n\r\n3. Giá cả hợp lý\r\nĐến với các sản phẩm của HeliSilver, khách hàng có quyền yên tâm về sản phẩm với mức giá mình bỏ ra. Luôn có các event, các ưu đãi cho khách hàng mới, tri ân khách hàng cũ. Ngoài ra, các sản phẩm của Helíilver đều có chế độ bảo hành theo từng dòng sản phẩm, chúng tôi làm tất cả để khách hàng có thể yên tâm khi sử dụng sản phẩm tại HeliSilver.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(25, 'Dây chuyền nam, nữ Helios Dice Smile DCN225', 'day-chuyen-nam-nu-helios-dice-smile-dcn225', 'Câu chuyện từ nhà thiết kế: Giống như trò chơi xúc xắc, cuộc sống là chuỗi những thử thách đầy bất ngờ.\r\n\r\nMỗi mặt hiện lên cũng chính là một bước ngoặt mới, đòi hỏi ta phải lựa chọn hướng đi trong hoàn cảnh ấy.\r\n\r\nNhưng thay vì chạy theo một con số mơ hồ, một cái đích vô định, người đàn ông sẽ luôn giữ nụ cười để đón nhận mọi kết quả.\r\n\r\nTâm thế trầm ổn, bình thản đó mới là thứ vũ khí mạnh mẽ nhất, chứ không phải gồng mình gắng gượng.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(26, 'Vòng Tay Bạc S925 Diamond Tennis Helios Silver Original', 'vong-tay-bac-s925-diamond-tennis-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Dựa trên thiết kế vòng tay kim cương của các vận động viên quần vợt thập niên 70, Diamond Tennis rất nhẹ, êm, thoải mái dù đeo ở bất cứ đâu.\r\nVẻ lấp lánh bao trọn chiếc vòng là điểm nhấn cực kỳ thời thượng, giúp anh em flexing mà chẳng cần phải cầu kỳ.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(27, 'Vòng Tay Bạc S925 Eden x Lotus Helios Silver Original', 'vong-tay-bac-s925-eden-x-lotus-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Vòng tay Eden x Lotus được thiết kế theo dáng Foxtail Chain, đặc trưng bởi các mắt xích chữ V ấn tượng.\r\nPhần khóa cài được chạm khắc tỉ mỉ họa tiết Lotus độc bản của Helios.\r\nTạo nên một điểm nhấn đơn giản mà mạnh mẽ cho bộ trang phục của anh em.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(28, 'Vòng Tay Bạc S925 POWERFUL WHEEL Helios Silver Original', 'vong-tay-bac-s925-powerful-wheel-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Powerful Wheel sở hữu tạo hình như một chiếc bánh xe, thể hiện cho sức mạnh và sự gan góc của dân biker đích thực.\r\nĐây chính là hình ảnh đặc trưng nhất và luôn gắn liền với họ trên mọi hành trình.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(29, 'Vòng tay kim loại Helios Chain Black', 'vong-tay-kim-loai-helios-chain-black', 'Câu chuyện của sản phẩm: Chiếc vòng mới nhất tại Helios Accessories được phát triển từ dáng Byzantine Box Chain đậm chất streetwear.\r\n\r\nCác mắt xích móc nối chắc chắn, bao phủ một tông màu đen xước cực bụi bặm và phóng khoáng..\r\n\r\nPhần khóa cài đóng mở thuận tiện, đảm bảo cho trải nghiệm đeo dễ chịu nhất.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(30, 'Vòng Tay Bạc S925 Lotus x Tramhuong Helios Silver Original', 'vong-tay-bac-s925-lotus-x-tramhuong-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Vòng tay Lotus x Tramhuong là kết quả của quá trình tết dây tỉ mỉ và chắc chắn theo phong cách Macrame độc đáo.\r\n\r\nĐan xen giữa các miếng gỗ vuông phá cách là 3 mặt charm Lotus bạc Thái, tạo nên một vẻ đẹp khỏe khoắn và thô mộc cho sản phẩm.\r\n\r\nBên cạnh đó, chất liệu trầm hương sánh chìm còn sở hữu một mùi thơm tự nhiên dễ chịu, giúp tinh thần trở nên khoan khoái và thư giãn hơn. \r\n\r\nKết hợp với hình ảnh hoa sen thanh khiết, chế tác này mang ý niệm về sự bình an và thuận lợi trong cuộc sống.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(31, 'Vòng Tay Bạc S925 Chain Helios Gle x Lotus Helios Silver Original', 'vong-tay-bac-s925-chain-helios-gle-x-lotus-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Vòng tay Gle x Lotus được thiết kế theo dáng Box Chain cong, đặc trưng bởi các mắt xích hình hộp.\r\n\r\nPhần khóa cài được chạm khắc tỉ mỉ họa tiết Lotus độc bản của Helios.\r\n\r\nTạo nên một điểm nhấn đơn giản mà mạnh mẽ cho bộ trang phục của anh em.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(32, 'Vòng Tay Bạc S925 ThuanThien X Lotus Bracelet Helios Silver Original', 'vong-tay-bac-s925-thuanthien-x-lotus-bracelet-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Thuanthien x Lotus là sự kết hợp của hai biểu tượng đến từ 2 BST mang đậm tinh thần dân tộc tại Helios.\r\n\r\nNếu hoa sen kết tinh từ những phẩm chất tốt đẹp, thuần khiết nhất, thì Thuận Thiên kiếm lại thể hiện sức mạnh, ý chí đấu tranh để bảo vệ bờ cõi.\r\n\r\nĐối lập nhưng lại bổ sung hoàn hảo cho nhau, nói lên giá trị truyền thống trong văn hóa và lịch sử Việt Nam.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(33, 'Vòng Tay Bạc S925 Lotus Silk Helios Silver Original', 'vong-tay-bac-s925-lotus-silk-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Mặt trước là hoa văn Lotus chạm nổi sắc nét, biểu tượng cho vẻ đẹp tinh khiết nhưng cũng đầy bí ẩn.\r\n\r\nPhần khóa của vòng tay được thiết kế thẩm mỹ mà không làm giảm sự chắc chắn và tiện dụng khi đeo. \r\n\r\nVới kiểu dáng dày dặn và khỏe khoắn, vòng tay Lotus Silk sẽ mang đến cho anh em cảm giác tự tin, từ đó khẳng định dấu ấn thời trang của chính mình..\r\n\r\nTạo nên một điểm nhấn đơn giản mà mạnh mẽ cho bộ trang phục của anh em.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(34, 'Vòng Tay Bạc S925 Gậy Như Ý Bạc Helios Original s925 VTBN0050', 'vong-tay-bac-s925-gay-nhu-y-bac-helios-original-s925-vtbn0050', 'Câu chuyện từ nhà thiết kế: Chế tác mang tạo hình như gậy như ý của Tôn Ngộ Không trong trong Tây Du Ký.\r\n\r\nGậy Như Ý tùy tâm sử dụng, muốn lớn thì sẽ lớn, muốn nhỏ thì sẽ nhỏ, đại diện cho chí khí của con người.\r\n\r\nTên ban đầu của nó là “Định Hải Thần Trâm Thiết”, cũng nói lên ý nghĩa đó: Tâm người định thì biển lặng trời yên, tâm bất định ắt sẽ là cuồng phong bão tố.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(35, 'Vòng Tay Bạc S925 Cuban Twinkle 2 hàng đá Helios SIlver Original', 'vong-tay-bac-s925-cuban-twinkle-2-hang-da-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Cuban Twinkle là chế tác mang đậm tinh thần đường phố và hiphop khi sở hữu dáng Cuban Iced Out chất ngầu và cực phá cách.\r\n\r\nTừng mắt xích của chiếc vòng đều được đính tỉ mỉ 24 viên đá CZ, tạo nên vẻ ngoài không thể bị lu mờ.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(36, 'Vòng Tay Bạc S925 Chain Helios Rise x Lotus Helios Silver Original', 'vong-tay-bac-s925-chain-helios-rise-x-lotus-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Vòng tay Rise x Lotus được thiết kế theo dáng Oval Cable, đặc trưng bởi các mắt xích dày khỏe khoắn và phóng khoáng.\r\n\r\nPhần khóa cài được chạm khắc tỉ mỉ họa tiết Lotus độc bản của Helios.\r\n\r\nTạo nên một điểm nhấn đơn giản mà mạnh mẽ cho bộ trang phục của anh em.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(37, 'Vòng Tay Bạc S925 Ancient Dinosaurs Helios Silver Original VTBN0145', 'vong-tay-bac-s925-ancient-dinosaurs-helios-silver-original-vtbn0145', 'Ancient Dinosaurs Bracelet\r\n\r\nMỗi chiếc nhẫn, mặt dây chuyền, bông tai, vòng tay của HeliSilver đều được thiết kế và chế tác thủ công với chất liệu bạc s925 bởi các thợ kim hoàn bậc thầy tại xưởng sản xuất của chúng tôi ở Hà Nội.\r\nPhù hợp với nhiều phong cách, trang phục.\r\nThanh lịch, bụi bặm, sang trọng, từ đơn giản tới tinh tế.\r\nSản phẩm có nhiều size hoặc có thể điều chỉnh size dễ dàng, phù hợp cho mọi lứa tuổi, giới tính.\r\n\r\nVòng tay bạc nam nữ tại HeliSilver được chế tác chuẩn bạc Thái S925, cực bền bỉ theo thời gian. Nó sẽ là món phụ kiện đồng hành bên bạn qua bao thăng trầm thì vẫn luôn mới và đẹp.\r\n\r\nCác mẫu vòng tay bạc, lắc tay bạc tại HeliSilver được tuyển chọn kĩ với thiết kế đặc biệt, nhiều phong cách khác nhau, chiếc vòng tay sẽ làm nổi bật set đồ khi đi làm, đi chơi hay thậm chí là đi dự tiệc đều có thể đeo.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(38, 'Vòng Tay Bạc S925 Zenger x Lotus Helios Silver Original', 'vong-tay-bac-s925-zenger-x-lotus-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Vòng tay Zenger x Lotus được thiết kế theo dáng Curb Chain, đặc trưng bởi các mắt xích dẹt.\r\n\r\nPhần khóa cài được chạm khắc tỉ mỉ họa tiết Lotus độc bản của Helios.\r\n\r\nTạo nên một điểm nhấn đơn giản mà chất ngầu cho bộ trang phục của anh em.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(39, 'Vòng tay kim loại nam, nữ Helios Emoji VTKL0108', 'vong-tay-kim-loai-nam-nu-helios-emoji-vtkl0108', 'Câu chuyện của sản phẩm: Quay ngược thời gian, trở lại ngày tháng thanh xuân với chiếc vòng tay Emoji khỏe khoắn.\r\n\r\nĐan kết từ ngọc trai cùng phần charm emoji, skull thú vị, vừa cool ngầu lại vừa có chút nghịch ngợm.\r\n\r\nChứa đựng tinh thần của tuổi trẻ, sự tự tin vào chất riêng của bản thân. ', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(40, 'Vòng tay kim loại Helios Good Luck VTKL0072', 'vong-tay-kim-loai-helios-good-luck-vtkl0072', 'Chất liệu: Hợp kim trắng, mạ màu khi đúc, cực bền màu.\r\n\r\nSize: Phù hợp với cổ tay từ 15~20 cm.\r\n\r\nKiểu dáng: Mẫu vòng tay kim loại mix giữa kiểu xích hầm hố pha thêm sợi chain nhỏ cực kỳ tinh tế. Charm treo khắc sắc nét tạo ra vẻ đẹp hoàn mĩ cho chiếc vòng.\r\n\r\nPHONG CÁCH!\r\n\r\nĐây có lẽ là phong cách cao cấp nhất của vòng đeo tay nam. Chúng là vật dụng khá liên quan và phù hợp với suit, sơ mi, cà vạt. Sự đa dạng về kiểu dáng là vô hạn nhưng tính hiệu quả của chúng thì như nhau: là phát ngôn táo bạo cho tính cách trên cổ tay người đàn ông – những chiếc vòng lớn, trơn và sáng luôn thể hiện sự cứng rắn, mạnh mẽ, nam tính.\r\n\r\nCÁCH MIX VÒNG KIM LOẠI.\r\n\r\nHãy đeo một chiếc vòng tay kim loại khi bạn muốn nổi bật và thu hút sự chú ý của người khác, đồng thời kết hợp với quần áo đơn giản nhưng thanh lịch, sang trọng để nó tự “tỏa sáng” mỗi khi xuất hiện sau gấu tay áo của bạn. Bạn có thể chọn chiếc áo sơ mi có tay áo ngắn hơn một chút so với thông thường, điều này phụ thuộc vào độ dày của chiếc vòng mà bạn đeo trên cánh tay. Nếu chiều dài tay áo phù hợp, chiếc vòng đôi khi sẽ “lấp ló” và thu hút cái nhìn của người đối diện.\r\n\r\nNHỮNG CHÚ Ý THƯỜNG GẶP KHI ĐEO.\r\n\r\nHãy tránh xa những chiếc vòng quá hào nhoáng và lấp lánh. Vòng kim loại chỉ nên có một hay hai màu là đủ. Nếu muốn kết hợp với đồng hồ, lời khuyên chân thành là hãy chọn những chiếc vòng mỏng và ít họa tiết, bạn nên hiểu rằng đây là sự kết hợp mang tính bổ trợ chứ không phải sự kết hợp tương đương.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(41, 'Khuyên Tai Bạc S925 Devil’s Piercing Helios Silver Original', 'khuyen-tai-bac-s925-devils-piercing-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Devil’s Piercing nằm trong dự án hợp tác giữa Helios và Viet Devils - Cộng đồng fan Man United Việt Nam.\r\n\r\nChế tác dựa trên dáng Hoop cơ bản của dòng khuyên tai, được thiết kế với hình ảnh cây đinh ba khỏe khoắn của Quỷ Đỏ.\r\n\r\nĐây là chi tiết đặc trưng nhất của đội bóng MU, bởi nó toát lên khí thế hừng hực mỗi trận cầu và vẻ ngạo nghễ trên đỉnh vinh quang.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(42, 'Khuyên Tai Bạc S925 Lotus Tiny Bud Helios Silver Original', 'khuyen-tai-bac-s925-lotus-tiny-bud-helios-silver-original', 'Bảo hành: Theo chính sách bảo hành và nhận đánh sáng sản phẩm trọn đời\r\n\r\nCâu chuyện từ nhà thiết kế: Thiết kế phát triển từ chế tác Lotus Buds Stud, lấy cảm hứng từ hình ảnh hoa sen đậm chất Việt.\r\n\r\nKết hợp đường nét của nghệ thuật Gothic để tôn lên vẻ sắc sảo mà mềm mại, gai góc mà uyển chuyển.\r\n\r\nVới kích thước nhỏ chỉ bằng 2/3 Lotus Buds Stud, cực tinh tế nhưng vẫn không kém ấn tượng và chất ngầu.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(43, 'Khuyên Tai Bạc S925 Kê Túc Helios Silver Original', 'khuyen-tai-bac-s925-ke-tuc-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Xa xưa, trong dân gian lưu truyền một cách đoán mệnh thông qua tướng chân gà.\r\n\r\nNgười xem có thể tường tận điềm tốt - điềm xấu, những thuận lợi - rủi ro trong năm. Thế nhưng suy cho cùng, mọi thứ đều do chính bản thân ta quyết định.\r\n\r\nKhông thể vì sự dự báo mà thay đổi mình, không thể vì ngoại cảnh mà biến chất, trở thành một con người hoàn toàn khác.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(44, 'Khuyên Tai Bạc S925 Phi Thuyền Frieza Duong Minh Hai x Helios Silver Original', 'khuyen-tai-bac-s925-phi-thuyen-frieza-duong-minh-hai-x-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Lấy cảm hứng từ bộ manga huyền thoại Dragon Ball.\r\n\r\nPhi Thuyền Frieza dựa trên con tàu vũ trụ đưa Goku từ hành tinh Vegeta đến Trái Đất. \r\n\r\nĐây cũng là dạng tàu mà rất nhiều nhân vật m sử dụng để du hành trong không gian, trong đó có Frieza - Kẻ thù không đội trời chung của người Saiyan.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(45, 'Khuyên Tai Bạc S925 Flying Nimbus Helios Silver Original', 'khuyen-tai-bac-s925-flying-nimbus-helios-silver-original', 'Câu chuyện từ nhà thiết kế: Lấy cảm hứng từ bộ manga huyền thoại Dragon Ball.\r\n\r\nFlying Nimbus gợi nhắc tới Cân Đẩu Vân - Phương tiện di chuyển khi nhỏ của Son Goku. \r\n\r\nChỉ những ai có trái tim nhân hậu, thuần khiết, chính trực mới có thể đứng được trên đó.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(46, 'Khuyên Tai Bạc S925 Double Standard Helios Silver Original', 'khuyen-tai-bac-s925-double-standard-helios-silver-original', 'Câu chuyện từ nhà thiết kế: DOUBLE STANDARD - Tiêu chuẩn Kép. \r\nChiếc khuyên được thiết kế với 2 vòng dây kẽm song song, đại diện cho tiêu chuẩn kép mà xã hội luôn mặc định, gán ghép cho người đàn ông.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(47, 'Khuyên Tai Bạc S925 Rebellion Helios Silver Original', 'khuyen-tai-bac-s925-rebellion-helios-silver-original', 'Câu chuyện từ nhà thiết kế: REBELLION - Nổi loạn. \r\n\r\nViệc đeo khuyên ở nam giới tuy đã phổ biến, nhưng dáng ear cuff (khuyên kẹp vành) vẫn bị coi là “kỳ lạ”, “khác thường”.\r\n\r\nChế tác Rebellion được ra đời như lời phủ định mạnh mẽ đối với những quy chuẩn đó.\r\n\r\nCũng tương tự như cuộc đời của người đàn ông, không thiếu những lần nổi loạn để thể hiện cá tính của riêng mình, đấu tranh để thoát khỏi những khuôn mẫu mà gia đình - xã hội áp đặt.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(48, 'Khuyên Tai Bạc S925 Tiny Diamond 6mm Helios Silver Original KTB322', 'khuyen-tai-bac-s925-tiny-diamond-6mm-helios-silver-original-ktb322', 'Câu chuyện từ nhà thiết kế: Chế tác được hoàn thiện với tinh thần “Less is More”.\r\n\r\nKhông cần quá hào nhoáng, phô trương, chỉ đơn giản là một chiếc khuyên tai nhỏ với viên đá CZ đã đủ tôn lên bộ trang phục của anh em.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(49, 'Helios Watch Sun', 'helios-watch-sun', 'Chất liệu vỏ: Thép không gỉ 316L được đa số hãng đồng hồ lớn sử dụng, mạ màu vàng hồng và màu bạc đánh xước, không bị phai màu\r\n\r\n                Mặt đồng hồ: 40mm\r\n                \r\n                Mặt kính: Kính Minerals, dày 2mm\r\n                \r\n                Chất liệu dây: Da thật Genuine Leather\r\n                \r\n                Size dây: 22mm\r\n                \r\n                Máy sử dụng: Miyota 2115. Máy sản xuất tại NHẬT BẢN hãng Miyota\r\n                \r\n                Chống nước 3 ATM', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(50, 'Dây da đồng hồ Apple Watch Lotus', 'day-da-dong-ho-apple-watch-lotus', 'Tác phẩm mới này sự kết hợp hoàn hảo bởi đôi bàn tay của người thợ da lành nghề và người thợ kim hoàn bậc thầy.\r\n                            Được hoàn thiện bằng:\r\n                            ▪️ Chất liệu Da Epsom cho bản phối màu đen.\r\n                            ▪️ Charm bạc s925 đính đá Cz.\r\n                            Sản phẩm được gia công phù hợp cho 2 size khác nhau cho Apple Watch.', 1, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_detail`
--

CREATE TABLE `product_detail` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_detail`
--

INSERT INTO `product_detail` (`id`, `product_id`, `size`, `color`, `quantity`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, '50 - 52 mm', 'Bạc', 100, 50000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(2, 1, '53 - 55 mm', 'Bạc', 100, 60000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(3, 1, '56 - 58 mm', 'Bạc', 100, 70000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(4, 1, '59 - 60 mm', 'Bạc', 100, 80000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(5, 1, '50 - 52 mm', 'Bạc', 100, 90000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(6, 2, '50 - 52 mm', 'Bạc', 99, 50000, '2025-07-03 04:10:46', '2025-07-03 04:16:18', NULL),
(7, 2, '53 - 55 mm', 'Bạc', 99, 60000, '2025-07-03 04:10:46', '2025-07-03 04:16:18', NULL),
(8, 2, '56 - 58 mm', 'Bạc', 100, 70000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(9, 2, '59 - 60 mm', 'Bạc', 100, 80000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(10, 2, '50 - 52 mm', 'Vàng', 100, 90000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(11, 3, '50 - 52 mm', 'Bạc', 100, 100000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(12, 3, '53 - 55 mm', 'Bạc', 100, 120000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(13, 3, '56 - 58 mm', 'Bạc', 100, 135000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(14, 3, '59 - 60 mm', 'Bạc', 100, 150000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(15, 3, '50 - 52 mm', 'Vàng', 100, 200000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(16, 4, '50 - 52 mm', 'Bạc', 100, 100000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(17, 4, '53 - 55 mm', 'Bạc', 100, 120000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(18, 4, '56 - 58 mm', 'Bạc', 100, 135000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(19, 4, '59 - 60 mm', 'Bạc', 100, 150000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(20, 4, '50 - 52 mm', 'Vàng', 100, 200000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(21, 5, '50 - 52 mm', 'Đồng', 100, 100000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(22, 5, '53 - 55 mm', 'Bạc', 100, 120000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(23, 5, '56 - 58 mm', 'Bạc', 100, 135000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(24, 5, '59 - 60 mm', 'Bạc', 100, 150000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(25, 5, '50 - 52 mm', 'Vàng', 100, 200000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(26, 6, '50 - 52 mm', 'Đồng', 99, 100000, '2025-07-03 04:10:46', '2025-07-03 04:22:34', NULL),
(27, 6, '53 - 55 mm', 'Bạc', 99, 120000, '2025-07-03 04:10:46', '2025-07-03 04:22:34', NULL),
(28, 6, '56 - 58 mm', 'Bạc', 100, 135000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(29, 6, '59 - 60 mm', 'Bạc', 100, 150000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(30, 6, '50 - 52 mm', 'Vàng', 100, 200000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(31, 7, '50 - 52 mm', 'Đồng', 100, 100000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(32, 7, '53 - 55 mm', 'Bạc', 100, 120000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(33, 7, '56 - 58 mm', 'Bạc', 100, 135000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(34, 7, '59 - 60 mm', 'Bạc', 100, 150000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(35, 7, '50 - 52 mm', 'Vàng', 100, 200000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(36, 8, '50 - 52 mm', 'Đồng', 100, 100000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(37, 8, '53 - 55 mm', 'Bạc', 100, 120000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(38, 8, '56 - 58 mm', 'Bạc', 100, 135000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(39, 8, '59 - 60 mm', 'Bạc', 100, 150000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(40, 8, '50 - 52 mm', 'Vàng', 100, 200000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(41, 9, '50 - 52 mm', 'Đồng', 100, 100000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(42, 9, '53 - 55 mm', 'Bạc', 100, 120000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(43, 9, '56 - 58 mm', 'Bạc', 100, 135000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(44, 9, '59 - 60 mm', 'Bạc', 100, 150000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(45, 9, '50 - 52 mm', 'Vàng', 100, 200000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(46, 10, '50 - 52 mm', 'Đồng', 100, 100000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(47, 10, '53 - 55 mm', 'Bạc', 100, 120000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(48, 10, '56 - 58 mm', 'Bạc', 100, 135000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(49, 10, '59 - 60 mm', 'Bạc', 100, 150000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(50, 10, '50 - 52 mm', 'Vàng', 100, 200000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(51, 11, '60 - 62 mm', 'Xanh', 300, 300000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(52, 11, '63 - 65 mm', 'Xanh', 300, 320000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(53, 11, '66 - 68 mm', 'Xanh', 150, 340000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(54, 11, '69 - 70 mm', 'Bạc', 100, 350000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(55, 11, '71 - 72 mm', 'Vàng', 100, 400000, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(56, 12, '60 - 62 mm', 'Bạc', 300, 300000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(57, 12, '63 - 65 mm', 'Xanh', 300, 320000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(58, 12, '66 - 68 mm', 'Xanh', 150, 340000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(59, 12, '69 - 70 mm', 'Bạc', 100, 350000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(60, 12, '71 - 72 mm', 'Vàng', 100, 400000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(61, 13, '60 - 62 mm', 'Bạc', 300, 300000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(62, 13, '63 - 65 mm', 'Xanh', 300, 320000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(63, 13, '66 - 68 mm', 'Xanh', 150, 340000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(64, 13, '69 - 70 mm', 'Bạc', 100, 350000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(65, 13, '71 - 72 mm', 'Vàng', 100, 400000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(66, 14, '60 - 62 mm', 'Bạc', 300, 300000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(67, 14, '63 - 65 mm', 'Xanh', 300, 320000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(68, 14, '66 - 68 mm', 'Xanh', 150, 340000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(69, 14, '69 - 70 mm', 'Bạc', 100, 350000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(70, 14, '71 - 72 mm', 'Vàng', 100, 400000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(71, 15, '60 - 62 mm', 'Bạc', 300, 300000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(72, 15, '63 - 65 mm', 'Bạc', 300, 320000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(73, 15, '66 - 68 mm', 'Bạc', 150, 340000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(74, 15, '69 - 70 mm', 'Bạc', 100, 350000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(75, 15, '71 - 72 mm', 'Vàng', 100, 400000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(76, 15, '60 - 62 mm', 'Xanh', 300, 300000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(77, 15, '63 - 65 mm', 'Xanh', 300, 320000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(78, 15, '66 - 68 mm', 'Xanh', 150, 340000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(79, 15, '69 - 70 mm', 'Xanh', 100, 350000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(80, 15, '73 - 74 mm', 'Vàng', 100, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(81, 16, '50 cm', 'Bạc', 50, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(82, 16, '55 cm', 'Bạc', 55, 600000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(83, 17, '50 cm', 'Bạc', 50, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(84, 17, '55 cm', 'Bạc', 55, 600000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(85, 18, '50 cm', 'Bạc', 50, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(86, 18, '55 cm', 'Bạc', 55, 600000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(87, 19, '50 cm', 'Bạc', 50, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(88, 19, '55 cm', 'Bạc', 55, 600000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(89, 20, '50 cm', 'Bạc', 50, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(90, 20, '55 cm', 'Bạc', 55, 600000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(91, 21, '50 cm', 'Bạc', 50, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(92, 21, '55 cm', 'Bạc', 55, 600000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(93, 22, '50 cm', 'Bạc', 50, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(94, 22, '55 cm', 'Bạc', 55, 600000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(95, 23, '50 cm', 'Bạc', 50, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(96, 23, '55 cm', 'Bạc', 55, 600000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(97, 24, '50 cm', 'Bạc', 50, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(98, 24, '55 cm', 'Bạc', 55, 600000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(99, 25, '50 cm', 'Bạc', 50, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(100, 25, '55 cm', 'Bạc', 55, 600000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(101, 26, '18 cm', 'Bạc', 50, 4000000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(102, 26, '20 cm', 'Bạc', 55, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(103, 27, '18 cm', 'Bạc', 50, 4000000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(104, 27, '20 cm', 'Bạc', 55, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(105, 28, '18 cm', 'Bạc', 50, 4000000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(106, 28, '20 cm', 'Bạc', 55, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(107, 29, '18 cm', 'Bạc', 50, 4000000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(108, 29, '20 cm', 'Bạc', 55, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(109, 30, '18 cm', 'Bạc', 50, 4000000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(110, 30, '20 cm', 'Bạc', 55, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(111, 31, '18 cm', 'Bạc', 50, 4000000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(112, 31, '20 cm', 'Bạc', 55, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(113, 32, '18 cm', 'Bạc', 50, 4000000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(114, 32, '20 cm', 'Bạc', 55, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(115, 33, '18 cm', 'Bạc', 50, 4000000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(116, 33, '20 cm', 'Bạc', 55, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(117, 34, '18 cm', 'Bạc', 50, 4000000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(118, 34, '20 cm', 'Bạc', 55, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(119, 35, '18 cm', 'Bạc', 50, 4000000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(120, 35, '20 cm', 'Bạc', 55, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(121, 36, '18 cm', 'Bạch Kim', 50, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(122, 36, '20 cm', 'Bạch Kim', 55, 600000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(123, 37, '18 cm', 'Bạch Kim', 50, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(124, 37, '20 cm', 'Bạch Kim', 55, 600000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(125, 38, '18 cm', 'Bạch Kim', 50, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(126, 38, '20 cm', 'Bạch Kim', 55, 600000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(127, 39, '18 cm', 'Bạch Kim', 50, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(128, 39, '20 cm', 'Bạch Kim', 55, 600000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(129, 40, '18 cm', 'Bạch Kim', 50, 500000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(130, 40, '20 cm', 'Bạch Kim', 55, 600000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(131, 41, '12 mm', 'Bạc', 50, 100000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(132, 41, '16 mm', 'Bạc', 55, 140000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(133, 42, '12 mm', 'Bạc', 50, 100000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(134, 42, '16 mm', 'Bạc', 55, 140000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(135, 43, '12 mm', 'Bạc', 50, 100000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(136, 43, '16 mm', 'Bạc', 55, 140000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(137, 44, '12 mm', 'Bạc', 50, 100000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(138, 44, '16 mm', 'Bạc', 55, 140000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(139, 45, '12 mm', 'Bạc', 50, 100000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(140, 45, '16 mm', 'Bạc', 55, 140000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(141, 46, '12 mm', 'Bạc', 50, 100000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(142, 46, '16 mm', 'Bạc', 55, 140000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(143, 47, '12 mm', 'Bạc', 50, 100000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(144, 47, '16 mm', 'Bạc', 55, 140000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(145, 48, '12 mm', 'Bạc', 50, 100000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(146, 48, '16 mm', 'Bạc', 55, 140000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(147, 49, '22 mm', 'Xanh Dương', 20, 1000000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(148, 49, '22 mm', 'Bạc', 20, 1200000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(149, 50, '22 mm', 'Đen', 50, 150000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(150, 50, '22 mm', 'Bạc', 50, 200000, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_image`
--

CREATE TABLE `product_image` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `image_path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_image`
--

INSERT INTO `product_image` (`id`, `name`, `product_id`, `image_path`, `order`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Nhan 1.1', 1, 'nhan1.1.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(2, 'Nhan 1.2', 1, 'nhan1.2.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(3, 'Nhan 1.3', 1, 'nhan1.3.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(4, 'Nhan 1.4', 1, 'nhan1.4.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(5, 'Nhan 1.5', 1, 'nhan1.5.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(6, 'Nhan 1.6', 2, 'nhan1.6.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(7, 'Nhan 1.7', 2, 'nhan1.7.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(8, 'Nhan 1.8', 2, 'nhan1.8.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(9, 'Nhan 1.9', 2, 'nhan1.9.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(10, 'Nhan 1.10', 2, 'nhan1.10.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(11, 'Nhan 1.11', 3, 'nhan1.11.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(12, 'Nhan 1.12', 3, 'nhan1.12.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(13, 'Nhan 1.13', 3, 'nhan1.13.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(14, 'Nhan 1.14', 3, 'nhan1.14.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(15, 'Nhan 1.15', 3, 'nhan1.15.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(16, 'Nhan 1.16', 4, 'nhan1.16.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(17, 'Nhan 1.17', 4, 'nhan1.17.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(18, 'Nhan 1.18', 4, 'nhan1.18.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(19, 'Nhan 1.19', 4, 'nhan1.19.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(20, 'Nhan 1.20', 4, 'nhan1.20.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(21, 'Nhan 1.21', 5, 'nhan1.21.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(22, 'Nhan 1.22', 5, 'nhan1.22.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(23, 'Nhan 1.23', 5, 'nhan1.23.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(24, 'Nhan 1.24', 5, 'nhan1.24.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(25, 'Nhan 1.25', 5, 'nhan1.25.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(26, 'Nhan 1.26', 6, 'nhan1.26.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(27, 'Nhan 1.27', 6, 'nhan1.27.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(28, 'Nhan 1.28', 6, 'nhan1.28.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(29, 'Nhan 1.29', 6, 'nhan1.29.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(30, 'Nhan 1.30', 6, 'nhan1.30.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(31, 'Nhan 1.31', 7, 'nhan1.31.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(32, 'Nhan 1.32', 7, 'nhan1.32.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(33, 'Nhan 1.33', 7, 'nhan1.33.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(34, 'Nhan 1.34', 7, 'nhan1.34.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(35, 'Nhan 1.35', 7, 'nhan1.35.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(36, 'Nhan 1.36', 8, 'nhan1.36.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(37, 'Nhan 1.37', 8, 'nhan1.37.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(38, 'Nhan 1.38', 8, 'nhan1.38.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(39, 'Nhan 1.39', 8, 'nhan1.39.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(40, 'Nhan 1.40', 8, 'nhan1.40.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(41, 'Nhan 1.41', 9, 'nhan1.41.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(42, 'Nhan 1.42', 9, 'nhan1.42.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(43, 'Nhan 1.43', 9, 'nhan1.43.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(44, 'Nhan 1.44', 9, 'nhan1.44.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(45, 'Nhan 1.45', 9, 'nhan1.45.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(46, 'Nhan 1.46', 10, 'nhan1.46.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(47, 'Nhan 1.47', 10, 'nhan1.47.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(48, 'Nhan 1.48', 10, 'nhan1.48.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(49, 'Nhan 1.49', 10, 'nhan1.49.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(50, 'Nhan 1.50', 10, 'nhan1.50.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(51, 'Nhan 1.51', 11, 'nhan1.51.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(52, 'Nhan 1.52', 11, 'nhan1.52.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(53, 'Nhan 1.53', 11, 'nhan1.53.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(54, 'Nhan 1.54', 11, 'nhan1.54.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(55, 'Nhan 1.55', 11, 'nhan1.55.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(56, 'Nhan 1.56', 12, 'nhan1.56.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(57, 'Nhan 1.57', 12, 'nhan1.57.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(58, 'Nhan 1.58', 12, 'nhan1.58.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(59, 'Nhan 1.59', 12, 'nhan1.59.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(60, 'Nhan 1.60', 12, 'nhan1.60.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(61, 'Nhan 1.61', 13, 'nhan1.61.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(62, 'Nhan 1.62', 13, 'nhan1.62.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(63, 'Nhan 1.63', 13, 'nhan1.63.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(64, 'Nhan 1.64', 13, 'nhan1.64.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(65, 'Nhan 1.65', 13, 'nhan1.65.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(66, 'Nhan 1.66', 14, 'nhan1.66.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(67, 'Nhan 1.67', 14, 'nhan1.67.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(68, 'Nhan 1.68', 14, 'nhan1.68.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(69, 'Nhan 1.69', 14, 'nhan1.69.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(70, 'Nhan 1.70', 14, 'nhan1.70.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(71, 'Nhan 1.71', 15, 'nhan1.71.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(72, 'Nhan 1.72', 15, 'nhan1.72.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(73, 'Nhan 1.73', 15, 'nhan1.73.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(74, 'Nhan 1.74', 15, 'nhan1.74.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(75, 'Nhan 1.75', 15, 'nhan1.75.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(76, 'Vong tay 1', 26, 'vongtay1.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(77, 'Vong tay 2', 26, 'vongtay2.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(78, 'Vong tay 3', 26, 'vongtay3.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(79, 'Vong tay 4', 26, 'vongtay4.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(80, 'Vong tay 5', 26, 'vongtay5.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(81, 'Vong tay 6', 27, 'vongtay6.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(82, 'Vong tay 7', 27, 'vongtay7.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(83, 'Vong tay 8', 27, 'vongtay8.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(84, 'Vong tay 9', 27, 'vongtay9.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(85, 'Vong tay 10', 27, 'vongtay10.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(86, 'Vong tay 11', 28, 'vongtay11.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(87, 'Vong tay 12', 28, 'vongtay12.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(88, 'Vong tay 13', 28, 'vongtay13.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(89, 'Vong tay 14', 28, 'vongtay14.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(90, 'Vong tay 15', 28, 'vongtay15.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(91, 'Vong tay 16', 29, 'vongtay16.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(92, 'Vong tay 17', 29, 'vongtay17.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(93, 'Vong tay 18', 29, 'vongtay18.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(94, 'Vong tay 19', 29, 'vongtay19.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(95, 'Vong tay 20', 29, 'vongtay20.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(96, 'Vong tay 21', 30, 'vongtay21.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(97, 'Vong tay 22', 30, 'vongtay22.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(98, 'Vong tay 23', 30, 'vongtay23.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(99, 'Vong tay 24', 30, 'vongtay24.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(100, 'Vong tay 25', 30, 'vongtay25.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(101, 'Vong tay 26', 31, 'vongtay26.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(102, 'Vong tay 27', 31, 'vongtay27.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(103, 'Vong tay 28', 31, 'vongtay28.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(104, 'Vong tay 29', 31, 'vongtay29.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(105, 'Vong tay 30', 31, 'vongtay30.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(106, 'Vong tay 31', 32, 'vongtay31.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(107, 'Vong tay 32', 32, 'vongtay32.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(108, 'Vong tay 33', 32, 'vongtay33.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(109, 'Vong tay 34', 32, 'vongtay34.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(110, 'Vong tay 35', 32, 'vongtay35.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(111, 'Vong tay 36', 33, 'vongtay36.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(112, 'Vong tay 37', 33, 'vongtay37.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(113, 'Vong tay 38', 33, 'vongtay38.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(114, 'Vong tay 39', 33, 'vongtay39.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(115, 'Vong tay 40', 33, 'vongtay40.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(116, 'Vong tay 41', 34, 'vongtay41.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(117, 'Vong tay 42', 34, 'vongtay42.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(118, 'Vong tay 43', 34, 'vongtay43.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(119, 'Vong tay 44', 34, 'vongtay44.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(120, 'Vong tay 45', 34, 'vongtay45.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(121, 'Vong tay 46', 35, 'vongtay46.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(122, 'Vong tay 47', 35, 'vongtay47.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(123, 'Vong tay 48', 35, 'vongtay48.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(124, 'Vong tay 49', 35, 'vongtay49.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(125, 'Vong tay 50', 35, 'vongtay50.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(126, 'Vong tay 51', 36, 'vongtay51.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(127, 'Vong tay 52', 36, 'vongtay52.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(128, 'Vong tay 53', 36, 'vongtay53.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(129, 'Vong tay 54', 36, 'vongtay54.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(130, 'Vong tay 55', 36, 'vongtay55.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(131, 'Vong tay 56', 37, 'vongtay56.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(132, 'Vong tay 57', 37, 'vongtay57.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(133, 'Vong tay 58', 37, 'vongtay58.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(134, 'Vong tay 59', 37, 'vongtay59.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(135, 'Vong tay 60', 37, 'vongtay60.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(136, 'Vong tay 61', 38, 'vongtay61.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(137, 'Vong tay 62', 38, 'vongtay62.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(138, 'Vong tay 63', 38, 'vongtay63.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(139, 'Vong tay 64', 38, 'vongtay64.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(140, 'Vong tay 65', 38, 'vongtay65.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(141, 'Vong tay 66', 39, 'vongtay66.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(142, 'Vong tay 67', 39, 'vongtay67.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(143, 'Vong tay 68', 39, 'vongtay68.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(144, 'Vong tay 69', 39, 'vongtay69.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(145, 'Vong tay 70', 39, 'vongtay70.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(146, 'Vong tay 71', 40, 'vongtay72.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(147, 'Vong tay 72', 40, 'vongtay72.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(148, 'Vong tay 73', 40, 'vongtay73.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(149, 'Vong tay 74', 40, 'vongtay74.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(150, 'Vong tay 75', 40, 'vongtay75.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(151, 'Day chuyen 1', 16, 'daychuyen1.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(152, 'Day chuyen 2', 16, 'daychuyen2.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(153, 'Day chuyen 3', 16, 'daychuyen3.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(154, 'Day chuyen 4', 16, 'daychuyen4.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(155, 'Day chuyen 5', 16, 'daychuyen5.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(156, 'Day chuyen 6', 17, 'daychuyen6.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(157, 'Day chuyen 7', 17, 'daychuyen7.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(158, 'Day chuyen 8', 17, 'daychuyen8.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(159, 'Day chuyen 9', 17, 'daychuyen9.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(160, 'Day chuyen 10', 17, 'daychuyen10.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(161, 'Day chuyen 11', 18, 'daychuyen11.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(162, 'Day chuyen 12', 18, 'daychuyen12.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(163, 'Day chuyen 13', 18, 'daychuyen13.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(164, 'Day chuyen 14', 18, 'daychuyen14.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(165, 'Day chuyen 15', 18, 'daychuyen15.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(166, 'Day chuyen 16', 19, 'daychuyen16.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(167, 'Day chuyen 17', 19, 'daychuyen17.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(168, 'Day chuyen 18', 19, 'daychuyen18.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(169, 'Day chuyen 19', 19, 'daychuyen19.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(170, 'Day chuyen 20', 19, 'daychuyen20.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(171, 'Day chuyen 21', 20, 'daychuyen21.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(172, 'Day chuyen 22', 20, 'daychuyen22.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(173, 'Day chuyen 23', 20, 'daychuyen23.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(174, 'Day chuyen 24', 20, 'daychuyen24.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(175, 'Day chuyen 25', 20, 'daychuyen25.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(176, 'Day chuyen 26', 21, 'daychuyen26.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(177, 'Day chuyen 27', 21, 'daychuyen27.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(178, 'Day chuyen 28', 21, 'daychuyen28.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(179, 'Day chuyen 29', 21, 'daychuyen29.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(180, 'Day chuyen 30', 21, 'daychuyen30.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(181, 'Day chuyen 31', 22, 'daychuyen31.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(182, 'Day chuyen 32', 22, 'daychuyen32.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(183, 'Day chuyen 33', 22, 'daychuyen33.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(184, 'Day chuyen 34', 22, 'daychuyen34.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(185, 'Day chuyen 35', 22, 'daychuyen35.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(186, 'Day chuyen 36', 23, 'daychuyen36.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(187, 'Day chuyen 37', 23, 'daychuyen37.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(188, 'Day chuyen 38', 23, 'daychuyen38.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(189, 'Day chuyen 39', 23, 'daychuyen39.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(190, 'Day chuyen 40', 23, 'daychuyen40.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(191, 'Day chuyen 41', 24, 'daychuyen41.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(192, 'Day chuyen 42', 24, 'daychuyen42.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(193, 'Day chuyen 43', 24, 'daychuyen43.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(194, 'Day chuyen 44', 24, 'daychuyen44.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(195, 'Day chuyen 45', 24, 'daychuyen45.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(196, 'Day chuyen 46', 25, 'daychuyen46.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(197, 'Day chuyen 47', 25, 'daychuyen47.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(198, 'Day chuyen 48', 25, 'daychuyen48.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(199, 'Day chuyen 49', 25, 'daychuyen49.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(200, 'Day chuyen 50', 25, 'daychuyen50.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(201, 'Khuyen tai 1', 41, 'khuyentai1.jpg', 1, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(202, 'Khuyen tai 2', 41, 'khuyentai2.jpg', 2, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(203, 'Khuyen tai 3', 41, 'khuyentai3.jpg', 3, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(204, 'Khuyen tai 4', 41, 'khuyentai4.jpg', 4, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(205, 'Khuyen tai 5', 41, 'khuyentai5.jpg', 5, '2025-07-03 04:10:47', '2025-07-03 04:10:47', NULL),
(206, 'Khuyen tai 6', 42, 'khuyentai6.jpg', 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(207, 'Khuyen tai 7', 42, 'khuyentai7.jpg', 2, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(208, 'Khuyen tai 8', 42, 'khuyentai8.jpg', 3, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(209, 'Khuyen tai 9', 42, 'khuyentai9.jpg', 4, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(210, 'Khuyen tai 10', 42, 'khuyentai10.jpg', 5, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(211, 'Khuyen tai 11', 43, 'khuyentai11.jpg', 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(212, 'Khuyen tai 12', 43, 'khuyentai12.jpg', 2, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(213, 'Khuyen tai 13', 43, 'khuyentai13.jpg', 3, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(214, 'Khuyen tai 14', 43, 'khuyentai14.jpg', 4, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(215, 'Khuyen tai 15', 43, 'khuyentai15.jpg', 5, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(216, 'Khuyen tai 16', 44, 'khuyentai16.jpg', 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(217, 'Khuyen tai 17', 44, 'khuyentai17.jpg', 2, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(218, 'Khuyen tai 18', 44, 'khuyentai18.jpg', 3, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(219, 'Khuyen tai 19', 44, 'khuyentai19.jpg', 4, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(220, 'Khuyen tai 20', 43, 'khuyentai20.jpg', 5, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(221, 'Khuyen tai 21', 45, 'khuyentai21.jpg', 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(222, 'Khuyen tai 22', 45, 'khuyentai22.jpg', 2, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(223, 'Khuyen tai 23', 45, 'khuyentai23.jpg', 3, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(224, 'Khuyen tai 24', 45, 'khuyentai24.jpg', 4, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(225, 'Khuyen tai 25', 45, 'khuyentai25.jpg', 5, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(226, 'Khuyen tai 26', 46, 'khuyentai26.jpg', 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(227, 'Khuyen tai 27', 46, 'khuyentai27.jpg', 2, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(228, 'Khuyen tai 28', 46, 'khuyentai28.jpg', 3, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(229, 'Khuyen tai 29', 46, 'khuyentai29.jpg', 4, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(230, 'Khuyen tai 30', 46, 'khuyentai30.jpg', 5, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(231, 'Khuyen tai 31', 47, 'khuyentai31.jpg', 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(232, 'Khuyen tai 32', 47, 'khuyentai32.jpg', 2, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(233, 'Khuyen tai 33', 47, 'khuyentai33.jpg', 3, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(234, 'Khuyen tai 34', 47, 'khuyentai34.jpg', 4, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(235, 'Khuyen tai 35', 47, 'khuyentai35.jpg', 5, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(236, 'Khuyen tai 36', 48, 'khuyentai36.jpg', 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(237, 'Khuyen tai 37', 48, 'khuyentai37.jpg', 2, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(238, 'Khuyen tai 38', 48, 'khuyentai38.jpg', 3, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(239, 'Khuyen tai 39', 48, 'khuyentai39.jpg', 4, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(240, 'Khuyen tai 40', 48, 'khuyentai40.jpg', 5, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(241, 'Dong ho 1', 49, 'dongho1.jpg', 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(242, 'Dong ho 2', 49, 'dongho2.jpg', 2, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(243, 'Dong ho 3', 49, 'dongho3.jpg', 3, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(244, 'Dong ho 4', 49, 'dongho4.jpg', 4, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(245, 'Dong ho 5', 50, 'dongho5.jpg', 5, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(246, 'Dong ho 6', 50, 'dongho6.jpg', 1, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(247, 'Dong ho 7', 50, 'dongho7.jpg', 2, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(248, 'Dong ho 8', 50, 'dongho8.jpg', 3, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(249, 'Dong ho 9', 50, 'dongho9.jpg', 4, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(250, 'Dong ho 10', 50, 'dongho10.jpg', 5, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_order`
--

CREATE TABLE `product_order` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_quantity` int NOT NULL,
  `product_size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `product_detail_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_order`
--

INSERT INTO `product_order` (`id`, `user_id`, `order_id`, `product_name`, `product_quantity`, `product_size`, `product_color`, `product_price`, `created_at`, `updated_at`, `product_id`, `product_detail_id`) VALUES
(1, 13, 1, 'Nhẫn Bạc S925 Horus Ring x Tattoo Chair Helios Silver Original', 1, '50 - 52 mm', 'Bạc', 50000, '2025-07-03 04:21:52', '2025-07-03 04:21:52', 2, 6),
(2, 13, 1, 'Nhẫn Bạc S925 Horus Ring x Tattoo Chair Helios Silver Original', 1, '53 - 55 mm', 'Bạc', 60000, '2025-07-03 04:21:52', '2025-07-03 04:21:52', 2, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_sale`
--

CREATE TABLE `product_sale` (
  `id` bigint UNSIGNED NOT NULL,
  `product_detail_id` bigint UNSIGNED DEFAULT NULL,
  `sale_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `type_sale` tinyint(1) DEFAULT '0',
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `type`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', 'web', '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(2, 'user', 'Staff', 'web', '2025-07-03 04:10:46', '2025-07-03 04:10:46'),
(3, 'user', 'Customer', 'web', '2025-07-03 04:10:46', '2025-07-03 04:10:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(33, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(46, 2),
(11, 3),
(13, 3),
(18, 3),
(20, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(33, 3),
(35, 3),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(46, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sales`
--

CREATE TABLE `sales` (
  `id` bigint UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `value` double NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `start_date` date NOT NULL DEFAULT '2025-07-03',
  `expiry_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('eOlvBN8we0ThPu0PshDJ6JZbY70vbdlnZ6mrurqW', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYTUxenpremN1MUE0TFQ0b25Oc0VjcnlzeEtYSWY0c0xLN0hBZ0x2TyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zdGFmZi81L2VkaXQiO31zOjUwOiJsb2dpbl93ZWJfM2RjN2E5MTNlZjVmZDRiODkwZWNhYmUzNDg3MDg1NTczZTE2Y2Y4MiI7aToxO3M6NDoiYXV0aCI7YToxOntzOjIxOiJwYXNzd29yZF9jb25maXJtZWRfYXQiO2k6MTc1MTUxNjU3ODt9fQ==', 1751516643);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff`
--

CREATE TABLE `staff` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `gender` int NOT NULL,
  `birthday` date NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `staff`
--

INSERT INTO `staff` (`id`, `user_id`, `gender`, `birthday`, `phone`, `bio`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 0, '1995-07-03', '0912345678', 'Staff 1 là một nhân viên trang sức tài năng và đam mê, mang lại sự sáng tạo và phong cách đặc sắc cho ngành công nghiệp này. Với bề dày kinh nghiệm lâu năm và sự kiên trì trong nghệ thuật thiết kế, Phương đã xây dựng danh tiếng của mình như một chuyên gia sáng tạo nổi bật.\r\n                                                    Với sự sáng tạo không ngừng, bạn âấy luôn tìm kiếm những ý tưởng mới và xu hướng tiên tiến để tạo ra những mảnh trang sức độc đáo và phản ánh cá tính của từng người. Bằng cách kết hợp tinh tế giữa nghệ thuật và kỹ thuật, bạn ấy đã tạo ra những kiệt tác trang sức không chỉ là vật trang trí mà còn là biểu tượng của phong cách và đẳng cấp.\r\n                                                    Khả năng giao tiếp xuất sắc và sự nhạy bén trong việc đọc hiểu ý muốn của khách hàng là một trong những đặc điểm nổi bật của Bạn ấy. Bạn ấy không chỉ tạo ra những sản phẩm tuyệt vời mà còn xây dựng mối quan hệ chặt chẽ với khách hàng, đồng đội và đối tác.', '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(2, 4, 2, '1995-07-03', '0912345678', 'Staff 2 là một nhân viên trang sức tài năng và đam mê, mang lại sự sáng tạo và phong cách đặc sắc cho ngành công nghiệp này. Với bề dày kinh nghiệm lâu năm và sự kiên trì trong nghệ thuật thiết kế, Phương đã xây dựng danh tiếng của mình như một chuyên gia sáng tạo nổi bật.\r\n                                                    Với sự sáng tạo không ngừng, bạn âấy luôn tìm kiếm những ý tưởng mới và xu hướng tiên tiến để tạo ra những mảnh trang sức độc đáo và phản ánh cá tính của từng người. Bằng cách kết hợp tinh tế giữa nghệ thuật và kỹ thuật, bạn ấy đã tạo ra những kiệt tác trang sức không chỉ là vật trang trí mà còn là biểu tượng của phong cách và đẳng cấp.\r\n                                                    Khả năng giao tiếp xuất sắc và sự nhạy bén trong việc đọc hiểu ý muốn của khách hàng là một trong những đặc điểm nổi bật của Bạn ấy. Bạn ấy không chỉ tạo ra những sản phẩm tuyệt vời mà còn xây dựng mối quan hệ chặt chẽ với khách hàng, đồng đội và đối tác.', '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(3, 5, 1, '1995-07-03', '0912345678', 'Staff 3 là một nhân viên trang sức tài năng và đam mê, mang lại sự sáng tạo và phong cách đặc sắc cho ngành công nghiệp này. Với bề dày kinh nghiệm lâu năm và sự kiên trì trong nghệ thuật thiết kế, Phương đã xây dựng danh tiếng của mình như một chuyên gia sáng tạo nổi bật.\r\n                                                    Với sự sáng tạo không ngừng, bạn âấy luôn tìm kiếm những ý tưởng mới và xu hướng tiên tiến để tạo ra những mảnh trang sức độc đáo và phản ánh cá tính của từng người. Bằng cách kết hợp tinh tế giữa nghệ thuật và kỹ thuật, bạn ấy đã tạo ra những kiệt tác trang sức không chỉ là vật trang trí mà còn là biểu tượng của phong cách và đẳng cấp.\r\n                                                    Khả năng giao tiếp xuất sắc và sự nhạy bén trong việc đọc hiểu ý muốn của khách hàng là một trong những đặc điểm nổi bật của Bạn ấy. Bạn ấy không chỉ tạo ra những sản phẩm tuyệt vời mà còn xây dựng mối quan hệ chặt chẽ với khách hàng, đồng đội và đối tác.', '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(4, 6, 1, '1995-07-03', '0912345678', 'Staff 4 là một nhân viên trang sức tài năng và đam mê, mang lại sự sáng tạo và phong cách đặc sắc cho ngành công nghiệp này. Với bề dày kinh nghiệm lâu năm và sự kiên trì trong nghệ thuật thiết kế, Phương đã xây dựng danh tiếng của mình như một chuyên gia sáng tạo nổi bật.\r\n                                                    Với sự sáng tạo không ngừng, bạn âấy luôn tìm kiếm những ý tưởng mới và xu hướng tiên tiến để tạo ra những mảnh trang sức độc đáo và phản ánh cá tính của từng người. Bằng cách kết hợp tinh tế giữa nghệ thuật và kỹ thuật, bạn ấy đã tạo ra những kiệt tác trang sức không chỉ là vật trang trí mà còn là biểu tượng của phong cách và đẳng cấp.\r\n                                                    Khả năng giao tiếp xuất sắc và sự nhạy bén trong việc đọc hiểu ý muốn của khách hàng là một trong những đặc điểm nổi bật của Bạn ấy. Bạn ấy không chỉ tạo ra những sản phẩm tuyệt vời mà còn xây dựng mối quan hệ chặt chẽ với khách hàng, đồng đội và đối tác.', '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(5, 7, 1, '1995-07-03', '0912345678', 'Staff 5 là một nhân viên trang sức tài năng và đam mê, mang lại sự sáng tạo và phong cách đặc sắc cho ngành công nghiệp này. Với bề dày kinh nghiệm lâu năm và sự kiên trì trong nghệ thuật thiết kế, Phương đã xây dựng danh tiếng của mình như một chuyên gia sáng tạo nổi bật.\r\n                                                    Với sự sáng tạo không ngừng, bạn âấy luôn tìm kiếm những ý tưởng mới và xu hướng tiên tiến để tạo ra những mảnh trang sức độc đáo và phản ánh cá tính của từng người. Bằng cách kết hợp tinh tế giữa nghệ thuật và kỹ thuật, bạn ấy đã tạo ra những kiệt tác trang sức không chỉ là vật trang trí mà còn là biểu tượng của phong cách và đẳng cấp.\r\n                                                    Khả năng giao tiếp xuất sắc và sự nhạy bén trong việc đọc hiểu ý muốn của khách hàng là một trong những đặc điểm nổi bật của Bạn ấy. Bạn ấy không chỉ tạo ra những sản phẩm tuyệt vời mà còn xây dựng mối quan hệ chặt chẽ với khách hàng, đồng đội và đối tác.', '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `two_factor_authentications`
--

CREATE TABLE `two_factor_authentications` (
  `id` bigint UNSIGNED NOT NULL,
  `authenticatable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `authenticatable_id` bigint UNSIGNED NOT NULL,
  `shared_secret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled_at` timestamp NULL DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `digits` tinyint UNSIGNED NOT NULL DEFAULT '6',
  `seconds` tinyint UNSIGNED NOT NULL DEFAULT '30',
  `window` tinyint UNSIGNED NOT NULL DEFAULT '0',
  `algorithm` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sha1',
  `recovery_codes` json DEFAULT NULL,
  `recovery_codes_generated_at` timestamp NULL DEFAULT NULL,
  `safe_devices` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  `active` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` timestamp NULL DEFAULT NULL,
  `last_login_ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_be_logged_out` tinyint(1) NOT NULL DEFAULT '0',
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `type`, `name`, `email`, `email_verified_at`, `password`, `password_changed_at`, `active`, `timezone`, `last_login_at`, `last_login_ip`, `to_be_logged_out`, `provider`, `provider_id`, `avatar`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'Super Admin', 'admin@gmail.com', '2025-07-03 04:10:46', '$2y$10$o6YOV.FdSpfNgJiz4eOjd.ChN530wFE4i5HcQm5jpavOWe4GjyAJ6', NULL, 1, 'America/New_York', '2025-07-03 04:22:58', '127.0.0.1', 0, NULL, NULL, NULL, NULL, '2025-07-03 04:10:46', '2025-07-03 04:22:58', NULL),
(2, 'user', 'Test User', 'user@user.com', '2025-07-03 04:10:46', '$2y$10$eWO65Zl74XeQybo9qU.s4.zureQMg.PA/IV2l8W9qNc5fgNZUmW4i', NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-07-03 04:10:46', '2025-07-03 04:10:46', NULL),
(3, 'user', 'Staff 1', 'nhanvien1@gmail.com', '2025-07-03 04:10:48', '$2y$10$VIXTyPL2.XaTskmfBLV1A.E3rhs0Fj330QgJeYygr24MGQ.njMUFa', NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(4, 'user', 'Staff 2', 'nhanvien2@gmail.com', '2025-07-03 04:10:48', '$2y$10$WW.2X/MDplKGGVcTUziHku6sQwTpnEO9qzHRioF9TwM/Gtcoi4QQa', NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(5, 'user', 'Staff 3', 'nhanvien3@gmail.com', '2025-07-03 04:10:48', '$2y$10$QRlyhY9q39Q3INox0Sxmr.YIOg94BVs6Ifsa4WrfBSdsuoc7TexYG', NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(6, 'user', 'Staff 4', 'nhanvien4@gmail.com', '2025-07-03 04:10:48', '$2y$10$OM20OKxjO/dBE03gM1IxzuUPrYMScS5F0pWYSnRr6Y6BgEUH/VBfW', NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(7, 'user', 'Staff 5', 'nhanvien5@gmail.com', '2025-07-03 04:10:48', '$2y$10$cLJd9JCCNx7FIfNSJ/duq.k/HQOfTYwgZ0p/WnnxkZfvCC/86kBAq', NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(8, 'user', 'Customer 1', 'khachhang1@gmail.com', '2025-07-03 04:10:48', '$2y$10$fyr.iOi/vgr5Dl3wCYLUz.Ty4bNurOhbUgzEMBCJfQjXbFsMAI1Yi', NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(9, 'user', 'Customer 2', 'khachhang2@gmail.com', '2025-07-03 04:10:48', '$2y$10$dGSjzza9QrHmPkZDUHTD2.win2G1cHh6HPBhjnndiCFwmWEPV9ahi', NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(10, 'user', 'Customer 3', 'khachhang3@gmail.com', '2025-07-03 04:10:48', '$2y$10$L7beFl4IVU1OJ6vzXT3FkuW.3f9QRlAtTifxoUV/rPgn1CTxmu6ri', NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(11, 'user', 'Customer 4', 'khachhang4@gmail.com', '2025-07-03 04:10:48', '$2y$10$/PfdoT448DoKOpOAJ9z9HeceY1HGbzXSkoJJshiYOnPtpJ.Kk5MDm', NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(12, 'user', 'Customer 5', 'khachhang5@gmail.com', '2025-07-03 04:10:48', '$2y$10$S/7byiv5m50rJpr61jwYH.8FLe1hcXRKOfPWvNQ6feuW/6JTMwnFu', NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-07-03 04:10:48', '2025-07-03 04:10:48', NULL),
(13, 'user', 'cccc', 'cccc@gmail.com', '2025-07-03 04:16:05', '$2y$10$RP1jT0tmSOKobRlO3yxG6uY4idZxffzhFWauSx6iI0KJae1ajLzV.', NULL, 1, 'America/New_York', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2025-07-03 04:16:05', '2025-07-03 04:16:05', NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`),
  ADD KEY `subject` (`subject_id`,`subject_type`),
  ADD KEY `causer` (`causer_id`,`causer_type`);

--
-- Chỉ mục cho bảng `address_order`
--
ALTER TABLE `address_order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_detail_id_foreign` (`product_detail_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_creator_id_foreign` (`creator_id`);

--
-- Chỉ mục cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_product_product_id_foreign` (`product_id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `channel_user`
--
ALTER TABLE `channel_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel_user_channel_id_foreign` (`channel_id`),
  ADD KEY `channel_user_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `coupons_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `coupon_order`
--
ALTER TABLE `coupon_order`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `coupon_user`
--
ALTER TABLE `coupon_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_user_coupon_id_foreign` (`coupon_id`),
  ADD KEY `coupon_user_user_id_foreign` (`user_id`),
  ADD KEY `coupon_user_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `favourites`
--
ALTER TABLE `favourites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favourites_user_id_foreign` (`user_id`),
  ADD KEY `favourites_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_channel_id_foreign` (`channel_id`),
  ADD KEY `messages_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_code_order_unique` (`code_order`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_address_order_id_foreign` (`address_order_id`),
  ADD KEY `orders_coupon_order_id_foreign` (`coupon_order_id`);

--
-- Chỉ mục cho bảng `password_histories`
--
ALTER TABLE `password_histories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_parent_id_foreign` (`parent_id`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_creator_id_foreign` (`creator_id`);

--
-- Chỉ mục cho bảng `product_detail`
--
ALTER TABLE `product_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_detail_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_image_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_order_user_id_foreign` (`user_id`),
  ADD KEY `product_order_order_id_foreign` (`order_id`),
  ADD KEY `product_order_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `product_sale`
--
ALTER TABLE `product_sale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sale_product_detail_id_foreign` (`product_detail_id`),
  ADD KEY `product_sale_sale_id_foreign` (`sale_id`),
  ADD KEY `product_sale_product_id_foreign` (`product_id`),
  ADD KEY `product_sale_category_id_foreign` (`category_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Chỉ mục cho bảng `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `two_factor_authentications`
--
ALTER TABLE `two_factor_authentications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `2fa_auth_type_auth_id_index` (`authenticatable_type`,`authenticatable_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `address_order`
--
ALTER TABLE `address_order`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `channels`
--
ALTER TABLE `channels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `channel_user`
--
ALTER TABLE `channel_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `coupon_order`
--
ALTER TABLE `coupon_order`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `coupon_user`
--
ALTER TABLE `coupon_user`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `favourites`
--
ALTER TABLE `favourites`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `password_histories`
--
ALTER TABLE `password_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `product_detail`
--
ALTER TABLE `product_detail`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT cho bảng `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT cho bảng `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `product_sale`
--
ALTER TABLE `product_sale`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `two_factor_authentications`
--
ALTER TABLE `two_factor_authentications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ràng buộc đối với các bảng kết xuất
--

--
-- Ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_detail_id_foreign` FOREIGN KEY (`product_detail_id`) REFERENCES `product_detail` (`id`),
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ràng buộc cho bảng `channel_user`
--
ALTER TABLE `channel_user`
  ADD CONSTRAINT `channel_user_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  ADD CONSTRAINT `channel_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `coupon_user`
--
ALTER TABLE `coupon_user`
  ADD CONSTRAINT `coupon_user_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`),
  ADD CONSTRAINT `coupon_user_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `coupon_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `favourites`
--
ALTER TABLE `favourites`
  ADD CONSTRAINT `favourites_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favourites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`),
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_order_id_foreign` FOREIGN KEY (`address_order_id`) REFERENCES `address_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_coupon_order_id_foreign` FOREIGN KEY (`coupon_order_id`) REFERENCES `coupon_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`);

--
-- Ràng buộc cho bảng `product_detail`
--
ALTER TABLE `product_detail`
  ADD CONSTRAINT `product_detail_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ràng buộc cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ràng buộc cho bảng `product_order`
--
ALTER TABLE `product_order`
  ADD CONSTRAINT `product_order_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_order_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_order_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `product_sale`
--
ALTER TABLE `product_sale`
  ADD CONSTRAINT `product_sale_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_sale_product_detail_id_foreign` FOREIGN KEY (`product_detail_id`) REFERENCES `product_detail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_sale_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_sale_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
