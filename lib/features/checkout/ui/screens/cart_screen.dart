import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/helpers/extensions.dart';
import 'package:payment/core/theming/text_styles.dart';
import 'package:payment/features/checkout/logic/payment_cubit.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../widgets/payment_methods_bottom_sheet.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext contextt) {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 18),
              Center(
                child: Image.asset(
                  'assets/images/img.png',
                  fit: BoxFit.cover,
                  height: MediaQuery.sizeOf(contextt).height * .5,
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
              BlocConsumer<PaymentCubit, PaymentState>(
                listener: (context, state) {
                  if (state is PaymentSuccessState) {
                    context.pushNamed(Routes.thankYouScreen);
                  }
          
                  if (state is PaymentFailureState) {
                    context.pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)));
                  }
                },
                builder: (context, state) {
                  return AppTextButton(
                    isloading: state is PaymentLoadingState ? true : false,
                    backgroundColor: Colors.green,
                    buttonWidth: double.maxFinite,
                    buttonHeight: 60,
                    buttonText: "Complete Payment",
                    textStyle: TextStyles.font22BlackRegular,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return  PaymentMethodsBottomSheet(contextt: contextt,);
                        },
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
