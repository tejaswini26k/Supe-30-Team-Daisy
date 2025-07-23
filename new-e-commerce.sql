-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2025 at 09:56 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new-e-commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `status` varchar(20) DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cart_id`, `customer_id`, `store_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 535, 241, 'active', '2025-06-23 09:56:39', '2025-06-24 07:10:02'),
(2, 540, 241, 'completed', '2025-06-23 09:56:39', '2025-07-14 16:18:38'),
(3, 541, 241, 'completed', '2025-06-23 09:56:39', '2025-06-27 18:31:29'),
(4, 526, 201, 'active', '2025-06-23 09:56:39', '2025-06-23 09:56:39'),
(5, 532, 201, 'active', '2025-06-23 09:56:39', '2025-06-23 09:56:39'),
(6, 536, 241, 'active', '2025-06-23 10:25:32', '2025-06-23 10:25:32'),
(7, 535, 201, 'active', '2025-06-23 10:30:27', '2025-06-23 10:30:27'),
(8, 535, 241, 'active', '2025-06-24 07:00:45', '2025-06-24 07:00:45'),
(9, 501, 201, 'active', '2025-06-27 18:32:53', '2025-06-27 18:47:26'),
(10, 506, 201, 'completed', '2025-07-14 16:05:36', '2025-07-14 16:08:04'),
(11, 525, 214, 'active', '2025-07-15 08:10:39', '2025-07-15 08:10:39'),
(12, 525, 205, 'active', '2025-07-15 08:15:07', '2025-07-15 08:22:41'),
(13, 545, 243, 'completed', '2025-07-16 13:52:09', '2025-07-16 13:53:16'),
(14, 546, 243, 'completed', '2025-07-16 14:06:35', '2025-07-16 14:55:59'),
(15, 503, 203, 'completed', '2025-07-16 15:58:48', '2025-07-16 16:04:05'),
(16, 547, 243, 'completed', '2025-07-16 16:22:31', '2025-07-16 16:23:01'),
(17, 521, 201, 'active', '2025-07-17 17:40:56', '2025-07-17 17:40:56');

-- --------------------------------------------------------


