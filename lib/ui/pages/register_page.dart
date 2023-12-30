import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lahantani/controller/register_controller.dart';
import 'package:lahantani/controller/shared/datepicker_controller.dart';
import 'package:lahantani/ui/pages/login_page.dart';
import 'package:lahantani/ui/widgets/buttons.dart';
import 'package:lahantani/ui/widgets/datepicker.dart';
import 'package:lahantani/ui/widgets/forms.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lahantani/theme.dart';
import 'package:flutter/services.dart';
import 'package:lahantani/ui/widgets/validator.dart';

class RegisterPage extends GetView<RegisterController> {
  final RegisterController controller = Get.put(RegisterController());
  // TextEditingController properties
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bornController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
    final RegisterController controller = Get.put(RegisterController());

    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Registrasi Akun",
            style: GoogleFonts.poppins(
              color: green2Color,
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Isi berdasarkan data yang valid",
            style: font_regular,
          ),
          const SizedBox(height: 40),
          InputField(
            title: "Nama",
            hintText: "Masukkan nama anda...",
            validator: Validator.required,
            onChange: (value) {
              controller.name = value;
            },
          ),
          const SizedBox(height: 20),
          InputFieldEmail(
            title: "Email",
            hintText: "Masukkan email anda..",
            validator: Validator.required,
            onChange: (value) {
              controller.email = value;
            },
          ),
          const SizedBox(height: 20),
          // InputField(
          //   title: "Nomor HP",
          //   hintText: "Masukkan nomor telpon anda...",
          //   controller: phoneController,
          //   validator: Validator.number,
          //   onChange: (value) {
          //     controller.phone = value;
          //   },
          // ),
          // const SizedBox(height: 20),
          // InputFieldDate(
          //   title: "Tanggal Lahir",
          //   hintText: "Masukkan tanggal lahir...",
          // ),
          // QDatePicker(
          //   label: "Tanggal Lahir",
          //   validator: Validator.required,
          //   onChanged: (value) {
          //     controller.born = value;
          //   },
          // ),
          // const SizedBox(height: 20),
          // InputFieldBox(
          //   title: "Alamat",
          //   hintText: "Masukkan alamat rumah anda...",
          //   validator: Validator.required,
          //   onChange: (value) {
          //     controller.address = value;
          //   },
          // ),
          const SizedBox(height: 20),
          InputFieldPassword(
            title: "Password",
            hintText: "Masukkan password anda..",
            validator: Validator.required,
            onChange: (value) {
              controller.password = value;
            },
          ),
          const SizedBox(height: 50),
          PrimaryButton(
            title: "Register",
            onPressed: () {
              debugPrint("Email : ${controller.email}");
              debugPrint("nama : ${controller.name}");
              controller.doRegister();
            },
          ),
          const SizedBox(height: 20),
          Center(
            child: GestureDetector(
              onTap: () {
                Get.off(() => LoginPage());
              },
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Sudah punya akun? ",
                      style: font_regular,
                    ),
                    TextSpan(
                      text: "Login",
                      style: font_regular.copyWith(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 90),
        ],
      ),
    );
  }
}
