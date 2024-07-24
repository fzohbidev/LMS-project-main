// lib/features/auth/domain/entities/user.dart
class User {
  final String username;
  final String token;
  final List<dynamic> roles;

  User({required this.username, required this.token, required this.roles});
}
