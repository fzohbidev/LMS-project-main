// lib/features/auth/domain/repositories/auth_repository.dart
import '../entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String username, String password);
  Future<User> register(String firstname, String lastname, String username,
      String password, String phonenumber, String email);
}
