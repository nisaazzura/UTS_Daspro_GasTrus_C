program BioskopKita;
uses crt;
var
  menu, film, jumlah, i, kategori, tiketSah : integer;
  hargaFilm, total, diskon, totalBayar      : longint;
  uangBayar, kembali, pendapatan            : longint;
  totalTransaksi, totalTiket                : integer;
  namaFilm, nama                            : string;
  batal                                     : boolean;

begin
  clrscr;
  pendapatan := 0;
  totalTransaksi := 0;
  totalTiket := 0;

  repeat
    writeln;
    writeln('_______________________________________');
    writeln;
    writeln('         PEMESANAN TIKET BIOSKOP         ');
    writeln('_______________________________________');
    writeln;
    writeln('1. Lihat Daftar Film');
    writeln('2. Beli Tiket');
    writeln('3. Lihat rekapitulasi');
    writeln('4. Keluar');
    write('Pilih menu (1-4): ');
    readln(menu);

    case menu of
      1: begin
        clrscr;
        writeln('Daftar Film : ');
        writeln('1. Lighter and Princess (Rp. 50.000)');
        writeln('2. The Last of Us (Rp. 75.000)');
        writeln('3. Doctor Romantic 3 (Rp. 100.000)');
        writeln('4. Parasite (Rp. 100.000)');         
        writeln;
        write('Tekan Enter untuk kembali ke menu utama');
        readln;
        end;

      2: begin
           clrscr;
           writeln('Beli Tiket');
           write('Nama Pemesan : ');
           readln(nama);
           write('Pilih Film (1-4) : ');
           readln(film);

           case film of
             1: begin namaFilm := 'Lighter and Princess'; hargaFilm := 50000;  end;
             2: begin namaFilm := 'The Last of Us';       hargaFilm := 75000;  end;
             3: begin namaFilm := 'Doctor Romantic 3';    hargaFilm := 100000; end;
             4: begin namaFilm := 'Parasite';             hargaFilm := 100000; end;
           else
             begin namaFilm := 'Tidak ada'; hargaFilm := 0; end;
           end;

           if hargaFilm = 0 then
             writeln('Film tidak tersedia.')
           else
           begin
             write('Jumlah Tiket: ');
             readln(jumlah);

             if (jumlah < 1) or (jumlah > 10) then
               writeln('Jumlah tiket tidak valid.')
             else
             begin
               total := 0;
               tiketSah := 0;
               batal := false;
               i := 1;

               while (i <= jumlah) and (not batal) do
               begin
                 writeln('Tiket ke-', i);
                 write('Kategori (1. Reguler / 2. VIP): ');
                 readln(kategori);

                 if kategori = 1 then
                 begin
                   total := total + hargaFilm;
                   tiketSah := tiketSah + 1;
                 end
                 else if kategori = 2 then
                 begin
                   total := total + (hargaFilm * 2);
                   tiketSah := tiketSah + 1;
                 end
                 else
                   batal := true;

                 i := i + 1;
               end;

               if batal then
                 writeln('Kategori tidak valid. Transaksi dibatalkan.')
               else
               begin
                 if total >= 500000 then
                   diskon := total * 10 div 100
                 else if total >= 300000 then
                   diskon := total * 5 div 100
                 else
                   diskon := 0;

                 totalBayar := total - diskon;

                 writeln;
                 writeln('Film: ', namaFilm);
                 writeln('Jumlah Tiket: ', tiketSah);
                 writeln('Total Harga: Rp. ', total);
                 writeln('Diskon: Rp. ', diskon);
                 writeln('Total Bayar: Rp. ', totalBayar);

                 uangBayar := 0;
                 kembali := 0;                             
                 while uangBayar < totalBayar do
                 begin
                   write('Masukkan uang bayar: Rp. ');
                   readln(uangBayar);
                   if uangBayar < totalBayar then
                     writeln('Uang yang dibayarkan kurang. Silakan coba lagi.');
                 end;

                 if uangBayar = totalBayar then
                   writeln('Uang yang dibayarkan pas. Tidak ada kembalian.')
                 else
                 begin
                   kembali := uangBayar - totalBayar;
                   writeln('Kembalian: Rp. ', kembali);
                 end;

                 writeln;
                 writeln('----STRUK PEMBAYARAN----');
                 writeln('Nama Pemesan: ', nama);
                 writeln('Film: ', namaFilm);
                 writeln('Jumlah Tiket: ', tiketSah);
                 writeln('Total Harga: Rp. ', total);
                 writeln('Diskon: Rp. ', diskon);
                 writeln('Total Bayar: Rp. ', totalBayar);
                 writeln('Uang Bayar: Rp. ', uangBayar);
                 writeln('Kembalian: Rp. ', kembali);

                 pendapatan := pendapatan + totalBayar;
                 totalTransaksi := totalTransaksi + 1;
                 totalTiket := totalTiket + tiketSah;

                 writeln;
                 write('Tekan Enter untuk kembali ke menu utama...');
                 readln;                                  
               end;
             end;
           end;
         end;

      3: begin
           writeln;
           writeln('Rekapitulasi Transaksi');
           writeln('Jumlah Transaksi: ', totalTransaksi);
           writeln('Jumlah Tiket Terjual: ', totalTiket);
           writeln('Total Pendapatan: Rp. ', pendapatan);
           writeln;
           write('Tekan Enter untuk kembali ke menu utama...');
           readln;                                       
         end;

      4: writeln('Terima kasih telah menggunakan program ini. Sampai jumpa!');

    else
      begin
        writeln('Menu tidak valid. Silakan pilih menu yang tersedia.');
        write('Tekan Enter untuk kembali ke menu utama...');
        readln;                                           
      end;
    end;

  until menu = 4;
end.