import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/routing/routes.dart';
import 'package:payment/features/checkout/logic/payment_cubit.dart';
import 'package:payment/features/checkout/ui/screens/thank_you_screen.dart';

import '../../features/checkout/ui/screens/cart_screen.dart';

class AppRouter {
  AppRouter();

  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                  create: (context) => PaymentCubit(),
                  child: const CartScreen()),
        );
      case Routes.thankYouScreen:
        return MaterialPageRoute(
          builder: (_) => const ThankYouScreen(),
        );

      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(
                  body: Center(
                    child: Text('NO route defined to ${settings.name}'),
                  ),
                ));
    }
  }
}
