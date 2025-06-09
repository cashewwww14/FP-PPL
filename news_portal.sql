-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2025 at 05:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `news_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Apresiasi', '2025-06-06 05:01:52', '2025-06-09 14:49:08'),
(8, 'Academic', '2025-06-07 14:15:17', '2025-06-09 14:44:32'),
(9, 'Entrepreneurship', '2025-06-09 15:08:48', '2025-06-09 15:08:48'),
(10, 'Managerial', '2025-06-09 15:14:37', '2025-06-09 15:14:37'),
(11, 'Scientific', '2025-06-09 15:16:06', '2025-06-09 15:16:06'),
(12, 'Talents', '2025-06-09 15:17:35', '2025-06-09 15:18:06');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `comment_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `news_id`, `comment_text`, `created_at`) VALUES
(1, 2, 5, 'Wah akhirnya Intel punya GPU yang bisa saingi NVIDIA! Harga 3.9 juta lumayan terjangkau untuk performa segitu.', '2024-12-11 01:10:00'),
(2, 4, 5, 'XeSS 2 kayaknya bakal jadi game changer nih. Mudah-mudahan optimasi game-nya bagus.', '2024-12-11 02:20:00'),
(3, 2, 6, 'Semangat RRQ dan TLID! Semoga bisa juara di M6 ini 🔥', '2024-12-11 01:20:00'),
(4, 4, 6, 'TLID vs RRQ tadi seru banget! Moga TLID bisa sampai grand final.', '2024-12-11 02:25:00'),
(5, 2, 7, 'Alhamdulillah UMP naik 6.5%. Semoga bisa membantu pekerja menghadapi inflasi.', '2024-12-11 01:40:00'),
(6, 4, 7, 'Kapan ya Jakarta diumumin? Ditunggu banget nih kenaikannya.', '2024-12-11 03:05:00'),
(7, 4, 8, 'Wah ASN udah mulai pindah April 2025. Semoga infrastruktur IKN siap semua.', '2024-12-11 02:35:00'),
(8, 2, 8, 'Istana Garuda rampung Desember ini? Keren banget progressnya!', '2024-12-11 03:20:00'),
(9, 4, 9, 'Crypto emang volatil banget. Barusan tembus $100k eh turun lagi ke $95k.', '2024-12-11 02:55:00'),
(10, 2, 9, 'Yang penting HODL aja sih. Ini cuma koreksi sebelum naik lagi.', '2024-12-11 04:00:00'),
(11, 2, 10, 'Integrasi LRT sama kereta bandara bakal sangat membantu! Gak perlu gonta-ganti transportasi.', '2024-12-11 02:10:00'),
(12, 4, 10, 'Menhub kayaknya serius nih benerin konektivitas transportasi Jakarta.', '2024-12-11 03:10:00'),
(13, 2, 11, 'Jahe sama kunyit emang manjur buat diabetes. Nenek saya juga sering minum rebusan jahe.', '2024-12-11 03:25:00'),
(14, 4, 11, 'Bawang putih juga bagus ya ternyata. Mau coba konsumsi rutin ah.', '2024-12-11 03:40:00'),
(15, 4, 12, 'Info yang sangat berguna! Banyak yang terjebak pinjol ilegal karena tidak tahu cara hapus datanya.', '2024-12-11 03:35:00'),
(16, 2, 12, 'Penting banget laporin ke OJK kalau masih diteror. Jangan diam aja.', '2024-12-11 04:10:00'),
(17, 2, 10, 'test', '2025-06-07 10:58:20'),
(18, 1, 20, 'test admin', '2025-06-07 13:59:47'),
(19, 2, 20, 'test user 1', '2025-06-07 14:02:33');

-- --------------------------------------------------------

--
-- Table structure for table `interactions`
--

