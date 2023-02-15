import 'package:assignment_1/screens/dashboard_screen.dart';
import 'package:assignment_1/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SplashService{

  void isLogin(BuildContext context){
    final auth=FirebaseAuth.instance;
    final user=auth.currentUser;

    if(user!=null){
      Navigator.pushNamed(context, DashBoardScreen.id);
    }
    else{
      Navigator.pushNamed(context, LoginScreen.id);
    }
  }
}