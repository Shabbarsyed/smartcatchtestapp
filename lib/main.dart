import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'theme/theme.dart';
import 'screens/login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    // Choose a color scheme
    final MaterialScheme materialScheme = MaterialTheme.lightScheme();

    // Generate theme data based on the chosen color scheme
    final ThemeData themeData =
    const MaterialTheme(TextTheme()).theme(materialScheme.toColorScheme());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Catch',
      theme: themeData,
      home: Login(
        isLoading: false,
      ),
    );
  }
}
