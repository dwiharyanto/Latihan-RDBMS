-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2020 at 04:15 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `latihan_rdbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(20) NOT NULL,
  `nama_barang` varchar(250) NOT NULL,
  `harga` int(11) NOT NULL,
  `jml_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga`, `jml_stock`) VALUES
('b0001', 'buku', 5000, 20),
('b0002', 'buku', 3000, 15),
('b0003', 'pulpen', 2000, 10),
('b0004', 'pulpen', 3000, 25),
('b0005', 'penggaris', 4000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id_customer` char(20) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `no_telp` int(11) NOT NULL,
  `no_kartu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id_customer`, `nama`, `alamat`, `no_telp`, `no_kartu`) VALUES
('c0001', 'budi', 'jakarta', 2147483647, 11111),
('c0002', 'doni', 'jakarta', 2147483647, 22222),
('c0003', 'andi', 'bandung', 2147483647, 33333);

-- --------------------------------------------------------

--
-- Table structure for table `kartu_member`
--

CREATE TABLE `kartu_member` (
  `no_kartu` int(11) NOT NULL,
  `masa_berlaku` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jenis_member` varchar(250) NOT NULL,
  `diskon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kartu_member`
--

INSERT INTO `kartu_member` (`no_kartu`, `masa_berlaku`, `jenis_member`, `diskon`) VALUES
(11111, '0000-00-00 00:00:00', 'tetap', 10),
(22222, '1979-12-31 17:00:00', 'tetap', 10),
(33333, '1989-12-31 17:00:00', 'tidak tetap', 0);

-- --------------------------------------------------------

--
-- Table structure for table `membeli`
--

CREATE TABLE `membeli` (
  `id_beli` char(20) NOT NULL,
  `tgl_beli` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_barang` char(20) NOT NULL,
  `id_customer` char(20) NOT NULL,
  `id_rekap` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membeli`
--

INSERT INTO `membeli` (`id_beli`, `tgl_beli`, `id_barang`, `id_customer`, `id_rekap`) VALUES
('m0001', '0000-00-00 00:00:00', 'b0002', 'c0001', 'r0001'),
('m0002', '1971-12-31 17:00:00', 'b0002', 'c0002', 'r0002'),
('m0003', '1972-12-31 17:00:00', 'b0001', 'c0002', 'r0003');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` char(20) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `no_telp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama`, `alamat`, `no_telp`) VALUES
('p0001', 'anton', 'jakarta', 2147483647),
('p0002', 'toni', 'jogja', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `rekap_penjualan`
--

CREATE TABLE `rekap_penjualan` (
  `id_rekap` char(20) NOT NULL,
  `tgl_rekap` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_pegawai` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekap_penjualan`
--

INSERT INTO `rekap_penjualan` (`id_rekap`, `tgl_rekap`, `id_pegawai`) VALUES
('r0001', '1989-12-31 17:00:00', 'p0001'),
('r0002', '0000-00-00 00:00:00', 'p0002'),
('r0003', '0000-00-00 00:00:00', 'p0001');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `kartu_member`
--
ALTER TABLE `kartu_member`
  ADD PRIMARY KEY (`no_kartu`);

--
-- Indexes for table `membeli`
--
ALTER TABLE `membeli`
  ADD PRIMARY KEY (`id_beli`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `rekap_penjualan`
--
ALTER TABLE `rekap_penjualan`
  ADD PRIMARY KEY (`id_rekap`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
