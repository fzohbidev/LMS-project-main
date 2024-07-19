// lib/features/auth/domain/entities/user.dart
class User {
  final String id;
  final String username;
  final String token;

  User({required this.id, required this.username, required this.token});
}