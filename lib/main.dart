import 'package:flutter/material.dart';
import 'package:pizza_ui/Screens/homescreen.dart';
import 'package:pizza_ui/Screens/menu.dart';
import 'package:pizza_ui/Welc_Screens/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'lottie',
      routes: {
        'lottie': (context) => LottieExamplePage(),
        'home': (context) => Homescreen(),
        'Explore': (context) => menuScreen(),
      },
    );
  }
}
