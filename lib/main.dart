import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Doctor App',
        home: Scaffold(
          body: Center(child: Text("Welecome to our Patient app..")),
        )
    );
  }
}