CREATE TABLE `interactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  `type` enum('like','bookmark') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `interactions`
--

INSERT INTO `interactions` (`id`, `user_id`, `news_id`, `type`, `created_at`) VALUES
(1, 2, 5, 'like', '2024-12-11 01:00:00'),
(2, 2, 6, 'like', '2024-12-11 01:15:00'),
(3, 2, 7, 'like', '2024-12-11 01:30:00'),
(5, 4, 5, 'like', '2024-12-11 02:15:00'),
(6, 4, 8, 'like', '2024-12-11 02:30:00'),
(7, 4, 9, 'like', '2024-12-11 02:45:00'),
(8, 4, 11, 'like', '2024-12-11 03:00:00'),
(9, 2, 5, 'bookmark', '2024-12-11 01:05:00'),
(10, 2, 7, 'bookmark', '2024-12-11 01:35:00'),
(11, 2, 11, 'bookmark', '2024-12-11 03:15:00'),
(12, 4, 6, 'bookmark', '2024-12-11 02:20:00'),
(13, 4, 9, 'bookmark', '2024-12-11 02:50:00'),
(14, 4, 12, 'bookmark', '2024-12-11 03:30:00'),
(15, 2, 10, 'like', '2025-06-07 10:58:25'),
(16, 2, 10, 'bookmark', '2025-06-07 10:58:26'),
(17, 1, 12, 'like', '2025-06-07 11:10:34'),
(18, 1, 12, 'bookmark', '2025-06-07 11:10:36'),
(19, 1, 20, 'like', '2025-06-07 13:59:56'),
(21, 2, 20, 'bookmark', '2025-06-07 14:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `release_date` datetime NOT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `release_date`, `image`, `category_id`, `created_by`) VALUES
(27, 'Mengenal Metode Evaluasi Regresi: MSE, RMSE, MAE, R², dan Adjusted R²', 'Dalam dunia machine learning, khususnya untuk model regresi, penting untuk mengevaluasi seberapa baik model memprediksi nilai numerik. Lima metrik umum digunakan untuk tujuan ini: MSE, RMSE, MAE, R², dan Adjusted R². Berikut penjelasan singkat masing-masing:\r\n\r\n1. MSE (Mean Squared Error)\r\nMSE menghitung rata-rata dari kuadrat selisih antara nilai prediksi dan nilai aktual. Metrik ini sensitif terhadap outlier karena kesalahan dikuadratkan, sehingga kesalahan besar memiliki dampak lebih besar.\r\n \r\n2. RMSE (Root Mean Squared Error)\r\nRMSE adalah akar dari MSE. Karena memiliki satuan yang sama dengan target, metrik ini lebih mudah diinterpretasikan daripada MSE.\r\n \r\n3. MAE (Mean Absolute Error)\r\nMAE menghitung rata-rata selisih absolut antara nilai aktual dan prediksi. Tidak seperti MSE/RMSE, MAE tidak terlalu dipengaruhi oleh outlier.\r\n\r\n4. R² (R-squared)\r\nR² menunjukkan seberapa besar variansi data yang bisa dijelaskan oleh model. Nilainya berkisar dari 0 hingga 1 (kadang bisa negatif jika model sangat buruk). Semakin mendekati 1, semakin baik modelnya.\r\n\r\n5. Adjusted R²\r\nAdjusted R² memperbaiki nilai R² dengan mempertimbangkan jumlah fitur dalam model. Ini penting untuk menghindari overfitting saat menambahkan banyak variabel yang tidak relevan.\r\n\r\nEvaluasi model regresi penting untuk memastikan akurasi dan keandalan prediksi. MSE dan RMSE memberikan penalti lebih besar untuk kesalahan besar, cocok jika outlier dianggap penting. MAE menawarkan alternatif yang lebih tahan terhadap outlier. R² menunjukkan seberapa baik model menjelaskan variansi data, sementara Adjusted R² memberikan gambaran yang lebih adil ketika model memiliki banyak fitur. Memilih metrik yang tepat bergantung pada konteks dan tujuan analisis.\r\n\r\nReferensi:\r\nhttps://farshadabdulazeez.medium.com/essential-regression-evaluation-metrics-mse-rmse-mae-r%C2%B2-and-adjusted-r%C2%B2-0600daa1c03a\r\n', '2024-11-04 18:44:00', 'assets/news/6846f39d1a0eb.jpg', 8, 1),
(28, 'Tutor EAS Genap 2024/2025', 'Menyambut pekan Ujian Akhir Semester (EAS), HMTC menghadirkan program Tutor EAS sebagai bentuk dukungan akademik bagi mahasiswa. Program ini bertujuan untuk membantu mahasiswa memahami materi dengan lebih baik melalui bimbingan langsung dari tutor-tutor berpengalaman. Kegiatan ini akan berlangsung selama dua hari, yaitu Jumat dan Sabtu, 13–14 Juni 2025 di ruang IF 105A-B.\r\n\r\nBerikut jadwal lengkapnya:\r\n\r\nDay 1 — Jumat, 13 Juni 2025\r\n\r\nStruktur Data (RPL)\r\n🕐 13.00 – 15.00 WIB\r\n👤 Muammar Bahalwan\r\n\r\nProbabilitas dan Statistik\r\n🕐 15.30 – 17.30 WIB\r\n👤 Genta Putra Prayoga\r\n\r\nDay 2 — Sabtu, 14 Juni 2025\r\n\r\nStruktur Data (IF)\r\n🕐 10.30 – 12.30 WIB\r\n👤 Valentino Reswara Aliputra & Fauzan Dzikir Rabbani\r\n\r\nSistem Operasi\r\n🕐 13.00 – 15.00 WIB\r\n👤 Miskiyah & Faith Mary Sani\r\n\r\nManfaatkan kesempatan ini untuk memperkuat pemahaman dan meningkatkan kesiapanmu menghadapi ujian. Sampai jumpa di sesi tutor!\r\n\r\nSelengkapnya:\r\nhttps://linktr.ee/TutorEASGenap2425\r\n\r\nReferensi:\r\nSWRT HMTC 2025', '2025-06-04 13:02:00', 'assets/news/6846f42f84e8c.png', 8, 7),
(29, 'Berawal dari Uang Jajan Jadi Bisnis Global', 'Rezqy Belva Rihan Poernomo, atau yang akrab disapa Egant, adalah mahasiswa Informatika angkatan 2022 yang kini tengah serius mengembangkan bisnisnya di bidang jasa 3D Modelling. Usaha yang diberi nama rbstudios ini fokus menyediakan aset 3D untuk kebutuhan game. Menariknya, dalam dua tahun terakhir, Egant berhasil menjangkau klien dari lebih dari sepuluh negara di berbagai belahan dunia.\r\n\r\nKecintaannya terhadap dunia 3D Modelling sudah tumbuh sejak SMA. Awalnya, Egant hanya ingin mencari uang jajan tambahan lewat hobi yang ia tekuni. Namun seiring waktu, keterampilannya di bidang ini justru membuka peluang yang lebih besar. Dari sinilah lahir ide untuk mulai menawarkan jasa 3D Modelling secara profesional dan membangun rbstudios dari nol.\r\n\r\nDalam menjalankan bisnisnya, Egant sangat menjunjung tinggi kualitas. Ia selalu memastikan setiap produk yang dikirim memiliki standar terbaik. Selain itu, menjaga komunikasi yang terbuka dengan klien juga menjadi prinsip penting baginya. Menurut Egant, relasi yang baik akan membuat klien merasa nyaman dan lebih mungkin untuk kembali menggunakan jasanya di kemudian hari.\r\n\r\nBergabung dengan program TCatalyst pun menjadi langkah baru bagi Egant untuk terus bertumbuh. Ia berharap bisa belajar banyak hal baru di dunia bisnis dan memperluas jaringan dengan sesama mahasiswa pengusaha. Baginya, kolaborasi adalah peluang besar yang bisa muncul dari komunitas seperti TCatalyst.\r\n\r\nUntuk teman-teman yang masih ragu memulai bisnis, Egant punya pesan penting. Ia menyarankan agar tidak takut untuk mencoba. Menurutnya, banyak orang terlalu fokus pada kekurangan yang dimiliki hingga lupa dengan potensi diri sendiri. Ketika sudah mulai dijalani, kekurangan itu justru lebih mudah dikenali dan diperbaiki. Yang terpenting adalah memulai dengan apa yang ada, lalu terus berkembang seiring waktu.\r\n\r\nPenasaran dengan karya-karya Egant? Kamu bisa langsung cek akun Instagram @rbstudios21 atau mampir ke fiverr.com/rezqybelva dan lihat sendiri bagaimana hobi bisa berubah menjadi ladang cuan yang menjanjikan!\r\n\r\nReferensi:\r\nhttps://www.instagram.com/p/DCVuSXlRSKF/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==\r\n', '2024-11-18 11:50:00', 'assets/news/6846f4b76131c.png', 2, 1),
(30, 'Cetak Foto Polaroid Unik dan Estetik dari Lapola', 'Kenalin nih, Ziyad Raziq Lahitidra Afey, mahasiswa S1 Rekayasa Perangkat Lunak angkatan 2024. Di tengah kesibukannya sebagai mahasiswa, Ziyad aktif menjalankan bisnis unik bernama Lapola, yang menawarkan jasa cetak foto polaroid menggunakan kertas Instax asli dari Fujifilm.\r\n\r\nIde bisnis ini muncul saat Ziyad melihat teman-temannya sering menggunakan kamera Instax. Dari situ, ia menangkap peluang untuk menghadirkan pengalaman serupa—tapi dengan cara yang lebih praktis dan terjangkau. Dengan menggunakan mesin cetak khusus yang belum banyak dikenal orang, Ziyad pun membangun Lapola sejak masih duduk di bangku kelas 10 SMA, tepatnya pada tahun 2019.\r\n\r\nLapola bukan sekadar jasa cetak biasa. Kualitas foto yang dihasilkan setara dengan kamera Instax, bahkan lebih awet karena menggunakan kertas asli yang tahan air. Ditambah lagi, Lapola menawarkan berbagai filter menarik yang bisa memberikan efek khas kamera Instax, cocok banget buat mempercantik feed Instagram atau menghias dinding kamar kamu.\r\n\r\nProses pemesanannya pun sangat simpel. Cukup kirim foto melalui LINE, WhatsApp, atau Google Drive, lalu tim Lapola akan membantu memilihkan filter terbaik sesuai gaya fotomu. Setelah dikonfirmasi, foto akan langsung diproses menggunakan mesin polaroid khusus, dipacking rapi, dan siap dikirim ke rumahmu.\r\n\r\nLapola melayani berbagai kalangan, terutama mahasiswa yang ingin mengabadikan momen spesial atau acara penting. Ziyad sendiri paling banyak mencetak untuk lingkungan FTEIC, namun siapa pun bisa memesan. Promosi bisnis ini juga dilakukan lewat poster digital dan pemasaran dari mulut ke mulut yang terbukti efektif.\r\n\r\nBagi Ziyad, interaksi langsung dengan pelanggan jadi pengalaman yang menyenangkan dan penting untuk perkembangan Lapola. Penasaran ingin coba cetak foto polaroid dengan kualitas premium? Langsung aja follow @lapola.id di Instagram dan rasakan sendiri kemudahan serta estetika yang ditawarkan.\r\n\r\nReferensi:\r\nhttps://www.instagram.com/p/DCgRa6xostq/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', '2024-11-18 14:23:00', 'assets/news/6846f7c8ee858.png', 2, 1),
(31, 'Muda, Aktif, dan Penuh Dedikasi', 'Di tengah padatnya aktivitas perkuliahan sebagai mahasiswa Teknik Informatika angkatan 2022, Lathifah Sahda tetap konsisten menunjukkan dedikasinya di berbagai lini organisasi dan kepanitiaan. Sosok yang kini menjabat sebagai General Secretary of External HMTC 2025 ini bukanlah nama baru dalam dunia keaktifan kampus. Sebelumnya, ia juga pernah mengemban amanah sebagai General Secretary of Administration II HMTC 2024, menunjukkan konsistensinya dalam bidang kesekretariatan dan tata kelola organisasi.\r\n\r\nLathifah juga aktif di ranah jurnalistik sebagai Official Journalist untuk ITS Online sejak 2022. Di luar HMTC, ia memperluas pengaruhnya melalui berbagai peran strategis, seperti Kepala Divisi Public Relation Schematics 2024, Expert Staff Divisi Exhibition ITS Expo 2024, dan Chief Executive Forda Bengkulu 2023–2024. Tak berhenti di situ, ia juga dipercaya menjadi Koordinator Tim Kawal Gemastik ITS 2025, bukti kontribusinya dalam mengawal prestasi mahasiswa di ajang nasional.\r\n\r\nKonsisten, komunikatif, dan penuh tanggung jawab, Lathifah adalah sosok representatif mahasiswa yang tidak hanya berprestasi di akademik, tetapi juga turut andil dalam membangun citra dan semangat kolaborasi antarmahasiswa.\r\n\r\n📎 LinkedIn: www.linkedin.com/in/lathifah-sahda/\r\n📷 Instagram: @lathifash_03\r\n\r\nReferensi:\r\nBOD HMTC 2025', '2025-03-14 08:05:00', 'assets/news/6846f8696fa99.png', 2, 7),
(32, 'Produktif Berkarya, Aktif Mengabdi', 'Sebagai mahasiswa Teknik Informatika angkatan 2022, Nabilah Atika Rahma merupakan sosok yang aktif, terstruktur, dan penuh inisiatif. Saat ini, ia mengemban tanggung jawab sebagai General Secretary of Administration I HMTC 2025, sebuah posisi penting yang menunjukkan kepercayaannya dalam bidang tata kelola administrasi organisasi.\r\n\r\nDi luar HMTC, Nabilah juga menunjukkan eksistensinya dalam pengembangan keilmuan dan kepemimpinan. Ia menjabat sebagai Kepala Departemen ETERNAL UKM Penalaran 2024, Koordinator Wilayah 1 FP2M 2024, dan HR Manager Java Region APMI 2024, memperlihatkan kepiawaiannya dalam mengelola sumber daya dan memperluas jejaring nasional.\r\n\r\nTak hanya fokus pada manajerial, Nabilah juga aktif di bidang teknis dan media melalui perannya sebagai Kepala Sub Divisi Data Management Schematics 2024 serta Staff Divisi IT & Medsos BPI ITS 2023. Pengalaman panjangnya sebagai Pemandu FTEIC 2023–sekarang dan mentor di berbagai kegiatan seperti Gerigi, Inclenation, dan OKKBK menegaskan komitmennya untuk terus berbagi dan membina generasi penerus.\r\n\r\nDalam hal pengembangan diri, Nabilah telah mengikuti berbagai pelatihan seperti PP LKMM IV, LKMM-TD XXIX, Pra-TD III, PKTI-TD, serta rangkaian diklat dan upgrading staf UKM Penalaran ITS. Ia juga merupakan bagian dari BIM Awardee dalam kegiatan pembalakan studi BPI.\r\n\r\nSosoknya mencerminkan pribadi yang visioner, adaptif, dan siap mengambil peran penting dalam perubahan di lingkungan kampus dan masyarakat luas.\r\n\r\nReferensi:\r\nBOD HMTC 2025', '2025-03-13 11:06:00', 'assets/news/6846f89e34adc.png', 2, 1),
(33, 'Si Serbabisa dari Teknik Informatika 2023', 'Berbekal semangat dan komitmen tinggi, Jasmine Aziza menunjukkan kiprah luar biasa sebagai mahasiswa Software Engineering ITS angkatan 2023. Meski baru menjalani tahun pertamanya, Jasmine telah aktif dalam berbagai organisasi dan kegiatan kampus, baik akademik maupun non-akademik.\r\n\r\nDalam hal keuangan dan manajemen organisasi, Jasmine dipercaya sebagai Bendahara di tiga lembaga berbeda: Ikatan Mahasiswa Jakarta 2025, Ini Lho ITS Forda Jakarta 2024, dan UKM Golf ITS 2025. Kepercayaan ini menunjukkan kepiawaiannya dalam mengelola keuangan dan menjaga transparansi di berbagai skala kegiatan.\r\n\r\nTak hanya itu, ia juga aktif dalam dunia desain dan teknologi, tergabung dalam divisi UI/UX untuk Futurest 2025 dan Petrolida 2025. Jasmine turut berkontribusi sebagai mentor Inclenation 2024, serta pernah magang di BPI HMTC.\r\n\r\nJasmine juga telah menempuh berbagai pelatihan pengembangan diri seperti LKMM-TD, LKMM-PP, Pra-TD, serta pelatihan non-degree lainnya. Dikenal cakap dalam kepemimpinan, manajemen proyek, dan komunikasi, Jasmine merupakan representasi mahasiswa aktif yang siap menghadapi tantangan di masa depan.\r\n\r\n📍 Instagram: @jasmineziza\r\n🔗 LinkedIn: Jasmine Aziza\r\n\r\nReferensi:\r\nBOD HMTC 2025', '2025-04-02 12:21:00', 'assets/news/6846f8d46465d.png', 2, 1),
(34, 'Bisnis Bagi Anak Muda Di Era Digital', 'Di era digital, peluang bisnis bagi anak muda semakin luas. Perkembangan teknologi membuka banyak potensi untuk memulai bisnis sendiri, seperti e-commerce, digital marketing, pengembangan aplikasi mobile, dan konten kreator. Anak muda dapat memanfaatkan keahlian teknologi, kreativitas, dan keberanian mereka untuk menciptakan bisnis inovatif dan sukses. Internet menjadi alat utama yang membuka berbagai peluang menguntungkan bagi generasi muda yang siap menghadapi tantangan dan mengembangkan ide kreatif di era digital ini. \r\n\r\nAdapun bisnis yang dikembangkan oleh mahasiswa ITS yang bergerak di bidang jasa pengembangan website dan mobile app.\r\n\r\n1. Software House TC\r\n\r\nSoftware House TC, didirikan oleh mahasiswa Teknik Informatika ITS, menawarkan beragam paket layanan, dari standar hingga custom, yang dapat disesuaikan dengan kebutuhan klien. Paket standar mencakup pembuatan website, sementara paket custom memungkinkan penyesuaian layanan seperti pengembangan aplikasi mobile atau IoT. Keunikan Software House TC terletak pada layanan shared handling, di mana mereka menyediakan SDM tambahan untuk tim yang membutuhkan. \r\n\r\ninstagram.com/softwarehousetc\r\n\r\n2. Genics\r\n\r\nGENICS, atau Generasi Electics, didirikan oleh BEM FTEIC ITS 2023, adalah Software House yang membantu mahasiswa belajar membuat website tanpa ribet. GENICS memberikan pelatihan intensif, mentorship, dan dukungan untuk menjadi programmer handal. Mereka juga menawarkan layanan pembuatan desain web keren, domain gratis setahun, website responsif, dan pemeliharaan gratis sebulan setelah launching.\r\n\r\ninstagram.com/genics_id\r\n\r\n3. Beta U\r\n\r\nBETA U, didirikan oleh sekumpulan mahasiswa yang ingin membangun creative software house yang menguntungkan klien dan developer. Mereka menawarkan kustomisasi penuh untuk mengembangkan versi beta atau MVP dari website klien. Dengan struktur Projectized Organization, anggota developer bisa mengasah keahlian manajerial sebagai Scrum Master. BETA U menyediakan layanan Mobile Application, Website, UI/UX Design, dan IoT. Mereka juga menawarkan paket pengembangan website yang cocok untuk klien seperti peserta PKM atau P2MW.\r\n\r\nInstagram.com/betafor.u\r\n\r\nRerefensi:\r\nhttps://www.instagram.com/p/C7Dmkdtx9iD/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', '2024-05-22 15:13:00', 'assets/news/6846f9471aa90.png', 9, 1),
(35, 'Calling For Young Entrepreneur!', 'TCatalyst adalah program akselerasi dari HMTC yang memberikan kesempatan bagi mahasiswa untuk menggunakan fasilitas HMTC, selama memenuhi kriteria yang ditentukan. Program ini terdiri dari beberapa tahap, mulai dari pendampingan, pengembangan usaha, hingga presentasi kemajuan di hadapan staff RnD. Jika usaha dinilai layak, anggota akan memperoleh berbagai fasilitas, seperti promosi di Instagram HMTC dan hak mencantumkan atribut HMTC dalam media promosi mereka.\r\n\r\n✨ Manfaat yang Didapatkan dari TCatalyst:\r\n1. Promosi usaha di Instagram HMTC\r\n2. Hak mencantumkan atribut HMTC pada media promosi\r\n3. Kesempatan penawaran ke birokrasi atau badan lain\r\n4. Rekomendasi untuk pengajuan dana hibah\r\n\r\n📅 Alur Kegiatan TCatalyst:\r\n1. Pendaftaran: 13 Juli – 1 Oktober\r\n2. Pengumpulan Submisi 1: 21 Juli – Oktober\r\n3. Revisi Submisi 1: 25 Juli – Oktober\r\n4. Pengumpulan Submisi 2: 25 Agustus – Oktober\r\n5. Revisi Submisi 2: 1 September – Oktober\r\n\r\n🔍 Syarat Pengisian Database:\r\n1. Mahasiswa aktif Teknik Informatika ITS\r\n2. Memiliki minat dalam berinovasi\r\n3. Telah memiliki usaha atau memiliki niat memulai usaha\r\n\r\n📌 Link Pendaftaran:\r\nhttps://its.id/m/OprecTCatalyst\r\n\r\n\r\nReferensi:\r\nhttps://www.instagram.com/p/C9XNUAdyvCQ/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', '2024-07-15 13:45:00', 'assets/news/6846f98ece655.png', 9, 7),
(36, 'Menjadi Mahasiswa Sukses dengan Freelance', 'Punya skill tapi masih bingung mau diarahkan ke mana? Freelance bisa jadi jawabannya! Freelance adalah pekerjaan lepas tanpa ikatan jangka panjang, yang memungkinkan kamu bekerja dengan fleksibel, kapan pun dan di mana pun. Cocok banget buat mahasiswa yang ingin tetap produktif tanpa mengganggu kuliah.\r\n\r\nKamu bisa menggunakan kemampuanmu dalam desain, pengembangan website, menulis artikel, atau membuat konten media sosial. Selain menyalurkan passion, freelance juga bisa jadi sumber penghasilan tambahan. Waktu kerja fleksibel dan lokasi yang bebas bikin kamu bisa menyesuaikannya dengan jadwal kuliah.\r\n\r\nMenjadi freelancer juga membuatmu lebih mandiri, kreatif, dan terbiasa bertanggung jawab terhadap pekerjaan sendiri. Bonusnya, kamu bisa membangun portofolio sejak dini dan memperluas relasi profesional.\r\n\r\nBingung mulai dari mana? Tenang, ada banyak platform seperti Fiverr, Freelancer, dan Upwork yang bisa membantumu menemukan proyek sesuai skill. Yuk mulai sekarang, ubah skill jadi penghasilan! 🚀\r\nReferensi:\r\nhttps://www.instagram.com/p/C9y86hzIAhC/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', '2024-07-29 09:31:00', 'assets/news/6846f9d58d9d5.png', 9, 1),
(37, 'Pendaftaran LKMM TD XXXI: TMNT', 'LKMM-TD atau Latihan Keterampilan Manajemen Mahasiswa Tingkat Dasar adalah pelatihan dasar organisasi yang dirancang khusus untuk membekali mahasiswa dengan keterampilan manajemen event, kepemimpinan, dan komunikasi organisasi. Di HMTC sendiri, LKMM-TD jadi wadah penting untuk menyiapkan generasi organisator yang siap berkarya dan berkontribusi nyata.\r\n\r\nSalah satu alumni yang pernah ikut, Ilyus (TC’22), membagikan pengalamannya saat mengikuti LKMM-TD HMTC 2023. Ia ikut murni karena ingin lebih paham tentang bagaimana cara menyusun organisasi dan membentuk event dari awal. “Awalnya aku cuma pengin tahu lebih jauh tentang cara membangun sebuah acara dari nol. Ternyata, setelah ikut LKMM-TD, aku malah dapat banyak insight penting yang ngebantu banget waktu lanjut di organisasi,” ujarnya.\r\n\r\nSetelah mengikuti LKMM-TD, perjalanan organisasinya makin berkembang. Ia melanjutkan kiprahnya sebagai Wakadiv dan Kadiv di NLC, serta terlibat di tim PR Bayucaraka. Semua bekal itu, menurut Ilyus, sangat terbantu dari pengalaman yang ia dapat selama pelatihan.\r\n\r\nApa aja sih manfaatnya? Banyak! Mulai dari belajar menyusun TUK (Tolak Ukur Keberhasilan), membuat KPI kegiatan, hingga mengelola administrasi acara dengan rapi. Ilyus mengaku, ia jadi lebih siap dan percaya diri saat memegang tanggung jawab sebagai panitia atau pengurus divisi. “Yang aku suka dari LKMM-TD itu, kita nggak cuma dikasih teori, tapi juga langsung praktik dan diskusi bareng. Jadi ilmunya lebih nempel dan bisa langsung diterapkan,” tambahnya.\r\n\r\nBuat kamu yang masih ragu, Ilyus punya pesan: “Ikut LKMM-TD itu justru jadi titik awal buat belajar, bukan harus udah jago duluan. Semua orang bisa berkembang kalau punya niat dan kemauan untuk mulai.”\r\n\r\nJadi, tunggu apa lagi?\r\nYuk daftar LKMM-TD HMTC dan mulai perjalanan organisasimu dari sini!\r\n\r\nReferensi:\r\nhttps://www.instagram.com/p/C76shnOsN1a/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==\r\nhttps://www.instagram.com/p/C8G0ttiN-br/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', '2024-06-17 10:51:00', 'assets/news/6846fa6b88749.png', 10, 9),
(38, 'Bangkitkan Semangat Keilmiahan Mahasiswa TC', 'Meski memiliki jumlah mahasiswa terbanyak di ITS, partisipasi Teknik Informatika dalam Liga PKM masih rendah. Tahun 2023 hanya ada 15 proposal, dan pada 2024 turun drastis menjadi 7. Melihat kondisi ini, HMTC menghadirkan BLUECAMP, pelatihan keilmiahan untuk membekali mahasiswa dengan kemampuan riset dan penulisan ilmiah yang matang.\r\n\r\nPelatihan ini mencakup penggalian latar belakang, pengembangan ide, metode penelitian, hingga cara menyusun dan mempresentasikan proposal. Diharapkan, BLUECAMP dapat mendorong peningkatan kualitas dan jumlah proposal PKM serta memperkuat budaya ilmiah di lingkungan Informatika.\r\n\r\nBentuk Kegiatan:\r\n1. 3 kali pertemuan dalam 2 minggu\r\n2. Materi: dasar keilmiahan, ide riset, metode, analisis, dan presentasi\r\n\r\nWaktu & Tempat:\r\n🗓 14, 15, & 22 September 2024\r\n🕘 09.00 – 15.00 WIB\r\n📍 IF-107A-B & IF-108\r\n\r\nPeserta:\r\nMahasiswa angkatan 2023 (30 orang) & 2024 (12 orang)\r\n\r\nBLUECAMP hadir untuk bantu kamu mengubah ide menjadi karya ilmiah yang berdampak!\r\n\r\nReferensi:\r\nSWRT HMTC 2025\r\nhttps://www.instagram.com/p/DF644stpoQy/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', '2025-02-18 08:09:00', 'assets/news/6846fac21d208.png', 11, 1),
(39, 'TC Grandcup is Back', 'Sebagai bagian dari misi besar Departemen Student Talent Interest (STI), TC Grand Cup hadir untuk mewadahi mahasiswa Teknik Informatika yang ingin mengeksplorasi dan mengembangkan potensi mereka. Kegiatan ini dirancang agar setiap mahasiswa bisa berpartisipasi aktif, tidak hanya dalam aspek akademik, tapi juga non-akademik seperti olahraga dan e-sport. Lingkungan yang kompetitif namun suportif ini diharapkan bisa menjadi ruang aktualisasi diri bagi mahasiswa untuk tumbuh, berprestasi, dan semakin solid dalam kebersamaan antargenerasi.\r\n\r\nTahun ini, TC Grand Cup menghadirkan beragam cabang kompetisi seru yang dapat diikuti oleh seluruh angkatan. Untuk olahraga fisik, ada badminton, pingpong, dan catur. Pertandingan badminton beregu akan digelar di GOR ITS, dengan nomor ganda campuran, ganda putra, dan tunggal putra. Catur akan dilaksanakan di TIF 107 dengan sistem waktu RAPID 5+0, sedangkan pingpong menggunakan format sistem gugur dan best of three, bertempat di Plaza Supeno.\r\n\r\nDi sisi lain, bagi pecinta e-sport, ada juga kompetisi FIFA, Mobile Legends, dan Valorant. FIFA akan berlangsung di TIF 105 dengan sistem double elimination. Mobile Legends akan digelar di Plaza Supeno dalam format tim 5 vs 5, sedangkan Valorant diadakan sepenuhnya online, memungkinkan seluruh tim bertanding fleksibel dari mana pun.\r\n\r\nTC Grand Cup bukan sekadar ajang lomba, tapi juga tempat membangun relasi, meningkatkan sportivitas, dan mengasah soft skill dalam kerja tim. Dengan antusiasme dari setiap angkatan, ajang ini diharapkan bisa mempererat kekeluargaan dan semangat kompetisi sehat di lingkungan Teknik Informatika.\r\n\r\nJadi, sudah siap bawa pulang kemenangan dan harumkan nama angkatanmu?\r\nLet the TC Grand Cup begin! 🏆🔥\r\n\r\nReferensi:\r\nhttps://www.instagram.com/p/DASclh6otMb/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', '2024-10-05 09:55:00', 'assets/news/6846fb4018ed9.png', 12, 1),
(40, 'Quadrathlon 2024 Reborn!', 'Quadrathlon adalah kompetisi bergengsi yang dirancang khusus untuk mahasiswa Teknik Informatika. Tujuannya adalah melatih dan mempersiapkan mahasiswa menghadapi berbagai lomba di tingkat nasional hingga internasional.\r\n\r\nTahun ini, Quadrathlon hadir kembali untuk membangkitkan semangat berkompetisi di kalangan mahasiswa. Setiap angkatan diundang untuk mengirimkan tim terbaik dan menunjukkan kemampuan unggulan mereka.\r\n\r\nTerdapat empat cabang lomba dalam Quadrathlon. Competitive Programming menguji logika dan kecepatan menyelesaikan soal-soal algoritma dalam waktu 3 jam. Capture The Flag (CTF) menantang peserta dalam bidang keamanan siber dengan menyelesaikan berbagai tantangan teknis.\r\n\r\nData Mining berfokus pada pemodelan data menggunakan platform Kaggle, dengan penilaian berdasarkan akurasi model. Sementara Web Slicing menguji kemampuan mengubah desain grafis menjadi website fungsional menggunakan HTML, CSS, dan JavaScript.\r\n\r\nQuadrathlon bukan sekadar lomba, tapi ajang untuk membuktikan bahwa kalian adalah yang terbaik di dunia Informatika.\r\n\r\n\r\nReferensi:\r\nhttps://www.instagram.com/p/DBIhN4kIRep/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', '2024-10-25 14:25:00', 'assets/news/6846fb862ee66.png', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `birth_date` date NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `gender`, `birth_date`, `role`, `created_at`) VALUES
(1, 'Admin', 'admin@nextc.id', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Male', '1990-01-01', 'admin', '2024-12-11 01:07:46'),
(2, 'user', 'user@example.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Female', '1995-05-15', 'user', '2024-12-11 01:07:46'),
(4, 'zaky', 'zaky@gmail.com', 'bf0b52439529700a4a04cea0ab5a0302283f86be667d49d8edc5209a22cab01d', 'Male', '2005-08-14', 'user', '2024-12-12 00:28:39'),
(5, 'Illona', 'illona@example.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Female', '2003-08-09', 'user', '2025-06-06 05:28:14'),
(7, 'admin2', 'admin2@nextc.id', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'Male', '2025-06-06', 'admin', '2025-06-06 21:33:09'),
(8, 'zaky', 'zaky@example.com', '6b51d431df5d7f141cbececcf79edf3dd861c3b4069f0b11661a3eefacbba918', 'Male', '2005-08-14', 'user', '2025-06-07 13:48:58'),
(9, 'Illona', 'illona@nextc.id', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Female', '2025-06-07', 'admin', '2025-06-07 14:53:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_news_id` (`news_id`),
  ADD KEY `idx_news_created` (`news_id`,`created_at`);

--
-- Indexes for table `interactions`
--
ALTER TABLE `interactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_user_news_type` (`user_id`,`news_id`,`type`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_news_id` (`news_id`),
  ADD KEY `idx_type_news` (`type`,`news_id`),
  ADD KEY `idx_user_type` (`user_id`,`type`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_category_fk` (`category_id`),
  ADD KEY `fk_news_created_by` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `interactions`
--
ALTER TABLE `interactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `fk_news_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `fk_news_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
