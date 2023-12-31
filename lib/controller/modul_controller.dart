import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lahantani/models/Modul.dart';
import 'package:lahantani/services/modul_service.dart';

class ModulController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getModuls();
    update();
  }

  RxList<dynamic> moduls = <dynamic>[].obs;

  Future<void> getModuls() async {
    try {
      moduls.assignAll(await ModulService().get());
      update(); // Ensure to call update after changing the data
    } catch (e) {
      print('Error fetching moduls: $e');
    }
  }
}
