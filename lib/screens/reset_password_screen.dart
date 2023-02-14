import 'package:assignment_1/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class ResetpasswordScreen extends StatefulWidget {
  static final String id = 'resetScreen';

  const ResetpasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetpasswordScreen> createState() => _ResetpasswordScreenState();
}

class _ResetpasswordScreenState extends State<ResetpasswordScreen> {
  final auth = FirebaseAuth.instance;
  TextEditingController _emailContoller = TextEditingController();
  var formkey = new GlobalKey<FormState>();
  var scaffoldKey = new GlobalKey<ScaffoldState>();
  String email = '';

  void dispose() {
    _emailContoller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Text(
                    "INNOVATIVE",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                ),
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50)),
                  gradient: LinearGradient(
                    colors: [(new Color(0xffaabbcc)), (new Color(0xffb74093))],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
              ),
              //TextFormField for Email Id
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return '* Required';
                    } else if (!value.contains('@') || !value.contains('.')) {
                      return "Email Id  Not Valid";
                    } else if (value.length < 10) {
                      return "Email  Id Not Valid";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailContoller,
                  onChanged: (value) => email = value,
                  decoration: InputDecoration(
                    focusColor: Colors.pinkAccent,
                    labelText: 'Email',
                    hintText: 'xyz@gmail.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
              ),

              //Button for LoginScreen
              ElevatedButton.icon(
                onPressed: () {
                  resetPassword();
                },
                icon: Icon(Icons.email),
                label: Text('Reset Password'),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    new Color(0xffb74093),
                  ),
                  shadowColor: MaterialStatePropertyAll(Color(0xffaabbcc)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future resetPassword() async {
    showDialog(context: context,barrierDismissible: false, builder: (context)=>Center(child: CircularProgressIndicator(),));
    try {
      await auth.sendPasswordResetEmail(email: _emailContoller.text.trim());
      Navigator.pushNamed(context, LoginScreen.id);
    } on FirebaseAuthException catch (e) {
      String error = e.message ?? 'Password Reset Email Sent';
      Fluttertoast.showToast(
          msg: error,
          gravity: ToastGravity.TOP,
          toastLength: Toast.LENGTH_LONG);
    }
  }
}
