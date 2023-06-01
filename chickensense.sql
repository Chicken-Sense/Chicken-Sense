-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: 34.101.192.198
-- Generation Time: 01 Jun 2023 pada 14.19
-- Versi Server: 8.0.26-google
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chickensense`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_history`
--

CREATE TABLE `list_history` (
  `id_history` int NOT NULL,
  `waktu` datetime NOT NULL,
  `id_penyakit` int NOT NULL,
  `id_listObat` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_obat`
--

CREATE TABLE `list_obat` (
  `id_listObat` int NOT NULL,
  `id_penyakit` int NOT NULL,
  `id_obat` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat_ayam`
--

CREATE TABLE `obat_ayam` (
  `id_obat` int NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `img_obat` varchar(50) NOT NULL,
  `harga` smallint NOT NULL,
  `keterangan_obat` varchar(50) NOT NULL,
  `dosis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyakit_ayam`
--

CREATE TABLE `penyakit_ayam` (
  `id_penyakit` int NOT NULL,
  `nama_penyakit` varchar(50) NOT NULL,
  `img` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `list_history`
--
ALTER TABLE `list_history`
  ADD PRIMARY KEY (`id_history`),
  ADD KEY `hubungan list penyakit` (`id_penyakit`),
  ADD KEY `hubungan history` (`id_listObat`);

--
-- Indexes for table `list_obat`
--
ALTER TABLE `list_obat`
  ADD PRIMARY KEY (`id_listObat`),
  ADD KEY `hubungan obat` (`id_obat`),
  ADD KEY `hubungan penyakit` (`id_penyakit`);

--
-- Indexes for table `obat_ayam`
--
ALTER TABLE `obat_ayam`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `penyakit_ayam`
--
ALTER TABLE `penyakit_ayam`
  ADD PRIMARY KEY (`id_penyakit`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `list_history`
--
ALTER TABLE `list_history`
  MODIFY `id_history` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `list_obat`
--
ALTER TABLE `list_obat`
  MODIFY `id_listObat` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `obat_ayam`
--
ALTER TABLE `obat_ayam`
  MODIFY `id_obat` int NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `penyakit_ayam`
--
ALTER TABLE `penyakit_ayam`
  MODIFY `id_penyakit` int NOT NULL AUTO_INCREMENT;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `list_history`
--
ALTER TABLE `list_history`
  ADD CONSTRAINT `hubungan history` FOREIGN KEY (`id_listObat`) REFERENCES `list_obat` (`id_listObat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hubungan list penyakit` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit_ayam` (`id_penyakit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `list_obat`
--
ALTER TABLE `list_obat`
  ADD CONSTRAINT `hubungan obat` FOREIGN KEY (`id_obat`) REFERENCES `obat_ayam` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hubungan penyakit` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit_ayam` (`id_penyakit`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
