import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lahantani/services/profile_service.dart';
import 'package:lahantani/theme.dart';
import 'package:lahantani/ui/pages/login_page.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isUpdatingProfile = false.obs;

  onLogout() {
    box.erase();
    Get.offAll(LoginPage());
  }

  @override
  void onInit() {
    super.onInit();
    getProfiles();
  }

  void initState() {}

  String? phone;
  String? born;
  String? address;
  String? password;

  RxMap profile = {}.obs;
  Future<void> getProfiles() async {
    try {
      profile.value = await ProfileService().get();

      phone = profile['phone'];
      born = profile['born'];
      address = profile['address'];
      password = profile['password'];

      update();
    } catch (e) {
      print('Error fetching profiles: $e');
      // Handle error as needed
    }
  }

  Future<void> updateProfile({
    required String phone,
    required String born,
    required String address,
    required String password,
  }) async {
    try {
      isUpdatingProfile.value = true;
      int userId = await ProfileService().update(
        id: profile['id'], // Assuming 'id' is a key in your profile data
        phone: phone,
        born: born,
        address: address,
        password: password,
      );

      // Optionally update the local profile data after successful update
      profile['phone'] = phone;
      profile['born'] = born;
      profile['address'] = address;
      profile['password'] = password;

      // Notify listeners (if necessary)
      update();

      // Show success message or handle success as needed
      Get.snackbar(
        'Success',
        'Profile Update Successful',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: green2Color,
      );
      await getProfiles();
    } catch (e) {
      print('Error updating profile: $e');
      // Handle error as needed
      Get.snackbar(
        'Error',
        'Profile Update Failed',
        snackPosition: SnackPosition.TOP,
        colorText: whiteColor,
        backgroundColor: redColor,
      );
    } finally {
      // Set isUpdatingProfile to false when the update is completed
      isUpdatingProfile.value = false;
    }
  }
}
