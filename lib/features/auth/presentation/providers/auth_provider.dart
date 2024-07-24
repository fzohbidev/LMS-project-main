// lib/features/auth/presentation/providers/auth_provider.dart
import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository authRepository;

  AuthProvider({required this.authRepository});

  User? _user;
  User? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> login(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await authRepository.login(username, password);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> register(String firstname, String lastname, String username,
      String password, String phonenumber, String email) async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await authRepository.register(
          firstname, lastname, username, password, phonenumber, email);
      _error = null;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
