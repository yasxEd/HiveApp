import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login', // Set the initial route to the login page
      routes: {
        '/login': (context) => LoginPage(), // Define the login route
        '/home': (context) => HomePage(), // Define the home route
      },
    );
  }
}
