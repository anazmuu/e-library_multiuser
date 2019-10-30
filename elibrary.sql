-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2019 at 01:00 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpusku`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(5) NOT NULL,
  `nama_admin` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(35) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `username`, `password`) VALUES
(1, 'anaz', 'admin', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'Mulki', 'Anaz', 'eaccb8ea6090a40a98aa28c071810371'),
(3, 'Mulki Anaz', 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `nama_anggota` varchar(45) NOT NULL,
  `gender` enum('Laki-Laki','Perempuan') NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(5) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `pengarang` varchar(35) NOT NULL,
  `thn_terbit` date NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `isbn` varchar(25) NOT NULL,
  `jumlah_buku` int(3) NOT NULL,
  `lokasi` enum('Rak 1','Rak 2','Rak 3') NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `tgl_input` date NOT NULL,
  `status_buku` enum('1','0') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `id_kategori`, `judul_buku`, `pengarang`, `thn_terbit`, `penerbit`, `isbn`, `jumlah_buku`, `lokasi`, `gambar`, `tgl_input`, `status_buku`) VALUES
(5, 8, 'Dilan 1990', 'Pidi Baiq', '2013-05-05', 'CV.Indo Kreasi', '3553234454', 27, 'Rak 1', 'gambar1554435238.PNG', '2019-03-27', '1'),
(7, 3, 'Trik SQL', 'Ahdim Makaren', '2014-07-07', 'Wacana Ria', '54234762', 4, 'Rak 1', 'gambar1539747068.jpg', '2019-03-23', '1'),
(10, 3, 'Dasar Pemrograman Java', 'Rudi Hartono', '2017-03-02', 'Unjung Pena', '12345345', 6, 'Rak 2', 'gambar1554436894.jpg', '2018-05-08', '1');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pinjam`
--

