import 'package:flutter/material.dart';
import 'package:lahantani/ui/pages/dashboard_page.dart';
import 'package:lahantani/ui/pages/forum/forum_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (_selectedIndex) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DashboardPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForumPage()),
        );
        break;
      case 2:
        // Do nothing as it's the current page
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                color:
                    Colors.green[200], // Background color for profile section
                width: double
                    .infinity, // Set width to fill the entire screen width
                padding: EdgeInsets.all(200.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      // Ganti gambar dengan foto profil pengguna
                      backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150'), // URL foto profil
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Nama Pengguna',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      'useremail@example.com',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Fungsi yang akan dijalankan saat tombol Edit Profile ditekan
                    // Tambahkan fungsi sesuai kebutuhan
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildProfileButton(
                    icon: Icons.lock,
                    text: 'Password',
                    onPressed: () {
                      // Fungsi untuk mengatur perubahan password
                      // Tambahkan fungsi sesuai kebutuhan
                    },
                  ),
                  SizedBox(height: 10),
                  _buildProfileButton(
                    icon: Icons.email,
                    text: 'Email Address',
                    onPressed: () {
                      // Fungsi untuk mengatur perubahan alamat email
                      // Tambahkan fungsi sesuai kebutuhan
                    },
                  ),
                  SizedBox(height: 10),
                  _buildProfileButton(
                    icon: Icons.help,
                    text: 'Help Desk',
                    onPressed: () {
                      // Fungsi untuk membuka help desk
                      // Tambahkan fungsi sesuai kebutuhan
                    },
                  ),
                  SizedBox(height: 10),
                  _buildProfileButton(
                    icon: Icons.logout,
                    text: 'Sign Out',
                    onPressed: () {
                      // Fungsi untuk logout
                      // Tambahkan fungsi sesuai kebutuhan
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
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

  Widget _buildProfileButton(
      {required IconData icon,
      required String text,
      required VoidCallback onPressed}) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 8.0), // Add vertical padding
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreen[100], // Background color for profile button
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(
            vertical: 20.0, horizontal: 16.0), // Add padding inside container
        child: TextButton(
          onPressed: onPressed,
          child: Row(
            children: [
              Icon(icon, color: Colors.green), // Change icon color
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 18, color: Colors.black), // Change text color
                ),
              ),
              Icon(Icons.arrow_forward_ios,
                  color: Colors.green), // Change arrow icon color
            ],
          ),
        ),
      ),
    );
  }
}
