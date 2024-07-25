import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:lms/features/auth/presentation/views/signin_screen.dart';
import 'package:lms/features/home/presentation/views/home_view.dart';
import 'package:lms/features/license_renewal/presentation/views/license_renewal.dart';
import 'package:lms/features/payment/presentation/views/payment_view.dart';
import 'package:lms/features/auth/presentation/views/register_screen.dart';
import 'package:lms/features/billing_notifications/presentation/pages/billing_notification_page.dart';
import 'package:lms/features/billing_notifications/presentation/pages/billing_user_assignment_page.dart'; // Import the new page
import 'package:lms/features/billing_notifications/presentation/pages/add_remove_billing_users_page.dart'; // Import for Add/Remove Billing Users
import 'package:lms/features/billing_notifications/presentation/pages/bills_payments_listing_page.dart'; // Import for Bills and Payments Listing
import 'package:lms/features/billing_notifications/presentation/pages/invoice_details_page.dart';

abstract class AppRouter {
  static const kSignIn = '/';
  static const kHomeView = '/homeView';
  static const kPaymentView = '/paymentView';
  static const kLicenseRenewalView = '/licenseRenewalView';
  static const kRegister = '/register';
  static const kBillingNotificationView = '/billingNotificationView';
  static const kBillingUserAssignmentView = '/billingUserAssignmentView';
  static const kBillsPaymentsListingView = '/billsPaymentsListingView';
  static const kAddRemoveBillingUsersView = '/addRemoveBillingUsersView';
  static const kInvoiceDetailsView = '/invoiceDetailsView';

  static final router = GoRouter(
    initialLocation: kSignIn,
    errorPageBuilder: (context, state) => MaterialPage(child: Container()),
    routes: [
      GoRoute(
        path: kRegister,
        name: kRegister,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: kSignIn,
        name: kSignIn,
        builder: (context, state) => const SignIn(),
      ),
      GoRoute(
        path: kHomeView,
        name: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kPaymentView,
        name: kPaymentView,
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
        name: kLicenseRenewalView,
        builder: (context, state) => const LicenseRenewal(),
      ),
      GoRoute(
        path: kBillingNotificationView,
        name: kBillingNotificationView,
        builder: (context, state) => BillingNotificationPage(),
      ),
      GoRoute(
        path: kBillingUserAssignmentView, // Define the new route
        name: kBillingUserAssignmentView,
        builder: (context, state) => BillingUserAssignmentPage(),
      ),
      GoRoute(
        path: kAddRemoveBillingUsersView,
        name: kAddRemoveBillingUsersView,
        builder: (context, state) =>
            AddRemoveBillingUsersPage(), // Route to Add/Remove Billing Users Page
      ),
      GoRoute(
        path: kBillsPaymentsListingView,
        name: kBillsPaymentsListingView,
        builder: (context, state) =>
            BillsPaymentsListingPage(), // Route to Bills and Payments Listing Page
      ),
      GoRoute(
        path: kInvoiceDetailsView,
        name: kInvoiceDetailsView,
        builder: (context, state) => InvoiceDetailsPage(),
      ),
    ],
  );
}
