import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shoes App',
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Agbalumo',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
