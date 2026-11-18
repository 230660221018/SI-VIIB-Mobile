# SOAL 1
Menurut saya, aplikasi bergerak (mobile application) lebih tepat digunakan untuk layanan pengajuan surat keterangan mahasiswa karena memiliki karakteristik yang mendukung kemudahan akses, pemanfaatan fitur perangkat, dan pemberian informasi secara langsung.

## Tiga karakteristik tersebut adalah sebagai berikut.
1. Mobilitas dan akses kapan saja serta di mana saja (ubiquitous access)

   Aplikasi bergerak dapat diakses melalui smartphone tanpa mengharuskan mahasiswa datang ke kampus atau menggunakan komputer desktop. Hal ini memberikan fleksibilitas bagi mahasiswa untuk mengajukan surat sesuai kebutuhan dan waktu yang tersedia.

   Contoh penerapan: Mahasiswa dapat membuka aplikasi melalui smartphone dari rumah, mengisi formulir pengajuan surat keterangan mahasiswa, melengkapi persyaratan, dan mengirimkan pengajuan tanpa perlu datang ke loket administrasi.

   Alasan: Karakteristik ini tepat untuk mengatasi masalah antrean dan keterbatasan akses layanan administrasi. Mahasiswa dapat menghemat waktu dan biaya transportasi, sedangkan petugas administrasi dapat menerima pengajuan secara digital.

2. Pemanfaatan fitur bawaan perangkat (device capabilities)

   Aplikasi bergerak dapat memanfaatkan fitur smartphone, seperti kamera, penyimpanan berkas, pemindai dokumen, dan notifikasi. Fitur-fitur tersebut dapat membantu mahasiswa menyelesaikan proses pengajuan surat dengan lebih praktis.

   Contoh penerapan: Mahasiswa dapat menggunakan kamera smartphone untuk memotret dokumen persyaratan, seperti kartu mahasiswa, kemudian mengunggahnya melalui aplikasi. Aplikasi juga dapat memanfaatkan notifikasi untuk memberitahukan bahwa pengajuan telah diterima atau surat sudah selesai diproses.

   Alasan: Pemanfaatan fitur perangkat mengurangi langkah manual dan memudahkan mahasiswa dalam mengirimkan persyaratan serta memperoleh informasi mengenai proses pengajuan.

3. Notifikasi dan interaksi secara langsung (real-time interaction)

   Aplikasi bergerak dapat memberikan pemberitahuan kepada pengguna melalui notifikasi ketika terdapat perubahan status atau informasi penting. Dengan demikian, mahasiswa tidak perlu terus-menerus datang ke loket atau menghubungi petugas untuk menanyakan perkembangan pengajuan.

   Contoh penerapan: Setelah mahasiswa mengirimkan pengajuan, aplikasi menampilkan status Menunggu Verifikasi. Ketika petugas menyetujui pengajuan, aplikasi memberikan notifikasi bahwa surat keterangan telah selesai dan dapat diunduh.

   Alasan: Karakteristik ini meningkatkan transparansi dan komunikasi antara mahasiswa dengan pihak administrasi. Mahasiswa dapat mengetahui perkembangan pengajuan dengan lebih cepat, sementara petugas dapat mengurangi pertanyaan berulang mengenai status surat.

Ketiga karakteristik tersebut menjadikan aplikasi bergerak sebagai solusi yang sesuai untuk digitalisasi layanan pengajuan surat keterangan mahasiswa. Akses yang fleksibel memudahkan pengajuan, fitur bawaan smartphone membantu proses pengiriman dokumen, dan notifikasi mempermudah pemantauan status. Dengan penerapan yang tepat, proses administrasi dapat menjadi lebih efisien, praktis, dan transparan dibandingkan prosedur manual yang mengharuskan mahasiswa datang dan mengantre di loket.


# SOAL 2
Kode tersebut digunakan untuk menyimpan dan menampilkan daftar jenis surat yang diajukan mahasiswa.

## Berikut penjelasan fungsi setiap bagian kode beserta alasannya.

1. List<String> daftarSurat = [];

   List<String> merupakan struktur data berupa daftar yang hanya dapat menyimpan elemen bertipe String atau teks. Variabel daftarSurat digunakan untuk menyimpan jenis-jenis surat, sedangkan [] menunjukkan bahwa daftar tersebut awalnya kosong.

   Contoh: daftar dapat berisi "Surat Keterangan Aktif Kuliah", "Surat Keterangan Lulus", dan "Surat Pengantar".

2. Parameter String jenis

   Parameter String jenis digunakan untuk menerima masukan berupa teks ketika fungsi tambahSurat() dipanggil. Parameter ini menentukan jenis surat yang akan dimasukkan ke dalam daftar.

   Contoh: tambahSurat('Surat Keterangan Aktif Kuliah'); akan mengirimkan teks tersebut sebagai nilai parameter jenis.

3. isEmpty

   Properti isEmpty digunakan untuk memeriksa apakah sebuah teks kosong. Pada kode tersebut, jenis.isEmpty bernilai true jika variabel jenis tidak memiliki karakter.

   Alasan: validasi ini diperlukan agar sistem tidak menyimpan data jenis surat yang kosong, sehingga data pengajuan menjadi lebih jelas dan dapat digunakan.

4. return pada kondisi error

   Perintah return digunakan untuk menghentikan eksekusi fungsi saat kondisi tertentu terpenuhi. Dalam kode tersebut, jika jenis kosong, sistem menampilkan pesan kesalahan lalu menjalankan return.

   Alasan: tanpa return, program akan melanjutkan eksekusi ke perintah berikutnya sehingga data yang tidak valid berpotensi tetap ditambahkan ke daftar.

5. daftarSurat.add(jenis);

   Metode add() digunakan untuk menambahkan nilai jenis ke dalam daftar daftarSurat.

   Contoh: jika jenis berisi "Surat Pengantar", maka teks tersebut akan disimpan sebagai salah satu elemen dalam daftar. Penambahan ini dilakukan setelah data melewati validasi.

6. Perulangan for

   Perulangan for digunakan untuk mengakses setiap elemen dalam daftar berdasarkan indeksnya. Variabel i dimulai dari 0 dan bertambah selama nilainya lebih kecil dari daftarSurat.length, yaitu jumlah elemen dalam daftar.

   Pada perintah print('${i + 1}. ${daftarSurat[i]}');, i + 1 digunakan agar nomor yang ditampilkan dimulai dari 1, sedangkan daftarSurat[i] mengambil jenis surat sesuai indeksnya.

   Alasan: perulangan ini memudahkan sistem menampilkan seluruh daftar surat secara berurutan tanpa harus menulis perintah print() untuk setiap surat secara manual.

## Satu kesalahan umum jika validasi isEmpty dihapus

Jika validasi isEmpty dihapus, pengguna dapat menambahkan teks kosong ke dalam daftar surat. Akibatnya, daftar bisa memiliki entri tanpa nama jenis surat, misalnya:

```js
tambahSurat("");
tampilkanSurat();
```

Hasilnya dapat terlihat seperti berikut:

