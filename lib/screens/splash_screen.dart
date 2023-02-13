import 'package:assignment_1/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    _navigateToLoginScreen();
  }

  _navigateToLoginScreen() async {
    await Future.delayed(Duration(seconds: 4), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
