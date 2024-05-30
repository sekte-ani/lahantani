import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lahantani/services/auth_service.dart';

class ModulService {
  final box = GetStorage();

  Future<List> get() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://tani.anitech.id/api/modul",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );
    String jsonString = jsonEncode(response.data);
    Map obj = jsonDecode(jsonString);
    List data = obj["data"];
    print("lah ini dari modul serv = ${data}");
    return data;
  }
}
