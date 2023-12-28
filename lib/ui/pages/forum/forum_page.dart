import 'package:flutter/material.dart';
import 'package:lahantani/ui/pages/dashboard_page.dart';
import 'package:lahantani/ui/pages/home_page.dart';
import 'package:lahantani/ui/pages/profile/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ForumPage(),
    );
  }
}

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Tambah logika untuk navigasi ke halaman terkait di sini
      if (_selectedIndex == 0) {
        // Navigasi ke halaman Dashboard
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        );
      } else if (_selectedIndex == 2) {
        // Navigasi ke halaman Profile
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      }
      // Jika ingin menambahkan logika navigasi untuk item ke-1 (Forum), tambahkan di sini
    });
  }

  String selectedCategory = 'Pilih Perihal';
  TextEditingController questionController = TextEditingController();
  bool submitted = false;

  @override
  void dispose() {
    questionController.dispose();
    super.dispose();
  }

  void submitQuestion() {
    // Di sini Anda dapat menambahkan logika untuk mengirim pertanyaan atau pesan
    setState(() {
      submitted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false, // Hapus tombol back
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.forum,
                  color: Colors.white, // Ganti warna ikon menjadi putih
                ), // Icon forum
                SizedBox(width: 8),
                Text(
                  'Forum',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedCategory,
                  isExpanded: true,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue!;
                    });
                  },
                  items: <String>[
                    'Pilih Perihal',
                    'Pertanyaan',
                    'Saran',
                    'Lainnya',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: questionController,
              maxLines: 8,
              decoration: InputDecoration(
                hintText: 'Tulis pertanyaan atau pesan Anda di sini',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                submitQuestion();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // Ganti warna tombol menjadi hijau
              ),
              child: Text(
                'Kirim',
                style: TextStyle(
                  color: Colors.white, // Ganti warna teks menjadi putih
                ),
              ),
            ),
            SizedBox(height: 20),
            submitted
                ? Text(
                    'Forum telah dikirim, silahkan cek email',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Modul',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[200],
        onTap: _onItemTapped,
      ),
    );
  }
}
