-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2023 at 08:43 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rbserverdatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `apartments`
--

CREATE TABLE `apartments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `apartments`
--

INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
(1, 'apartment17270', 'apartment1', 'South Rockford Drive 7270', 'ZMW96212');

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(250) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','business','Gang') NOT NULL DEFAULT 'Current'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_cards`
--

CREATE TABLE `bank_cards` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `cardNumber` varchar(50) DEFAULT NULL,
  `cardPin` varchar(50) DEFAULT NULL,
  `cardActive` tinyint(4) DEFAULT 1,
  `cardLocked` tinyint(4) DEFAULT 0,
  `cardType` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_statements`
--

CREATE TABLE `bank_statements` (
  `record_id` bigint(255) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crypto`
--

CREATE TABLE `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `crypto`
--

INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
('qbit', 979, '[{\"NewWorth\":989,\"PreviousWorth\":997},{\"NewWorth\":989,\"PreviousWorth\":997},{\"NewWorth\":989,\"PreviousWorth\":997},{\"NewWorth\":979,\"PreviousWorth\":989}]');

-- --------------------------------------------------------

--
-- Table structure for table `crypto_transactions`
--

CREATE TABLE `crypto_transactions` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

CREATE TABLE `dealers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gloveboxitems`
--

CREATE TABLE `gloveboxitems` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `houselocations`
--

CREATE TABLE `houselocations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `house_plants`
--