```js
1.
```

Hal ini membuat data menjadi tidak valid dan membingungkan pengguna maupun petugas administrasi karena terdapat entri surat tanpa keterangan jenis surat. Oleh karena itu, validasi isEmpty penting untuk menjaga kualitas data yang disimpan.


# SOAL 3
Struktur widget tersebut digunakan untuk membuat halaman aplikasi yang menampilkan judul halaman, petunjuk kepada pengguna, dan daftar jenis surat yang dapat dipilih. Setiap widget memiliki fungsi berbeda dalam membangun tampilan aplikasi Flutter.

## Fungsi setiap widget

1. MaterialApp

   MaterialApp merupakan widget utama yang menyediakan struktur dasar aplikasi dengan desain Material Design. Widget ini dapat mengatur tema, navigasi, dan halaman awal aplikasi.

   Alasan: penggunaan MaterialApp memudahkan pengembang membangun aplikasi dengan komponen tampilan yang konsisten sesuai standar desain Flutter.

2. Scaffold

   Scaffold menyediakan kerangka dasar halaman, seperti AppBar, body, FloatingActionButton, dan Drawer.

   Alasan: widget ini memudahkan pengembang menyusun bagian-bagian utama halaman aplikasi, misalnya halaman daftar surat yang memiliki bilah judul dan area konten.

3. AppBar

   AppBar merupakan bilah bagian atas halaman yang biasanya menampilkan judul atau tombol navigasi. Pada kode tersebut, AppBar menampilkan judul Daftar Surat melalui Text('Daftar Surat').

   Alasan: judul membantu pengguna mengetahui halaman yang sedang dibuka.

4. Column

   Column digunakan untuk menyusun beberapa widget anak secara vertikal, dari atas ke bawah. Pada kode tersebut, Column menempatkan teks petunjuk di atas daftar surat.

   Alasan: susunan vertikal membuat informasi dan pilihan surat lebih mudah dibaca secara berurutan.

5. Text

   Text digunakan untuk menampilkan teks pada layar. Dalam kode tersebut, Text('Pilih jenis surat') memberikan petunjuk kepada pengguna agar memilih jenis surat yang dibutuhkan.

   Alasan: petunjuk ini membantu pengguna memahami tindakan yang perlu dilakukan sebelum mengajukan surat.

6. ListView.builder

   ListView.builder digunakan untuk menampilkan daftar widget yang dapat digulir (scrollable). Widget ini membangun item daftar sesuai kebutuhan, sehingga cocok untuk daftar surat yang jumlahnya banyak atau berubah-ubah.

   Alasan: mahasiswa dapat melihat berbagai pilihan surat tanpa harus menampilkan seluruh item sekaligus dalam satu area yang terbatas.

## Masalah jika ListView.builder berada langsung di dalam Column

Salah satu masalah yang dapat terjadi adalah layout error karena tinggi ListView.builder tidak dibatasi. Secara default, Column memberikan ruang vertikal berdasarkan kebutuhan anak-anaknya, sedangkan ListView.builder ingin menggunakan ruang untuk daftar yang dapat digulir. Jika batas tinggi yang sesuai tidak tersedia, Flutter dapat menampilkan error seperti “Vertical viewport was given unbounded height”.

Masalah ini terjadi karena ListView.builder membutuhkan batas ukuran tinggi agar Flutter dapat menentukan area daftar yang dapat digulir.

Cara memperbaikinya: bungkus ListView.builder menggunakan widget Expanded, sehingga daftar menggunakan sisa ruang yang tersedia di dalam Column.

### Contoh perbaikannya:

```js
MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('Daftar Surat'),
    ),
    body: Column(
      children: [
        Text('Pilih jenis surat'),
        Expanded(
          child: ListView.builder(
            itemCount: daftarSurat.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(daftarSurat[index]),
              );
            },
          ),
        ),
      ],
    ),
  ),
);
```

Pada contoh tersebut, Expanded membuat ListView.builder mengisi sisa tinggi yang tersedia setelah widget Text ditampilkan. Dengan demikian, daftar surat dapat digulir tanpa menyebabkan masalah tinggi yang tidak terbatas.

setiap widget memiliki peran dalam membangun antarmuka Flutter. Expanded diperlukan pada struktur ini agar ListView.builder memperoleh batas tinggi yang jelas dan dapat menampilkan daftar surat secara normal.


# SOAL 4
Analisis kebutuhan dilakukan untuk menentukan fitur yang harus tersedia dalam aplikasi pengajuan surat mahasiswa. Kebutuhan dibagi menjadi kebutuhan fungsional dan nonfungsional, kemudian ditentukan prioritasnya menggunakan metode MoSCoW.

1. Kebutuhan fungsional dan nonfungsional
    Kebutuhan fungsional menjelaskan layanan atau tindakan yang dapat dilakukan oleh sistem. Sementara itu, kebutuhan nonfungsional menjelaskan kualitas atau standar yang harus dipenuhi sistem, seperti keamanan, kemudahan penggunaan, dan kecepatan respons.
    
    | No. | Permintaan mahasiswa | Jenis kebutuhan | Penjelasan |
    |:---:|:--------|:-------------|:------------------|
    | 1 | Mengajukan surat keterangan aktif kuliah | Fungsional | Sistem menyediakan formulir untuk mengisi data dan mengirim pengajuan surat. |
    | 2 | Melihat status pengajuan | Fungsional | Sistem menampilkan status pengajuan, misalnya menunggu verifikasi, diproses, atau selesai. |
    | 3 | Menerima notifikasi saat surat siap diambil | Fungsional | Sistem mengirimkan pemberitahuan ketika surat telah selesai diproses. |

    Ketiga permintaan tersebut termasuk kebutuhan fungsional karena semuanya menjelaskan fitur atau layanan yang diharapkan tersedia di aplikasi. Kebutuhan nonfungsional belum disebutkan secara langsung dalam permintaan, tetapi tetap diperlukan untuk mendukung aplikasi, misalnya keamanan data mahasiswa, kemudahan penggunaan, dan waktu respons yang baik.

2. Prioritas menggunakan MoSCoW
    Metode MoSCoW membagi kebutuhan menjadi empat tingkat prioritas:
    - `Must`: wajib tersedia agar fungsi utama aplikasi dapat berjalan.
    - `Should`: penting, tetapi aplikasi masih dapat berfungsi tanpa fitur tersebut untuk sementara.
    - `Could`: fitur tambahan yang bermanfaat jika waktu dan sumber daya mencukupi.
    - `Won't`: tidak dikerjakan pada ruang lingkup pengembangan saat ini, tetapi dapat dipertimbangkan di masa depan.
    
    Berikut penentuan prioritas untuk ketiga kebutuhan tersebut.
    | Kebutuhan | Jenis | Prioritas | Alasan |
    |:------|:--------|:-------------|:------------------|
    | Mengajukan surat keterangan aktif kuliah | Fungsional | Must | Pengajuan surat merupakan fungsi utama aplikasi. Tanpa fitur ini, tujuan utama aplikasi tidak tercapai. |
    | Melihat status pengajuan | Fungsional | Must | Mahasiswa perlu mengetahui perkembangan pengajuannya tanpa harus datang atau bertanya langsung kepada petugas. |
    | Menerima notifikasi saat surat siap diambil | Fungsional | Should | Notifikasi mempermudah mahasiswa mengetahui bahwa surat sudah selesai. Namun, tanpa notifikasi, mahasiswa masih dapat memeriksa status melalui aplikasi. |

    Tidak ada kebutuhan yang secara eksplisit masuk kategori Could atau Won't dari tiga permintaan tersebut. Kedua kategori itu tidak harus digunakan jika memang tidak ada kebutuhan yang sesuai.

    Sebagai tambahan, kebutuhan nonfungsional seperti keamanan data mahasiswa dapat diprioritaskan sebagai Must, karena data pribadi harus dilindungi. Kemudahan penggunaan juga penting agar mahasiswa dapat mengajukan surat tanpa mengalami kesulitan.

