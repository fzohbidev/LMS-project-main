import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:lms/features/auth/presentation/views/signin_screen.dart';
import 'package:lms/features/home/presentation/views/home_view.dart';
import 'package:lms/features/license_renewal/presentation/views/license_renewal.dart';
import 'package:lms/features/payment/presentation/views/payment_view.dart';
import 'package:lms/features/auth/presentation/views/register_screen.dart';

abstract class AppRouter {
  static const kSignIn = '/';
  static const kHomeView = '/homeView';
  static const kPaymentView = '/paymentView';
  static const kLicenseRenewalView = '/licenseRenewalView';
  static const kRegister = '/register';

  static final router = GoRouter(
    initialLocation: kSignIn,
    errorPageBuilder: (context, state) => MaterialPage(child: Container()),
    routes: [
      GoRoute(
        path: kRegister,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: kSignIn,
        builder: (context, state) => const SignIn(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kPaymentView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: const PaymentView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurveTween(curve: Curves.easeIn).animate(animation),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kLicenseRenewalView,
        builder: (context, state) => const LicenseRenewal(),
      ),
    ],
  );
}
