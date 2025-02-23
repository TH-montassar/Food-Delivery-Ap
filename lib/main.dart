import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_delivery_app/screens/admin/dashboard_screen.dart';
import 'package:food_delivery_app/screens/admin/login_screen.dart';
import 'package:food_delivery_app/screens/auth_wrapper.dart';
import 'package:food_delivery_app/screens/customer/home_screen.dart';
import 'package:food_delivery_app/screens/customer/welcome_screen.dart';
import 'firebase_options.dart';
import 'package:food_delivery_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print("Firebase initialized successfully");
  } catch (e) {
    print("Failed to initialize Firebase: $e");
  }
  runApp(
    ChangeNotifierProvider(create: (context) => CartProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      initialRoute: '/',
      home: WelcomeScreen(),
      /*  routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      }, */
    );
  }
}
//http://localhost:63042/#/login