3. User flow untuk kebutuhan Must
    Kebutuhan Must yang dipilih adalah mengajukan surat keterangan aktif kuliah dan melihat status pengajuan. Alur berikut menggambarkan proses mahasiswa mengajukan surat hingga memeriksa statusnya.
    ```mermaid
    flowchart TD
        D1["1. Mahasiswa membuka aplikasi"] --> D2["2. Login ke aplikasi"]
        D2 --> D3["3. Memilih menu Pengajuan Surat"]
        D3 --> D4["4. Memilih Surat Keterangan Aktif Kuliah"]
        D4 --> D5["5. Mengisi formulir dan mengirim pengajuan"]
        D5 --> D6["6. Sistem memvalidasi dan menyimpan pengajuan"]
        D6 --> D7["7. Mahasiswa membuka menu Status Pengajuan"]
        D7 --> D8["8. Sistem menampilkan status pengajuan"]
    ```
    Penjelasan user flow:
    1. Mahasiswa membuka aplikasi dan login agar sistem dapat mengenali identitas pemohon.
    2. Mahasiswa memilih menu pengajuan surat, kemudian menentukan jenis surat yang dibutuhkan.
    3. Mahasiswa mengisi formulir sesuai persyaratan dan mengirimkannya.
    4. Sistem memvalidasi data. Jika data tidak lengkap, sistem meminta mahasiswa memperbaikinya. Jika valid, sistem menyimpan pengajuan.
    5. Mahasiswa membuka menu status pengajuan untuk mengetahui perkembangan prosesnya.
    6. Sistem menampilkan status terbaru agar mahasiswa dapat memantau pengajuan tanpa perlu datang langsung ke loket administrasi.

    Fitur pengajuan surat dan pemeriksaan status ditetapkan sebagai Must karena keduanya mendukung proses utama aplikasi. Notifikasi ditetapkan sebagai Should karena meningkatkan kenyamanan, tetapi tidak menjadi satu-satunya cara untuk mengetahui bahwa surat telah selesai.


# SOAL 5
Dalam merancang halaman daftar 20 jenis surat pada aplikasi pengajuan surat mahasiswa, terdapat tiga prinsip UI/UX mobile yang perlu diperhatikan, yaitu desain responsif dan sederhana, kemudahan interaksi sentuh, serta efisiensi dan kemudahan menemukan informasi.
1. Desain responsif dan sederhana (Responsive Design)

    Keputusan desain: Saya akan menggunakan tampilan daftar berbentuk kartu (card) atau baris yang tersusun vertikal. Setiap item menampilkan nama surat, status pengajuan, dan tombol “Ajukan”. Ukuran serta susunan komponen menyesuaikan ukuran layar smartphone, dengan teks yang mudah dibaca.

    Alasan: Layar smartphone memiliki ruang terbatas. Jika terlalu banyak informasi ditampilkan dalam satu baris, tampilan akan menjadi padat dan sulit dibaca. Dengan susunan vertikal yang sederhana, mahasiswa dapat memahami informasi setiap surat tanpa harus memperbesar layar atau menggulir secara horizontal.

2. Kemudahan interaksi sentuh (Touch-Friendly Design)

    Keputusan desain: Saya akan membuat tombol “Ajukan” dengan ukuran area sentuh yang memadai, jarak antartombol yang cukup, serta warna yang kontras dengan latar belakang. Tombol juga ditempatkan secara konsisten pada setiap item agar mudah ditemukan. Sebagai acuan, area sentuh sebaiknya sekitar 48 × 48 dp atau lebih.

    Alasan: Pengguna berinteraksi menggunakan jari, bukan kursor mouse. Tombol yang terlalu kecil atau berdekatan dapat menyebabkan pengguna salah menekan pilihan. Area sentuh yang memadai membantu mahasiswa mengajukan surat dengan lebih mudah dan mengurangi kesalahan interaksi.
    
3. Efisiensi dan kemudahan menemukan informasi (Efficiency and Findability)

    Keputusan desain: Saya akan menyediakan fitur pencarian berdasarkan nama surat, filter berdasarkan status, dan daftar yang dapat digulir (scrollable list). Status ditampilkan dengan label yang jelas, seperti “Belum Diajukan”, “Diproses”, atau “Selesai”. Tombol “Ajukan” hanya diaktifkan untuk surat yang memang dapat diajukan.

    Alasan: Dengan 20 jenis surat, pengguna mungkin membutuhkan waktu lebih lama jika harus mencari secara manual. Fitur pencarian dan filter membantu mahasiswa menemukan surat yang dibutuhkan dengan cepat. Label status yang jelas juga mengurangi kebingungan, terutama ketika pengguna membuka aplikasi hanya sebentar untuk memeriksa informasi atau mengajukan surat.

Ketiga prinsip tersebut membantu menghasilkan halaman daftar surat yang mudah dibaca, mudah disentuh, dan cepat digunakan. Desain responsif mengatasi keterbatasan layar, interaksi sentuh yang baik mengurangi kesalahan, sedangkan pencarian dan filter mempersingkat waktu pengguna dalam menemukan surat yang dibutuhkan. Dengan demikian, aplikasi dapat memberikan pengalaman penggunaan yang lebih nyaman dan efisien bagi mahasiswa.


