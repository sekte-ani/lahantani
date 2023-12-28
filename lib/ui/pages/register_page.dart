import 'package:flutter/material.dart';
import 'package:lahantani/controller/register_controller.dart';
import 'package:lahantani/ui/pages/login_page.dart';
import 'package:lahantani/ui/widgets/buttons.dart';
import 'package:lahantani/ui/widgets/forms.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lahantani/theme.dart';
import 'package:flutter/services.dart';

class RegisterPage extends GetView<RegisterController> {
  final RegisterController controller = Get.find<RegisterController>();

  // TextEditingController properties
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: green2Color,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            _buildTop(mediaSize),
            ListView(
              children: [
                const SizedBox(
                  height: 100,
                ),
                _buildBottom(mediaSize),
              ],
            ),
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
          Icon(Icons.assignment_ind_outlined, size: 100, color: Colors.white),
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
            "Registrasi Akun",
            style: GoogleFonts.montserrat(
              color: green2Color,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text("Isi berdasarkan data yang valid"),
          const SizedBox(height: 40),
          InputField(
            title: "Nama",
            hintText: "Masukkan nama anda...",
            controller: namaController,
          ),
          const SizedBox(height: 20),
          InputFieldEmail(
            title: "Email",
            hintText: "Masukkan email anda..",
            controller: emailController,
            validator: (email) => controller.validateEmail(email),
          ),
          const SizedBox(height: 20),
          InputField(
            title: "Nomor HP",
            hintText: "Masukkan nomor telpon anda...",
          ),
          const SizedBox(height: 20),
          InputFieldDate(
            title: "Tanggal Lahir",
            hintText: "Masukkan tanggal lahir...",
          ),
          const SizedBox(height: 20),
          InputFieldBox(
            title: "Alamat",
            hintText: "Masukkan alamat rumah anda...",
          ),
          const SizedBox(height: 20),
          InputFieldPassword(
            title: "Password",
            hintText: "Masukkan password anda..",
            controller: passwordController,
            validator: (password) => controller.validatePassword(password),
          ),
          const SizedBox(height: 40),
          PrimaryButton(
            title: "Register",
            onPressed: () {
              debugPrint("Email : ${emailController.text}");
              debugPrint("Password : ${passwordController.text}");
              controller.onLogin();
            },
          ),
          const SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Sudah punya akun? ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
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
