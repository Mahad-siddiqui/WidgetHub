import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgethub/utils/routes.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'package:widgethub/utils/theme.dart';

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
      theme: MyTheme.lightTheme,

      // Dark Theme
      darkTheme: MyTheme.darkTheme,

      // First screen displayed when app starts
      home: HomePage(),

      // Define routes for navigation
      routes: {
        MYRoutes.homeRoute: (context) => HomePage(),
        MYRoutes.loginRoute: (context) => const LoginPage(),
        '/unknown': (context) =>
            const Scaffold(body: Center(child: Text('Unknown Route'))),
      },
    );
  }
}