# SOAL 6
Pada aplikasi pengajuan surat mahasiswa, navigasi digunakan untuk berpindah antara tiga halaman, yaitu daftar surat, form pengajuan, dan detail status. Flutter menyediakan widget Navigator untuk mengatur perpindahan halaman dengan konsep navigation stack, yaitu halaman yang dibuka akan ditumpuk di atas halaman sebelumnya.
1. Implementasi navigasi menggunakan Navigator
    Terdapat tiga metode yang dapat digunakan, yaitu push(), pushNamed(), dan pop().

    1. Navigator.push()

        Metode ini digunakan untuk membuka halaman baru dengan memberikan objek Route secara langsung, biasanya menggunakan MaterialPageRoute.

        `Contoh:` ketika mahasiswa memilih salah satu jenis surat pada halaman daftar, aplikasi membuka form pengajuan dan mengirimkan data jenis surat yang dipilih.
        ```js
        Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FormPengajuanPage(
            jenisSurat: 'Surat Keterangan Aktif Kuliah',
            ),
        ),
        );
        ```
        Metode ini cocok digunakan ketika perpindahan halaman membutuhkan konfigurasi khusus atau pengiriman data secara langsung melalui konstruktor.
    
    2. Navigator.pushNamed()

        Metode ini digunakan untuk membuka halaman berdasarkan nama rute yang telah didaftarkan pada MaterialApp, misalnya /form atau /detail-status.

        `Contoh:` setelah pengajuan berhasil dikirim, aplikasi membuka halaman detail status dengan membawa data pengajuan.
        ```js
        Navigator.pushNamed(
        context,
        '/detail-status',
        arguments: dataPengajuan,
        );
        ```
        Metode ini cocok untuk aplikasi dengan beberapa halaman karena nama rute membuat navigasi lebih terstruktur dan mudah dikelola.

    3. Navigator.pop()

        Metode ini digunakan untuk menutup halaman yang sedang terbuka dan kembali ke halaman sebelumnya dalam navigation stack.

        `Contoh:` mahasiswa menekan tombol kembali pada halaman form pengajuan untuk kembali ke halaman daftar surat.
        ```js
        Navigator.pop(context);
        ```
        Metode ini membantu pengguna kembali ke halaman sebelumnya tanpa harus membuka ulang halaman tersebut dari awal.

2. Pengiriman data jenis surat dari halaman daftar ke form

    Data jenis surat dapat dikirim melalui dua cara, yaitu menggunakan parameter konstruktor ketika memakai Navigator.push() atau menggunakan arguments ketika memakai Navigator.pushNamed().

    Contoh menggunakan parameter konstruktor:
    ```js
    class FormPengajuanPage extends StatelessWidget {
    final String jenisSurat;

    const FormPengajuanPage({
        super.key,
        required this.jenisSurat,
    });

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(title: Text('Form Pengajuan')),
        body: Center(
            child: Text('Jenis surat: $jenisSurat'),
        ),
        );
    }
    }
    ```
    Ketika mahasiswa memilih surat “Surat Keterangan Aktif Kuliah”, nilai tersebut dikirim ke FormPengajuanPage melalui parameter jenisSurat. Form kemudian menampilkan jenis surat yang dipilih sehingga mahasiswa tidak perlu memilih atau mengetik ulang jenis surat tersebut.

    `Alasannya:` pengiriman data ant halaman membuat informasi yang dipilih pengguna tetap konsisten dan mengurangi risiko kesalahan input.

3. Pemberian feedback setelah form dikirim

    Setelah mahasiswa mengisi dan mengirim form, sistem perlu memberikan umpan balik (feedback) agar mahasiswa mengetahui apakah pengajuan berhasil atau gagal.

    Salah satu cara yang dapat digunakan adalah SnackBar untuk menampilkan pesan sementara setelah validasi berhasil.
    ```js
    if (_formKey.currentState!.validate()) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
        content: Text('Pengajuan surat berhasil dikirim'),
        ),
    );
    }
    ```
    Sebelum menampilkan pesan berhasil, sistem harus memvalidasi data yang diisi. Jika terdapat kolom wajib yang kosong, sistem menampilkan pesan validasi dan tidak melanjutkan pengiriman.

    Jika pengajuan berhasil disimpan, aplikasi juga dapat membuka halaman detail status menggunakan Navigator.pushNamed() agar mahasiswa dapat melihat status pengajuannya, misalnya “Menunggu Verifikasi”.

    `Alasannya:` feedback membantu pengguna memahami hasil tindakannya dan mengurangi ketidakpastian setelah menekan tombol kirim. Namun, pesan berhasil hanya boleh ditampilkan setelah sistem benar-benar memastikan pengajuan berhasil disimpan, bukan sekadar setelah tombol ditekan.

### Kesimpulan
Navigator.push() digunakan untuk membuka halaman baru dengan rute yang dibuat langsung, Navigator.pushNamed() digunakan untuk berpindah menggunakan nama rute yang telah didaftarkan, sedangkan Navigator.pop() digunakan untuk kembali ke halaman sebelumnya. Data jenis surat dikirim melalui konstruktor atau arguments, sementara feedback diberikan melalui validasi, SnackBar, dan halaman detail status. Kombinasi tersebut membuat alur pengajuan surat lebih terstruktur, informatif, dan mudah digunakan.


# SOAL 7
1. **Mengapa setiap field bersifat final?**

    Pada model data PengajuanSurat, semua field (id, jenis, tanggal, dan status) menggunakan kata kunci final. Dalam Dart, final berarti suatu variabel hanya dapat diberi nilai satu kali. Setelah nilainya ditetapkan, variabel tersebut tidak dapat diisi ulang dengan nilai lain.
    - id digunakan sebagai identitas unik untuk membedakan setiap pengajuan surat.
    - jenis menyimpan nama atau jenis surat yang diajukan mahasiswa.
    - tanggal menyimpan tanggal pengajuan surat.
    - status menyimpan kondisi pengajuan, seperti menunggu verifikasi, diproses, atau selesai.
    Penggunaan final membuat objek pengajuan lebih konsisten karena field tidak dapat diubah secara langsung setelah objek dibuat. Hal ini juga membantu mengurangi perubahan data yang tidak disengaja.

    Namun, jika status atau data pengajuan perlu diperbarui, objek baru dapat dibuat dengan nilai yang berbeda, kemudian objek lama diganti di dalam daftar. Jadi, penggunaan final tidak berarti data pengajuan tidak dapat diperbarui sama sekali.

2. **Mengapa id wajib ada?**

    Field id wajib ada karena setiap pengajuan membutuhkan identitas yang unik. Jika terdapat beberapa pengajuan dengan jenis surat yang sama, sistem tetap dapat membedakan masing-masing pengajuan berdasarkan ID-nya.

    Contohnya:
    | ID | Jenis surat | Status |
    |:---|:--------|:-------------|
    | S001 | Surat Keterangan Aktif Kuliah | Diproses |
    | S002 | Surat Keterangan Aktif Kuliah | Selesai |

    Walaupun jenis suratnya sama, kedua pengajuan tersebut merupakan data yang berbeda karena memiliki ID yang berbeda.

    Dengan demikian, id memudahkan sistem menemukan pengajuan tertentu, memperbarui status pengajuan yang tepat, menghapus data yang dipilih, dan menghindari kesalahan saat mengelola banyak pengajuan.

3. **Perbedaan StatelessWidget dan StatefulWidget**

    StatelessWidget adalah widget yang tidak memiliki state internal yang dapat berubah selama siklus hidup widget. Widget ini cocok untuk tampilan yang relatif tetap dan tidak perlu mengelola perubahan data secara langsung.

    StatefulWidget adalah widget yang memiliki objek State untuk menyimpan dan mengelola data yang dapat berubah. Widget ini cocok untuk halaman yang perlu memperbarui tampilannya ketika terjadi perubahan data.

    Untuk halaman daftar pengajuan surat, saya akan menggunakan StatefulWidget.

    Alasannya, daftar pengajuan dapat berubah ketika mahasiswa menambahkan pengajuan baru, menghapus pengajuan, atau memperbarui statusnya. Dengan StatefulWidget, perubahan tersebut dapat ditampilkan pada layar tanpa harus membuka ulang aplikasi.

    Sebaliknya, StatelessWidget lebih cocok untuk komponen yang hanya menampilkan data yang diberikan dari luar dan tidak mengelola perubahan state-nya sendiri.

