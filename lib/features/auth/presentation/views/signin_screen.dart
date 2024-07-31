import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lms/features/auth/widgets/signin_form.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  void _handleSignIn() {
    setState(() {
      _errorMessage = '';
    });

    final username = _usernameController.text;
    final password = _passwordController.text;

    // Check credentials
    if (username == 'user' && password == 'user') {
      // Navigate to HomeView on successful sign-in using GoRouter
      context.go('/homeView');
    } else {
      setState(() {
        _errorMessage = 'Invalid username or password';
      });
    }
  }

  void _handleRegister() {
    // Implement register logic
    // Example: context.go('/register');
  }

  void _handleForgotPassword() {
    // Implement forgot password logic
    // Example: context.go('/forgotPassword');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SignInForm(
                usernameController: _usernameController,
                passwordController: _passwordController,
                errorMessage: _errorMessage,
                onSignIn: _handleSignIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
