import 'package:flutter/material.dart';
import 'package:lahantani/ui/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String username = "John Doe"; // Ganti dengan username yang sesuai
  final String userRole = "Collage Student";
  final List<String> bookTitles = [
    'Judul Buku 1',
    'Judul Buku 2',
    'Judul Buku 3',
    'Judul Buku 4',
    // Tambahkan judul buku lainnya di sini...
  ]; // Ganti dengan peran pengguna yang sesuai
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(100), // Sesuaikan dengan tinggi yang diinginkan
        child: AppBar(
          backgroundColor:
              Colors.green[200], // Ubah sesuai dengan warna yang diinginkan
          toolbarHeight: 80, // Sesuaikan dengan tinggi yang diinginkan
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10), // Jarak atas dari teks "Hola John Doe"
                  Text(
                    'Hola $username',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    userRole,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/user_avatar.png'), // Ganti dengan gambar profil pengguna
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(40), // Sesuaikan dengan tinggi yang diinginkan
            child: SizedBox(), // Gunakan SizedBox untuk menambahkan tinggi
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recently",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), // Jarak antara teks dan card
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[300],
                            ),
                            // Simulasikan foto buku di sini
                            child: Center(
                              child: Icon(
                                Icons.book,
                                size: 40,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Judul Buku 1',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Kategori Buku 1',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Keterangan mengenai buku 1.',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Card(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey[300],
                            ),
                            // Simulasikan foto buku di sini
                            child: Center(
                              child: Icon(
                                Icons.book,
                                size: 40,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Judul Buku 2',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Kategori Buku 2',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  'Keterangan mengenai buku 2.',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "All",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ), // Jarak antara dua baris card
            Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                      ),
                      // Simulasikan foto buku di sini
                      child: Center(
                        child: Icon(
                          Icons.book,
                          size: 40,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Judul Buku 3',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Kategori Buku 3',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Keterangan mengenai buku 3.',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10), // Jarak antara card ke-3 dan card ke-4
            // Card keempat
            Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                      ),
                      // Simulasikan foto buku di sini
                      child: Center(
                        child: Icon(
                          Icons.book,
                          size: 40,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Judul Buku 4',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Kategori Buku 4',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Keterangan mengenai buku 4.',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
