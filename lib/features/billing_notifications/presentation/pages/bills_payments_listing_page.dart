// lib/features/billing_notifications/presentation/pages/bills_payments_listing_page.dart

import 'package:flutter/material.dart';
import '../widgets/bills_payment_listing_widget.dart';

class BillsPaymentsListingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bills and Payments'),
      ),
      body: BillsPaymentsListingWidget(),
    );
  }
}
