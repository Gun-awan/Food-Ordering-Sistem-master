-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Bulan Mei 2025 pada 08.17
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_food_order`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `code` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CompanyCode` varchar(20) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL,
  `IsDeleted` tinyint(4) NOT NULL,
  `CreatedBy` varchar(32) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `LastUpdatedBy` varchar(32) NOT NULL,
  `LastUpdatedDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`adm_id`, `username`, `password`, `email`, `code`, `date`, `CompanyCode`, `Status`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `LastUpdatedBy`, `LastUpdatedDate`) VALUES
(14, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@gmail.com', 'QTT00', '2025-04-14 13:55:49', NULL, 0, 0, '', '2025-04-14 20:55:49', '', '2025-04-14 20:55:49'),
(15, 'gunn', '12345678', 'ahmadgubajbdj@gmail.com', 'QTT00', '2025-04-25 14:51:47', NULL, 0, 0, '', '2025-04-25 21:51:47', '', '2025-04-25 21:51:47'),
(16, 'gunawan', '25d55ad283aa400af464c76d713c07ad', 'asdr@gmail.com', 'QSTE52', '2025-04-25 14:57:36', NULL, 0, 0, '', '2025-04-25 21:57:36', '', '2025-04-25 21:57:36'),
(17, 'gunawan', '202cb962ac59075b964b07152d234b70', 'asd@gmail.com', 'QFE6ZM', '2025-05-05 09:40:31', NULL, 0, 0, '', '2025-05-05 16:40:31', '', '2025-05-05 16:40:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_codes`
--

