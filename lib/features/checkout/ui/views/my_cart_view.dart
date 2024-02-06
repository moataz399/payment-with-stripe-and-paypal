import 'package:flutter/material.dart';
import 'package:payment/core/theming/text_styles.dart';

import '../../../../core/widgets/app_text_button.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        title: const Text('My Cart'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(height: 18),
              Center(
                child: Expanded(
                  child: Image.asset(
                    'assets/images/img.png',
                    fit: BoxFit.cover,
                    height: 400,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Subtotal',
                        style: TextStyles.font16BlackRegular,
                      ),
                      Text(
                        '\$24',
                        style: TextStyles.font16BlackRegular,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount ',
                        style: TextStyles.font16BlackRegular,
                      ),
                      Text(
                        '\$0',
                        style: TextStyles.font16BlackRegular,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Shipping',
                        style: TextStyles.font16BlackRegular,
                      ),
                      Text(
                        '\$8',
                        style: TextStyles.font16BlackRegular,
                      )
                    ],
                  ),
                ],
              ),
              const Divider(
                height: 34,
                thickness: 1,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyles.font22BlackRegular,
                  ),
                  Text(
                    '\$32',
                    style: TextStyles.font22BlackRegular,
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              AppTextButton(
                backgroundColor: Colors.green,
                buttonWidth: double.maxFinite,
                buttonHeight: 60,
                buttonText: "Complete Payment",
                textStyle: TextStyles.font22BlackRegular,
                onPressed: () {

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