4. **Fungsi setState dan akibat jika tidak digunakan**

    setState() adalah metode pada objek State yang memberi tahu Flutter bahwa terdapat perubahan pada state sehingga Flutter perlu membangun ulang tampilan (rebuild) untuk mencerminkan perubahan tersebut.

    Contoh penambahan data pada daftar pengajuan:
    ```js
    setState(() {
    daftarPengajuan.add(
        const PengajuanSurat(
        id: 'S003',
        jenis: 'Surat Pengantar',
        tanggal: '29-10-2026',
        status: 'Menunggu Verifikasi',
        ),
    );
    });
    ```
    Pada contoh tersebut, data baru ditambahkan ke dalam daftarPengajuan di dalam setState(). Setelah itu, Flutter memperbarui tampilan agar pengajuan baru dapat terlihat pada halaman daftar.

    Jika data ditambahkan tanpa setState(), data di dalam list sebenarnya dapat bertambah, tetapi Flutter tidak otomatis mengetahui bahwa tampilan perlu diperbarui. Akibatnya, pengajuan baru mungkin belum terlihat di layar, meskipun datanya sudah tersimpan dalam list. Tampilan biasanya baru berubah ketika terjadi rebuild karena proses lain.

    Oleh karena itu, perubahan state yang memengaruhi tampilan harus diberitahukan kepada Flutter menggunakan setState() agar data dan tampilan tetap sinkron.

### Kesimpulan
final menjaga nilai field objek agar tidak berubah secara langsung, sedangkan id berfungsi sebagai identitas unik setiap pengajuan. StatefulWidget lebih sesuai untuk halaman daftar pengajuan yang datanya dapat berubah. Sementara itu, setState() diperlukan agar Flutter mengetahui perubahan data dan memperbarui tampilan sesuai kondisi terbaru.


# SOAL 8
CRUD merupakan singkatan dari Create, Read, Update, dan Delete, yaitu empat operasi dasar yang digunakan untuk mengelola data dalam aplikasi. Pada Flutter, CRUD lokal dapat diterapkan menggunakan List untuk menyimpan data sementara di dalam aplikasi tanpa harus menggunakan database atau server.

## Berikut penjelasan setiap operasi CRUD beserta method List yang digunakan.
1. **Create (Menambahkan Data)**

    Create merupakan operasi untuk menambahkan data baru ke dalam daftar. Pada aplikasi pengajuan surat, operasi ini digunakan ketika pengguna mengisi formulir pengajuan surat, kemudian data tersebut disimpan ke dalam List.

    Method yang digunakan adalah:
    - add(): menambahkan satu data baru ke dalam daftar.
    - addAll(): menambahkan beberapa data sekaligus.
    Contoh kode:
    ```js
    List<Map<String, dynamic>> pengajuanSurat = [];

    pengajuanSurat.add({
    'id': 1,
    'nama': 'Andi',
    'jenisSurat': 'Surat Pengantar'
    });

    setState(() {});
    ```
    Alasan: Method add() digunakan karena data pengajuan surat yang baru harus dimasukkan ke dalam daftar agar dapat ditampilkan dan dikelola kembali. Penggunaan setState() bertujuan agar tampilan Flutter diperbarui setelah data berhasil ditambahkan.

2. **Read (Membaca atau Menampilkan Data)**

    Read merupakan operasi untuk membaca dan menampilkan data yang sudah tersimpan di dalam List. Pada aplikasi pengajuan surat, operasi ini digunakan untuk menampilkan seluruh data pengajuan surat kepada admin atau pengguna.

    Method yang digunakan antara lain:
    - ListView.builder: menampilkan data dalam bentuk daftar secara dinamis.
    - where(): mencari data berdasarkan kondisi tertentu.
    - firstWhere(): mencari data pertama yang sesuai dengan kondisi.
    Contoh kode:
    ```js
    ListView.builder(
    itemCount: pengajuanSurat.length,
    itemBuilder: (context, index) {
        return ListTile(
        title: Text(pengajuanSurat[index]['nama']),
        subtitle: Text(pengajuanSurat[index]['jenisSurat']),
        );
    },
    );
    ```
    Alasan: ListView.builder digunakan karena mampu menampilkan data berdasarkan jumlah elemen yang tersedia di dalam List. Dengan demikian, ketika jumlah pengajuan surat bertambah, daftar akan menyesuaikan secara otomatis tanpa harus membuat tampilan satu per satu.

3. **Update (Mengubah Data)**

    Update merupakan operasi untuk mengubah data yang sudah tersimpan. Pada aplikasi pengajuan surat, operasi ini dapat digunakan ketika pengguna ingin memperbaiki nama atau jenis surat yang sebelumnya sudah diajukan.

    Method yang digunakan:
    - indexWhere(): mencari posisi data berdasarkan kondisi tertentu.
    - []=: mengganti elemen pada posisi tertentu di dalam List.
    Contoh kode:
    ```js
    int index = pengajuanSurat.indexWhere(
    (item) => item['id'] == 1
    );

    if (index != -1) {
    pengajuanSurat[index] = {
        'id': 1,
        'nama': 'Budi',
        'jenisSurat': 'Surat Keterangan'
    };
    }

    setState(() {});
    ```
    Alasan: indexWhere() digunakan untuk menemukan data berdasarkan id yang dimiliki, sedangkan []= digunakan untuk mengganti data lama dengan data baru. setState() diperlukan agar perubahan data langsung terlihat pada tampilan aplikasi.

4. **Delete (Menghapus Data)**

    Delete merupakan operasi untuk menghapus data yang sudah tersimpan di dalam daftar. Pada aplikasi pengajuan surat, operasi ini dapat digunakan ketika pengguna atau admin ingin menghapus pengajuan surat yang sudah tidak diperlukan.

    Method yang digunakan:
    - remove(): menghapus elemen berdasarkan nilai objek.
    - removeAt(): menghapus elemen berdasarkan posisi index.
    - removeWhere(): menghapus elemen berdasarkan kondisi tertentu.
    Contoh kode:
    ```js
    pengajuanSurat.removeWhere(
    (item) => item['id'] == 1
    );

    setState(() {});
    ```
    Alasan: removeWhere() digunakan karena dapat menghapus data berdasarkan kondisi tertentu, dalam contoh ini berdasarkan id pengajuan surat. Cara ini lebih aman untuk memastikan data yang dihapus merupakan data yang dimaksud, bukan sekadar data yang berada pada posisi tertentu.

#
Mengapa id Digunakan sebagai Kunci Update dan Delete, Bukan Index Daftar?

