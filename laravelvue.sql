/*
SQLyog Community v12.5.0 (64 bit)
MySQL - 10.1.28-MariaDB : Database - testing
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`testing` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `testing`;

/*Table structure for table `adresses` */

CREATE TABLE `adresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `detail` text,
  `preferred` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `adresses` */

/*Table structure for table `migrations` */

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2018_03_17_145117_create_category_models_table',2),
(4,'2018_03_18_072543_create_post_table',3),
(5,'2018_03_18_110550_create_post_table',4),
(6,'2018_03_24_132449_create_posts_table',5),
(7,'2018_03_24_133914_table_post',6);

/*Table structure for table `password_resets` */

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `table_category` */

CREATE TABLE `table_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `table_category` */

insert  into `table_category`(`category_id`,`category_name`,`created_at`,`updated_at`,`category_description`) values 
(2,'PHP',NULL,'2018-04-08 04:29:22','Tutorial for PHP language'),
(31,'Pemrograman Java','2018-04-08 08:04:53','2018-04-08 08:04:53','this tutorial for java'),
(32,'Info','2018-04-28 06:05:08','2018-04-28 06:05:08','Kategori ini untuk info');

/*Table structure for table `table_post` */

CREATE TABLE `table_post` (
  `post_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_hit` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `post_category` (`category_id`),
  CONSTRAINT `table_post_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `table_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `table_post` */

insert  into `table_post`(`post_id`,`post_title`,`post_author`,`post_image`,`post_value`,`post_hit`,`created_at`,`updated_at`,`category_id`) values 
(29,'3 Langkah Untuk Mahasiswa Dalam Menulis Karya Ilmiah','arief','1524896232.jpeg','<p>Mungkin tidak banyak dari kita yang memiliki kegemaran menulis. Tetapi harus disadari suka tidak suka, mau tidak mau, ada kondisi yang mengharuskan Mahasiswa untuk menulis. Untuk Mahasiswa Teknik Informatika mungkin tidak asing dengan menulis karya ilmiah, Kuliah Kerja Praktek (KKP) dan Tugas Akhir (TA). Ya, KKP dan TA seakan menjadi tugas yang menakutkan. 1 Semester (4 bulan) adalah waktu yang sedikit untuk menyelesaikan karya ilmiah. Karena kita perlu membagi waktu untuk membuat rancangan, membuat program dan menulis laporan berupa karya ilmiah. Sehingga menurut Saya penting bagi Mahasiswa menyiapkan diri sejak awal perkuliahan.</p><p>Bagi Mahasiswa yang sudah terbiasa menulis program, menulis karya ilmiah bukanlah sesuatu yang sederhana. Hal itu yang Saya rasakan juga beberapa tahun kebelakang. Saat menulis program Saya dapat dengan mudah mencari tutorial, membuat program, execute dan mendapatkan hasilnya \"sukses atau error\". Tetapi untuk menulis karya ilmiah, sejak awal Saya tidak mengerti apa yang harus Saya ketik, \"apakah sudah benar atau salah ?\", dan lain sebagainya. Tetapi itulah tujuan belajar, berubah dari yang awalnya tidak bisa menjadi bisa membutuhkan proses. Terpenting adalah bagaimana proses kita melakukannya, \"dengan berusaha maksimal atau belum ?\", \"dengan hasil belajar atau mencontek ?\" dan lain sebagainya. Berdasarkan hal tersebut Saya menyampaikan tulisan ini sebagai masukan untuk teman-teman Mahasiswa. Berikut 3 langkah dalam menulis karya ilmiah.</p><p>1. Kuasai 1 Topik</p><p>ATM (Amati, Tiru, Modifikasi) adalah metodologi yang paling tepat dalam belajar. Pada langkah 1 kita akan melakukan proses amati. Sejak awal perkuliahan kita akan banyak sekali mendapat pelajaran, kriptografi, steganografi, artificial intelligence, image processing dan lain-lain. Tetapi untuk menulis karya ilmiah kita hanya perlu satu topik bahasan. Mulailah dengan memilih 1 topik yang kita senangi. Pelajari dan kuasai topik tersebut secara mandiri dan lakukan diskusi dengan teman. Karena kita tidak bisa berharap banyak dari 15 kali tatap muka di kelas. Untuk menulis 1 halaman karya ilmiah setidaknya kita membutuhkan 10 karya ilmiah terdahulu. Jangan sungkan untuk bertanya kepada dosen dan menemuinya di luar kelas terkait topik bahasan yang diambil.</p><p>2. Tulis Ulang Bukan Copy-Paste</p><p>Bagi Saya langkah ke-2 ini adalah proses yang terdengar sepele tetapi sangat penting. Karena pada tahap ini kita melakukan proses tiru dan modifikasi dari karya ilmiah penelitian orang lain. Sangat Saya tekankan dalam menulis jangan pernah melakukan “copy-paste” tapi lakukan “tulis ulang”. Beberapa teman berkomentar “apa bedanya ??? kan sama-sama juga hasilnya, malah copy-paste lebih cepat kan ?”. Perlu disadari Copy-paste merupakan salah satu contoh perilaku generasi digital native tetapi menurut saya sangat tidak baik untuk dilakukan dalam menulis karya ilmiah.</p><p>Saya akan berikan alasan berdasarkan contoh kasus. Sebelumnya kita perlu memahami proses yang terjadi. Saat melakukan “copy-paste” proses yang terjadi adalah sorot tulisan yang ingin dikutip -&gt; copy -&gt; kembali ke lembar kerja -&gt; paste -&gt; sesuaikan -&gt; selesai. Saat melakukan “tulis ulang” proses yang terjadi adalah baca tulisan yang ingin kutip -&gt; kembali ke lembar kerja -&gt; ingat tulisan yang dibaca -&gt; sesuaikan -&gt; tulis ulang. Ya, “copy-paste” tidak ada proses mengingat. Ini yang menjadikan \"copy-paste\" membuat kita tidak berkembang dalam menulis.</p><p>Dimisalkan kalimat yang akan dikutip adalah “Penelitian ini dilakukan dengan metode xyz”. Karena kebetulan penelitian kita menggunakan metode yang sama, saat melakukan “copy-paste” kita akan mengutip kalimat itu secara penuh. Maka yang tertulis di lembar kerja kita adalah “Penelitian ini dilakukan dengan metode xyz”. Tetapi bisa berbeda saat melakukan “tulis ulang” karena ada proses mengingat, kata tersebut bisa saja berubah tetapi dengan makna yang sama, misalnya menjadi “Penelitian ini dilakukan menggunakan metode xyz”. Perubahan kata “dengan” menjadi “menggunakan” adalah hasil dari pemikiran yang kita lakukan. Sehingga sedikit demi sedikit kita terbiasa untuk menulis bukan \"copy-paste\".</p><p>3. Tulis dan Tulis Saja</p><p>Mulai menulis adalah proses yang paling sulit. Terkadang sejak awal membuka lebar kerja kita sudah bingung apa yang akan ditulis. Tetapi Dosen Saya pernah menyampaikan, \"saat anda menulis pokoknya tulis saja, tulis, tidak perduli seperti apa tulisannya pokoknya tulis saja\". Dan itu yang Saya coba lakukan, pada lembar pendahuluan terkadang Saya menuliskan “Penelitian ini diharapkan bla bla bla wkwkwkwkw”. Entahlah, pokoknya Saya tulis dan tulis saja. Bahkan terkadang kita bisa curhat pada bagian-bagian yang lain hanya sekedar untuk memenuhi lembar kerja. Tetapi poin pentingnya adalah jangan mengharapkan sekali tulis akan dapat tulisan yang baik. Kita hanya perlu menulisnya, kita akan membaca tulisan kita sendiri berulang-ulang dan memperbaikinya berulang-ulang juga. Nikmati prosesnya maka kita akan mendapatkan tulisan yang baik.</p><p>Inilah 3 langkah yang Saya lakukan untuk selamat dalam menyelesaikan karya ilmiah. Mungkin jika Saya tidak pernah melakukan ini, Anda tidak akan pernah menemukan tulisan Saya pada laman ini. Penutup dari tulisan ini,</p><p>“Menulislah agar orang di masa akan datang tahu bahwa kau pernah hidup di masa lalu”. ~Ustadz Abdul Somad~</p><p>Terima kasih, Semoga bermanfaat. Wassalamualaikum Warahmatullah Wabarakatuh.</p>',1,'2018-06-10 01:09:01','2018-04-28 06:17:23',32),
(30,'Laragon, Alternatif XAMPP Terbaik di Windows','arief','1524895643.png','<p>Pembaca yang menggunakan Windows pasti sudah cukup akrab dengan XAMPP. XAMPP adalah aplikasi pilihan untuk kebutuhan development web PHP di komputer lokal. Untuk penggunaan PHP biasa, XAMPP sudah sangat mumpuni. Namun, XAMPP kurang fleksibel untuk framework yang membutuhkan versi PHP tertentu, memasang ekstensi tertentu, atau membutuhkan konfigurasi lain yang perlu dikostumisasi.</p><p>Jika kalian sudah capek <em>ngoprek</em> XAMPP untuk menyokong pengembangan web di komputer lokal, cobalah untuk memasang Laragon.</p><h2>Apa itu Laragon?</h2><p>Laragon adalah <em>universal development environment</em> untuk PHP, Node.js, Python, Java, Go, Ruby, yang <em>portable</em>, terisolasi, cepat, ringan, dan mudah dipakai. Laragon bisa dipakai sebagai pengganti XAMPP.</p><h2>Apa yang Ditawarkan Oleh Laragon?</h2><ul><li>Pretty URLs</li><li>Dengan memakai laragon kita bisa mengakses project lewat <code>app.test</code> daripada menggunakan <code>localhost/app</code>.</li><li>Portable</li><li>Folder Laragon bisa dipindah-pindah tanpa perlu merusak sistemnya.</li><li>Isolated</li><li>Sistem Laragon terisolasi dari sistem operasi yang kita miliki sehingga apapun yang kita lakukan dengan Laragon tidak akan mempengaruhi komputer lokal.</li><li>Easy Operation</li><li>Laragon sudah mengotomatiskan banyak konfigurasi yang kompleks sehinga kita \"tinggal pakai\" saja. Kita bisa menambah versi baru dari PHP, Python, Ruby, Java, Go, Apache, Nginx, MySQL, PostgreSQL, MongoDB, atau yang lainnya tanpa kesulitan yang berarti dan tanpa merusak sistem yang sudah ada.</li><li>Modern &amp; Powerful</li><li>Laragon memiliki arsitektur modern yang cocok untuk dipakai mengembangkan aplikasi web mdoern. Kita bisa menggunakan <strong>Apache</strong> &amp; <strong>Nginx</strong> sekaligus.</li></ul><h2>Tangkapan Layar</h2><p>Untuk memberikan pembaca gambaran tentang Laragon, berikut ini beberapa tangkapan layar antarmukanya.</p><p><img src=\"https://static.cdn-cdpl.com/700x350/8b81700471e8917196897fec5d8e28e9/f8rBqSU.png\"></p><p><img src=\"https://static.cdn-cdpl.com/700x350/8b81700471e8917196897fec5d8e28e9/ao8WhLD.png\"></p><p><img src=\"https://static.cdn-cdpl.com/700x350/8b81700471e8917196897fec5d8e28e9/IUqLtn2.png\"></p><p><img src=\"https://static.cdn-cdpl.com/700x350/8b81700471e8917196897fec5d8e28e9/M2aaGch.png\"></p><p><img src=\"https://static.cdn-cdpl.com/700x350/8b81700471e8917196897fec5d8e28e9/nXjupsM.png\"></p><h2>Download</h2><p>Laragon tersedia secara cuma-cuma alias gratis. Kita bisa mengunduh file <em>installer</em>-nya di halaman <a href=\"https://www.laragon.org/download/\" target=\"_blank\">Download</a>. Semua paket Laragon baik itu PHP, RoR, Node.js, Python, Java, dkk. bisa dipasang salah satu atau sekaligus. Untuk panduan pemasangan dan cara penggunaannya silahkan ikuti di <a href=\"https://www.laragon.org/docs/\" target=\"_blank\">laragon.org/docs/</a>.</p><p>Perlu diketahui bahwa Laragon hanya tersedia untuk sistem operasi Microsoft Windows saja.</p>',1,'2018-06-14 01:23:58','2018-04-28 06:08:30',32),
(31,'asem','arief','1525925684.jpeg','<p>ame</p>',1,'2018-05-10 04:14:45','2018-05-10 04:14:45',2),
(32,'tes','arief','1525943751.png','<p>tests</p>',1,'2018-05-10 09:15:53','2018-05-10 09:15:53',31);

/*Table structure for table `users` */

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` enum('active','archived','','') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`password`,`remember_token`,`created_at`,`updated_at`,`status`) values 
(1,'arie','manggala.corp@gmail.com','$2y$10$Gy7OtKFO.wf6IeKUQ5Rt4O06eCQJGsHtG/OoE6W/Z/HWgWV//PIBK','fiPpw8JDYBXu96pCqlJ7gf602tNBQ62E1c9nws1QjwLGSYUBoBw7Ow06FqI0','2018-03-17 00:26:30','2018-03-17 00:26:30',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
