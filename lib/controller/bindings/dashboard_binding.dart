import 'package:lahantani/controller/dashboard_controller.dart';
import 'package:lahantani/controller/login_controller.dart';

import 'package:get/get.dart';
import 'package:lahantani/controller/modul_controller.dart';
import 'package:lahantani/controller/profile_controller.dart';
import 'package:lahantani/controller/register_controller.dart';
import 'package:lahantani/controller/splash_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<ModulController>(() => ModulController());
  }
}
