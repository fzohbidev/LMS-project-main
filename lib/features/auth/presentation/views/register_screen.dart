// lib/features/auth/presentation/views/register_screen.dart
import 'package:flutter/material.dart';
import 'package:lms/features/auth/widgets/register_form.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _handleRegister() {
      // Navigate to HomeView on successful registration
      context.go('/homeView');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: RegisterForm(
        onRegister: _handleRegister,
      ),
    );
  }
}
