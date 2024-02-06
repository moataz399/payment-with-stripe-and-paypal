import 'package:flutter/material.dart';
import 'package:payment/features/checkout/ui/widgets/payment_method_item.dart';

class PaymentMethodsListView extends StatelessWidget {
  const PaymentMethodsListView({super.key});

  final List<String> paymentMethodsItems = const [
    "assets/images/card.png",
    "assets/images/paypal.png"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: paymentMethodsItems.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: PaymentMethodItem(
                  isActive: false, image: paymentMethodsItems[index]),
            );
          }),
    );
  }
}
