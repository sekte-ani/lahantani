import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lahantani/ui/pages/dashboard_page.dart';
import 'package:lahantani/ui/pages/login_page.dart';

class SplashController extends GetxController {
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    String? savedToken = box.read("token");
    print("Saved token from GetStorage: $savedToken");

    if (savedToken != null) {
      Future.delayed(
        const Duration(seconds: 5),
        () {
          Get.offAll(DashboardPage());
        },
      );
    } else {
      Get.offAll(LoginPage());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
