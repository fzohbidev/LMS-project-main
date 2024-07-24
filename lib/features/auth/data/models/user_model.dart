// lib/features/auth/data/models/user_model.dart
import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel(
      {required super.username, required super.token, required super.roles});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        username: json['username'],
        token: json['jwtToken'],
        roles: json['roles']);
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'token': token, 'roles': roles};
  }
}
