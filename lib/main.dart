import 'package:flutter/material.dart';
import './widgets/home_screen.dart';
// import 'package:flutter/services.dart';
// import './home.dart';
// import 'package:for_expense/widgets/fill_form.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
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
        // fontFamilyFallback: 'OpenSans',
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Quicksand',
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        buttonTheme: ButtonThemeData(buttonColor: Colors.white),
        fontFamily: 'OpenSans',

        useMaterial3: true,
        // colorSchemeSeed: Color.fromARGB(225, 192, 18, 70),
      ),
      home: HomeScreen(),
    );
  }
}
