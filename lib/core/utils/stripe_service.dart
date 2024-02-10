import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/network/api_service.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/features/checkout/data/models/payment_intent_model/payment_intent_input_model.dart';

import '../../features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {



  // paymentIntentObject  create payment intent(amount, currency)
  //init paymentSheet
  //display payment sheet



  final ApiService apiService = ApiService();

  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
        body: paymentIntentInputModel.toJson(),
        url: "https://api.stripe.com/v1/payment_intents",
        token: ApiKeys.secretKey);

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String clientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "moataz mohamed ",
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(clientSecret: paymentIntentModel.clientSecret!);
    await displayPaymentSheet();
  }
}