--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `date_joined` date NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `date_joined`, `phone_number`, `address`, `email`, `password`, `store_id`) VALUES
(501, 'Alice Smith', '2023-01-15', '111-222-3333', '123 Oak Ave, Anytown, USA', 'alice.smith@example.com', 'pass123', 201),
(502, 'Bob Johnson', '2023-02-20', '222-333-4444', '456 Pine St, Anytown, USA', 'bob.johnson@example.com', 'pass123', 202),
(503, 'Charlie Brown', '2023-03-10', '333-444-5555', '789 Maple Rd, Anytown, USA', 'charlie.brown@example.com', 'pass123', 203),
(504, 'Ethan Hunt', '2023-04-01', '444-555-6666', '101 Elm Blvd, Anytown, USA', 'ethan.hunt@example.com', 'pass123', 204),
(505, 'Fiona Glenanne', '2023-05-05', '555-666-7777', '202 Cedar Ln, Anytown, USA', 'fiona.g@example.com', 'pass123', 205),
(506, 'Harry Potter', '2023-06-12', '666-777-8888', '303 Birch Ct, Anytown, USA', 'harry.potter@example.com', 'pass123', 201),
(507, 'Ivy Green', '2023-07-18', '777-888-9999', '404 Willow Way, Anytown, USA', 'ivy.green@example.com', 'pass123', 202),
(508, 'Jack Black', '2023-08-25', '888-999-0000', '505 Spruce Dr, Anytown, USA', 'jack.black@example.com', 'pass123', 203),
(509, 'Karen White', '2023-09-01', '999-000-1111', '606 Poplar Pl, Anytown, USA', 'karen.white@example.com', 'pass123', 204),
(510, 'Liam Parker', '2023-10-10', '000-111-2222', '707 Ash Rd, Anytown, USA', 'liam.parker@example.com', 'pass123', 205),
(511, 'Mia Taylor', '2023-11-01', '123-456-7890', '808 Elm Ct, Anytown, USA', 'mia.taylor@example.com', 'pass123', 201),
(512, 'Noah Clark', '2023-12-10', '234-567-8901', '909 Pine Rd, Anytown, USA', 'noah.clark@example.com', 'pass123', 202),
(513, 'Olivia Wilson', '2024-01-05', '345-678-9012', '1010 Maple Ave, Anytown, USA', 'olivia.w@example.com', 'pass123', 203),
(514, 'Peter Jones', '2024-02-14', '456-789-0123', '1111 Oak St, Anytown, USA', 'peter.jones@example.com', 'pass123', 204),
(515, 'Quinn Evans', '2024-03-20', '567-890-1234', '1212 Birch Ln, Anytown, USA', 'quinn.evans@example.com', 'pass123', 205),
(516, 'Rachel King', '2024-04-01', '678-901-2345', '1313 Pine Ct, Anytown, USA', 'rachel.king@example.com', 'pass123', 201),
(517, 'Samira Ali', '2024-04-15', '789-012-3456', '1414 Cedar Dr, Anytown, USA', 'samira.ali@example.com', 'pass123', 202),
(518, 'Tom Davies', '2024-05-01', '890-123-4567', '1515 Maple Rd, Anytown, USA', 'tom.davies@example.com', 'pass123', 203),
(519, 'Ursula Brown', '2024-05-10', '901-234-5678', '1616 Oak Ct, Anytown, USA', 'ursula.b@example.com', 'pass123', 204),
(520, 'Victor Green', '2024-06-01', '012-345-6789', '1717 Elm St, Anytown, USA', 'victor.green@example.com', 'pass123', 205),
(521, 'Wendy White', '2024-06-05', '121-314-5161', '1818 Pine Ave, Anytown, USA', 'wendy.white@example.com', 'pass123', 201),
(522, 'Xavier Black', '2024-06-10', '232-435-6472', '1919 Cedar Dr, Anytown, USA', 'xavier.black@example.com', 'pass123', 202),
(523, 'Yara Smith', '2024-06-15', '343-546-7583', '2020 Elm Ln, Anytown, USA', 'yara.smith@example.com', 'pass123', 203),
(524, 'Zane Johnson', '2024-06-20', '454-657-8694', '2121 Oak Ct, Anytown, USA', 'zane.j@example.com', 'pass123', 204),
(525, 'Amber Davis', '2024-06-25', '565-768-9705', '2222 Birch St, Anytown, USA', 'amber.davis@example.com', 'pass123', 205),
(526, 'Blake Wilson', '2024-06-30', '676-879-0816', '2323 Maple Rd, Anytown, USA', 'blake.wilson@example.com', 'pass123', 201),
(527, 'Chloe Martin', '2024-07-01', '787-980-1927', '2424 Spruce Dr, Anytown, USA', 'chloe.martin@example.com', 'pass123', 202),
(528, 'Daniel Lee', '2024-07-05', '898-091-2038', '2525 Poplar Pl, Anytown, USA', 'daniel.lee@example.com', 'pass123', 203),
(529, 'Eva Roberts', '2024-07-10', '909-102-3149', '2626 Ash Rd, Anytown, USA', 'eva.roberts@example.com', 'pass123', 204),
(530, 'Frank Miller', '2024-07-15', '010-213-4250', '2727 Elm Ct, Anytown, USA', 'frank.miller@example.com', 'pass123', 205),
(531, 'Janhavi Pawar', '2025-06-19', '07276039884', 'Ram Nagar, Khat Road Bhandara', 'u@gmail.com', 'adminpass201', 201),
(532, 'Jane Doe', '2025-06-21', '08012345678', '123 Market Street, Lagos', 'jane.doe@example.com', 'securePass123', 201),
(533, 'Tanu', '2025-06-21', '123456', 'sdfgbhnj', 't@gmail.com', '444', 201),
(534, 'Pihu', '2025-06-21', '1234', 'loni', 'pihu@gmail.com', 'adminpass201', 201),
(535, 'Jane Doe', '2025-05-01', '1234567890', '101 Rose St, Springfield', 'jane@example.com', 'hashedpass123', 241),
(536, 'John Smith', '2025-05-03', '2345678901', '202 Lily Ave, Springfield', 'john@example.com', 'hashedpass234', 241),
(537, 'Emily Johnson', '2025-05-05', '3456789012', '303 Daisy Ln, Springfield', 'emily@example.com', 'hashedpass345', 241),
(538, 'Michael Lee', '2025-05-08', '4567890123', '404 Tulip Blvd, Springfield', 'michael@example.com', 'hashedpass456', 241),
(539, 'Alice Brown', '2025-05-10', '5678901234', '505 Garden Path, Springfield', 'alice@example.com', 'hashedpass567', 241),
(540, 'Chris Evans', '2025-05-12', '6789012345', '606 Orchid Ct, Springfield', 'chris@example.com', 'hashedpass678', 241),
(541, 'Olivia Green', '2025-05-14', '7890123456', '707 Bloom Way, Springfield', 'olivia@example.com', 'hashedpass789', 241),
(542, 'Janhavi Mane', '2025-06-25', '7276039880', 'Delhi', 'janhavi@example.com', '123456', 201),
(543, 'Sushila Bankar', '2025-06-27', '234567', 'Akola', 'Sushila.Bankar@gmail.com', '3333333', 202),
(544, 'Tanmay', '2025-07-16', '3344556677', 'Gonjipaar', 'tv@gmail.com', '123456', 243),
(545, 'Pipi', '2025-07-16', '23456789', 'wweerr', 'pipo@gmail.com', '909090', 243),
(546, 'SUshilaBai', '2025-07-16', '3434343434', 'Akola', 'SUshilaBai@gmail.com', 'SUshilaBai', 243),
(547, 'Pihu Dida', '2025-07-16', '2233449884', 'Nagpir', 'cadepihu@gmail.com', '12345678', 243);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `review_date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `product_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `review_description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `review_date`, `customer_id`, `rating`, `product_id`, `store_id`, `review_description`) VALUES
(401, '2024-05-01 10:00:00', 501, 5, 1001, 201, 'Excellent laptop, very fast and reliable for my work. Highly recommend!'),
(402, '2024-05-03 11:30:00', 502, 4, 1003, 201, 'Good mechanical keyboard, clicks are satisfying. RGB is a nice touch.'),
(403, '2024-05-05 14:00:00', 503, 5, 1005, 202, 'Absolutely love this handbag! High quality leather and perfect size. Stylish and practical.'),
(404, '2024-05-07 09:45:00', 504, 3, 1002, 201, 'Mouse works fine, but a bit too light for my preference. Precision is okay.'),
(405, '2024-05-09 16:15:00', 505, 4, 1006, 202, 'Comfortable summer dress, fabric is breathable. A little tight in the shoulders, but overall good.'),
(406, '2024-05-11 13:00:00', 506, 5, 1008, 205, 'Best running shoes I have ever owned! Great support and cushioning for long runs.'),
(407, '2024-05-13 10:30:00', 507, 4, 1009, 203, 'Delicious recipes, easy to follow. Already made three dishes, family loves them!'),
(408, '2024-05-15 17:00:00', 508, 3, 1007, 206, 'Smartwatch is okay, battery life could be better. Fitness tracking is accurate though.'),
(409, '2024-05-17 08:00:00', 509, 5, 1010, 201, 'Fantastic smartphone, camera is incredible. Very happy with the purchase, totally worth it.'),
(410, '2024-05-19 11:00:00', 510, 4, 1004, 201, 'USB-C hub works as expected, compact design. Connects everything I need without issues.'),
(411, '2024-05-21 09:00:00', 511, 2, 1001, 201, 'Laptop had a minor software bug, but was resolved after an update. A bit frustrating initially.'),
(412, '2024-05-23 14:00:00', 512, 5, 1005, 202, 'Purchased this handbag as a gift, and she absolutely loved it! Looks even better in person.'),
(413, '2024-05-25 10:15:00', 513, 4, 1008, 205, 'Solid running shoes for daily jogs. Good value for money and quite comfortable.'),
(414, '2024-05-27 16:30:00', 514, 1, 1007, 206, 'The smartwatch stopped charging after a month. Very disappointed with the quality.'),
(415, '2024-05-29 12:00:00', 515, 5, 1009, 203, 'A must-have cookbook for anyone who loves Italian cuisine. Highly recommend this for beginners too!'),
(416, '2024-06-01 10:00:00', 516, 4, 1011, 201, 'Earbuds sound great, but the fit is a bit loose for my ears.'),
(417, '2024-06-03 11:00:00', 517, 5, 1012, 201, 'Amazing portable speaker! Battery lasts forever and sound is crisp.'),
(418, '2024-06-05 13:00:00', 518, 3, 1013, 214, 'Headset is okay, mic quality is not the best. Comfort is good for long sessions.'),
(419, '2024-06-07 09:00:00', 519, 5, 1014, 205, 'Perfect yoga mat, excellent grip and thickness. No slipping during hot yoga.'),
(420, '2024-06-09 15:00:00', 520, 4, 1015, 205, 'Dumbbells are solid, easy to adjust. Good addition to my home gym.'),
(421, '2024-06-11 10:00:00', 521, 5, 1016, 203, 'Intriguing plot, read it in one sitting! Very well written and captivating.'),
(422, '2024-06-13 14:00:00', 522, 4, 1017, 211, 'My child loves this storybook, colorful illustrations. Great for bedtime stories.'),
(423, '2024-06-15 16:00:00', 523, 3, 1018, 211, 'Action figure is decent, but some joints are stiff. Good for display, less for play.'),
(424, '2024-06-17 08:00:00', 524, 5, 1019, 214, 'Complex board game, but highly rewarding once you learn the rules. Great with friends.'),
(425, '2024-06-19 11:00:00', 525, 4, 1020, 204, 'Desk lamp is bright, wireless charger works great. Stylish and functional.'),
(426, '2024-06-21 09:00:00', 526, 5, 1021, 218, 'Kettle boils water super fast, sleek design. Very happy with this kitchen essential.'),
(427, '2024-06-23 13:00:00', 527, 4, 1022, 218, 'Coffee maker makes good coffee, but it is a bit noisy. Easy to clean.'),
(428, '2024-06-25 15:00:00', 528, 5, 1023, 236, 'Pillows are very soft and add a nice touch to my living room. Good quality fabric.'),
(429, '2024-06-27 10:00:00', 529, 4, 1024, 236, 'Candles smell amazing and burn evenly. The lavender scent is very relaxing.'),
(430, '2024-06-29 12:00:00', 530, 5, 1025, 213, 'Moisturizer feels light on the skin and provides great hydration. SPF is a bonus.'),
(431, '2024-07-01 14:00:00', 501, 4, 1026, 213, 'Shampoo and conditioner leave my hair soft and shiny. Natural ingredients are a plus.'),
(432, '2024-07-03 10:00:00', 502, 5, 1027, 207, 'My dog loves this food, and his coat is looking healthier. Great value for money.'),
(433, '2024-07-05 11:00:00', 503, 3, 1028, 207, 'Scratching post is a bit wobbly, but my cat uses it. Needs better base support.'),
(434, '2024-07-07 15:00:00', 504, 5, 1029, 209, 'Acrylic paints have vibrant colors and good consistency. Perfect for my art projects.'),
(435, '2024-07-09 09:00:00', 505, 4, 1030, 209, 'Sketchbook paper is thick, great for mixed media. Lies flat when open which is nice.'),
(436, '2024-07-11 13:00:00', 506, 5, 1031, 223, 'Protein powder mixes well and tastes good. Helps with my post-workout recovery.'),
(437, '2024-07-13 14:00:00', 507, 4, 1032, 223, 'Multivitamins are easy to swallow, feel more energized. Good for daily health.'),
(438, '2024-07-15 10:00:00', 508, 5, 1033, 208, 'Delicious green tea, very refreshing. Love the individual packaging.'),
(439, '2024-07-17 11:00:00', 509, 5, 1034, 208, 'Amazing sourdough, crusty outside and soft inside. Tastes like homemade.'),
(440, '2024-07-19 12:00:00', 510, 4, 1035, 216, 'Toolbox is sturdy, tools are decent quality for basic tasks. Good for emergencies.'),
(441, '2024-07-21 14:00:00', 511, 3, 1036, 216, 'Drill works, but battery life is shorter than expected. Charges quickly though.'),
(442, '2024-07-23 10:00:00', 512, 5, 1037, 217, 'Gardening gloves are very comfortable and protect my hands well.'),
(443, '2024-07-25 11:00:00', 513, 4, 1038, 217, 'Plant pots are stylish, perfect for my indoor garden. Good drainage.'),
(444, '2024-07-27 13:00:00', 514, 5, 1039, 231, 'Baby onesies are soft and cute. Great for sensitive skin.'),
(445, '2024-07-29 15:00:00', 515, 4, 1040, 231, 'Stroller is lightweight and folds easily. A bit bulky when folded, but manageable.'),
(446, '2024-08-01 10:00:00', 516, 5, 1041, 225, 'Digital camera takes stunning photos, easy to use interface. Highly versatile.'),
(447, '2024-08-03 11:00:00', 517, 4, 1042, 225, 'Tripod is stable, good for travel. A little heavy but worth it for the stability.'),
(448, '2024-08-05 13:00:00', 518, 5, 1043, 226, 'Backpack is very spacious and comfortable for long trips. Lots of pockets!'),
(449, '2024-08-07 14:00:00', 519, 4, 1044, 226, 'Travel pillow is a lifesaver on long flights, great neck support.'),
(450, '2024-08-09 10:00:00', 520, 5, 1045, 227, 'Water bottle keeps drinks cold all day. Love the eco-friendly aspect.'),
(451, '2024-08-11 11:00:00', 521, 4, 1046, 227, 'Reusable bags are strong and fold up small. Perfect for grocery shopping.'),
(452, '2024-08-13 13:00:00', 522, 5, 1047, 228, 'Smart light bulbs are easy to set up and control with my phone. Good range of colors.'),
(453, '2024-08-15 14:00:00', 523, 4, 1048, 228, 'Smart plugs work perfectly, integrate well with my smart home system.'),
(454, '2024-08-17 10:00:00', 524, 5, 1049, 230, 'Office chair is very comfortable, perfect for long working hours. My back feels much better.'),
(455, '2024-08-19 11:00:00', 525, 4, 1050, 230, 'Printer paper is good quality, no jams so far. Standard and reliable.'),
(456, '2024-08-21 13:00:00', 526, 5, 1051, 232, 'Beautiful ceramic mug, feels great to hold. My new favorite coffee cup.'),
(457, '2024-08-23 14:00:00', 527, 4, 1052, 232, 'Wooden coasters are a nice touch, good craftsmanship. Protects my table well.'),
(458, '2024-08-25 10:00:00', 528, 3, 1053, 233, 'Repair kit has useful tools, but the instructions are not very clear.'),
(459, '2024-08-27 11:00:00', 529, 4, 1054, 233, 'Cooling pad keeps my laptop from overheating, noticeable difference during gaming.'),
(460, '2024-08-29 13:00:00', 530, 5, 1055, 234, 'Hiking boots are very comfortable and provide excellent grip on trails. Waterproofing works!'),
(461, '2024-09-01 10:00:00', 501, 4, 1056, 269, 'Camping tent is easy to set up, perfect for two people. A bit heavy for backpacking.'),
(462, '2024-09-03 11:00:00', 502, 5, 1057, 208, 'Gourmet chocolates are exquisite, great gift idea. Every piece is a delight.'),
(463, '2024-09-05 13:00:00', 503, 4, 1058, 243, 'Coffee beans have a rich aroma and smooth taste. My new go-to for morning coffee.'),
(464, '2024-09-07 14:00:00', 504, 3, 1059, 237, 'Dash cam works, but video quality is only average at night. Easy installation.'),
(465, '2024-09-09 10:00:00', 505, 5, 1060, 237, 'Car air fresheners last a long time and smell great. Not overpowering.'),
(466, '2024-09-11 11:00:00', 506, 4, 1061, 238, 'Mountain bike is good for beginners, smooth gears. A bit heavy for uphill rides.'),
(467, '2024-09-13 13:00:00', 507, 5, 1062, 238, 'Bike helmet is comfortable and adjustable. Feels very secure and safe.'),
(468, '2024-09-15 14:00:00', 508, 4, 1063, 239, 'Acoustic guitar has good sound for its price. Ideal for learning.'),
(469, '2024-09-17 10:00:00', 509, 5, 1064, 239, 'Ukulele sounds beautiful, very portable. Fun to learn and play.'),
(470, '2024-09-19 11:00:00', 510, 4, 1065, 240, 'Coin is in good condition, as described. A nice addition to my collection.'),
(471, '2024-09-21 13:00:00', 511, 5, 1066, 240, 'Stamp set is unique, perfect for collectors. Well-packaged and protected.'),
(472, '2024-09-23 14:00:00', 512, 4, 1067, 245, 'Fish tank kit is easy to set up, good for a small space. Filter works well.'),
(473, '2024-09-25 10:00:00', 513, 5, 1068, 245, 'Tropical fish food is readily eaten by my fish. Seems to keep them healthy.'),
(474, '2024-09-27 11:00:00', 514, 4, 1069, 228, 'Security camera provides clear video, easy to monitor from my phone. Motion detection is sensitive.'),
(475, '2024-09-29 13:00:00', 515, 5, 1070, 228, 'Smart doorbell has excellent video quality and two-way audio. Improves home security.'),
(476, '2025-06-08 00:00:00', 535, 5, 1085, 241, 'Absolutely stunning arrangement! Brightened my day.'),
(477, '2025-06-09 00:00:00', 536, 4, 1086, 241, 'Lovely bouquet, fresh flowers but delivery was a bit late.'),
(478, '2025-06-10 00:00:00', 537, 5, 1087, 241, 'Unique and elegant, loved the artistic touch.'),
(479, '2025-06-11 00:00:00', 535, 4, 1088, 241, 'Charming rustic jar, flowers were fresh and well-packed.'),
(480, '2025-06-12 00:00:00', 538, 3, 1086, 241, 'Nice bouquet, but not as full as expected.'),
(481, '2025-06-13 00:00:00', 539, 5, 1088, 241, 'Perfect gift. Vibrant and long-lasting blooms.'),
(482, '2025-06-14 00:00:00', 536, 4, 1085, 241, 'Beautiful colors and scent, highly recommend.'),
(484, '2025-07-16 22:50:55', 547, 3, 1093, 243, 'as'),
(485, '2025-07-16 22:51:18', 547, 4, 1058, 243, 'cofffeee is heavenly ');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `date_ordered` datetime NOT NULL,
  `total_amount` decimal(10,2) NOT NULL CHECK (`total_amount` >= 0),
  `customer_id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `date_ordered`, `total_amount`, `customer_id`, `status`) VALUES
