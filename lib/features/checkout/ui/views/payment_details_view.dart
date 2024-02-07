import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment/core/theming/text_styles.dart';
import 'package:payment/core/widgets/app_text_button.dart';

import '../widgets/custom_credit_card.dart';
import '../widgets/payment_methods_list_view.dart';

class PaymentDetailsView extends StatefulWidget {
  const PaymentDetailsView({super.key});

  @override
  State<PaymentDetailsView> createState() => _PaymentDetailsViewState();
}

class _PaymentDetailsViewState extends State<PaymentDetailsView> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: PaymentMethodsListView(),
              ),
              SliverToBoxAdapter(
                child: CustomCreditCard(
                    formKey: formKey, autoValidateMode: autoValidateMode),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AppTextButton(
                      backgroundColor: Colors.green,
                      buttonText: "Pay",
                      textStyle: TextStyles.font16BlackRegular,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          log("Payment");
                        } else {
                          autoValidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                      }),
                ),
              )
            ],
          ),
        ));
  }
}
