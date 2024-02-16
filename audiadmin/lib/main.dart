import 'package:audiadmin/screens/request.dart';
import 'package:flutter/material.dart';
import 'package:audiadmin/screens/login_screen.dart'; // Import your login screen

void main() {
  runApp(AudiAdminApp());
}

class AudiAdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AudiAdmin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Set the initial route to the login screen
      initialRoute: '/requests',
      routes: {
        // Define routes for different screens
        '/login': (context) => SignInOTP(), // Your login screen
        '/requests':(context) => RequestsPage(email: 'asdf',),
        // Add more routes for other screens as needed
      },
    );
  }
}
