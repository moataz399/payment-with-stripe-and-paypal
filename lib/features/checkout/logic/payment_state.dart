part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoadingState extends PaymentState {}

class PaymentSuccessState extends PaymentState {}

class PaymentFailureState extends PaymentState {
  final String errorMessage;

  PaymentFailureState(this.errorMessage);
}
