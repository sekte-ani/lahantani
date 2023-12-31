import 'package:get/get.dart';

class Modul {
  final int id;
 final String title;
 final String? file;
 final String createdAt;

 Modul({required this.id, required this.title, this.file, required this.createdAt});

  factory Modul.fromJson(Map<String, dynamic> json) {
    return Modul(
      id: json['id'],
      title: json['title'],
      file: json['file'],
      createdAt: json['created_at'],
    );
 }

}