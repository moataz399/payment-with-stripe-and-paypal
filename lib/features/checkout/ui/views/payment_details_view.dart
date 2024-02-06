import 'package:flutter/material.dart';

import '../widgets/payment_method_item.dart';
import '../widgets/payment_methods.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          backgroundColor: Colors.transparent,
          title: const Text('Payment Details'),
          centerTitle: true,
          elevation: 0,
        ),
        body: const Column(
          children: [
            PaymentMethodsListView(),
          ],
        ));
  }
}
