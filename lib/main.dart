import 'package:flutter/material.dart';
import 'package:intern_test_project/AppData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateInheritedWidget(
      child: MaterialApp(
        title: 'Intern Test Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(),
      ),
    );
  }
}
