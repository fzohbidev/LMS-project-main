// lib/features/billing_notifications/presentation/pages/billing_notification_page.dart

import 'package:flutter/material.dart';
import '../widgets/billing_notification_widget.dart';

class BillingNotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billing Notification'),
      ),
      body: BillingNotificationWidget(),
    );
  }
}
