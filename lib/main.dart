import 'package:deneme/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final String _appTitle = 'FLUTTER DEMO';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color(0xff03045e),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Color(0xff03045e)),
          bottomAppBarColor: const Color(0xff03045e)),
      title: _appTitle,
      home: const HomeScreen(),
    );
  }
}
