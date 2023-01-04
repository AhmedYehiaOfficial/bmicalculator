//import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        primarySwatch: Colors.brown,
        canvasColor: Colors.black12,
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
            headline2: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
            bodyText1: TextStyle(
                fontSize: 15,
                color: Colors.white
            )
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
