-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2022 at 10:26 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `transport_company`
--

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `license_plate_number_ID` int(11) NOT NULL,
  `model` varchar(40) NOT NULL,
  `capacity` int(30) NOT NULL,
  `driver_name` varchar(30) NOT NULL,
  `fk_driver_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`license_plate_number_ID`, `model`, `capacity`, `driver_name`, `fk_driver_ID`) VALUES
(1, '00001', 2146719746, 'John Doe', 1),
(2, '00002', 21383946, 'John Doe', 1),
(4, 'VW', 48, 'Otto Normalverbraucher', 5);

-- --------------------------------------------------------

--
-- Table structure for table `busstation`
--

CREATE TABLE `busstation` (
  `order_number` int(11) NOT NULL,
  `bus_station_name` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `cityID` int(11) NOT NULL,
  `cityname` varchar(40) NOT NULL,
  `address` varchar(40) NOT NULL,
  `telephonenumber` varchar(40) NOT NULL,
  `fk_order_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_ID` int(11) NOT NULL,
  `f_Name` varchar(30) NOT NULL,
  `l_Name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_ID`, `f_Name`, `l_Name`) VALUES
(1, 'John', 'Doe'),
(2, 'Johanna', 'Dover'),
(3, 'Sandro', 'Huber'),
(4, 'Maria', 'Rasant'),
(5, 'Otto', 'Normalverbraucher');

-- --------------------------------------------------------

--
-- Table structure for table `map`
--

CREATE TABLE `map` (
  `map_ID` int(11) NOT NULL,
  `fk_route_ID` int(11) NOT NULL,
  `fk_city_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `routeID` int(11) NOT NULL,
  `distance` int(11) NOT NULL,
  `origin` int(11) NOT NULL,
  `destination` varchar(30) NOT NULL,
  `fk_license_plate_number_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`license_plate_number_ID`),
  ADD KEY `fk_driver_ID` (`fk_driver_ID`);

--
-- Indexes for table `busstation`
--
ALTER TABLE `busstation`
  ADD PRIMARY KEY (`order_number`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`cityID`),
  ADD KEY `fk_order_number` (`fk_order_number`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_ID`);

--
-- Indexes for table `map`
--
ALTER TABLE `map`
  ADD PRIMARY KEY (`map_ID`),
  ADD KEY `fk_route_ID` (`fk_route_ID`),
  ADD KEY `fk_city_ID` (`fk_city_ID`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`routeID`),
  ADD KEY `fk_license_plate_number_ID` (`fk_license_plate_number_ID`),
  ADD KEY `origin` (`origin`),
  ADD KEY `distance` (`distance`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `license_plate_number_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `busstation`
--
ALTER TABLE `busstation`
  MODIFY `order_number` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `cityID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `map`
--
ALTER TABLE `map`
  MODIFY `map_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `routeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buses`
--
ALTER TABLE `buses`
  ADD CONSTRAINT `buses_ibfk_1` FOREIGN KEY (`fk_driver_ID`) REFERENCES `driver` (`driver_ID`);

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`fk_order_number`) REFERENCES `busstation` (`order_number`);

--
-- Constraints for table `map`
--
ALTER TABLE `map`
  ADD CONSTRAINT `map_ibfk_1` FOREIGN KEY (`fk_route_ID`) REFERENCES `routes` (`routeID`),
  ADD CONSTRAINT `map_ibfk_2` FOREIGN KEY (`fk_city_ID`) REFERENCES `cities` (`cityID`);

--
-- Constraints for table `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`fk_license_plate_number_ID`) REFERENCES `buses` (`license_plate_number_ID`),
  ADD CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`origin`) REFERENCES `busstation` (`order_number`),
  ADD CONSTRAINT `routes_ibfk_3` FOREIGN KEY (`distance`) REFERENCES `busstation` (`order_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
