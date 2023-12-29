import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lahantani/ui/pages/login_page.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  onLogout() {
    box.erase();
    Get.offAll(LoginPage());
  }
}
