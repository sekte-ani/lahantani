import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahantani/services/auth_service.dart';
import 'package:lahantani/theme.dart';
import 'package:lahantani/ui/pages/login_page.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? name;
  String? email;
  // String? phone;
  // DateTime? born;
  // String? address;
  String? password;

  Future doRegister() async {
    Get.focusScope!.unfocus();

    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    bool isSuccess = await AuthService().register(
      name: name!,
      email: email!,
      // phone: phone!,
      // born: born!,
      // address: address!,
      password: password!,
    );

    if (!isSuccess) {
      Get.snackbar(
        'Error',
        'Registrasi belum berhasil',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: redColor,
      );
      return;
    } else {
      Get.snackbar(
        'Success',
        'Akun berhasil dibuat!',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: green2Color,
      );

      Get.off(() => LoginPage());
    }
  }
}
