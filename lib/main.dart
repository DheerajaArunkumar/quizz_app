import 'package:flutter/material.dart';
import 'package:quiz_app/view/home_screen/home_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: QuestionScreen(),
      home: HomePage(),
    );
  }
}
