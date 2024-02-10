import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                cubit.makePayment(
                    paymentIntentInputModel: PaymentIntentRequestModel(
                        amount: "100",
                        currency: "USD",
                        customerId: ApiKeys.stripeCustomerId));
              },
            )
          ],
        ),
      ),
    );
  }
}
