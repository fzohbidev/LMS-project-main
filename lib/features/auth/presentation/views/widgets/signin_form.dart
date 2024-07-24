// lib/features/auth/presentation/views/widgets/signin_form.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final String errorMessage;
  final VoidCallback onSignIn;

  const SignInForm({
    super.key,
    required this.usernameController,
    required this.passwordController,
    required this.errorMessage,
    required this.onSignIn,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(143, 148, 251, .2),
                blurRadius: 20.0,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black),
                  ),
                ),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: onSignIn,
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: const Center(
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        if (errorMessage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {
            // Handle forgot password
          },
          child: const Text("Forgot Password?",
              style: TextStyle(color: Colors.blue)),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Don't have an account?"),
            TextButton(
              onPressed: () {
                context.go('/register');
              },
              child:
                  const Text("Register", style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ],
    );
  }
}
