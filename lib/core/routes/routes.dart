import 'package:doodleblue_ecommerce/views/cart/cart_view.dart';
import 'package:doodleblue_ecommerce/views/checkout/checkout_view.dart';
import 'package:doodleblue_ecommerce/views/home/home_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home  = '/';
  static const String cart = '/cart';
  static const String orderReview = '/orderReview';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case cart:
        return MaterialPageRoute(builder: (_) => CartView());

      case orderReview :
        return MaterialPageRoute(builder: (_) => CheckoutView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("Unknown-route-${settings.name}")),
          ),
        );
    }
  }

}