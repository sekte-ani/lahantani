import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lahantani/controller/profile_controller.dart';
import 'package:lahantani/theme.dart';

import 'profile_edit_page.dart';

class ProfilePage extends GetView<ProfileController> {
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: greenColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    var itemProfile = controller.profile;

    return Scaffold(
      backgroundColor: greenColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.green,
                  width: double.infinity,
                  height: 200, // Set a fixed height
                  child: Obx(
                    () => Column(
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
                          '${itemProfile["name"]}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          '${itemProfile["email"]}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                // Positioned(
                //   top: 0,
                //   right: 0,
                //   child: IconButton(
                //     icon: Icon(Icons.edit),
                //     onPressed: () {
                //       // Function to be executed when the Edit Profile button is pressed
                //       // Add the desired functionality here
                //     },
                //   ),
                // ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(27),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 30),
                      _buildProfileButton(
                        icon: Icons.edit_document,
                        text: 'Edit Profile',
                        onPressed: () {
                          Get.to(ProfileEditPage(
                            itemProfile: itemProfile,
                          ));
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
            ),
          ],
        ),
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
          borderRadius: BorderRadius.circular(16),
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
