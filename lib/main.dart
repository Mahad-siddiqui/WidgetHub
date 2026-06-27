import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgethub/utils/routes.dart';
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
        // Use GoogleFonts to set the default text theme for the app
        textTheme: GoogleFonts.latoTextTheme(),
      ),

      // Dark Theme
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        // Use GoogleFonts to set the default text theme for the app
        textTheme: GoogleFonts.latoTextTheme(),
      ),

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
