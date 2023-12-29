import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lahantani/ui/pages/login_page.dart';

class ProfileController extends GetxController {
  final getStorage = GetStorage();
  onLogout() {
    getStorage.erase();
    Get.offAll(LoginPage());
  }
}
