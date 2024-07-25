// lib/features/billing_notifications/presentation/pages/add_remove_billing_users_page.dart

import 'package:flutter/material.dart';
import '../widgets/add_remove_billing_users_widget.dart';

class AddRemoveBillingUsersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add/Remove Billing Users'),
      ),
      body: AddRemoveBillingUsersWidget(),
    );
  }
}
