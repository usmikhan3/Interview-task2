import 'package:flutter/material.dart';
import 'package:interviewtask2/screens/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TASK 2',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const Screen1(),
    );
  }
}


