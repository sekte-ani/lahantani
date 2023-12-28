import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lahantani/controller/dashboard_controller.dart';
import 'package:lahantani/controller/modul_controller.dart';
import 'package:lahantani/theme.dart';

class ModulPage extends GetView<DashboardController> {
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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: greenColor,
          toolbarHeight: 80,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Hi,',
                    style: font_semiBold.copyWith(
                      fontSize: 22,
                      color: whiteColor,
                    ),
                  ),
                  Text(
                    '$username',
                    style: font_medium.copyWith(
                      fontSize: 21,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  controller.changeTabIndex(2);
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.account_circle,
                    size: 70.0,
                    color: Colors.white, // Optionally set the icon color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "List Modul",
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
