import 'package:e_commerce_app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.username, required super.password});

  toJson() {
    return {"username": username, "password": password};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(username: json["username"], password: json["password"]);
  }
}