CREATE TABLE `house_plants` (
  `id` int(11) NOT NULL,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lapraces`
--

CREATE TABLE `lapraces` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `management_funds`
--

CREATE TABLE `management_funds` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `management_funds`
--

INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
(1, 'police', 0, 'boss'),
(2, 'ambulance', 0, 'boss'),
(3, 'realestate', 0, 'boss'),
(4, 'taxi', 0, 'boss'),
(5, 'cardealer', 0, 'boss'),
(6, 'mechanic', 0, 'boss'),
(7, 'lostmc', 0, 'gang'),
(8, 'ballas', 0, 'gang'),
(9, 'vagos', 0, 'gang'),
(10, 'cartel', 0, 'gang'),
(11, 'families', 0, 'gang'),
(12, 'triads', 0, 'gang');

-- --------------------------------------------------------

--
-- Table structure for table `occasion_vehicles`
--

CREATE TABLE `occasion_vehicles` (
  `id` int(11) NOT NULL,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_gallery`
--

CREATE TABLE `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_invoices`
--

CREATE TABLE `phone_invoices` (
  `id` int(10) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_tweets`
--

CREATE TABLE `phone_tweets` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` varchar(512) DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`) VALUES
(1, 'ZMW96212', 1, 'license:5a031a269c8c884aa5a34ec120a050af08a86ad7', 'RBTC', '{\"cash\":500,\"bank\":5020,\"crypto\":0}', '{\"account\":\"US04QBCore2651589937\",\"nationality\":\"Philippines\",\"gender\":0,\"cid\":1,\"lastname\":\"TC\",\"birthdate\":\"1996-11-13\",\"firstname\":\"RB\",\"phone\":\"2197760532\",\"backstory\":\"placeholder backstory\"}', '{\"payment\":10,\"name\":\"unemployed\",\"label\":\"Civilian\",\"isboss\":false,\"onduty\":true,\"grade\":{\"name\":\"Freelancer\",\"level\":0},\"type\":\"none\"}', '{\"isboss\":false,\"grade\":{\"name\":\"none\",\"level\":0},\"name\":\"none\",\"label\":\"No Gang Affiliaton\"}', '{\"x\":-157.7934112548828,\"y\":-304.31207275390627,\"z\":39.7266845703125}', '{\"phone\":[],\"thirst\":65.80000000000003,\"injail\":0,\"hunger\":62.19999999999997,\"attachmentcraftingrep\":0,\"inside\":{\"apartment\":[]},\"armor\":0,\"jobrep\":{\"trucker\":0,\"taxi\":0,\"tow\":0,\"hotdog\":0},\"dealerrep\":0,\"fitbit\":[],\"inlaststand\":false,\"status\":[],\"callsign\":\"NO CALLSIGN\",\"fingerprint\":\"LV882W44Pey1922\",\"ishandcuffed\":false,\"phonedata\":{\"SerialNumber\":58352089,\"InstalledApps\":[]},\"isdead\":false,\"criminalrecord\":{\"hasRecord\":false},\"jailitems\":[],\"craftingrep\":0,\"commandbinds\":[],\"tracker\":false,\"stress\":9,\"bloodtype\":\"AB-\",\"licences\":{\"business\":false,\"weapon\":false,\"driver\":true},\"walletid\":\"QB-67916792\"}', '[{\"type\":\"item\",\"name\":\"driver_license\",\"slot\":1,\"info\":{\"birthdate\":\"1996-11-13\",\"type\":\"Class C Driver License\",\"firstname\":\"RB\",\"lastname\":\"TC\"},\"amount\":1},{\"type\":\"item\",\"name\":\"id_card\",\"slot\":2,\"info\":{\"gender\":0,\"firstname\":\"RB\",\"lastname\":\"TC\",\"citizenid\":\"ZMW96212\",\"birthdate\":\"1996-11-13\",\"nationality\":\"Philippines\"},\"amount\":1},{\"type\":\"item\",\"name\":\"phone\",\"slot\":3,\"info\":[],\"amount\":1}]', '2023-07-09 18:42:03');

-- --------------------------------------------------------

--
-- Table structure for table `playerskins`
--

CREATE TABLE `playerskins` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `playerskins`
--

INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
(2, 'ZMW96212', '587703123', '{\"ageing\":{\"item\":-1,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1},\"cheek_3\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"chimp_bone_width\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"t-shirt\":{\"item\":2,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1},\"cheek_2\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"ear\":{\"item\":-1,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1},\"eyebrows\":{\"item\":-1,\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1},\"chimp_bone_lowering\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"pants\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"watch\":{\"item\":-1,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1},\"vest\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"lips_thickness\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"bag\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"hat\":{\"item\":3,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1},\"lipstick\":{\"item\":-1,\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1},\"makeup\":{\"item\":-1,\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1},\"hair\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"face\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"nose_2\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"neck_thikness\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"shoes\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":1},\"arms\":{\"item\":2,\"texture\":2,\"defaultTexture\":0,\"defaultItem\":0},\"moles\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1},\"chimp_hole\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"blush\":{\"item\":-1,\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1},\"mask\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"bracelet\":{\"item\":-1,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1},\"chimp_bone_lenght\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"jaw_bone_back_lenght\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"eyebrown_forward\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"eyebrown_high\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"jaw_bone_width\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"eye_opening\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"face2\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"cheek_1\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"beard\":{\"item\":-1,\"texture\":1,\"defaultTexture\":1,\"defaultItem\":-1},\"eye_color\":{\"item\":-1,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":-1},\"nose_5\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"nose_4\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"accessory\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"nose_3\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"nose_1\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"facemix\":{\"shapeMix\":0,\"defaultShapeMix\":0.0,\"skinMix\":0,\"defaultSkinMix\":0.0},\"torso2\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"decals\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"glass\":{\"item\":2,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0},\"nose_0\":{\"item\":0,\"texture\":0,\"defaultTexture\":0,\"defaultItem\":0}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `player_contacts`
--

CREATE TABLE `player_contacts` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_houses`
--

CREATE TABLE `player_houses` (
  `id` int(255) NOT NULL,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_mails`
--

CREATE TABLE `player_mails` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_outfits`
--

CREATE TABLE `player_outfits` (
  `id` int(11) NOT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL DEFAULT '0',
  `model` varchar(50) DEFAULT NULL,
  `props` varchar(1000) DEFAULT NULL,
  `components` varchar(1500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_outfit_codes`
--

CREATE TABLE `player_outfit_codes` (
  `id` int(11) NOT NULL,
  `outfitid` int(11) NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_vehicles`
--

CREATE TABLE `player_vehicles` (
  `id` int(11) NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `player_warns`
--

CREATE TABLE `player_warns` (
  `id` int(11) NOT NULL,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stashitems`
--

CREATE TABLE `stashitems` (
  `id` int(11) NOT NULL,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trunkitems`
--

CREATE TABLE `trunkitems` (
  `id` int(11) NOT NULL,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apartments`
--
ALTER TABLE `apartments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`record_id`),
  ADD UNIQUE KEY `citizenid` (`citizenid`),
  ADD KEY `business` (`business`),
  ADD KEY `businessid` (`businessid`),
  ADD KEY `gangid` (`gangid`);

--
-- Indexes for table `bank_cards`
--
ALTER TABLE `bank_cards`
  ADD PRIMARY KEY (`citizenid`),
  ADD KEY `record_id` (`record_id`);

--
-- Indexes for table `bank_statements`
--
ALTER TABLE `bank_statements`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `business` (`business`),
  ADD KEY `businessid` (`businessid`),
  ADD KEY `gangid` (`gangid`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `license` (`license`),
  ADD KEY `discord` (`discord`),
  ADD KEY `ip` (`ip`);

--
-- Indexes for table `crypto`
--
ALTER TABLE `crypto`
  ADD PRIMARY KEY (`crypto`);

--
-- Indexes for table `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `dealers`
--
ALTER TABLE `dealers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gloveboxitems`
--
ALTER TABLE `gloveboxitems`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `houselocations`
--
ALTER TABLE `houselocations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `house_plants`
--
ALTER TABLE `house_plants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `building` (`building`),
  ADD KEY `plantid` (`plantid`);

--
-- Indexes for table `lapraces`
--
ALTER TABLE `lapraces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `raceid` (`raceid`);

--
-- Indexes for table `management_funds`
--
ALTER TABLE `management_funds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `job_name` (`job_name`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `occasion_vehicles`
--
ALTER TABLE `occasion_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `occasionId` (`occasionid`);

--
-- Indexes for table `phone_invoices`
--
ALTER TABLE `phone_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `number` (`number`);

--
-- Indexes for table `phone_tweets`
--
ALTER TABLE `phone_tweets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`citizenid`),
  ADD KEY `id` (`id`),
  ADD KEY `last_updated` (`last_updated`),
  ADD KEY `license` (`license`);

--
-- Indexes for table `playerskins`
--
ALTER TABLE `playerskins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `active` (`active`);

--
-- Indexes for table `player_contacts`
--
ALTER TABLE `player_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `player_houses`
--
ALTER TABLE `player_houses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `house` (`house`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `identifier` (`identifier`);

--
-- Indexes for table `player_mails`
--
ALTER TABLE `player_mails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `player_outfits`
--
ALTER TABLE `player_outfits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `citizenid_outfitname_model` (`citizenid`,`outfitname`,`model`),
  ADD KEY `citizenid` (`citizenid`);

--
-- Indexes for table `player_outfit_codes`
--
ALTER TABLE `player_outfit_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_player_outfit_codes_player_outfits` (`outfitid`);

--
-- Indexes for table `player_vehicles`
--
ALTER TABLE `player_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plate` (`plate`),
  ADD KEY `citizenid` (`citizenid`),
  ADD KEY `license` (`license`);

--
-- Indexes for table `player_warns`
--
ALTER TABLE `player_warns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stashitems`
--
ALTER TABLE `stashitems`
  ADD PRIMARY KEY (`stash`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `trunkitems`
--
ALTER TABLE `trunkitems`
  ADD PRIMARY KEY (`plate`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apartments`
--
ALTER TABLE `apartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_cards`
--
ALTER TABLE `bank_cards`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_statements`
--
ALTER TABLE `bank_statements`
  MODIFY `record_id` bigint(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crypto_transactions`
--
ALTER TABLE `crypto_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealers`
--
ALTER TABLE `dealers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gloveboxitems`
--
ALTER TABLE `gloveboxitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `houselocations`
--
ALTER TABLE `houselocations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `house_plants`
--
ALTER TABLE `house_plants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lapraces`
--
ALTER TABLE `lapraces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `management_funds`
--
ALTER TABLE `management_funds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `occasion_vehicles`
--
ALTER TABLE `occasion_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_invoices`
--
ALTER TABLE `phone_invoices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_tweets`
--
ALTER TABLE `phone_tweets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `playerskins`
--
ALTER TABLE `playerskins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `player_contacts`
--
ALTER TABLE `player_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_houses`
--
ALTER TABLE `player_houses`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_mails`
--
ALTER TABLE `player_mails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_outfits`
--
ALTER TABLE `player_outfits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `player_outfit_codes`
--
ALTER TABLE `player_outfit_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_vehicles`
--
ALTER TABLE `player_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `player_warns`
--
ALTER TABLE `player_warns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stashitems`
--
ALTER TABLE `stashitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trunkitems`
--
ALTER TABLE `trunkitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