(301, '2024-01-20 10:30:00', 1200.00, 501, 'Delivered'),
(302, '2024-01-22 14:00:00', 80.00, 502, 'Pending'),
(303, '2024-02-05 11:45:00', 45.00, 503, 'Shipped'),
(304, '2024-02-10 09:15:00', 25.00, 504, 'Delivered'),
(305, '2024-02-15 16:20:00', 155.00, 505, 'Processing'),
(306, '2024-03-01 13:00:00', 110.00, 506, 'Delivered'),
(307, '2024-03-10 10:00:00', 35.99, 507, 'Cancelled'),
(308, '2024-03-15 17:00:00', 280.00, 508, 'Shipped'),
(309, '2024-03-20 08:30:00', 70.00, 509, 'Delivered'),
(310, '2024-04-01 11:00:00', 799.00, 510, 'Processing'),
(311, '2024-04-05 09:00:00', 99.00, 511, 'Delivered'),
(312, '2024-04-10 14:30:00', 15.75, 512, 'Shipped'),
(313, '2024-04-15 11:15:00', 320.00, 513, 'Pending'),
(314, '2024-04-20 16:00:00', 65.50, 514, 'Delivered'),
(315, '2024-04-25 10:45:00', 580.90, 515, 'Processing'),
(316, '2024-05-01 08:00:00', 125.00, 516, 'Delivered'),
(317, '2024-05-03 12:10:00', 49.99, 517, 'Shipped'),
(318, '2024-05-07 15:30:00', 210.00, 518, 'Pending'),
(319, '2024-05-09 10:00:00', 18.50, 519, 'Delivered'),
(320, '2024-05-12 11:50:00', 300.00, 520, 'Processing'),
(321, '2024-05-15 14:10:00', 75.00, 521, 'Delivered'),
(322, '2024-05-18 09:30:00', 55.00, 522, 'Cancelled'),
(323, '2024-05-20 16:40:00', 400.00, 523, 'Shipped'),
(324, '2024-05-23 13:00:00', 90.00, 524, 'Delivered'),
(325, '2024-05-26 10:20:00', 150.00, 525, 'Processing'),
(326, '2024-05-29 11:30:00', 20.00, 526, 'Delivered'),
(327, '2024-06-01 15:00:00', 320.00, 527, 'Shipped'),
(328, '2024-06-04 09:00:00', 88.00, 528, 'Pending'),
(329, '2024-06-07 12:45:00', 190.00, 529, 'Delivered'),
(330, '2024-06-10 17:15:00', 10.00, 530, 'Processing'),
(331, '2024-06-13 08:30:00', 50.00, 501, 'Delivered'),
(332, '2024-06-16 10:00:00', 60.00, 502, 'Shipped'),
(333, '2024-06-19 14:00:00', 250.00, 503, 'Pending'),
(334, '2024-06-22 11:00:00', 12.50, 504, 'Delivered'),
(335, '2024-06-25 09:45:00', 750.00, 505, 'Processing'),
(336, '2024-06-28 16:00:00', 40.00, 506, 'Delivered'),
(337, '2024-07-01 13:00:00', 180.00, 507, 'Shipped'),
(338, '2024-07-04 08:00:00', 22.00, 508, 'Cancelled'),
(339, '2024-07-07 10:30:00', 55.00, 509, 'Delivered'),
(340, '2024-07-10 15:15:00', 999.00, 510, 'Processing'),
(341, '2024-07-13 11:45:00', 65.00, 511, 'Delivered'),
(342, '2024-07-16 09:00:00', 140.00, 512, 'Shipped'),
(343, '2024-07-19 14:20:00', 30.00, 513, 'Pending'),
(344, '2024-07-22 10:10:00', 170.00, 514, 'Delivered'),
(345, '2024-07-25 16:50:00', 25.00, 515, 'Processing'),
(346, '2024-07-28 08:00:00', 42.00, 516, 'Delivered'),
(347, '2024-07-31 12:00:00', 280.00, 517, 'Shipped'),
(348, '2024-08-03 15:00:00', 7.50, 518, 'Pending'),
(349, '2024-08-06 10:30:00', 112.00, 519, 'Delivered'),
(350, '2024-08-09 13:40:00', 5.00, 520, 'Processing'),
(351, '2024-08-12 11:00:00', 80.00, 521, 'Delivered'),
(352, '2024-08-15 14:00:00', 15.00, 522, 'Shipped'),
(353, '2024-08-18 09:00:00', 600.00, 523, 'Pending'),
(354, '2024-08-21 16:00:00', 90.00, 524, 'Delivered'),
(355, '2024-08-24 10:00:00', 105.00, 525, 'Processing'),
(356, '2024-08-27 12:30:00', 35.00, 526, 'Delivered'),
(357, '2024-08-30 15:45:00', 220.00, 527, 'Delivered'),
(358, '2024-09-02 09:15:00', 18.00, 528, 'Cancelled'),
(359, '2024-09-05 11:00:00', 70.00, 529, 'Delivered'),
(360, '2024-09-08 14:00:00', 500.00, 530, 'Processing'),
(361, '2024-09-11 08:45:00', 25.00, 501, 'Delivered'),
(362, '2024-09-14 10:20:00', 130.00, 502, 'Shipped'),
(363, '2024-09-17 13:00:00', 40.00, 503, 'Pending'),
(364, '2024-09-20 16:30:00', 85.00, 504, 'Delivered'),
(365, '2024-09-23 09:00:00', 310.00, 505, 'Processing'),
(366, '2024-09-26 11:00:00', 12.00, 506, 'Delivered'),
(367, '2024-09-29 14:00:00', 95.00, 507, 'Shipped'),
(368, '2024-10-02 10:00:00', 65.00, 508, 'Cancelled'),
(369, '2024-10-05 12:00:00', 380.00, 509, 'Delivered'),
(370, '2024-10-08 15:00:00', 29.99, 510, 'Processing'),
(371, '2024-10-11 08:30:00', 160.00, 511, 'Delivered'),
(372, '2024-10-14 11:30:00', 700.00, 512, 'Shipped'),
(373, '2024-10-17 14:00:00', 19.99, 513, 'Pending'),
(374, '2024-10-20 17:00:00', 49.00, 514, 'Delivered'),
(375, '2024-10-23 09:30:00', 200.00, 515, 'Processing'),
(376, '2024-10-26 12:00:00', 78.00, 516, 'Shipped'),
(377, '2024-10-29 15:00:00', 145.00, 517, 'Shipped'),
(378, '2024-11-01 10:00:00', 420.00, 518, 'Cancelled'),
(379, '2024-11-04 13:00:00', 39.00, 519, 'Delivered'),
(380, '2024-11-07 16:00:00', 310.00, 520, 'Processing'),
(381, '2024-11-10 08:00:00', 70.00, 521, 'Cancelled'),
(382, '2024-11-13 11:00:00', 115.00, 522, 'Shipped'),
(383, '2024-11-16 14:00:00', 550.00, 523, 'Pending'),
(384, '2024-11-19 17:00:00', 49.00, 524, 'Delivered'),
(385, '2024-11-22 09:00:00', 200.00, 525, 'Processing'),
(386, '2024-11-25 11:00:00', 95.00, 526, 'Processing'),
(387, '2024-11-28 14:00:00', 180.00, 527, 'Shipped'),
(388, '2024-12-01 10:00:00', 350.00, 528, 'Cancelled'),
(389, '2024-12-04 12:00:00', 25.00, 529, 'Delivered'),
(390, '2024-12-07 15:00:00', 290.00, 530, 'Processing'),
(391, '2024-12-10 08:30:00', 60.00, 501, 'Delivered'),
(392, '2024-12-13 11:30:00', 110.00, 502, 'Shipped'),
(393, '2024-12-16 14:00:00', 500.00, 503, 'Pending'),
(394, '2024-12-19 17:00:00', 33.00, 504, 'Delivered'),
(395, '2024-12-22 09:00:00', 210.00, 505, 'Processing'),
(396, '2025-06-01 00:00:00', 75.00, 535, 'Delivered'),
(397, '2025-06-02 00:00:00', 140.00, 536, 'Shipped'),
(398, '2025-06-03 00:00:00', 85.00, 537, 'Processing'),
(399, '2025-06-04 00:00:00', 130.00, 535, 'Delivered'),
(400, '2025-06-05 00:00:00', 68.00, 538, 'Cancelled'),
(401, '2025-06-06 00:00:00', 120.00, 539, 'Delivered'),
(402, '2025-06-07 00:00:00', 90.00, 536, 'Processing'),
(403, '2025-06-23 19:28:10', 70.00, 535, 'pending'),
(404, '2025-06-23 19:31:33', 70.00, 535, 'pending'),
(405, '2025-06-24 12:30:18', 136.00, 535, 'pending'),
(406, '2025-06-24 13:53:38', 267.00, 533, 'Shipped'),
(407, '2025-06-25 22:50:38', 799.00, 542, 'Pending'),
(408, '2025-06-25 22:54:44', 99.00, 542, 'Cancelled'),
(409, '2025-06-27 13:47:49', 1000.00, 522, 'Processing'),
(410, '2025-06-27 23:44:11', 226.00, 541, 'pending'),
(411, '2025-06-27 23:57:00', 55.00, 541, 'pending'),
(412, '2025-06-28 00:01:29', 85.00, 541, 'pending'),
(413, '2025-06-28 00:03:46', 1080.00, 501, 'pending'),
(414, '2025-07-14 14:30:16', 89.00, 542, 'Cancelled'),
(415, '2025-07-14 21:38:04', 1299.00, 506, 'Pending'),
(416, '2025-07-14 21:38:04', 1299.00, 506, 'Pending'),
(417, '2025-07-14 21:45:05', 170.00, 540, 'paid'),
(418, '2025-07-14 21:48:38', 75.00, 540, 'paid'),
(419, '2025-07-14 21:48:38', 75.00, 540, 'paid'),
(420, '2025-07-15 13:47:22', 340.00, 525, 'paid'),
(421, '2025-07-15 13:51:22', 70.00, 525, 'paid'),
(422, '2025-07-16 19:23:16', 1200.00, 545, 'Pending'),
(424, '2025-07-16 20:14:27', 80.00, 546, 'Pending'),
(427, '2025-07-16 20:25:59', 1200.00, 546, 'Pending'),
(429, '2025-07-16 21:29:18', 52.00, 503, 'Processing'),
(430, '2025-07-16 21:34:05', 60.00, 503, 'Shipped'),
(431, '2025-07-16 21:53:01', 1220.00, 547, 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL CHECK (`quantity` > 0),
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `store_id`) VALUES
(601, 301, 1001, 1, 201),
(602, 302, 1003, 1, 201),
(603, 303, 1004, 2, 201),
(604, 304, 1002, 1, 201),
(605, 305, 1008, 1, 205),
(606, 306, 1005, 1, 202),
(607, 307, 1010, 1, 201),
(608, 308, 1007, 1, 206),
(609, 309, 1009, 2, 203),
(610, 310, 1011, 1, 201),
(611, 311, 1012, 1, 201),
(612, 312, 1013, 1, 214),
(613, 313, 1014, 2, 205),
(614, 314, 1015, 1, 205),
(615, 315, 1016, 1, 203),
(616, 316, 1017, 3, 211),
(617, 317, 1018, 1, 211),
(618, 318, 1019, 1, 214),
(619, 319, 1020, 1, 204),
(620, 320, 1021, 2, 218),
(621, 321, 1022, 1, 218),
(622, 322, 1023, 1, 236),
(623, 323, 1024, 2, 236),
(624, 324, 1025, 1, 213),
(625, 325, 1026, 1, 213),
(626, 326, 1027, 1, 207),
(627, 327, 1028, 1, 207),
(628, 328, 1029, 2, 209),
(629, 329, 1030, 1, 209),
(630, 330, 1031, 1, 223),
(631, 331, 1032, 2, 223),
(632, 332, 1033, 1, 208),
(633, 333, 1034, 1, 208),
(634, 334, 1035, 1, 216),
(635, 335, 1036, 1, 216),
(636, 336, 1037, 2, 217),
(637, 337, 1038, 1, 217),
(638, 338, 1039, 1, 231),
(639, 339, 1040, 1, 231),
(640, 340, 1041, 1, 225),
(641, 341, 1042, 1, 225),
(642, 342, 1043, 1, 226),
(643, 343, 1044, 1, 226),
(644, 344, 1045, 2, 227),
(645, 345, 1046, 1, 227),
(646, 346, 1047, 1, 228),
(647, 347, 1048, 1, 228),
(648, 348, 1049, 1, 230),
(649, 349, 1050, 3, 230),
(650, 350, 1051, 1, 232),
(651, 351, 1052, 1, 232),
(652, 352, 1053, 1, 233),
(653, 353, 1054, 1, 233),
(654, 354, 1055, 1, 234),
(655, 355, 1056, 1, 269),
(656, 356, 1057, 2, 208),
(657, 357, 1058, 1, 243),
(658, 358, 1059, 1, 237),
(659, 359, 1060, 2, 237),
(660, 360, 1061, 1, 238),
(661, 361, 1062, 1, 238),
(662, 362, 1063, 1, 239),
(663, 363, 1064, 1, 239),
(664, 364, 1065, 1, 240),
(665, 365, 1066, 1, 240),
(666, 366, 1067, 1, 245),
(667, 367, 1068, 2, 245),
(668, 368, 1069, 1, 228),
(669, 369, 1070, 1, 228),
(670, 370, 1071, 1, 209),
(671, 371, 1072, 1, 209),
(672, 372, 1073, 2, 208),
(673, 373, 1074, 1, 251),
(674, 374, 1075, 1, 216),
(675, 375, 1076, 1, 216),
(676, 376, 1077, 2, 217),
(677, 377, 1078, 1, 217),
(678, 378, 1079, 1, 231),
(679, 379, 1080, 1, 231),
(680, 380, 1001, 1, 201),
(681, 381, 1002, 1, 201),
(682, 382, 1003, 2, 201),
(683, 383, 1004, 1, 201),
(684, 384, 1005, 1, 202),
(685, 385, 1006, 1, 202),
(686, 386, 1007, 1, 206),
(687, 387, 1008, 2, 205),
(688, 388, 1009, 1, 203),
(689, 389, 1010, 1, 201),
(690, 390, 1011, 1, 201),
(691, 391, 1012, 1, 201),
(692, 392, 1013, 1, 214),
(693, 393, 1014, 2, 205),
(694, 394, 1015, 1, 205),
(695, 395, 1016, 1, 203),
(696, 396, 1085, 1, 241),
(697, 397, 1086, 2, 241),
(698, 398, 1087, 1, 241),
(699, 399, 1088, 1, 241),
(700, 399, 1085, 1, 241),
(701, 400, 1086, 1, 241),
(702, 401, 1088, 2, 241),
(703, 402, 1087, 1, 241),
(704, 404, 1086, 1, 241),
(705, 405, 1089, 2, 241),
(706, 406, 1084, 3, 201),
(707, 407, 1010, 1, 201),
(708, 408, 1011, 1, 201),
(709, 409, 1092, 2, 202),
(710, 410, 1089, 2, 241),
(711, 410, 1091, 1, 241),
(712, 411, 1088, 1, 241),
(713, 412, 1087, 1, 241),
(714, 413, 1003, 1, 201),
(715, 413, 1082, 2, 201),
(716, 414, 1084, 1, 201),
(717, 415, 1082, 1, 201),
(718, 415, 1010, 1, 201),
(719, 416, 1082, 1, 201),
(720, 416, 1010, 1, 201),
(721, 417, 1087, 2, 241),
(722, 418, 1085, 1, 241),
(723, 419, 1085, 1, 241),
(724, 420, 1015, 4, 205),
(725, 421, 1014, 2, 205),
(726, 422, 1093, 1, 243),
(727, 424, 1058, 4, 243),
(728, 427, 1093, 1, 243),
(730, 429, 1016, 1, 203),
(731, 429, 1009, 1, 203),
(732, 430, 1009, 2, 203),
(733, 431, 1093, 1, 243),
(734, 431, 1058, 1, 243);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `otp` varchar(10) NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL CHECK (`price` >= 0),
  `stock_quantity` int(11) NOT NULL CHECK (`stock_quantity` >= 0),
  `image_url` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `data_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `price`, `stock_quantity`, `image_url`, `product_category`, `store_id`, `data_created`) VALUES
(1001, 'Laptop Pro X', 'High-performance laptop with 16GB RAM and 512GB SSD.', 1200.00, 50, 'uploads/laptop.png', 'Electronics', 201, '2024-04-07'),
(1002, 'Wireless Mouse', 'Ergonomic wireless mouse with adjustable DPI.', 25.00, 200, 'uploads/wireless_mouse.jpg', 'Peripherals', 201, '2023-07-01'),
(1003, 'Mechanical Keyboard', 'RGB mechanical keyboard with brown switches.', 80.00, 8, 'uploads/mech_keyboard.jpg', 'Peripherals', 201, '2025-03-17'),
(1004, 'USB-C Hub', 'Multi-port USB-C hub with HDMI and card reader.', 65.00, 250, 'uploads/usb_c_hub.png', 'Peripherals', 201, '2024-02-03'),
(1005, 'Designer Handbag', 'Premium leather handbag with unique design.', 250.00, 30, 'https://placehold.co/150x150/FFFFFF/000000?text=Handbag', 'Fashion', 202, '2025-05-12'),
(1006, 'Summer Dress', 'Light and airy cotton dress for summer.', 60.00, 80, 'https://placehold.co/150x150/FFFFFF/000000?text=Dress', 'Apparel', 202, '2025-01-21'),
(1007, 'Smart Watch X', 'Fitness tracker with heart rate monitor.', 180.00, 70, 'https://placehold.co/150x150/FFFFFF/000000?text=Watch', 'Wearables', 206, '2023-09-26'),
(1008, 'Running Shoes Pro', 'High-performance running shoes with great cushioning.', 120.00, 45, 'https://placehold.co/150x150/FFFFFF/000000?text=Shoes', 'Footwear', 205, '2024-01-11'),
(1009, 'Cookbook: Italian Classics', 'Collection of classic Italian recipes.', 30.00, 97, 'https://placehold.co/150x150/FFFFFF/000000?text=Book', 'Books', 203, '2025-06-20'),
(1010, 'Smartphone XYZ', 'Latest model smartphone with triple camera.', 799.00, 60, 'uploads/Smartphone.png', 'Electronics', 201, '2023-10-17'),
(1011, 'Wireless Earbuds', 'Compact earbuds with rich sound and long battery life.', 99.00, 120, 'uploads/wireless_earbuds.png', 'Audio', 201, '2025-01-31'),
(1012, 'Portable Bluetooth Speaker', 'Waterproof speaker with deep bass for outdoor use.', 75.00, 80, 'uploads/portable_bluetooth_speaker.png', 'Audio', 201, '2024-07-28'),
(1013, 'Gaming Headset', 'Immersive gaming headset with noise-cancelling mic.', 150.00, 60, 'https://placehold.co/150x150/FFFFFF/000000?text=GamingHeadset', 'Gaming', 214, '2024-02-22'),
(1014, 'Yoga Mat', 'Non-slip yoga mat, eco-friendly material.', 35.00, 148, 'https://placehold.co/150x150/FFFFFF/000000?text=YogaMat', 'Fitness', 205, '2023-07-11'),
(1015, 'Dumbbell Set 10kg', 'Adjustable dumbbell set for home workouts.', 85.00, 0, 'https://placehold.co/150x150/FFFFFF/000000?text=Dumbbells', 'Fitness', 205, '2023-09-22'),
(1016, 'Fiction Novel', 'Bestselling new release in the fantasy genre.', 22.00, 199, 'https://placehold.co/150x150/FFFFFF/000000?text=Novel', 'Books', 203, '2024-07-28'),
(1017, 'Kids Story Book', 'Colorful illustrated book for young readers.', 15.00, 180, 'https://placehold.co/150x150/FFFFFF/000000?text=KidsBook', 'Books', 211, '2024-03-23'),
(1018, 'Action Figure', 'Collectible action figure with multiple articulation points.', 40.00, 90, 'https://placehold.co/150x150/FFFFFF/000000?text=ActionFigure', 'Toys', 211, '2023-12-09'),
(1019, 'Board Game: Strategy Master', 'Complex strategy board game for 2-4 players.', 55.00, 50, 'https://placehold.co/150x150/FFFFFF/000000?text=BoardGame', 'Gaming', 214, '2023-07-17'),
(1020, 'Desk Lamp with Wireless Charger', 'Modern desk lamp with integrated phone charging.', 65.00, 70, 'https://placehold.co/150x150/FFFFFF/000000?text=DeskLamp', 'Home+Office', 204, '2024-06-03'),
(1021, 'Electric Kettle', 'Fast boiling electric kettle, stainless steel.', 40.00, 100, 'https://placehold.co/150x150/FFFFFF/000000?text=Kettle', 'Kitchen', 218, '2024-01-06'),
(1022, 'Coffee Maker', 'Drip coffee maker with programmable timer.', 90.00, 50, 'https://placehold.co/150x150/FFFFFF/000000?text=CoffeeMaker', 'Kitchen', 218, '2025-05-04'),
(1023, 'Throw Pillow Set', 'Set of two decorative throw pillows for sofa.', 45.00, 100, 'https://placehold.co/150x150/FFFFFF/000000?text=Pillows', 'Home+Decor', 236, '2025-03-06'),
(1024, 'Scented Candles', 'Natural soy wax candles, lavender scent.', 20.00, 150, 'https://placehold.co/150x150/FFFFFF/000000?text=Candles', 'Home+Decor', 236, '2024-05-30'),
(1025, 'Face Moisturizer', 'Hydrating face moisturizer with SPF 30.', 28.00, 200, 'https://placehold.co/150x150/FFFFFF/000000?text=Moisturizer', 'Beauty', 213, '2025-01-18'),
(1026, 'Shampoo and Conditioner Set', 'Organic shampoo and conditioner for all hair types.', 32.00, 180, 'https://placehold.co/150x150/FFFFFF/000000?text=ShampooSet', 'Beauty', 213, '2024-07-17'),
(1027, 'Dog Food (Large Breed)', 'Premium dog food for large breeds, 10kg bag.', 50.00, 70, 'https://placehold.co/150x150/FFFFFF/000000?text=DogFood', 'Pet+Supplies', 207, '2024-02-06'),
(1028, 'Cat Scratching Post', 'Durable cat scratching post with toy.', 30.00, 60, 'https://placehold.co/150x150/FFFFFF/000000?text=ScratchPost', 'Pet+Supplies', 207, '2025-05-23'),
(1029, 'Acrylic Paint Set', 'Set of 12 acrylic paints for artists.', 25.00, 100, 'https://placehold.co/150x150/FFFFFF/000000?text=PaintSet', 'Art+Supplies', 209, '2025-03-10'),
(1030, 'Sketchbook A4', 'High-quality sketchbook with 100 pages.', 18.00, 150, 'https://placehold.co/150x150/FFFFFF/000000?text=Sketchbook', 'Art+Supplies', 209, '2024-04-21'),
(1031, 'Protein Powder', 'Whey protein powder, vanilla flavor, 1kg.', 45.00, 90, 'https://placehold.co/150x150/FFFFFF/000000?text=Protein', 'Health', 223, '2024-06-25'),
(1032, 'Multivitamin Tablets', 'Daily multivitamin with essential minerals.', 20.00, 130, 'https://placehold.co/150x150/FFFFFF/000000?text=Multivitamin', 'Health', 223, '2024-01-11'),
(1033, 'Organic Green Tea', 'Pack of 50 organic green tea bags.', 12.00, 200, 'https://placehold.co/150x150/FFFFFF/000000?text=GreenTea', 'Groceries', 208, '2025-03-23'),
(1034, 'Artisan Bread', 'Freshly baked sourdough bread.', 7.00, 50, 'https://placehold.co/150x150/FFFFFF/000000?text=Bread', 'Groceries', 208, '2024-07-26'),
(1035, 'Toolbox Set', 'Basic toolbox with essential hand tools.', 70.00, 40, 'https://placehold.co/150x150/FFFFFF/000000?text=Toolbox', 'Tools', 216, '2023-09-10'),
(1036, 'Drill Machine', 'Cordless drill machine with battery and charger.', 110.00, 30, 'https://placehold.co/150x150/FFFFFF/000000?text=Drill', 'Tools', 216, '2025-04-14'),
(1037, 'Gardening Gloves', 'Durable gardening gloves, size M.', 15.00, 100, 'https://placehold.co/150x150/FFFFFF/000000?text=Gloves', 'Gardening', 217, '2023-11-19'),
(1038, 'Plant Pot Set', 'Set of 3 ceramic plant pots.', 25.00, 80, 'https://placehold.co/150x150/FFFFFF/000000?text=PlantPots', 'Gardening', 217, '2024-01-31'),
(1039, 'Baby Onesie Set', 'Pack of 3 organic cotton baby onesies.', 30.00, 120, 'https://placehold.co/150x150/FFFFFF/000000?text=Onesie', 'Baby+Care', 231, '2025-04-19'),
(1040, 'Baby Stroller', 'Lightweight and foldable baby stroller.', 180.00, 20, 'https://placehold.co/150x150/FFFFFF/000000?text=Stroller', 'Baby+Care', 231, '2024-10-10'),
(1041, 'Digital Camera', 'Mirrorless digital camera with 4K video.', 950.00, 25, 'https://placehold.co/150x150/FFFFFF/000000?text=Camera', 'Photography', 225, '2024-07-07'),
(1042, 'Camera Tripod', 'Adjustable tripod for stable photography.', 50.00, 70, 'https://placehold.co/150x150/FFFFFF/000000?text=Tripod', 'Photography', 225, '2024-10-13'),
(1043, 'Travel Backpack', 'Spacious travel backpack with multiple compartments.', 80.00, 60, 'https://placehold.co/150x150/FFFFFF/000000?text=Backpack', 'Travel', 226, '2024-11-22'),
(1044, 'Noise-Cancelling Travel Pillow', 'Comfortable travel pillow with built-in noise cancellation.', 40.00, 90, 'https://placehold.co/150x150/FFFFFF/000000?text=TravelPillow', 'Travel', 226, '2024-08-25'),
(1045, 'Stainless Steel Water Bottle', 'Insulated water bottle, 750ml.', 20.00, 150, 'https://placehold.co/150x150/FFFFFF/000000?text=WaterBottle', 'Eco-Friendly', 227, '2025-02-04'),
(1046, 'Reusable Shopping Bags (Set of 3)', 'Foldable and durable shopping bags.', 15.00, 180, 'https://placehold.co/150x150/FFFFFF/000000?text=ShoppingBags', 'Eco-Friendly', 227, '2024-01-23'),
(1047, 'Smart Light Bulbs (Pack of 2)', 'Wi-Fi enabled LED light bulbs.', 35.00, 80, 'https://placehold.co/150x150/FFFFFF/000000?text=SmartBulbs', 'Smart Home', 228, '2023-07-19'),
(1048, 'Smart Plug (2-pack)', 'Control appliances remotely with smart plugs.', 25.00, 100, 'https://placehold.co/150x150/FFFFFF/000000?text=SmartPlug', 'Smart Home', 228, '2024-01-28'),
(1049, 'Ergonomic Office Chair', 'Adjustable office chair with lumbar support.', 190.00, 40, 'https://placehold.co/150x150/FFFFFF/000000?text=OfficeChair', 'Office+Furniture', 230, '2024-04-08'),
(1050, 'A4 Printer Paper (Ream)', '500 sheets of standard A4 printer paper.', 8.00, 300, 'https://placehold.co/150x150/FFFFFF/000000?text=PrinterPaper', 'Office+Supplies', 230, '2023-08-24'),
(1051, 'Handmade Ceramic Mug', 'Unique handmade ceramic coffee mug.', 22.00, 60, 'https://placehold.co/150x150/FFFFFF/000000?text=CeramicMug', 'Artisan+Goods', 232, '2023-12-11'),
(1052, 'Custom Engraved Wooden Coasters', 'Set of 4 custom wooden coasters.', 35.00, 50, 'https://placehold.co/150x150/FFFFFF/000000?text=Coasters', 'Artisan+Goods', 232, '2025-04-25'),
(1053, 'Smartphone Repair Kit', 'Toolkit for basic smartphone repairs.', 18.00, 80, 'https://placehold.co/150x150/FFFFFF/000000?text=RepairKit', 'Tech+Repair', 233, '2025-04-10'),
(1054, 'Laptop Cooling Pad', 'Cooling pad with fans for laptops.', 30.00, 70, 'https://placehold.co/150x150/FFFFFF/000000?text=CoolingPad', 'Tech+Accessories', 233, '2024-12-16'),
(1055, 'Hiking Boots', 'Waterproof hiking boots for rugged trails.', 110.00, 40, 'https://placehold.co/150x150/FFFFFF/000000?text=HikingBoots', 'Outdoor+Gear', 234, '2023-07-05'),
(1056, 'Camping Tent (2-person)', 'Lightweight 2-person camping tent.', 95.00, 30, 'https://placehold.co/150x150/FFFFFF/000000?text=CampingTent', 'Outdoor+Gear', 269, '2025-03-08'),
(1057, 'Gourmet Chocolate Box', 'Assorted gourmet chocolates, 500g.', 28.00, 100, 'https://placehold.co/150x150/FFFFFF/000000?text=ChocolateBox', 'Food+Beverage', 208, '2023-12-04'),
(1058, 'Artisanal Coffee Beans', '1lb bag of single-origin artisanal coffee beans.', 20.00, 75, 'https://placehold.co/150x150/FFFFFF/000000?text=CoffeeBeans', 'Food+Beverage', 243, '2024-08-05'),
(1059, 'Car Dash Cam', 'Full HD dash cam with night vision.', 60.00, 70, 'https://placehold.co/150x150/FFFFFF/000000?text=DashCam', 'Car+Accessories', 237, '2023-09-27'),
(1060, 'Car Air Freshener (Pack of 4)', 'Long-lasting car air fresheners.', 10.00, 150, 'https://placehold.co/150x150/FFFFFF/000000?text=AirFreshener', 'Car+Accessories', 237, '2025-06-06'),
(1061, 'Mountain Bike', '21-speed mountain bike, alloy frame.', 350.00, 15, 'https://placehold.co/150x150/FFFFFF/000000?text=MountainBike', 'Bikes', 238, '2024-06-22'),
(1062, 'Bike Helmet', 'Adjustable bike helmet with ventilation.', 45.00, 40, 'https://placehold.co/150x150/FFFFFF/000000?text=BikeHelmet', 'Bike+Accessories', 238, '2024-08-11'),
(1063, 'Acoustic Guitar', 'Beginner-friendly acoustic guitar kit.', 180.00, 20, 'https://placehold.co/150x150/FFFFFF/000000?text=AcousticGuitar', 'Musical+Instruments', 239, '2024-02-28'),
(1064, 'Ukulele', 'Soprano ukulele with carrying bag.', 60.00, 30, 'https://placehold.co/150x150/FFFFFF/000000?text=Ukulele', 'Musical+Instruments', 239, '2023-06-30'),
(1065, 'Vintage Collectible Coin', 'Rare collectible coin from the 1950s.', 150.00, 5, 'https://placehold.co/150x150/FFFFFF/000000?text=Coin', 'Collectibles', 240, '2023-07-08'),
(1066, 'Limited Edition Stamp Set', 'Set of limited edition commemorative stamps.', 75.00, 10, 'https://placehold.co/150x150/FFFFFF/000000?text=Stamps', 'Collectibles', 240, '2023-08-20'),
(1067, 'Fish Tank Starter Kit', '10-gallon aquarium kit with filter and light.', 80.00, 25, 'https://placehold.co/150x150/FFFFFF/000000?text=FishTank', 'Pet+Supplies', 245, '2024-02-22'),
(1068, 'Tropical Fish Food', 'High-quality flakes for tropical fish.', 10.00, 100, 'https://placehold.co/150x150/FFFFFF/000000?text=FishFood', 'Pet+Supplies', 245, '2024-05-07'),
(1069, 'Wireless Security Camera', 'Outdoor wireless security camera with night vision.', 90.00, 40, 'https://placehold.co/150x150/FFFFFF/000000?text=SecurityCam', 'Smart Home', 228, '2023-11-02'),
(1070, 'Smart Doorbell', 'Video doorbell with motion detection.', 120.00, 30, 'https://placehold.co/150x150/FFFFFF/000000?text=SmartDoorbell', 'Smart Home', 228, '2024-09-03'),
(1071, 'Digital Painting Tablet', 'Graphics tablet with pressure sensitivity and pen.', 130.00, 50, 'https://placehold.co/150x150/FFFFFF/000000?text=DrawingTablet', 'Art+Supplies', 209, '2024-05-20'),
(1072, 'Calligraphy Pen Set', 'Elegant calligraphy pen set with ink cartridges.', 40.00, 80, 'https://placehold.co/150x150/FFFFFF/000000?text=Calligraphy', 'Art+Supplies', 209, '2024-06-08'),
(1073, 'Herbal Tea Variety Pack', 'Assorted herbal teas for relaxation.', 18.00, 150, 'https://placehold.co/150x150/FFFFFF/000000?text=HerbalTea', 'Groceries', 208, '2023-07-22'),
(1074, 'Gourmet Cheese Selection', 'Artisan cheese assortment for connoisseurs.', 35.00, 40, 'https://placehold.co/150x150/FFFFFF/000000?text=Cheese', 'Groceries', 251, '2024-12-27'),
(1075, 'Power Drill Kit', 'Cordless power drill with various bits.', 120.00, 35, 'https://placehold.co/150x150/FFFFFF/000000?text=PowerDrill', 'Tools', 216, '2024-10-26'),
(1076, 'Socket Wrench Set', 'Complete metric and SAE socket wrench set.', 60.00, 50, 'https://placehold.co/150x150/FFFFFF/000000?text=WrenchSet', 'Tools', 216, '2023-08-31'),
(1077, 'Indoor Plant Fertilizer', 'Organic fertilizer for houseplants.', 15.00, 100, 'https://placehold.co/150x150/FFFFFF/000000?text=Fertilizer', 'Gardening', 217, '2024-05-19'),
(1078, 'Seed Starter Kit', 'Complete kit for starting seeds indoors.', 25.00, 80, 'https://placehold.co/150x150/FFFFFF/000000?text=SeedKit', 'Gardening', 217, '2025-06-12'),
(1079, 'Baby Monitor with Camera', 'Video baby monitor with night vision and two-way audio.', 90.00, 25, 'https://placehold.co/150x150/FFFFFF/000000?text=BabyMonitor', 'Baby+Care', 231, '2024-08-14'),
(1080, 'Diaper Changing Pad', 'Waterproof and washable diaper changing pad.', 30.00, 60, 'https://placehold.co/150x150/FFFFFF/000000?text=DiaperPad', 'Baby+Care', 231, '2025-04-17'),
(1082, 'Peacock-frame', 'just for trial of products insertion', 500.00, 99, 'uploads/1750336604853-759774309.png', 'Accessories', 201, '2025-02-17'),
(1083, 'Joystick', 'helps as mouse', 90.00, 8, 'uploads/1750337242778-849194230.png', 'Electronics', 201, '2024-04-24'),
(1084, 'lock', 'needs a key', 89.00, 10, 'uploads/1750428533970-962012697.jpg', 'Peripherals', 201, NULL),
(1085, 'Fantin Arrangement', 'A radiant blend of seasonal flowers in custom pottery.', 75.00, 20, 'uploads/fantin.jpg', 'Floral Arrangement', 241, '2025-06-22'),
(1086, 'Van Aelst Bouquet', 'A lush bouquet of wildflowers and greens.', 70.00, 15, 'uploads/van_aelst.jpg', 'Bouquet', 241, '2025-06-22'),
(1087, 'Hiroshige Arrangement', 'Inspired by Japanese art, this mix features delicate petals.', 85.00, 10, 'uploads/hiroshige.jpg', 'Floral Arrangement', 241, '2025-06-22'),
(1088, 'Sunshine Jar', 'Sunflowers and wild herbs in a rustic jar.', 55.00, 25, 'uploads/sunshine.png', 'Jar Arrangement', 241, '2025-06-22'),
(1089, 'Evening Dew', 'Soft-hued blossoms perfect for twilight evenings.', 68.00, 18, 'uploads/evening_dew.png', 'Bouquet', 241, '2025-06-22'),
(1090, 'Wild Bloom', 'Untamed beauty of hand-picked flowers.', 65.00, 22, 'uploads/wild_bloom.png', 'Bouquet', 241, '2025-06-22'),
(1091, 'Glass Garden', 'A modern twist with greens in glass vases.', 90.00, 12, 'uploads/glass_garden.png', 'Vase Arrangement', 241, '2025-06-22'),
(1092, 'Cashmere Sweater', 'To keep you super warm wihtout weight.', 500.00, 40, 'uploads/1751012118757-451375727.jpg', 'Fashion', 202, '0000-00-00'),
(1093, 'Mirchi ka Achaar', 'tasty', 1200.00, 8, 'uploads/1752673070236-122821671.jpeg', 'Achaar', 243, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sale_id` int(11) NOT NULL,
  `sale_date` datetime NOT NULL,
  `sale_type` enum('online','offline') NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_sold` int(11) NOT NULL CHECK (`quantity_sold` > 0),
  `unit_price_at_sale` decimal(10,2) NOT NULL CHECK (`unit_price_at_sale` >= 0),
  `total_sale_amount` decimal(10,2) NOT NULL CHECK (`total_sale_amount` >= 0),
  `store_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sale_id`, `sale_date`, `sale_type`, `product_id`, `quantity_sold`, `unit_price_at_sale`, `total_sale_amount`, `store_id`, `customer_id`) VALUES
(801, '2024-01-05 10:00:00', 'online', 1001, 1, 1200.00, 1200.00, 201, 501),
(802, '2024-01-06 11:30:00', 'offline', 1003, 1, 80.00, 80.00, 201, 502),
(803, '2024-01-07 14:00:00', 'online', 1005, 1, 250.00, 250.00, 202, 503),
(804, '2024-01-08 09:15:00', 'offline', 1002, 2, 25.00, 50.00, 201, 504),
(805, '2024-01-09 16:45:00', 'online', 1006, 1, 60.00, 60.00, 202, 505),
(806, '2024-01-10 13:00:00', 'offline', 1008, 1, 120.00, 120.00, 205, 506),
(807, '2024-01-11 10:30:00', 'online', 1009, 1, 30.00, 30.00, 203, 507),
(808, '2024-01-12 17:00:00', 'offline', 1007, 1, 180.00, 180.00, 206, 508),
(809, '2024-01-13 08:00:00', 'online', 1010, 1, 799.00, 799.00, 201, 509),
(810, '2024-01-14 11:00:00', 'offline', 1004, 2, 45.00, 90.00, 201, 510),
(811, '2024-01-15 09:00:00', 'online', 1011, 1, 99.00, 99.00, 201, 511),
(812, '2024-01-16 14:00:00', 'offline', 1012, 1, 75.00, 75.00, 201, 512),
(813, '2024-01-17 10:15:00', 'online', 1013, 1, 150.00, 150.00, 214, 513),
(814, '2024-01-18 16:30:00', 'offline', 1014, 2, 35.00, 70.00, 205, 514),
(815, '2024-01-19 12:00:00', 'online', 1015, 1, 85.00, 85.00, 205, 515),
(816, '2024-01-20 09:30:00', 'offline', 1016, 1, 22.00, 22.00, 203, 516),
(817, '2024-01-21 15:00:00', 'online', 1017, 3, 15.00, 45.00, 211, 517),
(818, '2024-01-22 10:45:00', 'offline', 1018, 1, 40.00, 40.00, 211, 518),
(819, '2024-01-23 11:15:00', 'online', 1019, 1, 55.00, 55.00, 214, 519),
(820, '2024-01-24 14:20:00', 'offline', 1020, 1, 65.00, 65.00, 204, 520),
(821, '2024-01-25 08:30:00', 'online', 1021, 1, 40.00, 40.00, 218, 521),
(822, '2024-01-26 16:00:00', 'offline', 1022, 1, 90.00, 90.00, 218, 522),
(823, '2024-01-27 13:00:00', 'online', 1023, 1, 45.00, 45.00, 236, 523),
(824, '2024-01-28 10:00:00', 'offline', 1024, 2, 20.00, 40.00, 236, 524),
(825, '2024-01-29 15:30:00', 'online', 1025, 1, 28.00, 28.00, 213, 525),
(826, '2024-01-30 09:00:00', 'offline', 1026, 1, 32.00, 32.00, 213, 526),
(827, '2024-02-01 11:00:00', 'online', 1027, 1, 50.00, 50.00, 207, 527),
(828, '2024-02-02 12:00:00', 'offline', 1028, 1, 30.00, 30.00, 207, 528),
(829, '2024-02-03 14:00:00', 'online', 1029, 2, 25.00, 50.00, 209, 529),
(830, '2024-02-04 16:00:00', 'offline', 1030, 1, 18.00, 18.00, 209, 530),
(831, '2024-02-05 10:00:00', 'online', 1031, 1, 45.00, 45.00, 223, 501),
(832, '2024-02-06 11:30:00', 'offline', 1032, 2, 20.00, 40.00, 223, 502),
(833, '2024-02-07 13:00:00', 'online', 1033, 1, 12.00, 12.00, 208, 503),
(834, '2024-02-08 09:45:00', 'offline', 1034, 1, 7.00, 7.00, 208, 504),
(835, '2024-02-09 16:15:00', 'online', 1035, 1, 70.00, 70.00, 216, 505),
(836, '2024-02-10 13:00:00', 'offline', 1036, 1, 110.00, 110.00, 216, 506),
(837, '2024-02-11 10:30:00', 'online', 1037, 2, 15.00, 30.00, 217, 507),
(838, '2024-02-12 17:00:00', 'offline', 1038, 1, 25.00, 25.00, 217, 508),
(839, '2024-02-13 08:00:00', 'online', 1039, 1, 30.00, 30.00, 231, 509),
(840, '2024-02-14 11:00:00', 'offline', 1040, 1, 180.00, 180.00, 231, 510),
(841, '2024-02-15 09:00:00', 'online', 1041, 1, 950.00, 950.00, 225, 511),
(842, '2024-02-16 14:00:00', 'offline', 1042, 1, 50.00, 50.00, 225, 512),
(843, '2024-02-17 10:15:00', 'online', 1043, 1, 80.00, 80.00, 226, 513),
(844, '2024-02-18 16:30:00', 'offline', 1044, 1, 40.00, 40.00, 226, 514),
(845, '2024-02-19 12:00:00', 'online', 1045, 2, 20.00, 40.00, 227, 515),
(846, '2024-02-20 09:30:00', 'offline', 1046, 1, 15.00, 15.00, 227, 516),
(847, '2024-02-21 15:00:00', 'online', 1047, 1, 35.00, 35.00, 228, 517),
(848, '2024-02-22 10:45:00', 'offline', 1048, 1, 25.00, 25.00, 228, 518),
(849, '2024-02-23 11:15:00', 'online', 1049, 1, 190.00, 190.00, 230, 519),
(850, '2024-02-24 14:20:00', 'offline', 1050, 3, 8.00, 24.00, 230, 520),
(851, '2024-02-25 08:30:00', 'online', 1051, 1, 22.00, 22.00, 232, 521),
(852, '2024-02-26 16:00:00', 'offline', 1052, 1, 35.00, 35.00, 232, 522),
(853, '2024-02-27 13:00:00', 'online', 1053, 1, 18.00, 18.00, 233, 523),
(854, '2024-02-28 10:00:00', 'offline', 1054, 1, 30.00, 30.00, 233, 524),
(855, '2024-02-29 15:30:00', 'online', 1055, 1, 110.00, 110.00, 234, 525),
(856, '2024-03-01 09:00:00', 'offline', 1056, 1, 95.00, 95.00, 269, 526),
(857, '2024-03-02 11:00:00', 'online', 1057, 2, 28.00, 56.00, 208, 527),
(858, '2024-03-03 12:00:00', 'offline', 1058, 1, 20.00, 20.00, 243, 528),
(859, '2024-03-04 14:00:00', 'online', 1059, 1, 60.00, 60.00, 237, 529),
(860, '2024-03-05 16:00:00', 'offline', 1060, 2, 10.00, 20.00, 237, 530),
(861, '2024-03-06 10:00:00', 'online', 1061, 1, 350.00, 350.00, 238, 501),
(862, '2024-03-07 11:30:00', 'offline', 1062, 1, 45.00, 45.00, 238, 502),
(863, '2024-03-08 13:00:00', 'online', 1063, 1, 180.00, 180.00, 239, 503),
(864, '2024-03-09 09:45:00', 'offline', 1064, 1, 60.00, 60.00, 239, 504),
(865, '2024-03-10 16:15:00', 'online', 1065, 1, 150.00, 150.00, 240, 505),
(866, '2024-03-11 13:00:00', 'offline', 1066, 1, 75.00, 75.00, 240, 506),
(867, '2024-03-12 10:30:00', 'online', 1067, 1, 80.00, 80.00, 245, 507),
(868, '2024-03-13 17:00:00', 'offline', 1068, 2, 10.00, 20.00, 245, 508),
(869, '2024-03-14 08:00:00', 'online', 1069, 1, 90.00, 90.00, 228, 509),
(870, '2024-03-15 11:00:00', 'offline', 1070, 1, 120.00, 120.00, 228, 510),
(871, '2024-03-16 09:00:00', 'online', 1071, 1, 130.00, 130.00, 209, 511),
(872, '2024-03-17 14:00:00', 'offline', 1072, 1, 40.00, 40.00, 209, 512),
(873, '2024-03-18 10:15:00', 'online', 1073, 2, 18.00, 36.00, 208, 513),
(874, '2024-03-19 16:30:00', 'offline', 1074, 1, 35.00, 35.00, 251, 514),
(875, '2024-03-20 12:00:00', 'online', 1075, 1, 120.00, 120.00, 216, 515),
(876, '2024-03-21 09:30:00', 'offline', 1076, 1, 60.00, 60.00, 216, 516),
(877, '2024-03-22 15:00:00', 'online', 1077, 2, 15.00, 30.00, 217, 517),
(878, '2024-03-23 10:45:00', 'offline', 1078, 1, 25.00, 25.00, 217, 518),
(879, '2024-03-24 11:15:00', 'online', 1079, 1, 90.00, 90.00, 231, 519),
(880, '2024-03-25 14:20:00', 'offline', 1080, 1, 30.00, 30.00, 231, 520),
(881, '2024-08-30 15:45:00', 'online', 1058, 1, 20.00, 20.00, 202, 527),
(882, '2025-07-16 21:53:01', 'online', 1058, 1, 20.00, 20.00, 243, 547),
(883, '2025-07-16 21:53:01', 'online', 1093, 1, 1200.00, 1200.00, 243, 547),
(884, '2025-07-16 21:53:01', 'online', 1058, 1, 20.00, 20.00, 243, 547),
(885, '2025-07-16 21:53:01', 'online', 1093, 1, 1200.00, 1200.00, 243, 547);

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(100) NOT NULL,
  `store_tagline` varchar(255) DEFAULT NULL,
  `landing_image` text DEFAULT NULL,
  `store_photo` text DEFAULT NULL,
  `store_address` text DEFAULT NULL,
  `instagram_link` varchar(255) DEFAULT NULL,
  `facebook_link` varchar(255) DEFAULT NULL,
  `store_email` varchar(150) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `store_desc` varchar(255) DEFAULT NULL,
  `store_status` enum('enabled','disabled') DEFAULT 'enabled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stores`
