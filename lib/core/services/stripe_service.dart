import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/network/api_service.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/features/checkout/data/models/init_payment_sheet_request_model.dart';
import 'package:payment/features/checkout/data/models/payment_intent_model/payment_intent_input_model.dart';

import '../../features/checkout/data/models/ephemeral_key_model.dart';
import '../../features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

class StripeService {
// steps for make payment  as a customer  and   saving the user data like cardNumber and name and customerId etc .

//1 paymentIntentObject  create payment intent(amount, currency,customerId)
//2 secretKey createEphemeralKey(customerId)
//3 init paymentSheet (merchantDisplayName, intentClientSystem, ephemeralKeySecret)
//4 display payment sheet

  final ApiService apiService = ApiService();

  Future<PaymentIntentResponseModel> createPaymentIntent(
      PaymentIntentRequestModel paymentIntentInputModel) async {
    var response = await apiService.post(
        body: paymentIntentInputModel.toJson(),
        url: "https://api.stripe.com/v1/payment_intents",
        token: ApiKeys.secretKey);

    var paymentIntentModel = PaymentIntentResponseModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        body: {
          "customer": customerId,
        },
        url: "https://api.stripe.com/v1/ephemeral_keys",
        headers: {
          "Authorization": "Bearer ${ApiKeys.secretKey}",
          "Stripe-Version": "2023-10-16"
        },
        token: ApiKeys.secretKey);

    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);
    return ephemeralKey;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetRequestModel
          initPaymentSheetRequestModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetRequestModel.clientSecretKey,
        customerEphemeralKeySecret: initPaymentSheetRequestModel.ephemeralKey,
        customerId: initPaymentSheetRequestModel.customerId,
        merchantDisplayName: "moataz mohamed shop",
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentRequestModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);

    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);

    InitPaymentSheetRequestModel initPaymentSheetRequestModel =
        InitPaymentSheetRequestModel(
            clientSecretKey: paymentIntentModel.clientSecret!,
            ephemeralKey: ephemeralKeyModel.secret!,
            customerId: paymentIntentInputModel.customerId);

    await initPaymentSheet(
        initPaymentSheetRequestModel: initPaymentSheetRequestModel);

    await displayPaymentSheet();
  }

  Future<PaymentIntentResponseModel> createCustomer(
      PaymentIntentRequestModel paymentIntentInputModel) async {
    var response = await apiService.post(
        body: paymentIntentInputModel.toJson(),
        url: "https://api.stripe.com/v1/customers",
        token: ApiKeys.secretKey);

    var paymentIntentModel = PaymentIntentResponseModel.fromJson(response.data);
    return paymentIntentModel;
  }
}
