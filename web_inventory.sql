-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 02 Jul 2022 pada 10.45
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_inventory`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `level` set('admin','owner') NOT NULL DEFAULT 'admin'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `stok` int(11) NOT NULL,
  `status_delete` int(10) NOT NULL,
  `foto_produk` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `deskripsi`, `stok`, `status_delete`, `foto_produk`) VALUES
(1, 'Nutrisari Jeruk rasa Mangga', 'Enak pokok e', 20, 0, '21.jpg'),
(2, 'Jasjus', 'Hemmmm segerrr', 0, 0, '8.jpg'),
(3, 'Haram', 'Ini barang haram', 22, 0, '2.jpg'),
(4, 'lol', 'lol', 0, 1, '0'),
(5, 'qwer', 'qwr', 0, 1, '0'),
(8, 'awdwda', 'defrf', 0, 1, '0'),
(9, 'fefef', 'gtgyh', 0, 0, '1-old.jpg'),
(12, 'dwadasf', 'dvtgthyh', 0, 0, '1.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_barang_masuk` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `id_departemen` int(11) DEFAULT NULL,
  `jenis_masuk` set('pengembalian','pengadaan') NOT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `waktu_masuk` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_pinjam`
--

CREATE TABLE `barang_pinjam` (
  `id_barang_pinjam` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `id_departemen` int(11) NOT NULL,
  `jumlah_pinjam` int(11) NOT NULL,
  `waktu_pinjam` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `departemen`
--

CREATE TABLE `departemen` (
  `id_departemen` int(11) NOT NULL,
  `nama_departemen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `departemen`
--

INSERT INTO `departemen` (`id_departemen`, `nama_departemen`) VALUES
(1, 'UPT'),
(2, 'Innovation Center'),
(3, 'Prodi Manajemen Informatika'),
(4, 'Prodi Teknik Informatika'),
(5, 'Kemahasiswaan'),
(6, 'Rektorat'),
(7, 'Pengembangan Euy');

-- --------------------------------------------------------

--
-- Struktur dari tabel `galeri_foto`
--

CREATE TABLE `galeri_foto` (
  `id_galeri_foto` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `nama_file` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok_bulanan`
--

CREATE TABLE `stok_bulanan` (
  `id_stok_bulanan` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `tahun` smallint(6) NOT NULL,
  `jumlah_stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_barang_masuk`) USING BTREE,
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_departemen` (`id_departemen`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `barang_pinjam`
--
ALTER TABLE `barang_pinjam`
  ADD PRIMARY KEY (`id_barang_pinjam`) USING BTREE,
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_departemen` (`id_departemen`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`id_departemen`);

--
-- Indeks untuk tabel `galeri_foto`
--
ALTER TABLE `galeri_foto`
  ADD PRIMARY KEY (`id_galeri_foto`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `stok_bulanan`
--
ALTER TABLE `stok_bulanan`
  ADD PRIMARY KEY (`id_stok_bulanan`),
  ADD KEY `id_barang` (`id_barang`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id_barang_masuk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `barang_pinjam`
--
ALTER TABLE `barang_pinjam`
  MODIFY `id_barang_pinjam` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `departemen`
--
ALTER TABLE `departemen`
  MODIFY `id_departemen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `galeri_foto`
--
ALTER TABLE `galeri_foto`
  MODIFY `id_galeri_foto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stok_bulanan`
--
ALTER TABLE `stok_bulanan`
  MODIFY `id_stok_bulanan` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `barang_masuk_ibfk_2` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`id_departemen`),
  ADD CONSTRAINT `barang_masuk_ibfk_3` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Ketidakleluasaan untuk tabel `barang_pinjam`
--
ALTER TABLE `barang_pinjam`
  ADD CONSTRAINT `barang_pinjam_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `barang_pinjam_ibfk_2` FOREIGN KEY (`id_departemen`) REFERENCES `departemen` (`id_departemen`),
  ADD CONSTRAINT `barang_pinjam_ibfk_3` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `galeri_foto`
--
ALTER TABLE `galeri_foto`
  ADD CONSTRAINT `galeri_foto_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `stok_bulanan`
--
ALTER TABLE `stok_bulanan`
  ADD CONSTRAINT `stok_bulanan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
