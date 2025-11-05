import 'package:flutter/material.dart';
import './widgets/home_screen.dart';
// import './home.dart';
// import 'package:for_expense/widgets/fill_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext build) {
    return MaterialApp(
      title: 'Purchase Record App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'QuickSand',
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        fontFamily: 'OpenSans',
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
      ),
      home: HomeScreen(),
    );
  }
}
