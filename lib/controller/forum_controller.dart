import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lahantani/services/forum_service.dart';
import 'package:lahantani/theme.dart';

class ForumController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController messageController = TextEditingController();
  // final getStorage = GetStorage();

  String? subject;
  String? message;

  RxString selected = ''.obs;

  doKirim() async {
    Get.focusScope!.unfocus();
    bool isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    bool isSuccess = await ForumService().create(
      subject: subject!,
      message: message!,
    );

    if (!isSuccess) {
      Get.snackbar(
        'Error',
        'Form validation failed',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: redColor,
      );
      return;
    } else {
      Get.snackbar(
        'Success',
        'Forum berhasil terkirim',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: green2Color,
      );

      selected.value = '';
      messageController.clear();
      return;
    }
  }
}
