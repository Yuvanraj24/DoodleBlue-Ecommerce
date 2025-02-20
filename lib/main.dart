import 'package:doodleblue_ecommerce/providers/cart_provider.dart';
import 'package:doodleblue_ecommerce/providers/product_provider.dart';
import 'package:doodleblue_ecommerce/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main(){
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, DeviceOrientation.portraitDown
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ProductProvider()..fetchProducts(),),
      ChangeNotifierProvider(create: (context) => CartProvider()..fetchCart())
      ],
      child: MaterialApp(
        title: "Doodle Blue",
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Color.fromARGB(100, 19, 64, 136)
          )
        ),
        home: HomeView(),

      ),
    );
  }
}
