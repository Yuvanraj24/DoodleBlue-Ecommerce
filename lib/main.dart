import 'package:doodleblue_ecommerce/core/constants/colors/colors.dart';
import 'package:doodleblue_ecommerce/core/routes/routes.dart';
import 'package:doodleblue_ecommerce/providers/cart_provider.dart';
import 'package:doodleblue_ecommerce/providers/product_provider.dart';
import 'package:doodleblue_ecommerce/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()..fetchProducts()),
        ChangeNotifierProvider(create: (context) => CartProvider()..fetchCart())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Doodle Blue",
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                elevation: 0,
                centerTitle: false,
                scrolledUnderElevation: 0,
                backgroundColor: AppColors.primaryColor,
                surfaceTintColor: AppColors.primaryColor,
                iconTheme: IconThemeData(color: AppColors.appWhite, size: 24),
                actionsIconTheme: IconThemeData(color: AppColors.appWhite, size: 24),

                titleTextStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.appWhite)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    elevation: 1,
                    foregroundColor: AppColors.appWhite,
                    backgroundColor: AppColors.primaryColor,
                    disabledForegroundColor: Colors.grey,
                    disabledBackgroundColor: Colors.grey,
                    side: const BorderSide(color: AppColors.appBlue),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))))),
        initialRoute: AppRoutes.home,
        onGenerateRoute: AppRoutes.generateRoute
      ),
    );
  }
}
