import 'package:flutter/material.dart';
import 'package:lms/features/auth/presentation/providers/auth_provider.dart';
import 'package:lms/features/auth/data/repositories/authRepositoryImpl.dart';
import 'package:lms/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:provider/provider.dart';
import 'package:lms/core/utils/app_router.dart';
import 'package:http/http.dart' as http;
// Adjust the path as necessary

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final client = http.Client(); // Create an instance of http.Client
    final authRemoteDataSource = AuthRemoteDataSource(client);
    final authRepository = AuthRepositoryImpl(
        authRemoteDataSource); // Create an instance of AuthRepository
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(authRepository: authRepository),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          iconTheme: const IconThemeData(color: Colors.black),
          hintColor: Colors.black,
          colorScheme: const ColorScheme.light(),
        ),
      ),
    );
  }
}
