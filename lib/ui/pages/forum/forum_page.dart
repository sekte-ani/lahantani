import 'package:flutter/material.dart';
import 'package:lahantani/ui/pages/dashboard_page.dart';
import 'package:lahantani/ui/pages/profile/profile_page.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  int _selectedIndex = 1; // Misalnya, Forum diindeks ke-1
  final TextEditingController _textEditingController = TextEditingController();
  String _title = '';

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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;

      default:
        break;
    }
  }

  void _submitPost() {
    // Handle submit post logic here
    String postContent = _textEditingController.text;
    // Perform actions with post content (e.g., save to database, submit API request, etc.)
    // Reset the text field
    _textEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.forum, color: Colors.white),
                SizedBox(width: 8.0),
                Text(
                  'Forum',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.0), // Set top padding here
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Judul',
                    labelStyle: TextStyle(
                      color: Colors.grey[700],
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green[200]!,
                        width: 2.0,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _title = value;
                    });
                  },
                ),
                SizedBox(height: 16.0),
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Isi Thread',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: _submitPost,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
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

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
