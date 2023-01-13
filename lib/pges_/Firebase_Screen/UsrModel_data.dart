import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? name;
  String? email;
  String? id;
  String? image;
  UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.image,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    id = json['id'];
    image = json[''];
  }

  Map<String, dynamic> toJson() =>
      {"name": name, "email": email, "id": id, "image": image};
}
