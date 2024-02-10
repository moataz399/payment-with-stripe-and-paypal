class InitPaymentSheetRequestModel {
  final String clientSecretKey;
  final String ephemeralKey;

  final String customerId;

  InitPaymentSheetRequestModel(
      {required this.clientSecretKey,
      required this.ephemeralKey,
      required this.customerId});
}
