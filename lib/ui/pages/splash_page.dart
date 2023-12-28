import 'package:lahantani/theme.dart';
import 'package:lahantani/ui/pages/dashboard_page.dart';
import 'package:lahantani/ui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahantani/ui/pages/register_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), (() {
      Get.off(LoginPage());
    }));
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/logo.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
