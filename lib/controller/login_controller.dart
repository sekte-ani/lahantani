import 'package:get_storage/get_storage.dart';
import 'package:lahantani/services/auth_service.dart';
import 'package:lahantani/theme.dart';
import 'package:lahantani/ui/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // final getStorage = GetStorage();

  String? email;
  String? password;

  doLogin() async {
    Get.focusScope!.unfocus();
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    bool isSuccess = await AuthService().login(
      email: email!,
      password: password!,
    );

    if (!isSuccess) {
      Get.snackbar(
        'Error',
        'Login validation failed',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: redColor,
      );
      return;
    } else {
      Get.snackbar(
        'Success',
        'Login Successful',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: greenColor,
      );
      
      Get.offAll(() => DashboardPage());
    }
  }

//
  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    } else if (!GetUtils.isEmail(email)) {
      return 'Invalid email format';
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    } else if (!GetUtils.isLengthGreaterOrEqual(password, 3)) {
      return 'Password must be at least 3 characters long';
    }
    return null;
  }
}
