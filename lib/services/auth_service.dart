import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  final box = GetStorage();
  static String? token;
  login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
        "https://tani.ferdirns.com/api/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "email": email, //     kozey.craig@example.org
          "password": password,
        },
      );
      token = response.data;
      box.write("token", token);
      print("Token saved in GetStorage: ${box.read("token")}");
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
