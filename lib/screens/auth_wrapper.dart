import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app/screens/admin/dashboard_screen.dart';
import 'package:food_delivery_app/screens/admin/login_screen.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          ); // Show a loader while checking auth state
        }
        if (snapshot.hasData) {
          return DashboardScreen(); // User is logged in, show the Dashboard
        }
        return LoginScreen(); // User is not logged in, show the Login Screen
      },
    );
  }
}
