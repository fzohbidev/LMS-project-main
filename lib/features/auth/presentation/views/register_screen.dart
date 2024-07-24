import 'package:flutter/material.dart';
import 'package:lms/features/auth/presentation/providers/auth_provider.dart';
import 'package:lms/features/auth/presentation/views/widgets/register_form.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController firstnameController = TextEditingController();
    final TextEditingController lastnameController = TextEditingController();
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController phonenumberController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    void handleRegister() async {
      final String email = emailController.text.trim();
      final String password = passwordController.text.trim();
      final String firstname = firstnameController.text.trim();
      final String lastname = lastnameController.text.trim();
      final String username = usernameController.text.trim();
      final String phonenumber = phonenumberController.text.trim();

      // Log the credentials for debugging
      // ignore: avoid_print
      // print('Registering with:');
      // // ignore: avoid_print
      // print('Email: $email');
      // // ignore: avoid_print
      // print('Password: $password');
      // // ignore: avoid_print
      // print('Firstname: $firstname');
      // // ignore: avoid_print
      // print('Lastname: $lastname');
      // // ignore: avoid_print
      // print('Username: $username');
      // // ignore: avoid_print
      // print('Phonenumber: $phonenumber');
      // // ignore: avoid_print
      // print('Confirm Password: $confirmPassword');

      final authProvider = Provider.of<AuthProvider>(context, listen: false);

      try {
        await authProvider.register(
          firstname,
          lastname,
          username,
          password,
          phonenumber,
          email,
        );

        context.go('/homeView');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: $e')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: RegisterForm(
        onRegister: handleRegister,
        firstnameController: firstnameController,
        lastnameController: lastnameController,
        usernameController: usernameController,
        emailController: emailController,
        phonenumberController: phonenumberController,
        passwordController: passwordController,
        confirmPasswordController: confirmPasswordController,
      ),
    );
  }
}
