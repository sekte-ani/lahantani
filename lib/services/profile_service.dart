import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:get_storage/get_storage.dart';

class ProfileService {
  final box = GetStorage();

  Future<Map> get() async {
    String? token = box.read("token");
    var response = await Dio().get(
      "https://tani.ferdirns.com/api/profile",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
    );
    Map obj = response.data;
    print(obj);
    return obj["data"];
  }

  update({
    required int id,
    required String phone,
    required String born,
    required String address,
    required String password,
  }) async {
    String? token = box.read("token");
    var response = await Dio().patch(
      "https://tani.ferdirns.com/api/profile/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      ),
      data: {
        "password": password,
        "phone": phone,
        "address": address,
        "born": born,
      },
    );
    Map obj = response.data;
    return obj["data"]["id"];
  }
}
