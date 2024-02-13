import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/core/helpers/extensions.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/features/checkout/data/models/amount_model.dart';
import 'package:payment/features/checkout/data/models/item_list_model.dart';
import 'package:payment/features/checkout/ui/widgets/payment_methods_list_view.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../data/models/payment_intent_model/payment_intent_input_model.dart';
import '../../logic/payment_cubit.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key, this.contextt});

  final BuildContext? contextt;

  @override
  Widget build(BuildContext context) {
    var cubit = PaymentCubit.get(contextt);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 16,
            ),
            const PaymentMethodsListView(),
            const SizedBox(
              height: 32,
            ),
            AppTextButton(
              backgroundColor: Colors.green,
              buttonWidth: double.maxFinite,
              buttonHeight: 60,
              buttonText: "Continue",
              textStyle: TextStyles.font22BlackRegular,
              onPressed: () {
                // cubit.makePayment(
                //     paymentIntentInputModel: PaymentIntentRequestModel(
                //         amount: "100",
                //         currency: "USD",
                //         customerId: ApiKeys.stripeCustomerId));
                var transactionData = getTransactionData();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PaypalCheckoutView(
                    sandboxMode: true,
                    clientId: ApiKeys.payPalClientId,
                    secretKey: ApiKeys.payPalSecretKey,
                    transactions: [
                      {
                        "amount": transactionData.amount.toJson(),
                        "item_list": transactionData.itemList.toJson()
                      }
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      log("onSuccess: $params");
                      context.pushNamed(Routes.thankYouScreen);
                    },
                    onError: (error) {
                      log("onError: $error");

                      Navigator.pop(context);
                    },
                    onCancel: () {
                      print('cancelled:');
                      Navigator.pop(context);
                    },
                  ),
                ));
              },
            )
          ],
        ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionData() {
    AmountModel amountModel = AmountModel(
        total: "100",
        currency: "USD",
        details: Details(
          shippingDiscount: 0,
          shipping: "0",
          subtotal: "100",
        ));

    List<OrderItemModel> orders = [
      OrderItemModel(name: "Apple", quantity: 4, price: '10', currency: "USD"),
      OrderItemModel(name: "Apple", quantity: 6, price: '10', currency: "USD"),
    ];
    ItemListModel itemListModel = ItemListModel(
      orders: orders,
    );

    return (amount: amountModel, itemList: itemListModel);
  }
}
