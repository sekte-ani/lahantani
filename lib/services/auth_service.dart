import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AuthService {
  final getStorage = GetStorage();
  static String? token;

  Future<bool> login({
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
          "email": email, //   kozey.craig@example.org
          "password": password,
        },
      );

      token = response.data;
      print("Received token: $token");
      getStorage.write("token", token);
      print(
          "Token saved in GetStorage: ${getStorage.read("token")}"); // Add this line
      if (token != null) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      // Handle Dio errors
      print("Dio error: $e");
      return false;
    } catch (e) {
      // Handle other exceptions
      print("Unexpected error: $e");
      return false;
    }
  }
}