CREATE TABLE `detail_pinjam` (
  `id_pinjam` varchar(5) NOT NULL,
  `denda` double NOT NULL,
  `id_anggota` int(4) NOT NULL,
  `id_buku` int(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(45) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Sains'),
(2, 'Hobby'),
(3, 'Komputer'),
(4, 'Komunikasi'),
(5, 'Hukum'),
(6, 'Agama'),
(7, 'Populer'),
(8, 'Bahasa'),
(9, 'Komik');

-- --------------------------------------------------------

--
-- Table structure for table `orderan`
--

CREATE TABLE `orderan` (
  `id_pinjam` varchar(5) DEFAULT NULL,
  `tgl_pencatatan` datetime DEFAULT NULL,
  `id_anggota` int(4) DEFAULT NULL,
  `id_buku` int(4) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `denda` double DEFAULT NULL,
  `tgl_pengembalian` date DEFAULT NULL,
  `total_denda` double DEFAULT NULL,
  `status_pengembalian` varchar(15) DEFAULT NULL,
  `status_peminjaman` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderan`
--

INSERT INTO `orderan` (`id_pinjam`, `tgl_pencatatan`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `denda`, `tgl_pengembalian`, `total_denda`, `status_pengembalian`, `status_peminjaman`) VALUES
('PJ001', '2019-04-12 00:00:00', 25, 11, '2019-04-12', '2019-04-26', 1000, '2019-05-26', 30000, '1', '1'),
('PJ063', '2019-09-01 00:00:00', 25, 21, '2019-09-01', '2019-09-15', 1000, '0000-00-00', 0, 'Belum Selesai', 'Belum Kembali');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pinjam` varchar(5) NOT NULL,
  `tanggal_input` datetime NOT NULL,
  `id_anggota` int(5) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `total_denda` double NOT NULL DEFAULT 0,
  `status_peminjaman` enum('Booking','Selesai','Belum Selesai') DEFAULT 'Belum Selesai',
  `status_pengembalian` enum('Kembali','Belum Kembali') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_pinjam`, `tanggal_input`, `id_anggota`, `tgl_pinjam`, `tgl_kembali`, `tgl_pengembalian`, `total_denda`, `status_peminjaman`, `status_pengembalian`) VALUES
('PJ001', '2019-04-12 23:04:47', 25, '2019-04-12', '2019-04-26', '2019-05-26', 30000, 'Booking', 'Kembali'),
('PJ002', '2019-04-12 23:04:47', 0, '2019-04-12', '2019-04-26', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ003', '2019-04-13 21:04:47', 25, '2019-04-13', '2019-04-27', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ004', '2019-04-13 21:04:48', 0, '2019-04-13', '2019-04-27', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ005', '2019-04-21 20:04:34', 25, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ006', '2019-04-21 20:04:35', 0, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ007', '2019-04-21 20:04:36', 25, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ008', '2019-04-21 20:04:37', 0, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ009', '2019-04-21 20:04:11', 25, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ010', '2019-04-21 20:04:12', 0, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ011', '2019-04-21 20:04:20', 25, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ012', '2019-04-21 20:04:20', 0, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ013', '2019-04-21 20:04:43', 25, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ014', '2019-04-21 20:04:44', 0, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ015', '2019-04-21 21:04:28', 25, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ016', '2019-04-21 21:04:29', 0, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ017', '2019-04-21 21:04:00', 25, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ018', '2019-04-21 21:04:00', 0, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ019', '2019-04-21 21:04:22', 25, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ020', '2019-04-21 21:04:23', 0, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ021', '2019-04-21 21:04:41', 25, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ022', '2019-04-21 21:04:41', 0, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ023', '2019-04-21 21:04:47', 25, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ024', '2019-04-21 21:04:47', 0, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ025', '2019-04-21 21:04:57', 25, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ026', '2019-04-21 21:04:57', 0, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ027', '2019-04-21 21:04:16', 25, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ028', '2019-04-21 21:04:16', 0, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ029', '2019-04-21 21:04:55', 25, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ030', '2019-04-21 21:04:55', 0, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ031', '2019-04-21 21:04:05', 25, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ032', '2019-04-21 21:04:05', 0, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ033', '2019-04-21 21:04:41', 25, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ034', '2019-04-21 21:04:42', 0, '2019-04-21', '2019-05-05', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ035', '2019-04-22 12:04:50', 25, '2019-04-22', '2019-05-06', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ036', '2019-04-22 12:04:50', 0, '2019-04-22', '2019-05-06', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ037', '2019-05-14 10:05:11', 25, '2019-05-14', '2019-05-28', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ038', '2019-05-14 10:05:11', 0, '2019-05-14', '2019-05-28', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ039', '2019-05-14 10:05:12', 0, '2019-05-14', '2019-05-28', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ040', '2019-05-14 10:05:31', 25, '2019-05-14', '2019-05-28', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ041', '2019-05-14 10:05:31', 0, '2019-05-14', '2019-05-28', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ042', '2019-05-14 10:05:31', 0, '2019-05-14', '2019-05-28', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ043', '2019-05-14 10:05:21', 25, '2019-05-14', '2019-05-28', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ044', '2019-05-14 10:05:21', 0, '2019-05-14', '2019-05-28', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ045', '2019-05-14 10:05:22', 0, '2019-05-14', '2019-05-28', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ046', '2019-05-26 02:05:20', 25, '2019-05-26', '2019-06-09', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ047', '2019-05-26 02:05:21', 0, '2019-05-26', '2019-06-09', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ048', '2019-05-26 02:05:21', 0, '2019-05-26', '2019-06-09', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ049', '2019-06-09 03:06:21', 25, '2019-06-09', '2019-06-23', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ050', '2019-06-09 03:06:22', 0, '2019-06-09', '2019-06-23', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ051', '2019-06-09 03:06:32', 25, '2019-06-09', '2019-06-23', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ052', '2019-06-09 03:06:33', 0, '2019-06-09', '2019-06-23', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ053', '2019-06-09 03:06:50', 25, '2019-06-09', '2019-06-23', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ054', '2019-06-09 03:06:50', 0, '2019-06-09', '2019-06-23', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ055', '2019-06-09 03:06:01', 25, '2019-06-09', '2019-06-23', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ056', '2019-06-09 03:06:01', 0, '2019-06-09', '2019-06-23', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ057', '2019-06-09 03:06:46', 25, '2019-06-09', '2019-06-23', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ058', '2019-06-09 03:06:46', 0, '2019-06-09', '2019-06-23', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ059', '2019-06-09 03:06:31', 25, '2019-06-09', '2019-06-23', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ060', '2019-06-09 03:06:32', 0, '2019-06-09', '2019-06-23', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ061', '2019-06-11 22:06:49', 25, '2019-06-11', '2019-06-25', '0000-00-00', 0, 'Booking', 'Belum Kembali'),
('PJ062', '2019-06-11 22:06:49', 0, '2019-06-11', '2019-06-25', '0000-00-00', 0, 'Booking', 'Belum Kembali');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_pinjam` varchar(5) NOT NULL,
  `tgl_pencatatan` datetime NOT NULL,
  `id_anggota` int(4) NOT NULL,
  `id_buku` int(4) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `denda` double NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `total_denda` double NOT NULL,
  `status_pengembalian` varchar(15) NOT NULL,
  `status_peminjaman` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_pinjam`, `tgl_pencatatan`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `denda`, `tgl_pengembalian`, `total_denda`, `status_pengembalian`, `status_peminjaman`) VALUES
('PJ063', '2019-09-01 00:00:00', 25, 21, '2019-09-01', '2019-09-15', 1000, '0000-00-00', 0, 'Belum Selesai', 'Belum Kembali');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_pinjam`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
