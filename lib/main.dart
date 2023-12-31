import 'package:bmi/pages/home_page.dart';
import 'package:bmi/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UnitChangerProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ResultProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => BoxAnimatorProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: 'BMI calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.deepPurple.shade50),
    );
  }
}
