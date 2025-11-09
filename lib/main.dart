import 'package:flutter/material.dart';

import 'package:lab1/screens/home.dart';
import 'package:lab1/screens/details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const MyHomePage(title: 'Распоред за испити - 211142'),
        "/details": (context) => const DetailsPage(),
      },

    );
  }
}
