// lib/features/billing_notifications/presentation/widgets/billing_notification_widget.dart

import 'package:flutter/material.dart';

class BillingNotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You have been billed.'),
          Text('Billing details and due date here.'),
        ],
      ),
    );
  }
}
