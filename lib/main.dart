import 'package:flutter/material.dart';
import 'package:test_technique_quantech/pages/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: LoginPage(),
    );
  }
}

