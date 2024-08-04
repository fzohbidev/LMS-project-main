import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/simple_bloc_observer.dart';
import 'package:lms/core/utils/app_router.dart';

void main() {
  Bloc.observer=SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        iconTheme: const IconThemeData(color: Colors.black),
        hintColor: Colors.black,
        colorScheme: const ColorScheme.light(),
      ),
    );
  }
}
