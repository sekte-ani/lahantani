import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahantani/controller/profile_controller.dart';
import 'package:lahantani/theme.dart';

class ProfilePage extends GetView<ProfileController> {
  ProfileController controller = Get.put(ProfileController());
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
                color: Colors.green,
                width: double.infinity,
                height: 200, // Set a fixed height
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 70.0,
                      color: whiteColor,
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
                    // Function to be executed when the Edit Profile button is pressed
                    // Add the desired functionality here
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
                      // Function to handle changing the password
                      // Add the desired functionality here
                    },
                  ),
                  SizedBox(height: 10),
                  _buildProfileButton(
                    icon: Icons.email,
                    text: 'Email Address',
                    onPressed: () {
                      // Function to handle changing the email address
                      // Add the desired functionality here
                    },
                  ),
                  SizedBox(height: 10),
                  _buildProfileButton(
                    icon: Icons.help,
                    text: 'Help Desk',
                    onPressed: () {
                      // Function to open the help desk
                      // Add the desired functionality here
                    },
                  ),
                  SizedBox(height: 10),
                  _buildProfileButton(
                    icon: Icons.logout,
                    text: 'Sign Out',
                    onPressed: () {
                      // Function to handle logout
                      // Add the desired functionality here
                      controller.onLogout();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileButton(
      {required IconData icon,
      required String text,
      required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.lightGreen[100],
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: TextButton(
          onPressed: onPressed,
          child: Row(
            children: [
              Icon(icon, color: Colors.green),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