id digunakan sebagai kunci dalam operasi update dan delete karena setiap data seharusnya memiliki identitas yang unik dan tetap. Dengan menggunakan id, aplikasi dapat menemukan dan mengelola data tertentu meskipun posisi data tersebut di dalam List berubah.

Sebaliknya, index merupakan nomor posisi data di dalam daftar, yang dapat berubah ketika ada penambahan atau penghapusan data.

Contohnya:
| Index | ID | Nama |
|:-----|:-----|:-----|
| 0 | 101 | Andi |
| 1 | 102 | Budi |
| 2 | 103 | Citra |

Jika data Andi dihapus, susunan daftar menjadi:
| Index | ID | Nama |
|:-----|:-----|:-----|
| 0 | 102 | Budi |
| 1 | 103 | Citra |

Terlihat bahwa index Budi berubah dari 1 menjadi 0 dan index Citra berubah dari 2 menjadi 1, sedangkan id masing-masing data tetap.

Konsekuensi jika menggunakan index sebagai kunci:
1. Kesalahan update: Jika posisi data berubah, aplikasi berisiko mengubah data yang salah karena index sebelumnya sudah tidak sesuai.
2. Kesalahan delete: Aplikasi dapat menghapus data lain yang menempati index tersebut setelah terjadi perubahan susunan daftar.
3. Ketergantungan pada urutan data: Operasi CRUD menjadi kurang aman karena keberhasilannya bergantung pada posisi data, bukan identitas sebenarnya.
4. Sulit menjaga konsistensi data: Ketika data sering ditambahkan atau dihapus, perubahan index dapat menyebabkan kesalahan dalam pengelolaan data.
Oleh karena itu, penggunaan id lebih disarankan karena identitas data bersifat unik dan tidak berubah meskipun urutan data di dalam List mengalami perubahan.

**Kesimpulan**

Operasi CRUD pada Flutter dapat dilakukan menggunakan List dengan method add() untuk menambahkan data, ListView.builder untuk menampilkan data, indexWhere() dan []= untuk mengubah data, serta removeWhere() untuk menghapus data. Penggunaan id sebagai kunci update dan delete lebih tepat dibandingkan index karena id bersifat unik dan tetap, sedangkan index dapat berubah ketika susunan data mengalami perubahan. Dengan demikian, pengelolaan data pengajuan surat menjadi lebih akurat dan mengurangi risiko kesalahan dalam aplikasi.


# SOAL 9
Dalam aplikasi pengajuan surat, penyimpanan data dapat dilakukan secara in-memory menggunakan List<PengajuanSurat> pada state atau menggunakan persistensi data dengan package shared_preferences. Keduanya memiliki perbedaan dalam cara menyimpan dan mempertahankan data.

1. **Perbedaan In-Memory dan Persistensi Menggunakan SharedPreferences**

    1. Penyimpanan In-Memory

        In-memory merupakan penyimpanan data sementara di dalam memori aplikasi selama aplikasi berjalan. Pada Flutter, penyimpanan ini dapat menggunakan List<PengajuanSurat> yang diletakkan di dalam State.

        Contoh kode:
        ```js
        List<PengajuanSurat> daftarPengajuan = [];

        void tambahPengajuan(PengajuanSurat data) {
        setState(() {
            daftarPengajuan.add(data);
        });
        }
        ```
        Data yang ditambahkan akan tersimpan selama aplikasi masih berjalan. Namun, ketika aplikasi ditutup secara penuh atau dijalankan ulang, data tersebut akan hilang karena hanya disimpan di memori sementara.

        Alasan: In-memory cocok digunakan untuk menyimpan data sementara karena proses membaca dan mengubah data relatif cepat serta tidak memerlukan proses penyimpanan ke media penyimpanan perangkat.

    2. Persistensi Menggunakan SharedPreferences

        Persistensi merupakan proses penyimpanan data agar tetap tersedia meskipun aplikasi ditutup atau perangkat dinyalakan ulang. Pada Flutter, salah satu package yang dapat digunakan adalah shared_preferences.

        Package ini digunakan untuk menyimpan data sederhana dalam bentuk pasangan key-value, seperti String, int, double, bool, dan List<String>.

        Contoh kode:
        ```js
        final prefs = await SharedPreferences.getInstance();

        await prefs.setString('nama', 'Andi');
        ```

        Untuk mengambil data:
        ```js
        final prefs = await SharedPreferences.getInstance();

        String? nama = prefs.getString('nama');
        ```
        Alasan: shared_preferences digunakan ketika data perlu dipertahankan setelah aplikasi ditutup. Dengan demikian, pengguna tidak perlu memasukkan kembali data yang sebelumnya sudah disimpan.

        Perbedaan keduanya dapat dilihat pada tabel berikut.
        | Index | In-Memory | NaSharedPreferencesma |
        |:--------|:--------|:--------|
        | Lokasi penyimpanan | Memori aplikasi (RAM) | Penyimpanan lokal perangkat |
        | Ketahanan data | Hilang ketika aplikasi dimulai ulang | Tetap tersedia setelah aplikasi ditutup |
        | Kecepatan akses | Relatif cepat | Melibatkan operasi penyimpanan asinkron |
        | Penggunaan | Data sementara | Data sederhana yang perlu dipertahankan |
        | Proses akses | RSinkron | Asinkron (Future) |

2. **Mengapa Operasi SharedPreferences Bersifat Asinkron (Future)?**

    Operasi shared_preferences bersifat asinkron karena proses membaca dan menyimpan data melibatkan komunikasi dengan media penyimpanan perangkat, yang membutuhkan waktu untuk diselesaikan.

    Flutter menggunakan Future untuk menunjukkan bahwa suatu operasi tidak langsung menghasilkan nilai, tetapi akan memberikan hasil setelah proses selesai.

    Contohnya:
    ```js
    Future<void> simpanData() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('nama', 'Andi');
    }
    ```
    Pada kode tersebut, terdapat dua penggunaan await:
    - await SharedPreferences.getInstance() digunakan untuk menunggu proses mendapatkan akses ke penyimpanan lokal sampai selesai.
    - await prefs.setString() digunakan untuk menunggu proses penyimpanan data sampai selesai.
    Alasan: Sifat asinkron membuat aplikasi tidak harus menghentikan seluruh proses antarmuka selama operasi penyimpanan berlangsung. Dengan demikian, aplikasi tetap dapat merespons interaksi pengguna ketika menunggu proses penyimpanan selesai.

