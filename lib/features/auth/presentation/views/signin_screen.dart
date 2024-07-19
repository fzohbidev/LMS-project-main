// lib/features/auth/presentation/views/signin_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import 'widgets/signin_form.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignIn() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    context.read<AuthProvider>().login(username, password);
  }

  void _handleRegister() {
    // Implement register logic
    context.go('/register');
  }

  void _handleForgotPassword() {
    // Implement forgot password logic
    context.go('/forgotPassword');
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
              child: Consumer<AuthProvider>(
                builder: (context, authProvider, child) {
                  return SignInForm(
                    usernameController: _usernameController,
                    passwordController: _passwordController,
                    errorMessage: authProvider.error ?? '',
                    onSignIn: _handleSignIn,
                  );
                },
              ),
            ),
            Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                if (authProvider.isLoading) {
                  return CircularProgressIndicator();
                } else if (authProvider.user != null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    context.go('/homeView');
                  });
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
