-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2023 at 08:57 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sekolah`
--

-- --------------------------------------------------------

--
-- Table structure for table `bio_walimurid`
--

CREATE TABLE `bio_walimurid` (
  `nama_walimurid` varchar(20) NOT NULL,
  `no_telepon` int(12) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bio_walimurid`
--

INSERT INTO `bio_walimurid` (`nama_walimurid`, `no_telepon`, `alamat`) VALUES
('Anggabaya Prasetyo', 345187668, 'Ds. Kiaracondong No. 378, Salatiga 91554, Bengkulu'),
('Cayadi Wahyudin ', 26234604, 'Jr. Babah No. 328, Surakarta 24893, SulBar'),
('Yance Sudiati', 248776129, 'Ds. Uluwatu No. 280, Administrasi Jakarta Timur 51939, KalSel');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `no_absen` int(2) NOT NULL,
  `nisn` int(10) NOT NULL,
  `nama_murid` varchar(20) NOT NULL,
  `nama_walikelas` varchar(20) NOT NULL,
  `jenis_kelamin` enum('P','L') NOT NULL,
  `ruang_kelas` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`no_absen`, `nisn`, `nama_murid`, `nama_walikelas`, `jenis_kelamin`, `ruang_kelas`) VALUES
(1, 1111111111, 'Cahya Nashiruddin', 'Lasmanto Kurniawan ', 'L', 'A'),
(2, 1111111112, 'Agnes Nasyidah', 'Gabriella Zulaika', 'P', 'B'),
(3, 1111111113, 'Kartika Purwanti', 'Gabriella Zulaika', 'P', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `murid`
--

CREATE TABLE `murid` (
  `nisn` int(10) NOT NULL,
  `nama_murid` varchar(20) NOT NULL,
  `jenis_kelamin` enum('P','L') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `no_telepon` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `murid`
--

INSERT INTO `murid` (`nisn`, `nama_murid`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `no_telepon`) VALUES
(1111111111, 'Cahya Nashiruddin', 'L', '1983-01-03', 'Psr. Kebangkitan Nasional No. 800, Padangpanjang 65941, KepR', 870181827),
(1111111112, 'Agnes Nasyidah', 'P', '2013-05-09', 'Ds. Supono No. 634, Binjai 36334, SulSel', 2007676112),
(1111111113, 'Kartika Purwanti', 'P', '2003-03-18', 'Ds. Rajiman No. 692, Kendari 83026, SumUt', 846366405),
(1111111114, 'Elisa Riyanti ', 'P', '2015-05-22', 'Dk. Pasteur No. 969, Administrasi Jakarta Timur 97330, DIY', 878866218);

-- --------------------------------------------------------

--
-- Table structure for table `wali_kelas`
--

CREATE TABLE `wali_kelas` (
  `nama_walikelas` varchar(20) NOT NULL,
  `jeniskelamin_guru` enum('P','L') NOT NULL,
  `id_guru` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `no_telepon` int(12) NOT NULL,
  `tanggallahir_guru` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wali_kelas`
--

INSERT INTO `wali_kelas` (`nama_walikelas`, `jeniskelamin_guru`, `id_guru`, `alamat`, `no_telepon`, `tanggallahir_guru`) VALUES
('Lasmanto Kurniawan ', 'L', 11, 'Ds. W.R. Supratman No. 761, Kendari 15055, NTB', 873133628, '1994-08-12'),
('Gabriella Zulaika', 'P', 22, 'Dk. Ronggowarsito No. 300, Palu 80098, SulSel', 840775955, '1989-11-02');

-- --------------------------------------------------------

--
-- Table structure for table `wali_murid`
--

CREATE TABLE `wali_murid` (
  `nama_murid` varchar(20) NOT NULL,
  `nisn` int(10) NOT NULL,
  `nama_walimurid` varchar(20) NOT NULL,
  `status_wali` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wali_murid`
--

INSERT INTO `wali_murid` (`nama_murid`, `nisn`, `nama_walimurid`, `status_wali`) VALUES
('Agnes Nasyidah', 1111111112, 'Anggabaya Prasetyo', 'ayah'),
('Kartika Purwanti', 1111111113, 'Cayadi Wahyudin ', 'ayah'),
('Cahya Nashiruddin', 1111111111, 'Yance Sudiati', 'ibu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bio_walimurid`
--
ALTER TABLE `bio_walimurid`
  ADD PRIMARY KEY (`nama_walimurid`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `nama_murid` (`nama_murid`),
  ADD KEY `nama_walikelas` (`nama_walikelas`);

--
-- Indexes for table `murid`
--
ALTER TABLE `murid`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `nama_murid` (`nama_murid`);

--
-- Indexes for table `wali_kelas`
--
ALTER TABLE `wali_kelas`
  ADD PRIMARY KEY (`id_guru`),
  ADD KEY `nama_walikelas` (`nama_walikelas`);

--
-- Indexes for table `wali_murid`
--
ALTER TABLE `wali_murid`
  ADD PRIMARY KEY (`nama_walimurid`),
  ADD KEY `nama_murid` (`nama_murid`),
  ADD KEY `nisn` (`nisn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
