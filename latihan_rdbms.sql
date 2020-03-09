-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Mar 2020 pada 08.11
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.3.0

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
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` char(20) NOT NULL,
  `nama_barang` varchar(250) NOT NULL,
  `harga` int(11) NOT NULL,
  `jml_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga`, `jml_stock`) VALUES
('b0001', 'buku', 5000, 20),
('b0002', 'buku', 3000, 15),
('b0003', 'pulpen', 2000, 10),
('b0004', 'pulpen', 3000, 25),
('b0005', 'penggaris', 4000, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_customer` char(20) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `no_telp` int(11) NOT NULL,
  `no_kartu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id_customer`, `nama`, `alamat`, `no_telp`, `no_kartu`) VALUES
('c0001', 'budi', 'jakarta', 2147483647, 11111),
('c0002', 'doni', 'jakarta', 2147483647, 22222),
('c0003', 'andi', 'bandung', 2147483647, 33333);

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar`
--

CREATE TABLE `daftar` (
  `id_daftar` int(11) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `daftar`
--

INSERT INTO `daftar` (`id_daftar`, `email`) VALUES
(1, 'email1@gmail.com'),
(2, 'email2@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kartu_member`
--

CREATE TABLE `kartu_member` (
  `no_kartu` int(11) NOT NULL,
  `masa_berlaku` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jenis_member` varchar(250) NOT NULL,
  `diskon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kartu_member`
--

INSERT INTO `kartu_member` (`no_kartu`, `masa_berlaku`, `jenis_member`, `diskon`) VALUES
(11111, '0000-00-00 00:00:00', 'tetap', 10),
(22222, '1979-12-31 17:00:00', 'tetap', 10),
(33333, '1989-12-31 17:00:00', 'tidak tetap', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_status_daftar`
--

CREATE TABLE `log_status_daftar` (
  `id_log` int(11) NOT NULL,
  `id_daftar` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `log_status_daftar`
--

INSERT INTO `log_status_daftar` (`id_log`, `id_daftar`, `id_status`, `tanggal`) VALUES
(1, 1, 1, '2020-03-07 03:00:00'),
(2, 1, 2, '2020-03-07 04:00:00'),
(3, 2, 1, '2020-03-07 03:00:00'),
(4, 2, 2, '2020-03-07 04:00:00'),
(5, 2, 3, '2020-03-07 05:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `membeli`
--

CREATE TABLE `membeli` (
  `id_beli` char(20) NOT NULL,
  `tgl_beli` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_barang` char(20) NOT NULL,
  `id_customer` char(20) NOT NULL,
  `id_rekap` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `membeli`
--

INSERT INTO `membeli` (`id_beli`, `tgl_beli`, `id_barang`, `id_customer`, `id_rekap`) VALUES
('m0001', '0000-00-00 00:00:00', 'b0002', 'c0001', 'r0001'),
('m0002', '1971-12-31 17:00:00', 'b0002', 'c0002', 'r0002'),
('m0003', '1972-12-31 17:00:00', 'b0001', 'c0002', 'r0003');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` char(20) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `no_telp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama`, `alamat`, `no_telp`) VALUES
('p0001', 'anton', 'jakarta', 2147483647),
('p0002', 'toni', 'jogja', 2147483647);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekap_penjualan`
--

CREATE TABLE `rekap_penjualan` (
  `id_rekap` char(20) NOT NULL,
  `tgl_rekap` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_pegawai` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rekap_penjualan`
--

INSERT INTO `rekap_penjualan` (`id_rekap`, `tgl_rekap`, `id_pegawai`) VALUES
('r0001', '1989-12-31 17:00:00', 'p0001'),
('r0002', '0000-00-00 00:00:00', 'p0002'),
('r0003', '0000-00-00 00:00:00', 'p0001');

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_daftar`
--

CREATE TABLE `status_daftar` (
  `id_status` int(11) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `status_daftar`
--

INSERT INTO `status_daftar` (`id_status`, `status`) VALUES
(1, 'unverified'),
(2, 'verified'),
(3, 'finish');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `no_kartu` (`no_kartu`);

--
-- Indeks untuk tabel `daftar`
--
ALTER TABLE `daftar`
  ADD PRIMARY KEY (`id_daftar`),
  ADD UNIQUE KEY `mail_index` (`email`);

--
-- Indeks untuk tabel `kartu_member`
--
ALTER TABLE `kartu_member`
  ADD PRIMARY KEY (`no_kartu`);

--
-- Indeks untuk tabel `log_status_daftar`
--
ALTER TABLE `log_status_daftar`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_daftar` (`id_daftar`),
  ADD KEY `id_status` (`id_status`);

--
-- Indeks untuk tabel `membeli`
--
ALTER TABLE `membeli`
  ADD PRIMARY KEY (`id_beli`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_rekap` (`id_rekap`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indeks untuk tabel `rekap_penjualan`
--
ALTER TABLE `rekap_penjualan`
  ADD PRIMARY KEY (`id_rekap`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indeks untuk tabel `status_daftar`
--
ALTER TABLE `status_daftar`
  ADD PRIMARY KEY (`id_status`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `daftar`
--
ALTER TABLE `daftar`
  MODIFY `id_daftar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `log_status_daftar`
--
ALTER TABLE `log_status_daftar`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `status_daftar`
--
ALTER TABLE `status_daftar`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`no_kartu`) REFERENCES `kartu_member` (`no_kartu`);

--
-- Ketidakleluasaan untuk tabel `log_status_daftar`
--
ALTER TABLE `log_status_daftar`
  ADD CONSTRAINT `log_status_daftar_ibfk_1` FOREIGN KEY (`id_daftar`) REFERENCES `daftar` (`id_daftar`),
  ADD CONSTRAINT `log_status_daftar_ibfk_2` FOREIGN KEY (`id_status`) REFERENCES `status_daftar` (`id_status`);

--
-- Ketidakleluasaan untuk tabel `membeli`
--
ALTER TABLE `membeli`
  ADD CONSTRAINT `membeli_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `membeli_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`),
  ADD CONSTRAINT `membeli_ibfk_3` FOREIGN KEY (`id_rekap`) REFERENCES `rekap_penjualan` (`id_rekap`);

--
-- Ketidakleluasaan untuk tabel `rekap_penjualan`
--
ALTER TABLE `rekap_penjualan`
  ADD CONSTRAINT `rekap_penjualan_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
