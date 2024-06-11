-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 11, 2024 at 02:40 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xuong-oop`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`) VALUES
(3, 4),
(4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE `cart_details` (
  `id` int NOT NULL,
  `cart_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart_details`
--

INSERT INTO `cart_details` (`id`, `cart_id`, `product_id`, `quantity`) VALUES
(82, 3, 12, 1),
(83, 3, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Điện thoại di động'),
(2, 'Laptop');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `shipping_name` varchar(255) DEFAULT NULL,
  `shipping_email` varchar(255) DEFAULT NULL,
  `shipping_phone` varchar(255) DEFAULT NULL,
  `shipping_address` varchar(255) DEFAULT NULL,
  `status_delivery` enum('0','1',' 2',' 3','4','5') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `status_payment` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `user_name`, `user_email`, `user_phone`, `user_address`, `shipping_name`, `shipping_email`, `shipping_phone`, `shipping_address`, `status_delivery`, `status_payment`, `created_at`, `updated_at`) VALUES
(1, 4, 'admin', 'tungteng258@gmail.com', '0914259062', '21 21  Ngõ Lê Đức Thọ', NULL, NULL, NULL, NULL, '0', 0, '2024-06-08 10:05:22', '2024-06-08 10:05:22'),
(2, 4, 'admin', 'tungteng258@gmail.com', '123123123', 'ádsad', NULL, NULL, NULL, NULL, '0', 0, '2024-06-08 15:35:26', '2024-06-08 15:35:26'),
(3, 4, 'admin', 'tungteng258@gmail.com', '123456', 'ádsad', NULL, NULL, NULL, NULL, '0', 0, '2024-06-09 09:25:06', '2024-06-09 09:25:06');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price_regular` int NOT NULL,
  `price_sale` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `price_regular`, `price_sale`) VALUES
(1, 1, 12, 1, 12000000, NULL),
(2, 2, 12, 1, 12000000, NULL),
(3, 3, 12, 1, 12000000, NULL),
(4, 3, 1, 4, 5100000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `img_thumbnail` varchar(255) DEFAULT NULL,
  `price_regular` int NOT NULL,
  `price_sale` int DEFAULT NULL,
  `overview` varchar(255) DEFAULT NULL,
  `content` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `img_thumbnail`, `price_regular`, `price_sale`, `overview`, `content`, `created_at`, `updated_at`) VALUES
(1, 2, 'Xiaomi K30123123123', 'assets/uploads/1718027831mat-kinh-nam-dep-1.jpeg', 5100000, 400000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<div class=\"gr\">    <figure class=\"g12-xs g3-md page-section__image\">      <img src=\"https://loremipsum.io/assets/images/lorem-ipsum-magazine-layout.jpg\" alt=\"Lorem ipsum used in a magazine layout\">      <figcaption>        <div class=\"page-section__squiggle\">          <div class=\"page-section__squiggle-one\"></div>          <div class=\"page-section__squiggle-two\"></div>        </div>        <h4 class=\"f5 cl-gray-1 page-section__caption\">Magazine layout with lorem ipsum</h4>      </figcaption>    </figure>    <div class=\"g12-xs g9-md g6-xl page-section__block\">      <h3 class=\"f5 cl-orange mb16\">History, Purpose and Usage</h3>      <p class=\"f4 cl-white mt0 mb16\"><em>Lorem ipsum</em>, or <em>lipsum</em> as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s <em>De Finibus Bonorum et Malorum</em> for use in a type specimen book. It usually begins with:</p>      <blockquote class=\"page-section__blockquote\">“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”</blockquote>      <p class=\"f4 cl-white mv16\">The purpose of <em>lorem ipsum</em> is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without <a href=\"#controversy\" title=\"Controversy in the Design World\">controversy</a>, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.</p>      <p class=\"f4 cl-white mv16\">The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs. Use our <a href=\"#generator\" title=\"Lorem Ipsum Generator\">generator</a> to get your own, or read on for the authoritative history of <em>lorem ipsum</em>.</p>    </div>    <div class=\"g12-xs g3-xl page-display s-half-page\">      <div class=\"page-display__block\">        <div align=\"center\" data-freestar-ad=\"__300x600\" id=\"loremipsum_siderail_right_2\" name=\"loremipsum_siderail_right_2\" data-google-query-id=\"\">          <script data-cfasync=\"false\" type=\"text/javascript\">            freestar.config.enabled_slots.push({ placementName: \"loremipsum_siderail_right_2\", slotId: \"loremipsum_siderail_right_2\" });          </script>        <div id=\"google_ads_iframe_/15184186,22580084566/loremipsum_siderail_right_2_0__container__\" style=\"border: 0pt none; width: 300px; height: 0px;\"></div></div>      </div>    </div>  </div>', '2024-05-31 02:41:03', '2024-05-31 02:41:03'),
(2, 1, 'Xiaomi K54', 'assets/img/phone.jpg', 5100000, 400000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<div class=\"gr\">\n    <figure class=\"g12-xs g3-md page-section__image\">\n      <img src=\"https://loremipsum.io/assets/images/lorem-ipsum-magazine-layout.jpg\" alt=\"Lorem ipsum used in a magazine layout\">\n      <figcaption>\n        <div class=\"page-section__squiggle\">\n          <div class=\"page-section__squiggle-one\"></div>\n          <div class=\"page-section__squiggle-two\"></div>\n        </div>\n        <h4 class=\"f5 cl-gray-1 page-section__caption\">Magazine layout with lorem ipsum</h4>\n      </figcaption>\n    </figure>\n    <div class=\"g12-xs g9-md g6-xl page-section__block\">\n      <h3 class=\"f5 cl-orange mb16\">History, Purpose and Usage</h3>\n      <p class=\"f4 cl-white mt0 mb16\"><em>Lorem ipsum</em>, or <em>lipsum</em> as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s <em>De Finibus Bonorum et Malorum</em> for use in a type specimen book. It usually begins with:\n</p>\n      <blockquote class=\"page-section__blockquote\">“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”</blockquote>\n      <p class=\"f4 cl-white mv16\">The purpose of <em>lorem ipsum</em> is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without <a href=\"#controversy\" title=\"Controversy in the Design World\">controversy</a>, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\n</p>\n      <p class=\"f4 cl-white mv16\">The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs. Use our <a href=\"#generator\" title=\"Lorem Ipsum Generator\">generator</a> to get your own, or read on for the authoritative history of <em>lorem ipsum</em>.\n</p>\n    </div>\n    <div class=\"g12-xs g3-xl page-display s-half-page\">\n      <div class=\"page-display__block\">\n\n        <div align=\"center\" data-freestar-ad=\"__300x600\" id=\"loremipsum_siderail_right_2\" name=\"loremipsum_siderail_right_2\" data-google-query-id=\"\">\n          <script data-cfasync=\"false\" type=\"text/javascript\">\n            freestar.config.enabled_slots.push({ placementName: \"loremipsum_siderail_right_2\", slotId: \"loremipsum_siderail_right_2\" });\n          </script>\n        <div id=\"google_ads_iframe_/15184186,22580084566/loremipsum_siderail_right_2_0__container__\" style=\"border: 0pt none; width: 300px; height: 0px;\"></div></div>\n      </div>\n    </div>\n  </div>', '2024-05-31 02:43:48', '2024-05-31 02:43:48'),
(3, 1, 'Xiaomi 8PRO', 'assets/img/phone.jpg', 5100000, 400000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<div class=\"gr\">\n    <figure class=\"g12-xs g3-md page-section__image\">\n      <img src=\"https://loremipsum.io/assets/images/lorem-ipsum-magazine-layout.jpg\" alt=\"Lorem ipsum used in a magazine layout\">\n      <figcaption>\n        <div class=\"page-section__squiggle\">\n          <div class=\"page-section__squiggle-one\"></div>\n          <div class=\"page-section__squiggle-two\"></div>\n        </div>\n        <h4 class=\"f5 cl-gray-1 page-section__caption\">Magazine layout with lorem ipsum</h4>\n      </figcaption>\n    </figure>\n    <div class=\"g12-xs g9-md g6-xl page-section__block\">\n      <h3 class=\"f5 cl-orange mb16\">History, Purpose and Usage</h3>\n      <p class=\"f4 cl-white mt0 mb16\"><em>Lorem ipsum</em>, or <em>lipsum</em> as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s <em>De Finibus Bonorum et Malorum</em> for use in a type specimen book. It usually begins with:\n</p>\n      <blockquote class=\"page-section__blockquote\">“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”</blockquote>\n      <p class=\"f4 cl-white mv16\">The purpose of <em>lorem ipsum</em> is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without <a href=\"#controversy\" title=\"Controversy in the Design World\">controversy</a>, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\n</p>\n      <p class=\"f4 cl-white mv16\">The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs. Use our <a href=\"#generator\" title=\"Lorem Ipsum Generator\">generator</a> to get your own, or read on for the authoritative history of <em>lorem ipsum</em>.\n</p>\n    </div>\n    <div class=\"g12-xs g3-xl page-display s-half-page\">\n      <div class=\"page-display__block\">\n\n        <div align=\"center\" data-freestar-ad=\"__300x600\" id=\"loremipsum_siderail_right_2\" name=\"loremipsum_siderail_right_2\" data-google-query-id=\"\">\n          <script data-cfasync=\"false\" type=\"text/javascript\">\n            freestar.config.enabled_slots.push({ placementName: \"loremipsum_siderail_right_2\", slotId: \"loremipsum_siderail_right_2\" });\n          </script>\n        <div id=\"google_ads_iframe_/15184186,22580084566/loremipsum_siderail_right_2_0__container__\" style=\"border: 0pt none; width: 300px; height: 0px;\"></div></div>\n      </div>\n    </div>\n  </div>', '2024-05-31 02:43:48', '2024-05-31 02:43:48'),
(4, 2, 'ASUS OFFICE O35', 'assets/img/laptop.jpg', 12000000, 400000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<div class=\"gr\">\n    <figure class=\"g12-xs g3-md page-section__image\">\n      <img src=\"https://loremipsum.io/assets/images/lorem-ipsum-magazine-layout.jpg\" alt=\"Lorem ipsum used in a magazine layout\">\n      <figcaption>\n        <div class=\"page-section__squiggle\">\n          <div class=\"page-section__squiggle-one\"></div>\n          <div class=\"page-section__squiggle-two\"></div>\n        </div>\n        <h4 class=\"f5 cl-gray-1 page-section__caption\">Magazine layout with lorem ipsum</h4>\n      </figcaption>\n    </figure>\n    <div class=\"g12-xs g9-md g6-xl page-section__block\">\n      <h3 class=\"f5 cl-orange mb16\">History, Purpose and Usage</h3>\n      <p class=\"f4 cl-white mt0 mb16\"><em>Lorem ipsum</em>, or <em>lipsum</em> as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s <em>De Finibus Bonorum et Malorum</em> for use in a type specimen book. It usually begins with:\n</p>\n      <blockquote class=\"page-section__blockquote\">“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”</blockquote>\n      <p class=\"f4 cl-white mv16\">The purpose of <em>lorem ipsum</em> is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without <a href=\"#controversy\" title=\"Controversy in the Design World\">controversy</a>, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\n</p>\n      <p class=\"f4 cl-white mv16\">The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs. Use our <a href=\"#generator\" title=\"Lorem Ipsum Generator\">generator</a> to get your own, or read on for the authoritative history of <em>lorem ipsum</em>.\n</p>\n    </div>\n    <div class=\"g12-xs g3-xl page-display s-half-page\">\n      <div class=\"page-display__block\">\n\n        <div align=\"center\" data-freestar-ad=\"__300x600\" id=\"loremipsum_siderail_right_2\" name=\"loremipsum_siderail_right_2\" data-google-query-id=\"\">\n          <script data-cfasync=\"false\" type=\"text/javascript\">\n            freestar.config.enabled_slots.push({ placementName: \"loremipsum_siderail_right_2\", slotId: \"loremipsum_siderail_right_2\" });\n          </script>\n        <div id=\"google_ads_iframe_/15184186,22580084566/loremipsum_siderail_right_2_0__container__\" style=\"border: 0pt none; width: 300px; height: 0px;\"></div></div>\n      </div>\n    </div>\n  </div>', '2024-05-31 02:43:48', '2024-05-31 02:43:48'),
(5, 1, 'IPHONE 12', 'assets/img/phone.jpg', 12000000, 400000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<div class=\"gr\">\n    <figure class=\"g12-xs g3-md page-section__image\">\n      <img src=\"https://loremipsum.io/assets/images/lorem-ipsum-magazine-layout.jpg\" alt=\"Lorem ipsum used in a magazine layout\">\n      <figcaption>\n        <div class=\"page-section__squiggle\">\n          <div class=\"page-section__squiggle-one\"></div>\n          <div class=\"page-section__squiggle-two\"></div>\n        </div>\n        <h4 class=\"f5 cl-gray-1 page-section__caption\">Magazine layout with lorem ipsum</h4>\n      </figcaption>\n    </figure>\n    <div class=\"g12-xs g9-md g6-xl page-section__block\">\n      <h3 class=\"f5 cl-orange mb16\">History, Purpose and Usage</h3>\n      <p class=\"f4 cl-white mt0 mb16\"><em>Lorem ipsum</em>, or <em>lipsum</em> as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s <em>De Finibus Bonorum et Malorum</em> for use in a type specimen book. It usually begins with:\n</p>\n      <blockquote class=\"page-section__blockquote\">“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”</blockquote>\n      <p class=\"f4 cl-white mv16\">The purpose of <em>lorem ipsum</em> is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without <a href=\"#controversy\" title=\"Controversy in the Design World\">controversy</a>, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\n</p>\n      <p class=\"f4 cl-white mv16\">The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs. Use our <a href=\"#generator\" title=\"Lorem Ipsum Generator\">generator</a> to get your own, or read on for the authoritative history of <em>lorem ipsum</em>.\n</p>\n    </div>\n    <div class=\"g12-xs g3-xl page-display s-half-page\">\n      <div class=\"page-display__block\">\n\n        <div align=\"center\" data-freestar-ad=\"__300x600\" id=\"loremipsum_siderail_right_2\" name=\"loremipsum_siderail_right_2\" data-google-query-id=\"\">\n          <script data-cfasync=\"false\" type=\"text/javascript\">\n            freestar.config.enabled_slots.push({ placementName: \"loremipsum_siderail_right_2\", slotId: \"loremipsum_siderail_right_2\" });\n          </script>\n        <div id=\"google_ads_iframe_/15184186,22580084566/loremipsum_siderail_right_2_0__container__\" style=\"border: 0pt none; width: 300px; height: 0px;\"></div></div>\n      </div>\n    </div>\n  </div>', '2024-05-31 02:43:48', '2024-05-31 02:43:48'),
(6, 2, 'ASUS GAMING G56', 'assets/img/laptop.jpg', 12000000, 400000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<div class=\"gr\">\n    <figure class=\"g12-xs g3-md page-section__image\">\n      <img src=\"https://loremipsum.io/assets/images/lorem-ipsum-magazine-layout.jpg\" alt=\"Lorem ipsum used in a magazine layout\">\n      <figcaption>\n        <div class=\"page-section__squiggle\">\n          <div class=\"page-section__squiggle-one\"></div>\n          <div class=\"page-section__squiggle-two\"></div>\n        </div>\n        <h4 class=\"f5 cl-gray-1 page-section__caption\">Magazine layout with lorem ipsum</h4>\n      </figcaption>\n    </figure>\n    <div class=\"g12-xs g9-md g6-xl page-section__block\">\n      <h3 class=\"f5 cl-orange mb16\">History, Purpose and Usage</h3>\n      <p class=\"f4 cl-white mt0 mb16\"><em>Lorem ipsum</em>, or <em>lipsum</em> as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s <em>De Finibus Bonorum et Malorum</em> for use in a type specimen book. It usually begins with:\n</p>\n      <blockquote class=\"page-section__blockquote\">“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”</blockquote>\n      <p class=\"f4 cl-white mv16\">The purpose of <em>lorem ipsum</em> is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without <a href=\"#controversy\" title=\"Controversy in the Design World\">controversy</a>, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\n</p>\n      <p class=\"f4 cl-white mv16\">The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs. Use our <a href=\"#generator\" title=\"Lorem Ipsum Generator\">generator</a> to get your own, or read on for the authoritative history of <em>lorem ipsum</em>.\n</p>\n    </div>\n    <div class=\"g12-xs g3-xl page-display s-half-page\">\n      <div class=\"page-display__block\">\n\n        <div align=\"center\" data-freestar-ad=\"__300x600\" id=\"loremipsum_siderail_right_2\" name=\"loremipsum_siderail_right_2\" data-google-query-id=\"\">\n          <script data-cfasync=\"false\" type=\"text/javascript\">\n            freestar.config.enabled_slots.push({ placementName: \"loremipsum_siderail_right_2\", slotId: \"loremipsum_siderail_right_2\" });\n          </script>\n        <div id=\"google_ads_iframe_/15184186,22580084566/loremipsum_siderail_right_2_0__container__\" style=\"border: 0pt none; width: 300px; height: 0px;\"></div></div>\n      </div>\n    </div>\n  </div>', '2024-05-31 02:43:48', '2024-05-31 02:43:48'),
(7, 1, 'IPHONE 13', 'assets/img/phone.jpg', 12000000, 400000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<div class=\"gr\">\n    <figure class=\"g12-xs g3-md page-section__image\">\n      <img src=\"https://loremipsum.io/assets/images/lorem-ipsum-magazine-layout.jpg\" alt=\"Lorem ipsum used in a magazine layout\">\n      <figcaption>\n        <div class=\"page-section__squiggle\">\n          <div class=\"page-section__squiggle-one\"></div>\n          <div class=\"page-section__squiggle-two\"></div>\n        </div>\n        <h4 class=\"f5 cl-gray-1 page-section__caption\">Magazine layout with lorem ipsum</h4>\n      </figcaption>\n    </figure>\n    <div class=\"g12-xs g9-md g6-xl page-section__block\">\n      <h3 class=\"f5 cl-orange mb16\">History, Purpose and Usage</h3>\n      <p class=\"f4 cl-white mt0 mb16\"><em>Lorem ipsum</em>, or <em>lipsum</em> as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s <em>De Finibus Bonorum et Malorum</em> for use in a type specimen book. It usually begins with:\n</p>\n      <blockquote class=\"page-section__blockquote\">“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”</blockquote>\n      <p class=\"f4 cl-white mv16\">The purpose of <em>lorem ipsum</em> is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without <a href=\"#controversy\" title=\"Controversy in the Design World\">controversy</a>, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\n</p>\n      <p class=\"f4 cl-white mv16\">The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs. Use our <a href=\"#generator\" title=\"Lorem Ipsum Generator\">generator</a> to get your own, or read on for the authoritative history of <em>lorem ipsum</em>.\n</p>\n    </div>\n    <div class=\"g12-xs g3-xl page-display s-half-page\">\n      <div class=\"page-display__block\">\n\n        <div align=\"center\" data-freestar-ad=\"__300x600\" id=\"loremipsum_siderail_right_2\" name=\"loremipsum_siderail_right_2\" data-google-query-id=\"\">\n          <script data-cfasync=\"false\" type=\"text/javascript\">\n            freestar.config.enabled_slots.push({ placementName: \"loremipsum_siderail_right_2\", slotId: \"loremipsum_siderail_right_2\" });\n          </script>\n        <div id=\"google_ads_iframe_/15184186,22580084566/loremipsum_siderail_right_2_0__container__\" style=\"border: 0pt none; width: 300px; height: 0px;\"></div></div>\n      </div>\n    </div>\n  </div>', '2024-05-31 02:43:48', '2024-05-31 02:43:48'),
(8, 1, 'IPHONE 14', 'assets/img/phone.jpg', 12000000, 400000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<div class=\"gr\">\n    <figure class=\"g12-xs g3-md page-section__image\">\n      <img src=\"https://loremipsum.io/assets/images/lorem-ipsum-magazine-layout.jpg\" alt=\"Lorem ipsum used in a magazine layout\">\n      <figcaption>\n        <div class=\"page-section__squiggle\">\n          <div class=\"page-section__squiggle-one\"></div>\n          <div class=\"page-section__squiggle-two\"></div>\n        </div>\n        <h4 class=\"f5 cl-gray-1 page-section__caption\">Magazine layout with lorem ipsum</h4>\n      </figcaption>\n    </figure>\n    <div class=\"g12-xs g9-md g6-xl page-section__block\">\n      <h3 class=\"f5 cl-orange mb16\">History, Purpose and Usage</h3>\n      <p class=\"f4 cl-white mt0 mb16\"><em>Lorem ipsum</em>, or <em>lipsum</em> as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s <em>De Finibus Bonorum et Malorum</em> for use in a type specimen book. It usually begins with:\n</p>\n      <blockquote class=\"page-section__blockquote\">“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”</blockquote>\n      <p class=\"f4 cl-white mv16\">The purpose of <em>lorem ipsum</em> is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without <a href=\"#controversy\" title=\"Controversy in the Design World\">controversy</a>, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\n</p>\n      <p class=\"f4 cl-white mv16\">The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs. Use our <a href=\"#generator\" title=\"Lorem Ipsum Generator\">generator</a> to get your own, or read on for the authoritative history of <em>lorem ipsum</em>.\n</p>\n    </div>\n    <div class=\"g12-xs g3-xl page-display s-half-page\">\n      <div class=\"page-display__block\">\n\n        <div align=\"center\" data-freestar-ad=\"__300x600\" id=\"loremipsum_siderail_right_2\" name=\"loremipsum_siderail_right_2\" data-google-query-id=\"\">\n          <script data-cfasync=\"false\" type=\"text/javascript\">\n            freestar.config.enabled_slots.push({ placementName: \"loremipsum_siderail_right_2\", slotId: \"loremipsum_siderail_right_2\" });\n          </script>\n        <div id=\"google_ads_iframe_/15184186,22580084566/loremipsum_siderail_right_2_0__container__\" style=\"border: 0pt none; width: 300px; height: 0px;\"></div></div>\n      </div>\n    </div>\n  </div>', '2024-05-31 02:43:48', '2024-05-31 02:43:48'),
(9, 2, 'ASUS TUF FX25', 'assets/img/laptop.jpg', 12000000, 400000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<div class=\"gr\">\n    <figure class=\"g12-xs g3-md page-section__image\">\n      <img src=\"https://loremipsum.io/assets/images/lorem-ipsum-magazine-layout.jpg\" alt=\"Lorem ipsum used in a magazine layout\">\n      <figcaption>\n        <div class=\"page-section__squiggle\">\n          <div class=\"page-section__squiggle-one\"></div>\n          <div class=\"page-section__squiggle-two\"></div>\n        </div>\n        <h4 class=\"f5 cl-gray-1 page-section__caption\">Magazine layout with lorem ipsum</h4>\n      </figcaption>\n    </figure>\n    <div class=\"g12-xs g9-md g6-xl page-section__block\">\n      <h3 class=\"f5 cl-orange mb16\">History, Purpose and Usage</h3>\n      <p class=\"f4 cl-white mt0 mb16\"><em>Lorem ipsum</em>, or <em>lipsum</em> as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s <em>De Finibus Bonorum et Malorum</em> for use in a type specimen book. It usually begins with:\n</p>\n      <blockquote class=\"page-section__blockquote\">“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”</blockquote>\n      <p class=\"f4 cl-white mv16\">The purpose of <em>lorem ipsum</em> is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without <a href=\"#controversy\" title=\"Controversy in the Design World\">controversy</a>, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\n</p>\n      <p class=\"f4 cl-white mv16\">The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs. Use our <a href=\"#generator\" title=\"Lorem Ipsum Generator\">generator</a> to get your own, or read on for the authoritative history of <em>lorem ipsum</em>.\n</p>\n    </div>\n    <div class=\"g12-xs g3-xl page-display s-half-page\">\n      <div class=\"page-display__block\">\n\n        <div align=\"center\" data-freestar-ad=\"__300x600\" id=\"loremipsum_siderail_right_2\" name=\"loremipsum_siderail_right_2\" data-google-query-id=\"\">\n          <script data-cfasync=\"false\" type=\"text/javascript\">\n            freestar.config.enabled_slots.push({ placementName: \"loremipsum_siderail_right_2\", slotId: \"loremipsum_siderail_right_2\" });\n          </script>\n        <div id=\"google_ads_iframe_/15184186,22580084566/loremipsum_siderail_right_2_0__container__\" style=\"border: 0pt none; width: 300px; height: 0px;\"></div></div>\n      </div>\n    </div>\n  </div>', '2024-05-31 02:43:48', '2024-05-31 02:43:48'),
(10, 1, 'IPHONE 15', 'assets/img/phone.jpg', 12000000, 400000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<div class=\"gr\">\n    <figure class=\"g12-xs g3-md page-section__image\">\n      <img src=\"https://loremipsum.io/assets/images/lorem-ipsum-magazine-layout.jpg\" alt=\"Lorem ipsum used in a magazine layout\">\n      <figcaption>\n        <div class=\"page-section__squiggle\">\n          <div class=\"page-section__squiggle-one\"></div>\n          <div class=\"page-section__squiggle-two\"></div>\n        </div>\n        <h4 class=\"f5 cl-gray-1 page-section__caption\">Magazine layout with lorem ipsum</h4>\n      </figcaption>\n    </figure>\n    <div class=\"g12-xs g9-md g6-xl page-section__block\">\n      <h3 class=\"f5 cl-orange mb16\">History, Purpose and Usage</h3>\n      <p class=\"f4 cl-white mt0 mb16\"><em>Lorem ipsum</em>, or <em>lipsum</em> as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s <em>De Finibus Bonorum et Malorum</em> for use in a type specimen book. It usually begins with:\n</p>\n      <blockquote class=\"page-section__blockquote\">“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”</blockquote>\n      <p class=\"f4 cl-white mv16\">The purpose of <em>lorem ipsum</em> is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without <a href=\"#controversy\" title=\"Controversy in the Design World\">controversy</a>, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\n</p>\n      <p class=\"f4 cl-white mv16\">The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs. Use our <a href=\"#generator\" title=\"Lorem Ipsum Generator\">generator</a> to get your own, or read on for the authoritative history of <em>lorem ipsum</em>.\n</p>\n    </div>\n    <div class=\"g12-xs g3-xl page-display s-half-page\">\n      <div class=\"page-display__block\">\n\n        <div align=\"center\" data-freestar-ad=\"__300x600\" id=\"loremipsum_siderail_right_2\" name=\"loremipsum_siderail_right_2\" data-google-query-id=\"\">\n          <script data-cfasync=\"false\" type=\"text/javascript\">\n            freestar.config.enabled_slots.push({ placementName: \"loremipsum_siderail_right_2\", slotId: \"loremipsum_siderail_right_2\" });\n          </script>\n        <div id=\"google_ads_iframe_/15184186,22580084566/loremipsum_siderail_right_2_0__container__\" style=\"border: 0pt none; width: 300px; height: 0px;\"></div></div>\n      </div>\n    </div>\n  </div>', '2024-05-31 02:43:48', '2024-05-31 02:43:48'),
(11, 2, 'ASUS AIO 45X', 'assets/img/laptop.jpg', 12000000, 400000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<div class=\"gr\">\n    <figure class=\"g12-xs g3-md page-section__image\">\n      <img src=\"https://loremipsum.io/assets/images/lorem-ipsum-magazine-layout.jpg\" alt=\"Lorem ipsum used in a magazine layout\">\n      <figcaption>\n        <div class=\"page-section__squiggle\">\n          <div class=\"page-section__squiggle-one\"></div>\n          <div class=\"page-section__squiggle-two\"></div>\n        </div>\n        <h4 class=\"f5 cl-gray-1 page-section__caption\">Magazine layout with lorem ipsum</h4>\n      </figcaption>\n    </figure>\n    <div class=\"g12-xs g9-md g6-xl page-section__block\">\n      <h3 class=\"f5 cl-orange mb16\">History, Purpose and Usage</h3>\n      <p class=\"f4 cl-white mt0 mb16\"><em>Lorem ipsum</em>, or <em>lipsum</em> as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s <em>De Finibus Bonorum et Malorum</em> for use in a type specimen book. It usually begins with:\n</p>\n      <blockquote class=\"page-section__blockquote\">“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”</blockquote>\n      <p class=\"f4 cl-white mv16\">The purpose of <em>lorem ipsum</em> is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without <a href=\"#controversy\" title=\"Controversy in the Design World\">controversy</a>, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\n</p>\n      <p class=\"f4 cl-white mv16\">The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs. Use our <a href=\"#generator\" title=\"Lorem Ipsum Generator\">generator</a> to get your own, or read on for the authoritative history of <em>lorem ipsum</em>.\n</p>\n    </div>\n    <div class=\"g12-xs g3-xl page-display s-half-page\">\n      <div class=\"page-display__block\">\n\n        <div align=\"center\" data-freestar-ad=\"__300x600\" id=\"loremipsum_siderail_right_2\" name=\"loremipsum_siderail_right_2\" data-google-query-id=\"\">\n          <script data-cfasync=\"false\" type=\"text/javascript\">\n            freestar.config.enabled_slots.push({ placementName: \"loremipsum_siderail_right_2\", slotId: \"loremipsum_siderail_right_2\" });\n          </script>\n        <div id=\"google_ads_iframe_/15184186,22580084566/loremipsum_siderail_right_2_0__container__\" style=\"border: 0pt none; width: 300px; height: 0px;\"></div></div>\n      </div>\n    </div>\n  </div>', '2024-05-31 02:43:48', '2024-05-31 02:43:48'),
(12, 2, 'ASUS VIVOBOOK V12', 'assets/img/laptop.jpg', 12000000, 400000, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', '<div class=\"gr\">\n    <figure class=\"g12-xs g3-md page-section__image\">\n      <img src=\"https://loremipsum.io/assets/images/lorem-ipsum-magazine-layout.jpg\" alt=\"Lorem ipsum used in a magazine layout\">\n      <figcaption>\n        <div class=\"page-section__squiggle\">\n          <div class=\"page-section__squiggle-one\"></div>\n          <div class=\"page-section__squiggle-two\"></div>\n        </div>\n        <h4 class=\"f5 cl-gray-1 page-section__caption\">Magazine layout with lorem ipsum</h4>\n      </figcaption>\n    </figure>\n    <div class=\"g12-xs g9-md g6-xl page-section__block\">\n      <h3 class=\"f5 cl-orange mb16\">History, Purpose and Usage</h3>\n      <p class=\"f4 cl-white mt0 mb16\"><em>Lorem ipsum</em>, or <em>lipsum</em> as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero\'s <em>De Finibus Bonorum et Malorum</em> for use in a type specimen book. It usually begins with:\n</p>\n      <blockquote class=\"page-section__blockquote\">“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”</blockquote>\n      <p class=\"f4 cl-white mv16\">The purpose of <em>lorem ipsum</em> is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn\'t distract from the layout. A practice not without <a href=\"#controversy\" title=\"Controversy in the Design World\">controversy</a>, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.\n</p>\n      <p class=\"f4 cl-white mv16\">The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it\'s seen all around the web; on templates, websites, and stock designs. Use our <a href=\"#generator\" title=\"Lorem Ipsum Generator\">generator</a> to get your own, or read on for the authoritative history of <em>lorem ipsum</em>.\n</p>\n    </div>\n    <div class=\"g12-xs g3-xl page-display s-half-page\">\n      <div class=\"page-display__block\">\n\n        <div align=\"center\" data-freestar-ad=\"__300x600\" id=\"loremipsum_siderail_right_2\" name=\"loremipsum_siderail_right_2\" data-google-query-id=\"\">\n          <script data-cfasync=\"false\" type=\"text/javascript\">\n            freestar.config.enabled_slots.push({ placementName: \"loremipsum_siderail_right_2\", slotId: \"loremipsum_siderail_right_2\" });\n          </script>\n        <div id=\"google_ads_iframe_/15184186,22580084566/loremipsum_siderail_right_2_0__container__\" style=\"border: 0pt none; width: 300px; height: 0px;\"></div></div>\n      </div>\n    </div>\n  </div>', '2024-05-31 02:43:48', '2024-05-31 02:43:48'),
(14, 1, 'Mạc Bục', 'assets/uploads/1717991023Black-Friday-thoi-ky-binh-thuong-moi-chuan-bi-cua-cac-doanh-nghiep-cung-can-doi-moi.jpg', 123123123, 12312313, 'Test nha', 'Test nha123', '2024-06-10 03:43:43', '2024-06-10 03:43:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('admin','member') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'member',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `avatar`, `email`, `password`, `type`, `created_at`, `updated_at`, `is_active`) VALUES
(4, 'Member1', 'assets/uploads/1717986997mat-kinh-nam-dep-1.jpeg', 'tungteng258@gmail.com', '$2y$10$2WNpquD0ev3D/FegGlGEReKdZjQrVxjLXV4cAgYoP2Ofs6bBixn2C', 'member', '2024-06-07 15:14:58', '2024-06-07 15:14:58', 1),
(5, 'Admin', 'assets/uploads/1717986910download.jpg', 'admin@gmail.com', '$2y$10$Mm.JlKBbpEbdXymyxKZEiuOuqvGx2DUqjLZ6Iy2ZntMC1S9d1NiTG', 'admin', '2024-06-10 02:35:10', '2024-06-10 02:35:10', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart_details`
--
ALTER TABLE `cart_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD CONSTRAINT `cart_details_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cart_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
