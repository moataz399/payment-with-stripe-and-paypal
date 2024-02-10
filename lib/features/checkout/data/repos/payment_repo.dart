import 'package:dartz/dartz.dart';
import 'package:payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/stripe_service.dart';
import '../models/payment_intent_model/payment_intent_input_model.dart';

class PaymentRepo {
  final StripeService stripeService = StripeService();

  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return right(null);
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