--

INSERT INTO `stores` (`store_id`, `store_name`, `store_tagline`, `landing_image`, `store_photo`, `store_address`, `instagram_link`, `facebook_link`, `store_email`, `created_at`, `updated_at`, `store_desc`, `store_status`) VALUES
(201, 'Electronics Hub', 'Powering your world, one gadget at a time.', 'uploads/store201_bckgnd.jpg', 'uploads/store201_store.png', '101 Tech Way, Silicon Valley, CA', 'https://www.instagram.com/electronics_hub.store', 'https://www.facebook.com/electronics_hub.store', 'contact@electronicshub.com', '2025-06-22 16:24:11', '2025-07-18 04:53:50', 'We bring you hand-picked electronic products and lifestyle gadgets to elevate your everyday routine.', 'enabled'),
(202, 'Fashion Forward', 'The Latest Trends, at Your Fingertips.', 'uploads/store202_backgnd.jpg', 'uploads/store202_store.jpg', 'FC Road, Manapa ,Pune', 'fashionforward@instagram.com', 'fashionforward@facebook.com', 'info@fashionforward.com', '2025-06-22 16:24:11', '2025-06-27 07:22:27', 'Discover your style at our store – where fashion meets elegance. From timeless classics to the latest trends, we bring you curated collections that define confidence and individuality.', 'enabled'),
(203, 'Bookworm Corner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(204, 'Home Essentials', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(205, 'Sporting Goods Pro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(206, 'Gadget Galaxy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(207, 'Pet Paradise', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(208, 'Healthy Foods Co.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(209, 'Art Craft Supply', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(210, 'Global Market', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(211, 'Kids Corner', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-07-17 13:46:32', NULL, 'disabled'),
(212, 'Outdoor Depot', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(213, 'Beauty Glow', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(214, 'Gaming Haven', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(215, 'Music Mania', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(216, 'Tool Time', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(217, 'Garden Paradise', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(218, 'Kitchen Gadgets', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(219, 'Jewelry Sparkle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(220, 'Footwear Walk', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(221, 'Vintage Vault', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(222, 'Camping World', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(223, 'Health Co.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(224, 'Craft Beer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(225, 'Photo Pro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(226, 'Traveler', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(227, 'Eco Finds', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(228, 'Smart Home Solutions', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(229, 'Fitness First', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(230, 'Office Supplies', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(231, 'Baby Boutique', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(232, 'Artisan Market', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(233, 'Tech Fix', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(234, 'Outdoor Adventure', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(235, 'Sweet Treats', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(236, 'Home Decor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(237, 'Car Accessories', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(238, 'Bike Shop', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(239, 'Music Instruments', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(240, 'Collectibles', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-22 16:24:11', '2025-06-22 16:24:11', NULL, 'enabled'),
(241, 'Hales', 'Your daily dose of floral joy.', 'uploads/store241_bckgnd.jpg', 'uploads/store241_store.png', '123 Blossom Lane, Springfield, IL 62704,\r\nUnited States', 'https://www.instagram.com/haven.store', 'https://www.facebook.com/haven.store', 'contact@flowerhaven.com', '2025-06-22 17:16:34', '2025-06-22 17:31:45', 'We work with a small list of carefully chosen producers, source the freshest hothouse blooms, wildflowers and seasonal greenery and display them in custom pottery and glassware. ', 'enabled'),
(243, 'AcharDoPyaza', 'Spice Up Your Life', 'uploads/store243_bckgnd.png', 'uploads/store243_photo.jpg', 'Ram Nagar,Bhandara  ', 'https://www.instagram.com/AcharDoPyaza.store', 'https://www.facebook.com/AcharDoPyaza.store', 'achardopyaza@contact.com', '2025-07-16 13:19:51', '2025-07-16 13:34:03', 'We are sharing happiness in every bottle. Too tasty, too good and too real. The right choice for your taste. It enhances your taste. Welcome to world of pickle. Your mood will take a turn. For the best spot on your dining table.', 'enabled');

-- --------------------------------------------------------

--
-- Table structure for table `store_reviews`
--

CREATE TABLE `store_reviews` (
  `review_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `review_text` text DEFAULT NULL,
  `store_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `store_reviews`
--

INSERT INTO `store_reviews` (`review_id`, `customer_name`, `rating`, `review_text`, `store_id`, `created_at`) VALUES
(1, 'Amit Sharma', 5, 'Excellent service and great product quality!', 201, '2025-06-01 05:00:00'),
(2, 'Sneha Patel', 4, 'Good experience overall, delivery was a bit late.', 201, '2025-06-03 08:45:00'),
(3, 'Raj Verma', 3, 'Average product, expected better quality.', 201, '2025-06-05 06:15:00'),
(4, 'Priya Desai', 5, 'Loved the customer support and fast delivery!', 201, '2025-06-07 03:30:00'),
(5, 'Sophia Green', 5, 'Absolutely stunning bouquets! The flowers were fresh and lasted for weeks. Highly recommend Flower Haven.', 241, '2025-06-15 05:04:00'),
(6, 'Liam Johnson', 4, 'Beautiful arrangements and timely delivery. Packaging could be improved but overall very satisfied.', 241, '2025-06-18 08:52:00'),
(7, 'Emma Davis', 5, 'Flower Haven made my anniversary extra special. Gorgeous flowers and great customer service!', 241, '2025-06-20 03:45:00'),
(8, 'Noah Smith', 3, 'Good flowers but the scent was not as strong as expected. Still a decent choice for gifting.', 241, '2025-06-21 05:35:00'),
(9, 'Olivia Brown', 5, 'The freshest flowers I have ever received. Beautifully arranged and delivered on time.', 241, '2025-06-22 11:00:00'),
(10, 'Jane Doe', 4, 'great services by store', 201, '2025-06-24 07:44:08'),
(11, 'Alice Smith', 2, 'Increase speed of delivery', 201, '2025-06-27 18:47:17'),
(12, 'Pipi', 3, 'Increase Delibery time', 243, '2025-07-16 13:51:52'),
(13, 'SUshilaBai', 5, 'Nani\'s Achar Taste', 243, '2025-07-16 13:56:10'),
(14, 'Wendy White', 1, 'i\'m broke my wife shops all day here ', 201, '2025-07-17 17:41:37');

-- --------------------------------------------------------

--
-- Table structure for table `todos`
--

CREATE TABLE `todos` (
  `task_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `task_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `todos`
--

INSERT INTO `todos` (`task_id`, `store_id`, `task_text`, `created_at`) VALUES
(2, 201, 'No task', '2025-07-15 09:57:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` enum('shop_owner','admin') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `user_type`, `created_at`, `updated_at`, `store_id`) VALUES
(31, 'contact@electronicshub.com', '$2b$12$sQVOpxTFKIab73hmxYvxeOgz4YKjCp0JxYy4MRhvgfG45XwQlmDjy', 'shop_owner', '2023-06-01 05:30:00', '2025-07-07 08:56:29', 201),
(32, 'info@fashionforward.com', '$2b$12$DU6GwGpMtbD5TFKSruztOuGTkb6rei3ctuJcEU3HLgnA5RbgbPhpi', 'shop_owner', '2023-06-05 05:30:00', '2025-07-07 08:56:29', 202),
(33, 'hello@bookwormcorner.com', '$2b$12$lLSVRiNWsnBemfVTae8Z5ekPvbZkO.68tDiFF.rHcyc9rEMYrFKjm', 'shop_owner', '2023-06-10 05:30:00', '2025-07-07 08:56:29', 203),
(34, 'support@homeessentials.com', '$2b$12$GGopbAXdXCcd7hbiBjeOTuIy10cBsaEKgl.U74kssuohRA1rXqJOa', 'shop_owner', '2023-06-15 05:30:00', '2025-07-07 08:56:29', 204),
(35, 'sales@sportinggoodspro.com', '$2b$12$yuqqbgmZlryjsxvJX73kgeiz.Id2JececnCScaa2O1wdL6tJBpN.i', 'shop_owner', '2023-06-20 05:30:00', '2025-07-07 08:56:29', 205),
(36, 'help@gadgetgalaxy.com', '$2b$12$z9vw4l1gUNFKaxAXPS7RROHoPLMdFeX5pL6nL8W5rbWx6bEXul6FC', 'shop_owner', '2023-06-25 05:30:00', '2025-07-07 08:56:29', 206),
(37, 'care@petparadise.com', '$2b$12$KjKaUZHo3cM0NVtRmNzSu.w8bfHg9e0Zl6RNiTgxkeX6khJfIjrkO', 'shop_owner', '2023-07-01 05:30:00', '2025-07-07 08:56:29', 207),
(38, 'order@healthyfoodsco.com', '$2b$12$ULW2ykCvMYIK/Tob.tlnV.5w4ZY9S8zMabA39T9GrzAkC5Ch4KK3q', 'shop_owner', '2023-07-05 05:30:00', '2025-07-07 08:56:29', 208),
(39, 'create@artcraftsupply.com', '$2b$12$fs8HRHqGHnA2q2B4kNDCvuQTHF4nA6rV9xv0ANo4eyD5dGU9KO4my', 'shop_owner', '2023-07-10 05:30:00', '2025-07-07 08:56:29', 209),
(40, 'inquiry@globalmarket.com', '$2b$12$UmY.5FVP.xMtfAHRX97SOuUuwq1SLJIdhOAmTIxKhAJGB.YjGq1KO', 'shop_owner', '2023-07-15 05:30:00', '2025-07-07 08:56:29', 210),
(41, 'toys@kidscorner.com', '$2b$10$k69rDLIOoo7NM9nDCoz.Zevb9KzYYgQf/4T/uwsBZZ2lGko6M.rrG', 'shop_owner', '2023-07-20 05:30:00', '2025-07-17 14:16:55', 211),
(42, 'gear@outdoordepot.com', '$2b$10$2Y4Gh4rxvWo67CETmqQ5n.r0OCIqhada4wCmmMup1ba4HmZ3J.Epe', 'shop_owner', '2023-07-25 05:30:00', '2025-07-17 14:16:32', 212),
(43, 'contact@beautyglow.com', '$2b$12$VK19zJ8.Eg6/9YUFcFxYqO7gYtx6Cujd8AaT0PoTBGGv8obIMcohK', 'shop_owner', '2023-07-30 05:30:00', '2025-07-07 08:56:29', 213),
(44, 'play@gaminghaven.com', '$2b$12$C.JZPDjAt3IH0iRt5klSxOai7ZgT96.nuhqp4xHT9Yj9AO/NZ/Ycu', 'shop_owner', '2023-08-01 05:30:00', '2025-07-07 08:56:29', 214),
(45, 'tune@musicmania.com', '$2b$12$gx2aK7s3p4XiyHfEPji/Pu5SKZrqbUwIdQ2yFRyMMHf5LgObe1NRu', 'shop_owner', '2023-08-05 05:30:00', '2025-07-07 08:56:29', 215),
(46, 'tools@tooltime.com', '$2b$12$9Q.z2LU4VStBdIAe6vso1OkgDhMI4E7LSXJKhdz/VkHqj9BuFG/nO', 'shop_owner', '2023-08-10 05:30:00', '2025-07-07 08:56:29', 216),
(47, 'garden@gardenparadise.com', '$2b$12$zZXfMQhMwRWUfvUQDRWklOBvu.Z7ECXY4aSO23N6AY2JUB9WcE3G2', 'shop_owner', '2023-08-15 05:30:00', '2025-07-07 08:56:29', 217),
(48, 'kitchen@gadgets.com', '$2b$12$0AefJH79UIXjH0fQl1P1duvLr7AaUqPlO2mMb3Y94xe5S/IRlTNbe', 'shop_owner', '2023-08-20 05:30:00', '2025-07-07 08:56:29', 218),
(49, 'shine@jewelrysparkle.com', '$2b$12$sjIhVOM8ZC51ccv9KpQ8uOGUm6X0grC86aGjxDBgSxXn5Txgx6i/C', 'shop_owner', '2023-08-25 05:30:00', '2025-07-07 08:56:29', 219),
(50, 'walk@footwear.com', '$2b$12$NdOCS2tA8jWyJApPgnvdvOyls/1EmnVxF37vC2DJy8M9kAxmvVpBu', 'shop_owner', '2023-08-30 05:30:00', '2025-07-07 08:56:29', 220),
(51, 'retro@vintagevault.com', '$2b$12$WJJl0PBPvC5kX8l5C8FZGuE0YOGcU43IF3UBFyGZ4MjV4ztHZhRVy', 'shop_owner', '2023-09-01 05:30:00', '2025-07-07 08:56:29', 221),
(52, 'camp@campingworld.com', '$2b$12$86TF3sATKCEcEgpNOCfqGeozavSgCDcCzKy/29yP4K2kZh.Mlxo.C', 'shop_owner', '2023-09-05 05:30:00', '2025-07-07 08:56:29', 222),
(53, 'wellness@healthco.com', '$2b$12$dfIoKr1hq3VZYRPSzdbiT.oeMiSRs1B1iCUMlNtn2C.JOwGOpP5XK', 'shop_owner', '2023-09-10 05:30:00', '2025-07-07 08:56:29', 223),
(54, 'brew@craftbeer.com', '$2b$12$uCz5aaDK7DW3rC2XSnYLyO3ls1BckIjIS3by6qQ4FvWJKBRMSbTX6', 'shop_owner', '2023-09-15 05:30:00', '2025-07-07 08:56:29', 224),
(55, 'capture@photopro.com', '$2b$12$w1V3bTn8Fo3OtAcQkN33BuYrcmmbE2xDJrGVztn6/YIKdZTKzFi7a', 'shop_owner', '2023-09-20 05:30:00', '2025-07-07 08:56:29', 225),
(56, 'explore@traveler.com', '$2b$12$dTbNJjqHt7hKnY/N/PhP.ujJw1ZhBRDkX4KmYv5qYWEcNbi/3B1Ga', 'shop_owner', '2023-09-25 05:30:00', '2025-07-07 08:56:29', 226),
(57, 'eco@ecofinds.com', '$2b$12$qcthRrRfTiAXpffHftwSK.g2DA.z53qzM8cZfMJtyq7ZMxLLuMcHO', 'shop_owner', '2023-09-30 05:30:00', '2025-07-07 08:56:29', 227),
(58, 'smarthome@solutions.com', '$2b$12$ru6jGFEsBKNog3rGoNWpQefU0ZFrCXLIZNWqRVCeWc4pGfFgHaO02', 'shop_owner', '2023-10-01 05:30:00', '2025-07-07 08:56:29', 228),
(59, 'fit@fitnessfirst.com', '$2b$12$fzKuWHtWabgyuWZy9kTTQumO2RU5PSoFvtz93C54mOfiRzq6UBMHa', 'shop_owner', '2023-10-05 05:30:00', '2025-07-07 08:56:29', 229),
(60, 'office@supplies.com', '$2b$12$3KiKoS39bb8dZY9RG/4UXu5zqlMtn0o9dy/7Yj23AY1muRoTKF9U2', 'shop_owner', '2023-10-10 05:30:00', '2025-07-07 08:56:29', 230),
(61, 'baby@boutique.com', '$2b$12$tBNhzUgtuwAxkO3Zb0CZVOorZ5ObQTOtKkH6zCyNzMHVJoGBNDccK', 'shop_owner', '2023-10-15 05:30:00', '2025-07-07 08:56:29', 231),
(62, 'art@artisanmarket.com', '$2b$12$ey/1uUmhvUChifN8AZh2Qeh2zPyvNozVjKgxUN1Zc2uFEG7OVIG4e', 'shop_owner', '2023-10-20 05:30:00', '2025-07-07 08:56:29', 232),
(63, 'repair@techfix.com', '$2b$12$xRTPDTFeaEXY0k9CBwcuEOZjjUvRpLqD67Ipx.OhUwDUCPZC9WHnm', 'shop_owner', '2023-10-25 05:30:00', '2025-07-07 08:56:29', 233),
(64, 'adventure@outdoor.com', '$2b$12$DOF4NOjqOjw1/sRYJzeQ0.7Nc3GLKLGnZGiAL2ZuPAzp25y.EKTZ6', 'shop_owner', '2023-10-30 05:30:00', '2025-07-07 08:56:29', 234),
(65, 'bake@sweettreats.com', '$2b$12$BPqjU2tdb1QQobvLKRSCUOrXjcJByUwDFkH9rZCQjEDX54oDhTWz2', 'shop_owner', '2023-11-01 05:30:00', '2025-07-07 08:56:29', 235),
(66, 'decor@homedecor.com', '$2b$12$IoJReiYIJS2SkOaSoCkRCeTxBpkqZpUuIra4e79R67GeFjU8rPLvO', 'shop_owner', '2023-11-05 05:30:00', '2025-07-07 08:56:29', 236),
(67, 'car@accessories.com', '$2b$12$gYQK2NfEjwlKykflbN6f3ui5PhB.AEMEBZFL1dNmgKHAVPz/7JKWi', 'shop_owner', '2023-11-10 05:30:00', '2025-07-07 08:56:29', 237),
(68, 'ride@bikeshop.com', '$2b$12$5Fy3BqOSaxEtjWI2x8qz5edEUs5R3fxQZX/48S1SkHkE1DiKhM7TS', 'shop_owner', '2023-11-15 05:30:00', '2025-07-07 08:56:29', 238),
(69, 'instrument@music.com', '$2b$12$8XZcYtwAt2jNzYv7x.O5ueYOXoM2kWHoSSKcmtH2vI95LDKhd1LDe', 'shop_owner', '2023-11-20 05:30:00', '2025-07-07 08:56:29', 239),
(70, 'collect@collectibles.com', '$2b$12$qPZl0kH02Dw0VqqlGJP82eAfPVjMuD3nvZg0ftrpyDq9Of9c8lAQu', 'shop_owner', '2023-11-25 05:30:00', '2025-07-07 08:56:29', 240),
(71, 'admin@example.com', '$2b$10$QzTPJ6zg1Wn.1cdpYFLLBueu9kFGl9OmH9SPt/Aw5XtZgDdiN3gT6', 'admin', '2025-06-19 06:26:36', '2025-07-17 12:06:56', NULL),
(72, 'janhavipawar7798@gmail.com', '$2b$12$s2Gk9p4E.BAmg1qNH7OcTuFHG6O4Iv82nPG4rkFBsh7aZ5qQniZbS', 'shop_owner', '2025-06-22 17:12:57', '2025-07-07 08:56:29', 241),
(75, 'cadepihu@gmail.com', '$2b$10$Y1eKBIGebtzHRNAkYqGs/.j06kRbpvM/YJd8KlkGibtpKa0UYedWm', 'shop_owner', '2025-07-07 09:27:56', '2025-07-14 11:19:08', 242),
(76, 'shitalvpawar1983@gmail.com', '$2b$10$mSExrSaqNvt30UOMM2VcTOOE3mKKqvodsxEXWO5VfwOshb.fwtcge', 'shop_owner', '2025-07-16 13:19:51', '2025-07-16 13:19:51', 243);

-- --------------------------------------------------------

--
-- Table structure for table `users_main`
--

CREATE TABLE `users_main` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users_main`
--

INSERT INTO `users_main` (`id`, `name`, `email`, `password`) VALUES
(1, 'Janhavi Pawar', 'janhavipawar7798@gmail.com', '$2b$10$Rbaa/fC5Y.fiGrIGuBiCtOvF2s1JYtOqT7x7e9OmzJ9/tN44eBi/K'),
(2, 'Tanvi Tonge', 'tanvitonge01@gmail.com', '$2b$10$A5TtOBTNi4F8H3zNCpWbqe2730RcFi2vUS1a9HRg9sTWaWeGQPoeG'),
(3, 'Vijay Pawar', 'vijayvpawar7798@gmail.com', '$2b$10$NNuqj/b177WM3vUDXXKQYeOksg3ojS2rfjgDZ7qbHH213YFiC9ge6'),
(4, 'fsdfsdfs', 'ffweferferg@err', '$2b$10$slecTtVSkzwWdynKotO/3eoVv9DF4R9.dX0hihu.AMONiR3Skvx/e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `customers`
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `idx_customer_id` (`customer_id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_store_id` (`store_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `idx_customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD UNIQUE KEY `uq_order_product` (`order_id`,`product_id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_store_id` (`store_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `idx_store_id` (`store_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sale_id`),
  ADD KEY `idx_product_id` (`product_id`),
  ADD KEY `idx_store_id` (`store_id`),
  ADD KEY `idx_customer_id` (`customer_id`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `store_reviews`
--
ALTER TABLE `store_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `fk_store` (`store_id`);

--
-- Indexes for table `todos`
--
ALTER TABLE `todos`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `unique_user_email` (`email`);

--
-- Indexes for table `users_main`
--
ALTER TABLE `users_main`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=548;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=486;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=432;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=735;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1094;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=886;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT for table `store_reviews`
--
ALTER TABLE `store_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `todos`
--
ALTER TABLE `todos`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_main`
--
ALTER TABLE `users_main`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);


--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_feedback_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_feedback_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_order_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_sales_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sales_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE;

--
-- Constraints for table `store_reviews`
--
ALTER TABLE `store_reviews`
  ADD CONSTRAINT `fk_store` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `store_reviews_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
