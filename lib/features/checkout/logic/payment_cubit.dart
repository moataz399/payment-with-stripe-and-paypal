import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment/features/checkout/data/repos/payment_repo.dart';

import '../data/models/payment_intent_model/payment_intent_input_model.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  final PaymentRepo paymentRepo = PaymentRepo();
  static PaymentCubit get(context) => BlocProvider.of(context);
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoadingState());
    var data = await paymentRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);

    data.fold((l) => emit(PaymentFailureState(l.errorMessage)),
        (r) => emit(PaymentSuccessState()));
  }


}
