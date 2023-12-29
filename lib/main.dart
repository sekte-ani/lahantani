import 'package:get_storage/get_storage.dart';
import 'package:lahantani/controller/bindings/dashboard_binding.dart';
import 'package:lahantani/theme.dart';
import 'package:lahantani/ui/pages/dashboard_page.dart';
// import 'package:lahantani/ui/pages/dashboard_page.dart';
// import 'package:lahantani/ui/pages/login_page.dart';
// import 'package:lahantani/ui/pages/register_page.dart';
import 'package:lahantani/ui/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: font_semiBold.copyWith(
            fontSize: 18,
          ),
        ),
      ),
      home: SplashPage(),
      initialBinding: DashboardBinding(),
    );
  }
}
