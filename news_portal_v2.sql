-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 06, 2025 at 06:11 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

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
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Gadget', '2025-06-06 12:01:52', '2025-06-06 12:01:52'),
(2, 'E-Sport', '2025-06-06 12:01:52', '2025-06-06 12:01:52'),
(3, 'Health', '2025-06-06 12:01:52', '2025-06-06 12:01:52'),
(4, 'Finansial', '2025-06-06 12:01:52', '2025-06-06 12:01:52'),
(5, 'Infrastruktur', '2025-06-06 12:01:52', '2025-06-06 12:01:52'),
(6, 'Fintech', '2025-06-06 12:01:52', '2025-06-06 12:01:52'),
(7, 'Travel', '2025-06-06 12:01:52', '2025-06-06 12:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `release_date` date NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `category_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `release_date`, `image`, `created_at`, `category_id`) VALUES
(5, 'GPU Intel yang Ditunggu-tunggu Akhirnya Dirilis', 'Jakarta - Intel mengumumkan kehadiran dua kartu grafis terbarunya dengan arsitektur Battlemage, yaitu Arc B580 dan Arc B570. Seperti apa kemampuannya?\r\nArc B580 akan diluncurkan pada 13 Desember 2024 mendatang, dan dijanjikan punya performa yang bisa menyalip RTX 4060. VRAM B580 adalah 12GB dan B570 adalah 10GB, yang membuatnya cocok untuk nge-game di resolusi 1440p (RTX 4060 hanya punya VRAM 8GB).\r\n\r\nTentu bukan cuma performanya yang menarik. Intel melengkapi B580 dengan XeSS 2, yang merupakan teknologi AI super resolution terbaru Intel yang mirip dengan Nvidia DLSS 3. Ada juga Xe Low Latency yang bisa mengurangi latensi di game.\r\n\r\n\"GPU Intel Arc B-Series terbaru hadir dengan peningkatan yang sempurna bagi para gamer. GPU ini menawarkan performance-per-dollar terdepan dan pengalaman gaming 1440p yang luar biasa dengan XeSS 2, ray tracing engine generasi kedua, dan engine AI XMX. Kami sangat senang dapat bekerja sama dengan lebih banyak mitra dari sebelumnya, sehingga para gamer memiliki lebih banyak pilihan dalam mencari desain yang sempurna bagi mereka,\" kata Vivian Lien, Intel vice president dan general manager Client Graphics, dalam keterangan yang diterima detikINET, Selasa (10/12/2024).\r\n\r\nXeSS 2 kini memiliki tiga teknologi: XeSS Super Resolution, XeSS Frame Generation, dan Xe Low Latency. XeSS Super Resolution adalah teknologi utama yang mendasari generasi pertama XeSS, menawarkan peningkatan resolusi berbasis AI selama lebih dari dua tahun dan kini mendukung lebih dari 150 game.\r\n\r\nTeknologi baru XeSS Frame Generation yang didukung AI menambahkan frame interpolasi menggunakan aliran optik dan proyeksi ulang vektor gerakan untuk memberikan pengalaman gaming yang lebih lancar. Dan Xe Low Latency yang baru terintegrasi dengan game engine untuk memberikan respons lebih cepat terhadap input pemain. Dengan diaktifkannya tiga teknologi ini, XeSS 2 mampu meningkatkan output frame-per-second hingga 3,9x, menghadirkan performa tinggi pada game-game AAA.\r\n\r\nSoftware grafis Intel yang baru akan memberikan akses ke pengaturan tampilan termasuk mode warna dan scaling, serta dukungan variable refresh rate (VRR). Pengaturan grafis 3D mencakup pembatas frames-per-second dan mode latensi rendah pada tingkat driver.\r\n\r\nSalah satu fitur menarik dari GPU Arc-B ini adalah dukungan AI Playground, sebuah aplikasi starter AI serba guna dan mudah digunakan. Dirancang untuk menjalankan beban kerja AI generatif secara lokal, memungkinkan pengguna dengan mudah mengubah teks jadi gambar, pengeditan foto, dan upscaling, serta menyesuaikan chatbot dengan data mereka sendiri.\r\n\r\nKartu grafis Intel Arc B580 Limited Edition dan model-model dari mitra seperti Acer, ASRock, Gunnir, Onix Technology, Maxsun, dan Sparkle akan tersedia mulai 13 Desember 2024, dengan harga mulai USD 249 atau sekitar Rp 3,9 juta.\r\n\r\nSementara itu Arc B570 tersedia dari mitra yang sama mulai 16 Januari, dan harganya mulai USD 219 atau sekitar Rp 3,4 juta.', '2024-12-10', 'assets/news/Gadget.jpeg.jpg', '2024-12-11 05:46:26', 1),
(6, 'Jadwal M6 Mobile Legends Knockout Stage: RRQ dan TLID Main 11 Desember', 'Jakarta - Dua wakil Indonesia di kompetisi M6 Mobile Legends, RRQ Hoshi dan Team Liquid ID, akan kembali tampil pada Rabu esok hari di babak knockout stage. Berikut informasi jadwal mainnya.\r\nPertandingan mereka akan terselenggara secara offline di Axiata Arena, Kuala Lumpur, Malaysia. RRQ Hoshi akan bermain duluan di lower bracket pada pagi hari. Sementara penampilan Team Liquid ID di final upper bracket akan menjadi penutupnya.\r\n\r\nUntuk lawan yang akan dihadapi RRQ masih menunggu hasil duel Selangor Red Giants Vs NIP Flash. Pemenangnya akan melaju ke quarter final lower bracket dan bertemu Sang Raja dari Segala Raja.\r\n\r\nRRQ berada di lower bracket, karena kalah adu mekanik dari sedulurnya Team Liquid ID di semifinal upper bracket. Persaingan keduanya dalam memperebutkan slot final upper begitu sengit. Namun di sini Team Liquid ID yang berhasil menang dengan skor tipis 3-2.\r\n\r\nLalu kemenangan Team Liquid ID membawanya ke final upper dan berhadapan dengan Fnatic Onic PH. Ini menjadi pertemuan mereka yang kedua kalinya.\r\n\r\nUntuk skema pertandingannya ialah best of 5 (Bo5). Jadi bila ingin lanjut ke fase berikutnya di babak knockout stage, wajib memenangkan tiga game dulu dengan skenario skor 3-0, 3-1, atau 3-2.\r\n\r\nBagi yang ingin memberikan dukungan kepada tim asal Indonesia, para penggemar bisa menyaksikannya secara online. Pihak penyelenggara menayangkan siaran langsungnya di kanal YouTube MLBB Esports.', '2024-12-02', 'assets/news/Esport.jpeg.jpg', '2024-12-11 05:49:40', 2),
(7, 'Cek! Ini Daftar Provinsi yang Telah Umumkan Kenaikan Upah', 'Jakarta - Kementerian Ketenagakerjaan (Kemnaker) telah menerbitkan Permenaker Nomor 16 Tahun 2024 tentang Penetapan Upah Minimum 2025. Dalam aturan itu pemerintah provinsi wajib mengumumkan Upah Minimum Provinsi (UMP) 2025 pada 11 Desember 2024.\r\nBerikut ini daftar provinsi yang telah mengumumkan UMP 2025:\r\n\r\n1. Kalimantan Utara\r\n\r\nGubernur Kalimantan Tengah telah resmi menetapkan Upah Minimum Provinsi (UMP) dan Upah Minimum Sektoral Provinsi (UMSP) Provinsi Kalimantan Tengah Tahun 2025. Dikutip dari detiknews, UMP Provinsi Kalimantan Tengah 2025 Rp 3.473.621,04.\r\n\r\nPlt. Sekretaris Daerah Provinsi Kalimantan Tengah HM Katma F Dirun mengatakan formula yang digunakan adalah UMP 2025 = UMP 2024 + Nilai Kenaikan. Berdasarkan ketentuan Pasal 2 ayat (3) Peraturan Menteri Ketenagakerjaan RI Nomor 16 Tahun 2024 disebutkan bahwa nilai kenaikan UMP Tahun 2025 adalah sebesar 6,5 % dari UMP Tahun 2024 ditetapkan berdasarkan Surat Keputusan Gubernur Kalimantan Tengah dalam\r\nrangka menindaklanjuti Peraturan Menteri Ketenagakerjaan RI Nomor 16\r\nTahun 2024 tanggal 4 Desember 2024 tentang Penetapan Upah Minimum\r\nTahun 2025,\" jelas Katma dalam keterangan tertulis, Minggu (8/12/2024).\r\n\r\n\r\n\"Penetapan UMP dan UMSP Provinsi Kalimantan Tengah Tahun 2025 ditetapkan berdasarkan Surat Keputusan Gubernur Kalimantan Tengah dalam rangka menindaklanjuti Peraturan Menteri Ketenagakerjaan RI Nomor 16 Tahun 2024 tanggal 4 Desember 2024 tentang Penetapan Upah Minimum Tahun 2025,\" jelas Katma dalam keterangan tertulis, Minggu (8/12/2024).\r\n\r\n2. Nusa Tenggara Barat (NTB)\r\n\r\nDewan Pengupahan Provinsi Nusa Tenggara Barat (NTB) menggelar sidang di Aula Dinas Tenaga Kerja dan Transmigrasi (Disnakertrans) Provinsi NTB pada Jumat (6/12) lalu. Sidang tersebut dipimpin langsung oleh Kepala Disnakertrans NTB selaku Ketua Dewan Pengupahan Provinsi, I Gede Putu Aryadi.\r\n\r\nDikutip dari laman Dinaskertrans, hasil sidang menghasilkan rekomendasi resmi kepada Gubernur NTB terkait UMP 2025 sebesar Rp 2.602.931. Angka itu mengalami kenaikan sebesar Rp 158.864 dari UMP tahun 2024 yang tercatat sebesar Rp 2.444.067.\r\n\r\n3. Kalimantan Utara\r\n\r\nDikutip dari Antara, pemerintah Provinsi Kalimantan Utara menetapkanUpah Minimum (UMP) Kaltara tahun 2025 naiksebesar 6,5% menjadi Rp3.580.160. Hal ini merupakan hasil dari rapat pleno, Sabtu (7/12) lalu.\r\n\r\n4. Kalimantan Barat\r\n\r\nPemerintah Provinsi Kalimantan Barat telah menetapkan kenaikan Upah Minimum Provinsi (UMP)2025. Sebagai acuan dari pemerintah pusat, kenaikan UMP diputuskan sebesar 6,5%.\r\n\r\nPenjabat Gubernur Kalbar,Harisson di Pontianak, mengatakan dengan begitu telah ditetapkan kenaikan UMP Kalbar menjadi Rp 2.878.285 yang mulai berlaku pada Januari 2025. Kenaikan ini telah mengacu pada Peraturan Menteri Ketenagakerjaan Nomor 16 Tahun 2024 tentang Penetapan Upah Minimum 2025,\r\n\r\n5. Kalimantan Timur\r\n\r\nMengutip dari CNBC Indonesia, pemerintah Kalimantan Timur (Kaltim) memastikan UMP 2025 naik 6,5%. Pemerintah Kaltim menetapkan Upah Minimum Provinsi (UMP) 2025 naik Rp 218.456 dari UMP menjadi Rp 3.579.314 dari sebelumnya Rp 3.360.858.\r\n\r\n6. Sulawesi Selatan\r\n\r\nPemprov Sulawesi Selatan (Sulsel) telah memastikan upah minimum provinsi (UMP) Sulsel 2025 naik sebesar 6,5% dari UMP 2024. Dengan begitu, UMP Sulsel 2025 akan naik menjadi Rp 3.657.527.\r\n\r\nKenaikan UMP Sulsel 2025 tersebut mencapai Rp 223.229 dari UMP Sulsel 2024. Diketahui, UMP Sulsel 2024 sebesar Rp 3.434.298.\r\n\r\n\"UMP (2025) tidak jadi soal, kita sampai pada UMP 2024 tambah dengan 6,5% sebagaimana ditetapkan oleh Kemenaker yang disampaikan oleh presiden,\" kata Kepala Dinas Tenaga Kerja dan Transmigrasi (Disnakertrans) Sulsel Jayadi Nas dikutip dari detiksulsel, (8/12/2024).\r\n\r\n7. Riau\r\n\r\nUpah Minimum Provinsi (UMP) Riau tahun 2025 telah ditetapkan sebesar Rp 3.508.776,22. Penetapan itu telah menerapkan kenaikan 6,5%.\r\n\r\nDikutip dari laman pemerintah Riau, penetapan tersebut telah disetujui melalui keputusan Gubernur Riau nomor 3724/12/2024 yaitu tentang upah minimum Provinsi Riau. Ketentuan ini juga sesuai dalam Peraturan Menteri Ketenagakerjaan Nomor 16 Tahun 2024 tentang Penetapan Upah Minimum Tahun 2025.\r\n\r\n8. Sulawesi Tenggara\r\n\r\nUntuk Provinsi Sulawesi Tenggara telah ditetapkan Upah Minimum Provinsi (UMP) 2025 naik sebesar Rp 187.587 atau 6,5% dari UMP tahun 2024. Kepala Dinas Transmigrasi dan Tenaga Kerja (Kadis Transnaker) Sultra, Laode Muhammad Ali Haswandy mengatakan UMP sebelumnya Rp 2.885.964, tahun depan akan menjadi Rp 3.073.551.\r\n\r\n\"Keputusan ini juga didasarkan pada hasil rapat bersama Dewan Pengupahan,\" ungkapnya dikutip dari CNBC Indonesia.\r\n\r\n9. Sulawesi Tengah\r\n\r\nKepala Dinas Tenaga Kerja dan Transmigrasi (Disnakertrans) Provinsi Sulteng sekaligus Ketua Dewan Pengupahan Sulteng Arnold Firdaus mengatakan Upah Minimum Provinsi (UMP) Sulteng tahun 2025 sebesar Rp 2.915.000.\r\n\r\nArtinya, UMP 2025 naik 6,5% atau Rp 178.302 dari UMP 2024 sebesar Rp 2.736.698.', '2024-12-07', 'assets/news/Financial.jpeg.jpg', '2024-12-11 05:50:58', 4),
(8, 'Istana hingga Kantor Kemenko di IKN Ditargetkan Rampung Bulan Ini', 'Jakarta - Kementerian Pekerjaan Umum (PU) menargetkan beberapa infrastruktur di Ibu Kota Nusantara (IKN) akan selesai pada Desember 2024 ini. Infrastruktur tersebut di antaranya Istana Garuda, Kantor Sekretariat Negara, serta Gedung dan Kawasan Kantor Kementerian Koordinator.\r\nWakil Menteri PU Diana Kusumastuti memastikan sejumlah infrastruktur itu akan diresmikan juga dalam waktu dekat. Persiapan infrastruktur itu untuk mendukung pemindahan Aparatur Sipil Negara (ASN) pada awal 2025 dan rencana pemindahan ibu kota negara 2028.\r\n\r\nDiana menuturkan, berdasarkan arahan Presiden Prabowo Subianto, pemindahan ibu kota negara ke IKN harus tetap dilakukan, salah satunya karena peningkatan air muka laut yang mengancam wilayah Jakarta. Prabowo berencana untuk mulai berkantor di IKN pada 17 Agustus 2028.\r\n\r\n\"Kami tetap semangat untuk menyesaikan IKN, alokasi anggarannya pun tetap ada juga di Kementerian untuk melanjutkan infrastrukturnya. Persiapan untuk pemindahan ke IKN juga sudah mulai kita lakukan dari sekarang,\" kata Diana dalam keterangannya dikutip dari Instagram @Kementerianpu, Selasa (10/12/2024).\r\n\r\nSementara itu, Kepala OIKN Basuki Hadimuljono menyampaikan ucapan terima kasih kepada Kementerian PU serta Kementerian/ Lembaga lainnya yang telah memberi masukan terkait bagaimana pembangunan, pemindahan, dan penyelenggaraan IKN perlu dilakukan ke depannya.\r\n\r\nNusantara (IKN), Kalimantan Timur. Menurutnya, ASN akan mulai pindah pada\r\nbulan April 2025 mendatang.\r\n\r\nDia bilang informasi ini didapatkan langsung dari Kementerian PAN-RB.\r\nMenurutnya, rencana awal ASN bisa pindah pada Januari 2025, namun karena\r\nmendekati bulan puasa maka diundur.\r\n\r\nMaka dari itu, ditetapkan lah ASN akan pindah ke IKN mulai April 2025 atau\r\nbisa disebut sehabis hari raya Lebaran.\r\n\r\n\"Menurut Menteri PAN-RB yang kita siapkan dan hitung semua itu mulai April.\r\nSebenarnya kan bulai Januari, cuma Maret kan lebaran. Ada lebaran mungkin\r\ndihitung itu,\" sebut Basuki ketika ditanya kapan ASN pindah ke IKN, di\r\nKompleks Istana Kepresidenan, Jakarta Pusat, Selasa (10/12).', '2024-12-05', 'assets/news/Infrastruktur.jpeg.jpg', '2024-12-11 05:52:31', 5),
(9, 'Harga Bitcoin Terjun Bebas, Ini Penyebabnya', 'Jakarta - Harga mata uang kripto, Bitcoin (BTC) terjun bebas setelah menembus level US$ 100.000 pada awal Desember lalu. Kripto dengan kapitalisasi pasar terbesar, Bitcoin anjlok 5% menjadi US$ 95.519 pada Senin (9/12) kemarin.\r\nMengutip Coindesk, Selasa (10/12/2024) kapitalisasi pasar kripto global turun. Bitcoin kembali turun ke level US$ 95.000 atau 5% selama 24 jam terakhir. Sementara itu, Ether (ETH) turun 10% menjadi US$ 3.590.\r\n\r\nBerdasarkan Indeks CoinDesk20, penurunan juga terjadi di beberapa aset kripto. Bahkan penurunan 20% untuk Cardano (ADA), Avalanche (AVAX), dan XRP (XRP).\r\nAda beberapa tanda menurunnya momentum di pasar kripto, termasuk menurunnya volume dan aksi ambil untung besar-besaran oleh pemegang jangka panjang. Pendiri 10x Research, Markus Thielen mengatakan fase ini merupakan salah satu fase konsolidasi sementara sebelum pasar kembali bullish.\r\n\r\n\"Namun, para trader sekarang harus memperhatikan dengan seksama posisi mana yang berkinerja lebih baik dan mana yang berkinerja buruk, karena reli memasuki fase di mana tidak semuanya akan terus meningkat,\" kata Thielen.\r\n\r\nDia mengimbau agar para trader menjauhi segmen yang lebih lemah dan fokus pada aset kripto pilihan masing-masing. Hal ini dilakukan agar para trader dapat menavigasi pasar kripto secara efektif.\r\n\r\n\"Untuk menavigasi pasar ini secara efektif, para trader harus menjauhi segmen yang lebih lemah dan berfokus pada posisi inti mereka yang memiliki keyakinan tinggi,\" tambahnya.\r\n\r\nSementara itu, perusahaan perdagangan aset kripto terkemuka di Singapura, QCP Capital dalam laporannya menyebut kondisi tersebut disebabkan beberapa hal, di antaranya para trader di pasar semakin memposisikan diri untuk dalam kondisi sideways hingga akhir tahun, mengambil untung dari tren bullish mereka sebelumnya, hingga berpotensi memperpanjang posisi hingga awal tahun depan.\r\n\r\n\"Meskipun kami masih bullish secara struktural, (harga) spot kemungkinan seperti sekarang selama sisa musim liburan,\" tulis laporan tersebut.', '2024-12-01', 'assets/news/Fintech.jpeg.jpg', '2024-12-11 05:53:03', 6),
(10, 'MRT Bakal Terhubung Kereta Bandara?', 'Jakarta - Menteri Perhubungan (Menhub) Dudy Purwagandhy menyatakan saat ini sedang mengkaji rencana mengintegrasikan Kereta Api (KA) Bandara dengan LRT Jabodebek. Langkah itu dilakukan untuk mempermudah traveler menuju bandara.\r\nRencana itu sempat disampaikan oleh Menteri BUMN Erick Thohir. Dudy mengatakan saat ini Kementerian Perhubungan memetakan titik-titik mana saja yang bisa diintegrasikan antara LRT Jabodebek dengan KA Bandara.\r\n\r\n\"Itu kita lagi kerjakan, misalnya ada titik yang bisa kita sambungkan itu kita akan lakukan. Kita lagi mengkaji kira-kira titik mana yang bisa kita sambung antara LRT sama kereta bandara,\" kata Dudy seperti dikutip dari detikFinance, Selasa (10/12/2024).\r\n\r\nDudy belum dapat memastikan waktu pengintegrasian antara LRT Jabodebek dengan KA Bandara berjalan.\r\n\r\n\"Saya harapkan sih dalam waktu dekat ya. Kita lagi usahakan. Maunya lebih cepat lebih baik,\" kata dia.\r\n\r\nSebelumnya, Menteri BUMN Erick Thohir mengungkapkan bahwa akan ada inovasi dari Kementerian Perhubungan untuk mengintegrasikan Kereta Api (KA) Bandara dengan LRT Jabodebek.\r\n\r\nDia mengatakan inovasi tersebut dilakukan lantaran konektivitas masih menjadi tantangan bagi pemerintah untuk menghubungkan masyarakat menggunakan kereta menuju ke pusat kota Jakarta.\r\n\r\nSaat ini, KA Bandara sudah terhubung dengan KRL Jabodetabek. Traveler bisa menggunakan KA Bandara melalui Stasiun Manggarai, Stasiun Sudirman Baru (BNI City), Stasiun Duri, Stasiun Rawa Buaya dan Stasiun Batu Ceper.\r\n\r\n\"PR nya satu, bagaimana konektivitas waktu keluar, naik, tentu kereta api yang menuju kota,\" kata Erick di Bandara Soekarno-Hatta, Tangerang, Banten, Kamis (5/12).\r\n\r\n\"Menhub ingin menyambungkan dari kereta dan ke LRT, dari kereta airport. Nah, itu pakai apa? Saya nggak boleh ngomong. Beliau nanti yang ngomong,\" kata Erick.', '2024-12-09', 'assets/news/Travel.jpg', '2024-12-11 05:54:04', 7),
(12, 'Catat, Ini Cara Menghapus Data di Aplikasi Pinjol Ilegal', 'Jakarta - Aplikasi pinjaman online (pinjol) menjadi solusi cepat bagi orang-orang yang membutuhkan dana darurat. Sayangnya, banyak aplikasi pinjol ilegal yang merugikan masyarakat.\r\nSaat menggunakan aplikasi ini, peminjam seringkali melibatkan data pribadi. Diketahui bahwa pinjol ilegal mempunyai sejumlah resiko, seperti penyalahgunaan data pribadi. Untuk itu, peminjam yang berurusan dengan pinjol legal harus mengetahui cara menghapus data di aplikasi.\r\n\r\nCara Menghapus Data di Aplikasi Pinjol Ilegal\r\nUntuk menghapus data di Pinjol ilegal, ada beberapa cara yang bisa dilakukan. Mengutip laman OCBC, berikut caranya:\r\n\r\n1. Lunasi Pinjaman\r\nKetika pinjaman dilunasi dan tidak mengajukan pinjaman baru, maka penyedia jasa pinjol tidak akan menghubungi lagi. Datamu pun akan terhapus.\r\nMemang terjadi perdebatan di kalangan masyarakat terkait pembayaran tagihan di pinjol. Pinjol ilegal dianggap tidak perlu dibayar sebab tidak berizin.\r\nNamun, kamu bisa melunasinya sebagai bentuk tanggung jawab agar tidak dihubungi oleh pihak pinjol. Setelah itu berhenti dan jangan lakukan pinjaman lagi.\r\n\r\n2. Lapor ke OJK\r\nKetika pinjaman sudah dilunasi namun masih diteror, laporkan ke OJK. Sampaikan masalah yang dialami dan minta solusi. Pelaporan bisa dilakukan ke situs OJK, email, atau kontak resminya di\r\nAlamat email OJK: waspadainvestasi@ojk.go.id\r\nSitus resmi OJK: ojk.go.id\r\nWhatsApp OJK: 081-157-157\r\nKontak resmi OJK: 157.\r\n\r\n3. Hapus Akun dan Uninstall Aplikasi\r\nPenghapusan data dapat dilakukan dengan cara menghapus akun dan\r\naplikasi. Begini caranya:\r\nBuka aplikasi pinjol\r\nPilih menu Pengaturan\r\nKlik opsi Hapus Akun\r\nIkuti langkah selanjutnya sesuai panduan\r\nKonfirmasi keinginan penghapusan akun\r\nAkun di aplikasi sudah terhapus.\r\nJangan lupa untuk uninstall aplikasi pinjol. Dengan begitu, kamu tidak akan dihubungi lagi oleh penyedia jasa pinjol ilegal.\r\n\r\nCiri-ciri Pinjaman Online Legal dan Ilegal\r\nPenting untuk mengetahui mana pinjaman legal dan ilegal sebelum meminjam. Menurut laman Otoritas Jasa Keuangan (OJK), berikut ciri-cirinya.\r\nPinjaman Online Legal\r\nTerdaftar/berizin dari OJK\r\nPinjol legal tak pernah menawarkan melalui komunikasi pribadi\r\nPemberian pinjaman akan diseleksi terlebih dahulu\r\nBunga atau biaya pinjaman dilakukan secara transparan\r\nPeminjam yang tak bisa membayar setelah batas waktu 90 hari akan masuk ke daftar hitam (blacklist) Fintech Data Center. Dalam kondisi ini peminjam tidak dapat meminjam dana ke platform fintech yang lain\r\nMemiliki layanan pengaduan\r\nIdentitas pengurus dan alamat kantor diketahui dengan jelas\r\nHanya mengizinkan akses kamera, mikrofon, dan lokasi pada gawai peminjam\r\nPihak penagih wajib mempunyai sertifikasi penagihan yang diterbitkan oleh AFPI.\r\n\r\nPinjaman Online Ilegal\r\nTidak terdaftar/tidak berizin dari OJK\r\nSaat memberikan penawaran, penyedia layanan pinjol memberi pesan melalui SMS/Whatsapp dalam memberikan penawaran\r\nPemberian pinjaman sangat mudah\r\nBunga atau biaya pinjaman dan denda tidak jelas\r\nAdanya ancaman teror, intimidasi, dan pelecehan bagi peminjam yang tidak bisa membayar\r\nTidak mempunyai layanan pengaduan\r\nTidak memiliki identitas pengurus dan alamat kantor tidak jelas\r\nMeminta akses seluruh data pribadi yang ada di dalam gawai peminjam		\r\nPihak yang menagih tidak mempunyai sertifikasi penagihan yang dikeluarkan Asosiasi Fintech Pendanaan Bersama Indonesia (AFPI).\r\nKetika sudah terlanjur meminjam di pinjaman online ilegal, pastikan kamu tidak melakukan pinjaman lagi. Jika ingin meminjam, maka pilih pinjol yang sudah terdaftar di OJK.\r\n', '2024-12-09', 'assets/news/Financial2.jpg', '2024-12-11 06:01:41', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `gender` enum('Male','Female','Other') COLLATE utf8mb4_general_ci NOT NULL,
  `birth_date` date NOT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_general_ci DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `gender`, `birth_date`, `role`, `created_at`) VALUES
(1, 'Admin', 'admin@example.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Male', '1990-01-01', 'admin', '2024-12-11 01:07:46'),
(2, 'zakya', 'user@example.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Female', '1995-05-15', 'user', '2024-12-11 01:07:46'),
(4, 'zaky', 'zaky@gmail.com', 'bf0b52439529700a4a04cea0ab5a0302283f86be667d49d8edc5209a22cab01d', 'Male', '2005-08-14', 'user', '2024-12-12 00:28:39'),
(5, 'Illona', 'illona@example.com', '5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5', 'Female', '2003-08-09', 'user', '2025-06-06 05:28:14');

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
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_category_fk` (`category_id`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `fk_news_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
