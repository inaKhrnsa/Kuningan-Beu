-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Sep 2024 pada 22.41
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pemesanan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_harga`
--

CREATE TABLE `daftar_harga` (
  `id` int(11) NOT NULL,
  `nama_wisata` varchar(100) DEFAULT NULL,
  `harga_dewasa` decimal(10,2) DEFAULT NULL,
  `harga_anak_anak` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `daftar_harga`
--

INSERT INTO `daftar_harga` (`id`, `nama_wisata`, `harga_dewasa`, `harga_anak_anak`) VALUES
(1, 'Cibulan', 25000.00, 12500.00),
(2, 'Waduk Darma', 30000.00, 15000.00),
(3, 'Woodland', 35000.00, 17500.00),
(4, 'Palutungan', 30000.00, 15000.00),
(5, 'Telaga Biru Cicerem', 15000.00, 7500.00),
(6, 'Sangkan Park', 50000.00, 25000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `obyek_wisata`
--

CREATE TABLE `obyek_wisata` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `deskripsi` text NOT NULL,
  `img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `obyek_wisata`
--

INSERT INTO `obyek_wisata` (`id`, `nama`, `alamat`, `deskripsi`, `img`) VALUES
(10, 'Kolam Ikan', 'Provinsi Papua Barat Daya', 'Kepulauan Raja Ampat adalah gugusan kepulauan yang berlokasi di barat bagian Semenanjung Kepala Burung Pulau Papua. Secara administrasi, gugusan ini berada di bawah Kabupaten Raja Ampat dan Kota Sorong, Provinsi Papua Barat Daya.', '2471240816145431.jpg'),
(11, 'View Alam', 'Avenida Isabel la Católica, Seville, Spain', 'Plaza de Espaa adalah sebuah plaza megah yang terletak di Taman Maria Lusia, Seville, Spanyol. Plaza ini akan membuat siapapun jatuh cinta dengan keindahan bangunan yang memiliki sentuhan gabungan gaya arsitektur Renaisans dan Moor khas Spanyol. Pada awalnya bangunan ini dibangun sebagai sebuah konstruksi dan simbol atas acara Ibero-American Exposition yang diselenggarakan pada tahun 1929. Kini, keindahan desain arsitektur bangunan tersebut menjadi daya tarik utama turis yang berkunjung ke kota Seville.', '4875240816150427.jpg'),
(12, 'Air terjun', 'Cappadocia, Türkiye', 'Cappadocia juga termasuk tempat wisata di Turki yang mendunia. Tak heran banyak wisatawan dari berbagai negara yang tidak mau melewatkan kesempatan untuk berkunjung ke Cappadocia saat berada di Turki. Jika Anda tertarik mencobanya, siapkan dana sekitar 2 juta hingga 3,6 juta rupiah untuk merasakan suasana Turki dari udara. \r\n\r\nCiri khas dari Cappadocia yaitu banyaknya balon udara yang terbang di atas tebing-tebing batu dan pegunungan sehingga terlihat panorama yang luar biasa indah. Lokasi tempat wisata ini berada di distrik kuno di bagian timur dari Anatolia, tepatnya berada di dataran tinggi utara pegunungan taurus.', '1525240816150642.jpg'),
(13, 'Wisata keluarga', 'Wengen, Lauterbrunnen, Switzerland', 'Lembah yang dijuluki dengan sebutan “Valley of 72 waterfalls” ini merupakan lembah yang mempunyai 72 air terjun dan tersebar di sekitar lokasi. Lembah ini terletak di Desa Bern, dikelilingi oleh tebing bebatuan yang membentuk huruf “U”.\r\n\r\nTidak heran jika lembah yang sangat menawan ini banyak diburu wisatawan hanya untuk sekedar mengambil gambar dengan latar belakang tebing tinggi menjulang.\r\n\r\nPesona Lauterbrunnen sudah sangat mendunia, bahkan seorang penyair asal Eropa bernama Lord Byron sangat terinspirasi akan kemolekan lembah ini.', '2019240816151822.jpg'),
(14, 'Waterboom', 'Hulunbuir, Inner Mongolia, China', 'Hulunbuir Prairie, yang terletak di wilayah otonomi Mongolia Dalam, China Utara. Dengan rerumputan yang membentang sepanjang 1.200 meter, Hulunbuir Prairie menawarkan pemandangan yang memukau dan pengalaman alam yang mengagumkan. Letak geografis Hulunbuir Prairie yang strategis dengan iklim khas, cocok untuk pertumbuhan rerumputan.', '5129240816152610.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `paket_wisata`
--

CREATE TABLE `paket_wisata` (
  `id` int(11) NOT NULL,
  `obyek_wisata_id` int(11) NOT NULL,
  `nama_paket` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga_paket` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `paket_wisata`
--

INSERT INTO `paket_wisata` (`id`, `obyek_wisata_id`, `nama_paket`, `img`, `deskripsi`, `harga_paket`) VALUES
(8, 10, 'Cibulan', '540240816150017.jpg', 'Salah satu pantai yang menjadi primadona di Raja Ampat adalah Pantai Waiwo. Pantai ini berada di Pulau Waigeo, pulau terbesar di Raja Ampat. Jalur menuju Pantai Waiwo sangatlah mudah, hanya perlu menempuh waktu sekitar 20 menit dari pusat Kota Waisai dengan menggunakan mobil maupun sepeda motor. Saat tiba di Pantai Waiwo, Sobat Pesona akan langsung menemukan beberapa homestay yang berjejer rapi.', 25000),
(9, 11, 'Waduk Darma', '315240816150933.jpg', 'Plaza de Espaa adalah sebuah plaza megah yang terletak di Taman Maria Lusia, Seville, Spanyol. Plaza ini akan membuat siapapun jatuh cinta dengan keindahan bangunan yang memiliki sentuhan gabungan gaya arsitektur Renaisans dan Moor khas Spanyol. Pada awalnya bangunan ini dibangun sebagai sebuah konstruksi dan simbol atas acara Ibero-American Exposition yang diselenggarakan pada tahun 1929. Kini, keindahan desain arsitektur bangunan tersebut menjadi daya tarik utama turis yang berkunjung ke kota Seville.', 30000),
(10, 12, 'Palutungan', '189240816151121.jpg', 'Cappadocia juga termasuk tempat wisata di Turki yang mendunia. Tak heran banyak wisatawan dari berbagai negara yang tidak mau melewatkan kesempatan untuk berkunjung ke Cappadocia saat berada di Turki. Jika Anda tertarik mencobanya, siapkan dana sekitar 2 juta hingga 3,6 juta rupiah untuk merasakan suasana Turki dari udara. \r\n\r\nCiri khas dari Cappadocia yaitu banyaknya balon udara yang terbang di atas tebing-tebing batu dan pegunungan sehingga terlihat panorama yang luar biasa indah. Lokasi tempat wisata ini berada di distrik kuno di bagian timur dari Anatolia, tepatnya berada di dataran tinggi utara pegunungan taurus.', 30000),
(11, 13, 'Woodland', '85240816152815.jpg', 'Lembah yang dijuluki dengan sebutan “Valley of 72 waterfalls” ini merupakan lembah yang mempunyai 72 air terjun dan tersebar di sekitar lokasi. Lembah ini terletak di Desa Bern, dikelilingi oleh tebing bebatuan yang membentuk huruf “U”.\r\n\r\nTidak heran jika lembah yang sangat menawan ini banyak diburu wisatawan hanya untuk sekedar mengambil gambar dengan latar belakang tebing tinggi menjulang.\r\n\r\nPesona Lauterbrunnen sudah sangat mendunia, bahkan seorang penyair asal Eropa bernama Lord Byron sangat terinspirasi akan kemolekan lembah ini.', 35000),
(12, 14, 'Sangkan Park', '9496240816152951.jpeg', 'Hulunbuir Prairie, yang terletak di wilayah otonomi Mongolia Dalam, China Utara. Dengan rerumputan yang membentang sepanjang 1.200 meter, Hulunbuir Prairie menawarkan pemandangan yang memukau dan pengalaman alam yang mengagumkan. Letak geografis Hulunbuir Prairie yang strategis dengan iklim khas, cocok untuk pertumbuhan rerumputan.', 50000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `paket_wisata_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nomor_id` int(20) NOT NULL,
  `pengunjung_dewasa` int(11) NOT NULL,
  `pengunjung_anak` int(11) NOT NULL,
  `harga_tiket` int(11) NOT NULL,
  `total_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pemesanan`
--

INSERT INTO `pemesanan` (`id`, `user_id`, `nama`, `no_hp`, `paket_wisata_id`, `tanggal`, `nomor_id`, `pengunjung_dewasa`, `pengunjung_anak`, `harga_tiket`, `total_bayar`) VALUES
(11, 3, 'Alika Fadila Haya', '089123123', 10, '2024-09-12', 12, 2, 2, 76000000, 57000000),
(12, 3, 'Alika Fadila Haya', '089123123', 10, '2024-09-12', 12, 2, 2, 76000000, 57000000),
(13, 3, 'Alika Fadila Haya', '089123123', 11, '2024-09-12', 12, 2, 2, 76000000, 57000000),
(14, 3, 'Alika Fadila Haya', '089123123', 9, '2024-09-13', 123, 2, 3, 0, 0),
(15, 3, 'Alika Fadila Haya', '089123123', 9, '2024-09-20', 123, 2, 3, 115000000, 80500000),
(16, 3, 'Alika Fadila Haya', '089123123', 12, '2024-09-20', 123, 2, 1, 75000000, 62500000),
(17, 3, 'Alika Fadila Haya', '089123123', 8, '2024-09-12', 123, 1, 1, 16000000, 12000000),
(18, 3, 'Alika Fadila Haya', '089123123', 8, '2024-09-12', 1223, 2, 2, 32000000, 24000000),
(19, 3, 'Alika Fadila Haya', '089123123', 8, '2024-09-13', 123, 2, 3, 40000000, 28000000),
(20, 7, 'Ade Wahyu', '089643', 9, '2025-12-01', 232424, 1, 1, 46000000, 34500000),
(21, 7, 'Ade Wahyu', '089643', 9, '2024-11-11', 312233, 3, 3, 180000, 135000),
(22, 7, 'Ade Wahyu', '089643', 9, '2024-11-11', 1212, 2, 2, 120000, 90000),
(23, 7, 'Ade Wahyu', '089643', 12, '2025-12-02', 1232, 3, 1, 200000, 175000),
(24, 7, 'Ade Wahyu', '089643', 11, '2004-12-10', 123, 2, 3, 175000, 122500);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `no_hp`, `is_admin`) VALUES
(3, 'Alika Fadila Haya', 'alikafdh', '0d5d157cbb45493963d2f72976b2c7fb', '089123123', 0),
(4, 'Peter', 'peter', '51dc30ddc473d43a6011e9ebba6ca770', '089', 0),
(5, 'Jhon', 'Jhony', '305a0acc6cb2226c9bba3da3f28e429f', '123', 0),
(6, 'Aditya', 'adit', '486b6c6b267bc61677367eb6b6458764', '0892', 0),
(7, 'Ade Wahyu', 'adewaja', '36154d0fab7952e875ecaaad089538e6', '089643', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `video`
--

INSERT INTO `video` (`id`, `url`) VALUES
(7, 'https://www.youtube.com/embed/Bq4rmeIvJbs?si=rSRhIwqpGDKdA9VP'),
(8, 'https://www.youtube.com/embed/UJiVARkYs0c?si=sKtBf3vbSL2UQAYX'),
(9, 'https://www.youtube.com/embed/Xl_N6Oc1MYU?si=QvWMBrECUnBkzdzf');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `daftar_harga`
--
ALTER TABLE `daftar_harga`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `obyek_wisata`
--
ALTER TABLE `obyek_wisata`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `paket_wisata`
--
ALTER TABLE `paket_wisata`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `daftar_harga`
--
ALTER TABLE `daftar_harga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `obyek_wisata`
--
ALTER TABLE `obyek_wisata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `paket_wisata`
--
ALTER TABLE `paket_wisata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