3. **Apa yang Terjadi Jika Await Diabaikan Saat Menyimpan Data?**

    Jika kata kunci await diabaikan, proses penyimpanan akan berjalan tanpa ditunggu penyelesaiannya oleh kode berikutnya.

    Contoh:
    ```js
    Future<void> simpanData() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('nama', 'Andi');

    print('Data berhasil disimpan');
    }
    ```
    Pada contoh tersebut, pesan "Data berhasil disimpan" dapat ditampilkan sebelum proses penyimpanan benar-benar selesai.

    Akibatnya:
    1. Program tidak mengetahui secara langsung apakah proses penyimpanan sudah berhasil atau masih berlangsung.
    2. Jika terjadi kesalahan dalam penyimpanan, penanganan kesalahan menjadi lebih sulit.
    3. Kode berikutnya dapat berjalan sebelum proses penyimpanan selesai sehingga berpotensi menimbulkan ketidaksesuaian data.
    4. Jika aplikasi langsung ditutup, terdapat risiko proses penyimpanan belum selesai ketika aplikasi berhenti.

    Alasan: await diperlukan agar program menunggu penyelesaian operasi asinkron sebelum melanjutkan ke proses berikutnya. Hal ini penting terutama ketika data yang disimpan harus dipastikan tersedia sebelum digunakan kembali.

4. **Contoh Situasi Penggunaan In-Memory dan Persistensi**
    1. Situasi ketika In-Memory Sudah Cukup

        Contohnya, aplikasi pengajuan surat memiliki formulir pengajuan yang sedang diisi oleh pengguna. Data sementara yang dimasukkan dapat ditampung terlebih dahulu dalam List<PengajuanSurat> selama pengguna masih berada di halaman formulir.

        Jika pengguna membatalkan pengajuan dan data tidak perlu disimpan, penggunaan in-memory sudah cukup.

        Alasan: Data tersebut hanya dibutuhkan sementara selama proses pengisian formulir. Tidak ada kebutuhan untuk mempertahankannya setelah aplikasi ditutup sehingga penyimpanan permanen tidak diperlukan.

    2. Situasi ketika Persistensi Mutlak Diperlukan

        Contohnya, pengguna sudah mengirimkan pengajuan surat kepada pihak desa dan ingin melihat kembali riwayat pengajuan tersebut meskipun aplikasi sudah ditutup atau perangkat dimulai ulang.

        Dalam situasi ini, data pengajuan harus disimpan secara permanen menggunakan media penyimpanan lokal atau database.

        Alasan: Data pengajuan surat merupakan informasi penting yang harus tetap tersedia agar pengguna dan pihak desa dapat melihat status serta riwayat pengajuan. Jika hanya menggunakan in-memory, seluruh data dapat hilang ketika aplikasi ditutup.

        Perlu diperhatikan bahwa shared_preferences lebih sesuai untuk data sederhana, seperti pengaturan aplikasi atau preferensi pengguna. Untuk menyimpan banyak data pengajuan surat yang membutuhkan operasi CRUD, relasi, dan riwayat, database lokal seperti SQLite lebih tepat digunakan.

**Kesimpulan**

Penyimpanan in-memory menggunakan List<PengajuanSurat> hanya mempertahankan data selama aplikasi berjalan, sedangkan persistensi menggunakan shared_preferences memungkinkan data sederhana tetap tersimpan meskipun aplikasi ditutup. Operasi shared_preferences bersifat asinkron karena melibatkan proses akses penyimpanan perangkat sehingga menggunakan Future dan membutuhkan await agar proses dapat ditunggu sampai selesai. In-memory cukup untuk data sementara, sedangkan persistensi diperlukan untuk data yang harus tetap tersedia setelah aplikasi dijalankan ulang.


# SOAL 10
Untuk memenuhi kebutuhan unit perpustakaan kampus, aplikasi mobile peminjaman buku dirancang untuk memudahkan mahasiswa mencari buku, melakukan peminjaman, dan melihat riwayat peminjaman. Aplikasi mengintegrasikan konsep arsitektur sistem informasi, analisis kebutuhan, navigasi Flutter, model data, dan pengelolaan state.
1. Arsitektur Aplikasi

    Arsitektur aplikasi terdiri dari tiga bagian utama, yaitu aplikasi mobile (frontend), penyimpanan lokal, dan backend Sistem Informasi (server).

    Hubungan ketiganya dapat digambarkan sebagai berikut:
    ```mermaid
    flowchart TD
        A[Aplikasi mobile] --> B[Penyimpanan Lokal]
        B --> A[Aplikasi mobile]
        A[Aplikasi mobile] --> C[Backend Sistem Informasi]
        C --> A[Aplikasi mobile]
    ```
    Penjelasan setiap bagian:
    - Aplikasi Mobile (Flutter): Berfungsi sebagai antarmuka yang digunakan mahasiswa untuk mencari buku, mengisi formulir peminjaman, dan melihat riwayat transaksi.
    - Penyimpanan Lokal: Digunakan untuk menyimpan data sementara atau cache agar beberapa informasi dapat diakses lebih cepat tanpa harus selalu mengambil data dari server.
    - Backend Sistem Informasi: Bertugas mengelola data utama, seperti informasi buku, ketersediaan stok, identitas mahasiswa, dan transaksi peminjaman.

    `Alasan:` Ketiga bagian tersebut saling berhubungan karena aplikasi mobile membutuhkan backend untuk mendapatkan informasi buku dan memproses transaksi. Penyimpanan lokal membantu meningkatkan kenyamanan penggunaan aplikasi, sedangkan backend menjadi pusat pengelolaan data agar informasi peminjaman tetap konsisten.

2. Kebutuhan dan Alur Pengguna

    Dua kebutuhan utama (Must Have) yang harus tersedia dalam aplikasi adalah:

    a. Must Have 1 – Melihat Katalog Buku

        Mahasiswa dapat melihat daftar buku yang tersedia di perpustakaan, termasuk judul buku, nama penulis, kategori, dan status ketersediaan.

        Alasan: Fitur katalog merupakan kebutuhan utama karena mahasiswa harus mengetahui buku yang tersedia sebelum melakukan peminjaman.

    b. Must Have 2 – Melakukan Peminjaman Buku

        Mahasiswa dapat memilih buku, mengisi formulir peminjaman, dan mengirimkan permohonan peminjaman melalui aplikasi.

        Alasan: Fitur ini merupakan fungsi utama aplikasi karena tujuan pengembangan sistem adalah mempermudah proses peminjaman buku tanpa harus melakukan pencatatan secara manual.

    Alur pengguna (User Flow):
    ```mermaid
    flowchart TD
        A([Membuka Aplikasi]) --> B[Halaman Beranda]
        B --> C[Melihat Katalog Buku]
        C --> D[Memilih Buku]
        D --> E[Melihat Detail Buku]
        E --> F{Buku Tersedia?}
        F -->|Tidak| C
        F -->|Ya| G[Memilih Pinjam Buku]
        G --> H[Mengisi Form Peminjaman]
        H --> I[Menekan Tombol Kirim]
        I --> J{Data Valid?}
        J -->|Tidak| H
        J -->|Ya| K[Backend Memproses Pengajuan]
        K --> L[Menampilkan Status Pengajuan]
        L --> M([Tugas Selesai])
    ```
    `Alasan:` Alur tersebut dibuat secara berurutan agar pengguna dapat mengetahui ketersediaan buku terlebih dahulu sebelum mengajukan peminjaman. Validasi formulir juga diperlukan untuk menghindari data yang tidak lengkap atau tidak sesuai.

