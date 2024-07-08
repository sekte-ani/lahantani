import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ForumService {
  final box = GetStorage();

  Future create({
    required String subject,
    required String message,
  }) async {
    try {
      String? token = box.read("token");

      var response = await Dio().post(
        "https://tani.anitech.id/api/chat",
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          },
        ),
        data: {
          "subject": subject,
          "message": message,
        },
      );
      Map obj = response.data;
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
