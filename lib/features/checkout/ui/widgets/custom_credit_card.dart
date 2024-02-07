import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../../../../core/theming/text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard(
      {super.key, required this.formKey, required this.autoValidateMode});

  final GlobalKey<FormState> formKey;
  final AutovalidateMode autoValidateMode;

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = "", cardHolderName = "", expiryDate = "", cvvCode = "";

  bool showBackView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
            cardNumber: cardNumber,
            isHolderNameVisible: true,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: showBackView,
            onCreditCardWidgetChange: (value) {}),
        CreditCardForm(
            autovalidateMode: widget.autoValidateMode,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (creditCardModel) {
              setState(() {
                cardNumber = creditCardModel.cardNumber;
                cardHolderName = creditCardModel.cardHolderName;
                expiryDate = creditCardModel.expiryDate;
                cvvCode = creditCardModel.cvvCode;
                showBackView = creditCardModel.isCvvFocused;
              });
            },
            formKey: widget.formKey),
      ],
    );
  }
}