3. Struktur Komponen dan Navigasi

    Aplikasi menggunakan beberapa halaman utama yang dibangun menggunakan widget Flutter.

    1. Halaman Katalog Buku

        Halaman ini digunakan untuk menampilkan seluruh buku yang tersedia di perpustakaan.

        Struktur widget yang digunakan:
        ```js
        Scaffold(
        appBar: AppBar(
            title: Text('Katalog Buku'),
        ),
        body: ListView.builder(
            itemCount: daftarBuku.length,
            itemBuilder: (context, index) {
            return ListTile(
                title: Text(daftarBuku[index].judul),
                subtitle: Text(daftarBuku[index].penulis),
                trailing: Icon(Icons.arrow_forward),
            );
            },
        ),
        );
        ```
        Widget yang digunakan:
        - Scaffold: kerangka utama halaman.
        - AppBar: menampilkan judul halaman.
        - ListView.builder: menampilkan daftar buku secara dinamis.
        - ListTile: menampilkan informasi setiap buku.

        `Alasan:` ListView.builder dipilih karena jumlah buku dapat berubah-ubah. Widget ini mempermudah penampilan data dalam bentuk daftar tanpa harus membuat widget untuk setiap buku secara manual.

    2. Halaman Form Peminjaman

        Halaman ini digunakan untuk mengisi data peminjaman buku yang telah dipilih.

        Struktur widget yang digunakan:
        ```js
        Scaffold(
        appBar: AppBar(
            title: Text('Form Peminjaman'),
        ),
        body: Form(
            child: Column(
            children: [
                TextFormField(
                decoration: InputDecoration(
                    labelText: 'Nama Peminjam',
                ),
                ),
                TextFormField(
                decoration: InputDecoration(
                    labelText: 'NIM',
                ),
                ),
                ElevatedButton(
                onPressed: () {
                    // Proses peminjaman
                },
                child: Text('Ajukan Peminjaman'),
                ),
            ],
            ),
        ),
        );
        ```
        Widget yang digunakan:
        - Form: mengelompokkan input peminjaman.
        - TextFormField: menerima input nama dan NIM mahasiswa.
        - Column: menyusun komponen secara vertikal.
        - ElevatedButton: mengirimkan pengajuan peminjaman.

        Alasan: Widget Form dan TextFormField digunakan agar proses pengisian data lebih terstruktur dan dapat dilengkapi dengan validasi sebelum pengajuan dikirimkan.

    3. Navigasi Antarhalaman

        Navigasi antarhalaman dapat menggunakan Navigator.push() untuk berpindah ke halaman form peminjaman dan Navigator.pop() untuk kembali ke halaman sebelumnya.

        Contoh kode:
        ```js
        // Berpindah ke halaman form
        Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FormPeminjamanPage(
            buku: buku,
            ),
        ),
        );

        // Kembali ke halaman sebelumnya
        Navigator.pop(context);
        ```
        `Alasan:` Navigator.push() digunakan untuk membuka halaman baru sekaligus mengirimkan data buku yang dipilih. Sementara itu, Navigator.pop() digunakan agar pengguna dapat kembali ke halaman katalog tanpa harus membuka ulang aplikasi.
    
4. Data dan State
    1. Definisi Model Data Buku

        Model data Buku digunakan untuk merepresentasikan informasi setiap buku yang terdapat dalam katalog perpustakaan.

        Contoh definisi model menggunakan Dart:
        ```js
        class Buku {
        final int id;
        final String judul;
        final String penulis;
        final String kategori;
        final bool tersedia;

        Buku({
            required this.id,
            required this.judul,
            required this.penulis,
            required this.kategori,
            required this.tersedia,
        });
        }
        ```
        Penjelasan setiap field:
        | Field | Tipe data | Keterangan |
        |:--------|:--------|:--------|
        | ID | int | Identitas unik setiap buku |
        | Judul | String | Judul buku |
        | Penulis | String | Nama penulis buku |
        | Kategori | String | Kategori atau jenis buku |
        | Tersedia | bool | Status ketersediaan buku |

        Alasan: Model Buku dibuat untuk mengelompokkan informasi buku dalam satu objek sehingga data lebih terstruktur, mudah dipanggil, dan dapat digunakan kembali pada halaman katalog maupun form peminjaman.

    2. Pengelolaan Create (Meminjam Buku)

        Create merupakan operasi untuk menambahkan data peminjaman baru ke dalam daftar riwayat peminjaman.

        Contoh implementasi menggunakan StatefulWidget:
        ```js
        List<Buku> daftarBuku = [];
        List<Peminjaman> riwayatPeminjaman = [];

        void tambahPeminjaman(Peminjaman data) {
        setState(() {
            riwayatPeminjaman.add(data);
        });
        }
        ```
        Ketika mahasiswa mengirimkan formulir peminjaman, data peminjaman akan ditambahkan ke dalam riwayatPeminjaman.

        Alasan: Operasi add() digunakan untuk memasukkan transaksi baru ke dalam daftar. Sementara itu, setState() digunakan agar tampilan aplikasi diperbarui dan data peminjaman terbaru dapat langsung terlihat.

        Dalam aplikasi sebenarnya, data juga harus dikirim ke backend agar transaksi tercatat secara terpusat dan dapat diproses oleh petugas perpustakaan.

    3. Pengelolaan Read (Melihat Riwayat Peminjaman)

        Read merupakan operasi untuk membaca dan menampilkan data peminjaman yang sudah tersimpan.

        Contoh implementasi:
        ```js
        ListView.builder(
        itemCount: riwayatPeminjaman.length,
        itemBuilder: (context, index) {
            final data = riwayatPeminjaman[index];

            return ListTile(
            title: Text(data.judulBuku),
            subtitle: Text(data.status),
            );
        },
        );
        ```
        Data riwayat peminjaman ditampilkan menggunakan ListView.builder berdasarkan jumlah data yang tersedia di dalam riwayatPeminjaman.

        Alasan: ListView.builder digunakan agar seluruh riwayat peminjaman dapat ditampilkan secara dinamis. Dengan demikian, mahasiswa dapat mengetahui buku yang pernah diajukan dan status peminjamannya.

        Perlu diperhatikan bahwa pada aplikasi yang terhubung dengan backend, riwayat peminjaman sebaiknya diambil dari server, sedangkan state digunakan untuk menampung hasil data agar dapat ditampilkan pada antarmuka.


**Kesimpulan**

Aplikasi mobile peminjaman buku dirancang menggunakan Flutter dengan mengintegrasikan frontend, penyimpanan lokal, dan backend Sistem Informasi. Dua kebutuhan utama aplikasi adalah melihat katalog dan melakukan peminjaman buku. Navigasi menggunakan Navigator.push() dan Navigator.pop(), sedangkan pengelolaan data menggunakan model Buku dan state pada StatefulWidget.

Operasi Create digunakan untuk menambahkan transaksi peminjaman, sedangkan Read digunakan untuk menampilkan riwayat peminjaman. Dengan rancangan tersebut, aplikasi diharapkan dapat mempermudah mahasiswa dalam mencari dan meminjam buku serta membantu perpustakaan mengelola transaksi secara lebih terstruktur.