CREATE TABLE `admin_codes` (
  `id` int(222) NOT NULL,
  `codes` varchar(6) NOT NULL,
  `CompanyCode` varchar(20) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL,
  `IsDeleted` tinyint(4) NOT NULL,
  `CreatedBy` varchar(32) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `LastUpdatedBy` varchar(32) NOT NULL,
  `LastUpdatedDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `admin_codes`
--

INSERT INTO `admin_codes` (`id`, `codes`, `CompanyCode`, `Status`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `LastUpdatedBy`, `LastUpdatedDate`) VALUES
(2, 'QFE6ZM', NULL, 0, 0, '', '2025-04-14 14:36:32', '', '2025-04-14 14:36:32'),
(5, 'QSTE52', NULL, 0, 0, '', '2025-04-14 14:36:32', '', '2025-04-14 14:36:32'),
(7, 'QTT00', NULL, 0, 0, '', '2025-04-14 20:54:58', '', '2025-04-14 20:54:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dishes`
--

CREATE TABLE `dishes` (
  `d_id` int(222) NOT NULL,
  `rs_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `slogan` varchar(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(222) NOT NULL,
  `CompanyCode` varchar(20) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL,
  `IsDeleted` tinyint(4) NOT NULL,
  `CreatedBy` varchar(32) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `LastUpdatedBy` varchar(32) NOT NULL,
  `LastUpdatedDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `dishes`
--

INSERT INTO `dishes` (`d_id`, `rs_id`, `title`, `slogan`, `price`, `img`, `CompanyCode`, `Status`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `LastUpdatedBy`, `LastUpdatedDate`) VALUES
(24, 50, 'Bebek Bumbu Hitam', 'Bebek dengan bumbu masakan hitam yang memiliki rasa unik', 68.00, '67fb5d68bdd9c.jpg', NULL, 0, 0, '', '2025-04-14 14:46:02', '', '2025-05-05 16:15:49'),
(25, 50, 'Daging Sengkel Semarang', 'Daging yang lembut perpaduan bumbu yang ciri khas semarang', 90.00, '67fd19b219518.jpg', NULL, 0, 0, '', '2025-04-14 21:20:34', '', '2025-04-14 21:20:34'),
(26, 56, 'Nasi Goreng Spesial Mantap 2', 'Nasi Goreng yang di Masak Dengan Bumbum Resep Enak', 53.00, '68059f76d44c8.jpg', NULL, 0, 0, '', '2025-04-21 08:29:26', 'gunawan', '2025-05-05 19:16:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `remark`
--

CREATE TABLE `remark` (
  `id` int(11) NOT NULL,
  `frm_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `CompanyCode` varchar(20) DEFAULT NULL,
  `IsDeleted` tinyint(4) NOT NULL,
  `CreatedBy` varchar(32) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `LastUpdatedBy` varchar(32) NOT NULL,
  `LastUpdatedDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `remark`
--

INSERT INTO `remark` (`id`, `frm_id`, `status`, `remark`, `remarkDate`, `CompanyCode`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `LastUpdatedBy`, `LastUpdatedDate`) VALUES
(81, 58, 'in process', 'Sedang dimassak', '2025-04-25 16:46:50', NULL, 0, '', '2025-04-25 23:46:50', '', '2025-04-25 23:46:50'),
(82, 60, 'in process', 'Makanan Sedang di masak', '2025-05-05 12:43:48', NULL, 0, '', '2025-05-05 19:43:48', '', '2025-05-05 19:43:48'),
(83, 60, 'in process', 'sedang di masak', '2025-05-05 12:45:25', NULL, 0, '', '2025-05-05 19:45:25', '', '2025-05-05 19:45:25'),
(84, 60, 'in process', 'sedang dimasak', '2025-05-05 12:49:39', NULL, 0, '', '2025-05-05 19:49:39', '', '2025-05-05 19:49:39'),
(85, 61, 'in process', 'Sedang di masak', '2025-05-05 12:52:31', NULL, 0, '', '2025-05-05 19:52:31', '', '2025-05-05 19:52:31'),
(86, 62, 'in process', 'Sedang di masak', '2025-05-05 13:00:18', NULL, 0, '', '2025-05-05 20:00:18', '', '2025-05-05 20:00:18'),
(87, 63, 'in process', 'Sedang dimasak', '2025-05-05 13:00:41', NULL, 0, '', '2025-05-05 20:00:41', '', '2025-05-05 20:00:41'),
(88, 62, 'On Delivery', 'Sedang di antar', '2025-05-05 13:03:38', NULL, 0, '', '2025-05-05 20:03:38', '', '2025-05-05 20:03:38'),
(89, 62, 'closed', 'selesai', '2025-05-05 13:07:50', NULL, 0, '', '2025-05-05 20:07:50', '', '2025-05-05 20:07:50'),
(90, 63, 'On Delivery', 'd', '2025-05-05 13:08:17', NULL, 0, '', '2025-05-05 20:08:17', '', '2025-05-05 20:08:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `restaurant`
--

CREATE TABLE `restaurant` (
  `rs_id` int(222) NOT NULL,
  `c_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `url` varchar(222) NOT NULL,
  `o_hr` varchar(222) NOT NULL,
  `c_hr` varchar(222) NOT NULL,
  `o_days` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `image` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CompanyCode` varchar(20) DEFAULT NULL,
  `Status` tinyint(4) NOT NULL,
  `IsDeleted` tinyint(4) NOT NULL,
  `CreatedBy` varchar(32) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `LastUpdatedBy` varchar(32) NOT NULL,
  `LastUpdatedDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `restaurant`
--

INSERT INTO `restaurant` (`rs_id`, `c_id`, `title`, `email`, `phone`, `url`, `o_hr`, `c_hr`, `o_days`, `address`, `image`, `date`, `CompanyCode`, `Status`, `IsDeleted`, `CreatedBy`, `CreatedDate`, `LastUpdatedBy`, `LastUpdatedDate`) VALUES
(50, 13, 'Lara Djonggrang', 'lara.djonggrang@gmail.com', '08856456732', 'Lara-Djonggrang.com', '10am', '7pm', 'every-day', ' Makan di Lara Djonggrang rasanya seperti ada di dalam rumah antik dan museum sekaligus. ', '67d7f664deb5d.jpg', '2025-03-17 10:16:04', NULL, 0, 0, '', '2025-04-14 14:50:56', '', '2025-04-14 14:50:56'),
(56, 13, 'Bunga Rampai', 'bungarampai@gmail.com', '08922407444', 'Bungan-Rampai.com', '8am', '7pm', 'mon-sat', 'Jl.Bsd Selatan No.24 Jakarta Selatan', '68059e4174e06.png', '2025-04-21 01:24:17', NULL, 0, 0, '', '2025-04-21 08:24:17', '', '2025-04-21 08:24:17'),
(57, 17, 'Harum Manis', 'harum.manis@gmail.com', '0878862842', 'harum.manis.com', '8am', '7pm', 'mon-sat', 'Jl. Pahlawan Blok.A9 Prov.Tanggerang', '6806356d87ba8.jpg', '2025-04-21 12:09:17', NULL, 0, 0, '', '2025-04-21 19:09:17', '', '2025-04-21 19:09:17'),
(58, 13, 'Kembang Goela 3', 'kembanggoelo@gmail.com', '087439435267', 'kembang.goelo.com', '8am', '5pm', 'mon-wed', ' Jl. Jend. Sudirman No.Kav. 47-48 Kota Jakarta Selatan ', '6818b114ccc0f.png', '2025-05-05 12:37:40', NULL, 0, 0, '', '2025-04-21 19:12:19', 'gunawan', '2025-05-05 19:37:40');

-- --------------------------------------------------------

--
-- Struktur dari tabel `res_category`
--

CREATE TABLE `res_category` (
  `c_id` int(222) NOT NULL,
  `c_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CompanyCode` varchar(20) NOT NULL,
  `Status` tinyint(4) NOT NULL,
  `IsDelet` tinyint(4) NOT NULL,
  `CreatedBy` varchar(32) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `LastUpdateBy` varchar(32) NOT NULL,
  `LastUpdateDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `res_category`
--

INSERT INTO `res_category` (`c_id`, `c_name`, `date`, `CompanyCode`, `Status`, `IsDelet`, `CreatedBy`, `CreatedDate`, `LastUpdateBy`, `LastUpdateDate`) VALUES
(12, 'Gourmet', '2025-03-17 10:12:32', '', 0, 0, '', '2025-04-25 21:17:34', '', '2025-04-25 21:17:34'),
(13, 'Specialty', '2025-03-17 10:12:09', '', 0, 0, '', '2025-04-25 21:17:34', '', '2025-04-25 21:17:34'),
(17, 'Etnis', '2025-03-17 10:11:48', '', 0, 0, '', '2025-04-25 21:17:34', '', '2025-04-25 21:17:34'),
(20, 'Drinking good', '2025-04-25 17:11:30', '', 0, 0, '', '2025-04-25 22:10:53', 'gunawan', '2025-04-26 00:11:30'),
(21, 'makanan ringan 2', '2025-05-05 09:41:14', '', 0, 0, 'gunawan', '2025-04-25 23:29:25', 'gunawan', '2025-05-05 16:41:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `u_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `f_name` varchar(222) NOT NULL,
  `l_name` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `status` int(222) NOT NULL DEFAULT 1,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CompanyCode` varchar(20) NOT NULL,
  `StatusIs` tinyint(20) NOT NULL,
  `IsDelet` tinyint(20) NOT NULL,
  `CreatedBy` varchar(32) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `LastUpdatedBy` varchar(32) NOT NULL,
  `LastUpdateDate` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`u_id`, `username`, `f_name`, `l_name`, `email`, `phone`, `password`, `address`, `status`, `date`, `CompanyCode`, `StatusIs`, `IsDelet`, `CreatedBy`, `CreatedDate`, `LastUpdatedBy`, `LastUpdateDate`) VALUES
(37, 'nisa99', 'nisa', 'latansa', 'c.nisalatansa@gmail.com', '087887094161', 'd0f0b62308f7f394068f27e71d1f8b61', 'jl.gemalapik', 1, '2025-03-09 03:21:06', '', 0, 0, '', '2025-04-25 21:22:21', '', '2025-04-25 21:22:21'),
(38, 'gunawan3', 'Ahmad', 'Gunawan', 'ahmadgunawan22022000@gmail.com', '081808530029', 'bd5c6fd7d3172d4591c283c1dc3ae9e2', 'Cikarang Selatan', 1, '2025-05-05 12:33:29', '', 0, 0, '', '2025-04-25 21:22:21', '', '2025-05-05 19:33:29'),
(39, 'wahyu4', 'Ahmad', 'Gunawan', 'theanime24@gmail.com', '085974550203', '25d55ad283aa400af464c76d713c07ad', 'Cikarang selatan', 1, '2025-05-05 12:34:38', '', 0, 0, '', '2025-04-25 21:53:12', 'gunawan', '2025-05-05 19:34:38'),
(40, 'Agung28', 'guns', 'agund', 'habasbchbc@gmail.com', '085974550203', '25d55ad283aa400af464c76d713c07ad', 'bekasi', 1, '2025-05-05 12:38:49', '', 0, 0, 'gunawan', '2025-04-25 23:23:41', 'gunawan', '2025-05-05 19:38:49'),
(41, 'user', 'Ahmad', 'Gunawan', 'ahmadgunawan@gmail.com', '081808530029', '25d55ad283aa400af464c76d713c07ad', 'Cikarang Selatan', 1, '2025-05-05 09:11:38', '', 0, 0, '', '2025-05-05 16:11:38', '', '2025-05-05 16:11:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_orders`
--

CREATE TABLE `users_orders` (
  `o_id` int(222) NOT NULL,
  `u_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `quantity` int(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(222) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CompanyCode` varchar(20) NOT NULL,
  `StatusIs` tinyint(50) NOT NULL,
  `IsDelet` tinyint(50) NOT NULL,
  `CreatedBy` varchar(32) NOT NULL,
  `CreatedDate` datetime NOT NULL DEFAULT current_timestamp(),
  `LastUpdateBy` varchar(32) NOT NULL,
  `LastUpdateDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users_orders`
--

INSERT INTO `users_orders` (`o_id`, `u_id`, `title`, `quantity`, `price`, `status`, `date`, `CompanyCode`, `StatusIs`, `IsDelet`, `CreatedBy`, `CreatedDate`, `LastUpdateBy`, `LastUpdateDate`) VALUES
(62, 41, 'Bebek Bumbu Hitam', 1, 68.00, 'closed', '2025-05-05 13:07:50', '', 0, 0, '', '2025-05-05 19:59:39', '', '2025-05-05 20:07:50'),
(63, 41, 'Daging Sengkel Semarang', 1, 90.00, 'On Delivery', '2025-05-05 13:08:17', '', 0, 0, '', '2025-05-05 19:59:39', '', '2025-05-05 20:08:17');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indeks untuk tabel `admin_codes`
--
ALTER TABLE `admin_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`d_id`);

--
-- Indeks untuk tabel `remark`
--
ALTER TABLE `remark`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`rs_id`);

--
-- Indeks untuk tabel `res_category`
--
ALTER TABLE `res_category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indeks untuk tabel `users_orders`
--
ALTER TABLE `users_orders`
  ADD PRIMARY KEY (`o_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `admin_codes`
--
ALTER TABLE `admin_codes`
  MODIFY `id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `dishes`
--
ALTER TABLE `dishes`
  MODIFY `d_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `remark`
--
ALTER TABLE `remark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT untuk tabel `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `rs_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `res_category`
--
ALTER TABLE `res_category`
  MODIFY `c_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `users_orders`
--
ALTER TABLE `users_orders`
  MODIFY `o_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
