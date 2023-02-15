import 'package:assignment_1/screens/dashboard_screen.dart';
import 'package:assignment_1/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "splashscreen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get cureentUser => _firebaseAuth.currentUser;


  void initState() {
    super.initState();
    _navigateToLoginScreen();
  }

  _navigateToLoginScreen() async {
    await Future.delayed(Duration(seconds: 4), () {});
    if (cureentUser == null) {
      Navigator.pushNamed(context, LoginScreen.id);
    } else {
      Navigator.pushNamed(context, DashBoardScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [(new Color(0xffaabbcc)), (new Color(0xffb74093))],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Text(
              'INNOVATIVE',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
