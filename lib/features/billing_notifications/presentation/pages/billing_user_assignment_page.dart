// lib/features/billing_notifications/presentation/pages/billing_user_assignment_page.dart

import 'package:flutter/material.dart';
import '../widgets/billing_user_assignment_widget.dart';

class BillingUserAssignmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assign Billing Users'),
      ),
      body: Column(
        children: [
          Expanded(child: BillingUserAssignmentWidget()),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // This button would trigger role assignment in a real implementation
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Roles assigned successfully!')),
                );
              },
              child: Text('Assign Roles'),
            ),
          ),
        ],
      ),
    );
  }
}
