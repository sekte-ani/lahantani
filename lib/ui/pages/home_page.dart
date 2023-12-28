import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username = "John Doe";
  final String userRole = "Collage Student";
  final List<String> bookTitles = [
    'Judul Buku 1',
    'Judul Buku 2',
    'Judul Buku 3',
    'Judul Buku 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.green[200],
          toolbarHeight: 80,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
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
                backgroundImage: AssetImage('assets/user_avatar.png'),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: SizedBox(),
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
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: bookTitles.length,
                itemBuilder: (context, index) {
                  return _buildBookCard(bookTitles[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookCard(String bookTitle) {
    return Card(
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
                    bookTitle,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Kategori Buku',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Keterangan mengenai buku.',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
