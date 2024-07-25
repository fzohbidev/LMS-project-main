// lib/features/billing_notifications/presentation/pages/invoice_details_page.dart

import 'package:flutter/material.dart';
import '../widgets/invoice_details_widget.dart';

class InvoiceDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Details'),
      ),
      body: InvoiceDetailsWidget(),
    );
  }
}
