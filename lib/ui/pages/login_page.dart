import 'package:lahantani/controller/login_controller.dart';
import 'package:lahantani/ui/pages/register_page.dart';
import 'package:lahantani/ui/widgets/buttons.dart';
import 'package:lahantani/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lahantani/theme.dart';
import 'package:flutter/services.dart';

class LoginPage extends GetView<LoginController> {
  final LoginController controller = Get.put(LoginController());

  // TextEditingController properties
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: green2Color, // Ensure green2Color is defined
        // image: DecorationImage(
        //   image: const AssetImage("assets/bg3.jpg"),
        //   fit: BoxFit.cover,
        //   colorFilter: ColorFilter.mode(
        //     green2Color.withOpacity(0.2),
        //     BlendMode.dstATop,
        //   ),
        // ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 80, child: _buildTop(mediaSize)),
            Positioned(bottom: 0, child: _buildBottom(mediaSize)),
          ],
        ),
      ),
    );
  }

  Widget _buildTop(Size mediaSize) {
    return Container(
      width: mediaSize.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.grass, size: 100, color: Colors.white),
          Text(
            "LahanTani",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom(Size mediaSize) {
    return Container(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello!",
            style: GoogleFonts.montserrat(
              color: green2Color, // Ensure green2Color is defined
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text("Please login with your information"),
          const SizedBox(height: 40),
          InputField(
            title: "Email",
            hintText: "Masukkan email anda..",
            onChange: (value) {
              controller.email = value;
            },
            validator: (email) => controller.validateEmail(email),
          ),
          const SizedBox(height: 30),
          InputFieldPassword(
            title: "Password",
            hintText: "Masukkan password anda..",
            onChange: (value) {
              controller.password = value;
            },
            validator: (password) => controller.validatePassword(password),
          ),
          const SizedBox(height: 40),
          PrimaryButton(
            title: "Login",
            onPressed: () {
              debugPrint("Email : ${controller.email}");
              debugPrint("Password : ${controller.password}");
              controller.doLogin();
            },
          ),
          const SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                Get.off(() => RegisterPage());
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.black, // Change color as needed
                      ),
                    ),
                    TextSpan(
                      text: "Register",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    // You can add more TextSpan for additional text if needed
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
