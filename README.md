BioskopKita - Program Pemesanan Tiket Bioskop

BioskopKita adalah program pemesanan tiket bioskop berbasis Pascal yang berjalan di terminal. Pengguna bisa melihat daftar film, membeli tiket dengan kategori Reguler atau VIP, membayar dengan perhitungan diskon dan kembalian otomatis, serta melihat rekapitulasi penjualan. Program ini dibuat sebagai tugas UTS Dasar Pemrograman.

Anggota Kelompok

1. Nailah Sakhi Sinambela - 261401024 - KOM C - Lab 5
2. Nisa Azzura Gultom - 261401018 - KOM C - Lab 5
3. Denish Azzayaka Syahyufi - 261401109 - KOM C - Lab 6

Fitur Utama dan Logika Singkat

1. Menu Utama (Perulangan)
Menu menampilkan 4 pilihan dan berulang dengan `repeat ... until menu = 4`, jadi program terus berjalan sampai pengguna memilih 4. Variabel `pendapatan`, `totalTransaksi`, dan `totalTiket` diinisialisasi sekali sebelum perulangan, sehingga nilainya tetap tersimpan antar transaksi.

2. Lihat Daftar Film (Menu 1)
Menampilkan daftar film beserta harganya dengan `writeln`, lalu `readln` (Enter) untuk kembali ke menu. Fitur ini tidak mengubah data apa pun.

3. Beli Tiket (Menu 2)
Ini fitur inti program, alurnya bertingkat:
1. Pengguna mengisi nama pemesan dan nomor film. `case-of` menentukan nama film dan harganya (film 1 sampai 4 berharga Rp 50.000, Rp 75.000, Rp 100.000, dan Rp 100.000).
2. Jika nomor film tidak valid (harga = 0), transaksi dibatalkan.
3. Pengguna mengisi jumlah tiket, yang divalidasi harus 1 sampai 10.
4. Perulangan per tiket meminta kategori tiap tiket. Reguler dihitung harga normal, VIP dihitung 2 kali harga. Jika kategori selain 1 atau 2, `batal := true` dan transaksi digagalkan.
5. Diskon bertingkat dengan `if-then-else`: total mulai Rp 500.000 diskon 10%, mulai Rp 300.000 diskon 5%, selain itu tanpa diskon. Total bayar adalah total dikurangi diskon.
6. Perulangan pembayaran `while uangBayar < totalBayar` memaksa pengguna mengisi ulang sampai uang cukup. Kelebihan uang dihitung sebagai kembalian.
7. Struk dicetak, lalu hasil transaksi ditambahkan ke `pendapatan`, `totalTransaksi`, dan `totalTiket`.

4. Rekapitulasi (Menu 3)
Menampilkan total transaksi, total tiket terjual, dan total pendapatan.

5. Keluar (Menu 4)
Keluar dari perulangan menu dan program selesai.

Dokumentasi

Screenshot hasil jalannya program ada di file `Dokumentasi_Screenshot.pdf`.
