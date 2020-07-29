-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 
-- 伺服器版本： 10.4.8-MariaDB-log
-- PHP 版本： 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `aiot_delivery`
--

-- --------------------------------------------------------

--
-- 資料表結構 `admin`
--

CREATE TABLE `admin` (
  `id` decimal(4,0) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`, `phone`, `email`) VALUES
('1', 'admin', '6c7ca345f63f835cb353ff15bd6c5e052ec08e7a', '0988-776-655', 'admin001@testmail.com');

-- --------------------------------------------------------

--
-- 資料表結構 `car`
--

CREATE TABLE `car` (
  `id` int(10) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `location` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `car`
--

INSERT INTO `car` (`id`, `status`, `location`) VALUES
(1, 1, ''),
(2, 1, ''),
(3, 1, ''),
(4, 0, ''),
(5, 0, ''),
(6, 0, ''),
(7, 0, ''),
(8, 2, ''),
(9, 2, ''),
(10, 1, '');

-- --------------------------------------------------------

--
-- 資料表結構 `car_status`
--

CREATE TABLE `car_status` (
  `status` tinyint(4) NOT NULL,
  `description` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `car_status`
--

INSERT INTO `car_status` (`status`, `description`) VALUES
(-1, '維修中'),
(0, '待命中'),
(1, '出勤中'),
(2, '回程中');

-- --------------------------------------------------------

--
-- 資料表結構 `customer`
--

CREATE TABLE `customer` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(80) NOT NULL,
  `payment` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `customer`
--

INSERT INTO `customer` (`id`, `name`, `password`, `phone`, `email`, `payment`) VALUES
(1, 'Alice', '57506e62eee113e203333a496940a4d34af23466', '0911-223-344', 'guest001_alice@testmail.com', '1'),
(2, 'Bob', 'e1938321acb5e9ec88a62f28b443fd5175e5a23e', '0922-334-455', 'guest002_bob@testmail.com', '3'),
(3, 'Carlos', 'af0a6086f97230f5470664ff51c11cb25e49e8b9', '0933-445-566', 'guest003_carlos@testmail.com', '1'),
(4, 'Diana', '89d7656453affe50152e11ec1411b91c8a4eb4af', '0944-556-677', 'guest004_diana@testmail.com', '2'),
(5, 'Tracy', '3cd23ccd1276de57a7abe67f8ede41a3ea4c78ae', '0987-648-090', 'carlie.sawayn@yahoo.com', '1'),
(6, 'Angela', '9b257a5b8e702001ca56c13a4a5c8ea39c7fa2f4', '0987-648-095', 'casimer.medhurst@hotmail.com', '2'),
(7, 'Jeremy', 'f54a164fe66d8146aa6f7e5d7742d145a508c4a8', '0987-648-290', 'margarette14@gmail.com', '3'),
(8, 'Bingo', '55fc154660399368c77c31767f1dfe445dfdc2e3', '0987-358-290', 'dortiz@yahoo.com', '1'),
(9, 'Jeff', '2b3c8c8fc0eeaec250a77594393810aeb6eb0cb6', '0967-588-092', 'sylvia29@hilpert.com', '2'),
(10, 'Charles', 'feabebdadef66e22fec591bdbce8ca39ba0160d7', '0937-589-396', 'nfahey@hotmail.com', '3'),
(11, 'Lucas', '47f6266cb89cb7ce270829e4c2d1683fdbdc9f05', '0937-589-388', 'ccartwright@okeefe.com', '3'),
(12, 'Issac', 'a8799e7a219467befbc88c637f9d9df2e8ddc74b', '0927-848-891', 'connelly.valentine@gibson.org', '2');

-- --------------------------------------------------------

--
-- 資料表結構 `order_list`
--

CREATE TABLE `order_list` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `arrive_time` datetime NOT NULL,
  `start_addr` varchar(80) NOT NULL,
  `dest_addr` varchar(80) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `order_list`
--

INSERT INTO `order_list` (`order_id`, `customer_id`, `car_id`, `arrive_time`, `start_addr`, `dest_addr`, `status`) VALUES
(1, 1, 1, '2020-05-10 16:20:00', '新北市板橋區民族路168號', '桃園市桃園區華廈路42巷182號96樓', 2),
(2, 2, 2, '2020-05-11 12:00:00', '新北市板橋區民族路168號', '嘉義市西區中港三路523巷127弄516號32樓', 2),
(3, 4, 4, '2020-05-16 17:00:00', '新北市板橋區民族路168號', '南投縣埔里鎮甘肅二路二段332巷727弄458號', 0),
(4, 1, 3, '2020-05-12 18:00:00', '新北市板橋區民族路168號', '新竹市北區自立二路七段976號', 2),
(5, 1, 5, '2020-05-15 12:00:17', '新北市板橋區民族路168號', '高雄市桃源區福中九街531號', 2),
(6, 2, 5, '2020-05-18 12:00:00', '新北市板橋區民族路168號', '臺中市中區香檳二路736號', 0),
(7, 3, 4, '2020-05-15 09:18:22', '新北市板橋區民族路168號', '基隆市仁愛區新華路二段781巷659號', 2),
(8, 4, 6, '2020-05-15 14:15:17', '新北市板橋區民族路168號', '雲林縣虎尾鎮海康街843號11樓', 2),
(9, 1, 7, '2020-05-15 14:59:00', '新北市板橋區民族路168號', '屏東縣鹽埔鄉文莊街三段926巷948弄493號45樓', 2),
(10, 2, 8, '2020-05-15 15:00:00', '新北市板橋區民族路168號', '宜蘭縣大同鄉厚北街七段86巷642弄11號', 2),
(11, 4, 9, '2020-05-15 15:16:00', '新北市板橋區民族路168號', '基隆市中山區新興二街六段115巷199弄444號10樓', 2),
(12, 3, 10, '2020-05-15 15:47:00', '新北市板橋區民族路168號', '新北市坪林區福德南街二段279巷926弄70號35樓', 1),
(13, 4, 1, '2020-05-15 16:10:00', '新北市板橋區民族路168號', '臺南市鹽水區榮安路566巷579弄981號', 1),
(14, 3, 2, '2020-05-15 17:13:00', '新北市板橋區民族路168號', '宜蘭縣蘇澳鎮文成北街764號35樓', 1),
(15, 3, 3, '2020-05-15 17:20:00', '新北市板橋區民族路168號', '基隆市中正區寶君街178巷538號95樓', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `order_status`
--

CREATE TABLE `order_status` (
  `status` tinyint(4) NOT NULL,
  `description` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `order_status`
--

INSERT INTO `order_status` (`status`, `description`) VALUES
(-1, '狀況排除中'),
(0, '受理中'),
(1, '送貨中'),
(2, '已完成');

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `v_carfree`
-- (請參考以下實際畫面)
--
CREATE TABLE `v_carfree` (
`car_id` int(10)
);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `v_carlist`
-- (請參考以下實際畫面)
--
CREATE TABLE `v_carlist` (
`car_id` int(11)
,`last_order_id` int(10)
,`arrive_time` datetime
,`description` varchar(10)
,`car_location` varchar(80)
);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `v_car_order`
-- (請參考以下實際畫面)
--
CREATE TABLE `v_car_order` (
`car_id` int(11)
,`order_id` int(10)
,`arrive_time` datetime
);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `v_dashboard_counts`
-- (請參考以下實際畫面)
--
CREATE TABLE `v_dashboard_counts` (
`going` bigint(21)
,`delivering` bigint(21)
,`waiting` bigint(21)
,`staying` bigint(21)
);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `v_orderlist`
-- (請參考以下實際畫面)
--
CREATE TABLE `v_orderlist` (
`order_id` int(10)
,`customer_name` varchar(30)
,`car_id` int(11)
,`dest_addr` varchar(80)
,`arrive_time` datetime
,`description` varchar(10)
);

-- --------------------------------------------------------

--
-- 替換檢視表以便查看 `v_orderlist_pie`
-- (請參考以下實際畫面)
--
CREATE TABLE `v_orderlist_pie` (
`waiting` bigint(21)
,`delivering` bigint(21)
,`finished` bigint(21)
);

-- --------------------------------------------------------

--
-- 檢視表結構 `v_carfree`
--
DROP TABLE IF EXISTS `v_carfree`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_carfree`  AS  select `car`.`id` AS `car_id` from (`v_carlist` join `car`) where `v_carlist`.`car_id` = `car`.`id` and `car`.`status` = 0 order by `v_carlist`.`arrive_time` ;

-- --------------------------------------------------------

--
-- 檢視表結構 `v_carlist`
--
DROP TABLE IF EXISTS `v_carlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_carlist`  AS  select `v1`.`car_id` AS `car_id`,`v1`.`last_order_id` AS `last_order_id`,`v1`.`arrive_time` AS `arrive_time`,`v1`.`description` AS `description`,`v1`.`car_location` AS `car_location` from ((select `order_list`.`car_id` AS `car_id`,`order_list`.`order_id` AS `last_order_id`,`order_list`.`arrive_time` AS `arrive_time`,`car_status`.`description` AS `description`,`car`.`location` AS `car_location` from ((`order_list` join `car`) join `car_status`) where `order_list`.`car_id` = `car`.`id` and `car`.`status` = `car_status`.`status`) `v1` join (select `order_list`.`car_id` AS `car_id`,max(`order_list`.`arrive_time`) AS `last_time` from `order_list` group by `order_list`.`car_id`) `v2`) where `v1`.`car_id` = `v2`.`car_id` and `v1`.`arrive_time` = `v2`.`last_time` order by `v1`.`car_id` ;

-- --------------------------------------------------------

--
-- 檢視表結構 `v_car_order`
--
DROP TABLE IF EXISTS `v_car_order`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_car_order`  AS  select `order_list`.`car_id` AS `car_id`,`order_list`.`order_id` AS `order_id`,`order_list`.`arrive_time` AS `arrive_time` from `order_list` order by `order_list`.`arrive_time` desc ;

-- --------------------------------------------------------

--
-- 檢視表結構 `v_dashboard_counts`
--
DROP TABLE IF EXISTS `v_dashboard_counts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_dashboard_counts`  AS  select (select count(`car`.`id`) from `car` where `car`.`status` = 1 or `car`.`status` = 2) AS `going`,(select count(`order_list`.`order_id`) from `order_list` where `order_list`.`status` = 1) AS `delivering`,(select count(`order_list`.`order_id`) from `order_list` where `order_list`.`status` = 0) AS `waiting`,(select count(`car`.`id`) from `car` where `car`.`status` = 0) AS `staying` ;

-- --------------------------------------------------------

--
-- 檢視表結構 `v_orderlist`
--
DROP TABLE IF EXISTS `v_orderlist`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_orderlist`  AS  select `order_list`.`order_id` AS `order_id`,`customer`.`name` AS `customer_name`,`order_list`.`car_id` AS `car_id`,`order_list`.`dest_addr` AS `dest_addr`,`order_list`.`arrive_time` AS `arrive_time`,`order_status`.`description` AS `description` from ((`customer` join `order_list`) join `order_status`) where `customer`.`id` = `order_list`.`customer_id` and `order_list`.`status` = `order_status`.`status` order by `order_list`.`order_id` ;

-- --------------------------------------------------------

--
-- 檢視表結構 `v_orderlist_pie`
--
DROP TABLE IF EXISTS `v_orderlist_pie`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_orderlist_pie`  AS  select (select count(`order_list`.`order_id`) from `order_list` where `order_list`.`status` = 0) AS `waiting`,(select count(`order_list`.`order_id`) from `order_list` where `order_list`.`status` = 1) AS `delivering`,(select count(`order_list`.`order_id`) from `order_list` where `order_list`.`status` = 2) AS `finished` ;

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`);

--
-- 資料表索引 `car_status`
--
ALTER TABLE `car_status`
  ADD PRIMARY KEY (`status`);

--
-- 資料表索引 `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `status` (`status`) USING BTREE,
  ADD KEY `carid` (`car_id`) USING BTREE,
  ADD KEY `customerID` (`customer_id`) USING BTREE;

--
-- 資料表索引 `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`status`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `car`
--
ALTER TABLE `car`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_list`
--
ALTER TABLE `order_list`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`status`) REFERENCES `car_status` (`status`);

--
-- 資料表的限制式 `order_list`
--
ALTER TABLE `order_list`
  ADD CONSTRAINT `order_list_ibfk_1` FOREIGN KEY (`status`) REFERENCES `order_status` (`status`),
  ADD CONSTRAINT `order_list_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`),
  ADD CONSTRAINT `order_list_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
