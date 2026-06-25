import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  // Entry point of the application
  runApp(const MyApp());
}

/// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // App name
      title: 'Widget Hub',

      // Remove debug banner
      debugShowCheckedModeBanner: false,

      // Current theme mode
      themeMode: ThemeMode.system,

      // Light Theme
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),

      // Dark Theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),

      // First screen displayed when app starts
      home: LoginPage(),

      // Define routes for navigation
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => const LoginPage(),
        '/unknown': (context) =>
            const Scaffold(body: Center(child: Text('Unknown Route'))),
      },
    );
  }
}
