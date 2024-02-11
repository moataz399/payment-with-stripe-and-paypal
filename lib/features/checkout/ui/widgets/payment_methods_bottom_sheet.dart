import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/features/checkout/ui/widgets/payment_methods_list_view.dart';

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


                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => PaypalCheckoutView(
                    sandboxMode: true,
                    clientId: "YOUR CLIENT ID",
                    secretKey: "YOUR SECRET KEY",
                    transactions: const  [
                      {
                        "amount": {
                          "total": '100',
                          "currency": "USD",
                          "details": {
                            "subtotal": '100',
                            "shipping": '0',
                            "shipping_discount": 0
                          }
                        },
                        "description": "The payment transaction description.",
                        // "payment_options": {
                        //   "allowed_payment_method":
                        //       "INSTANT_FUNDING_SOURCE"
                        // },
                        "item_list": {
                          "items": [
                            {
                              "name": "Apple",
                              "quantity": 4,
                              "price": '10',
                              "currency": "USD"
                            },
                            {
                              "name": "Pineapple",
                              "quantity": 5,
                              "price": '12',
                              "currency": "USD"
                            }
                          ],

                          // Optional
                          //   "shipping_address": {
                          //     "recipient_name": "Tharwat samy",
                          //     "line1": "tharwat",
                          //     "line2": "",
                          //     "city": "tharwat",
                          //     "country_code": "EG",
                          //     "postal_code": "25025",
                          //     "phone": "+00000000",
                          //     "state": "ALex"
                          //  },
                        }
                      }
                    ],
                    note: "Contact us for any questions on your order.",
                    onSuccess: (Map params) async {
                      log("onSuccess: $params");
                      Navigator.pop(context);
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
}
