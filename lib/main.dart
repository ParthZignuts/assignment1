import 'package:assignment_1/screens/home_screen.dart';
import 'package:assignment_1/screens/login_screen.dart';
import 'package:assignment_1/screens/reset_password_screen.dart';
import 'package:assignment_1/screens/signup_screen.dart';
import 'package:assignment_1/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: SplashScreen(),
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          ResetpasswordScreen.id: (context) => ResetpasswordScreen(),
          HomeScreen.id: (context) => HomeScreen(),
        });
  }
}
