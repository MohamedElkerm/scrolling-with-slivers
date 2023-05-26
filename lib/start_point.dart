import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black
      ),
      debugShowCheckedModeBanner: false,
      home:HomeScreen() ,
    );
  }
}
