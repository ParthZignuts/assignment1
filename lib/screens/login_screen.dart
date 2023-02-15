import 'package:assignment_1/screens/dashboard_screen.dart';
import 'package:assignment_1/screens/reset_password_screen.dart';
import 'package:assignment_1/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static final String id = 'loginscreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final auth = FirebaseAuth.instance;
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordContoller = TextEditingController();
  bool showPassword = true;
  var formkey = new GlobalKey<FormState>();
  var scaffoldKey = new GlobalKey<ScaffoldState>();

  String email = '';
  String pass = '';

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
                    }
                    else if (value.length < 10) {
                      return "Email  Id Not Valid";
                    }
                    else {
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

              //TextFormField for password
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "* Required";
                    } else if (value.length < 6) {
                      return "Password should be atleast 6 characters";
                    } else if (value.length > 15) {
                      return "Password should not be greater than 15 characters";
                    } else
                      return null;
                  },
                  keyboardType: TextInputType.text,
                  controller: _passwordContoller,
                  onChanged: (value) => pass = value,
                  obscureText: showPassword,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: showPassword
                          ? Icon(Icons.remove_red_eye)
                          : Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      tooltip: "Show Password",
                    ),
                    focusColor: Colors.pinkAccent,
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.pink),
                ),
                onTap: () {
                  print("Forgot password");
                  Navigator.pushNamed(context, ResetpasswordScreen.id);
                },
              ),

              //Button for LoginScreen
              ElevatedButton(
                onPressed: () async {
                  showDialog(context: context, builder: (context){
                    return Center(child: CircularProgressIndicator());
                  });
                  if (formkey.currentState!.validate()) {
                    try {
                      var validUser = await auth.signInWithEmailAndPassword(
                        email: email,
                        password: pass,
                      );
                      if (validUser.user != null) {
                        Navigator.pushNamed(context, DashBoardScreen.id);
                      }
                    } on FirebaseAuthException catch (e) {
                      String error= e.message ?? 'Loged In';
                      Fluttertoast.showToast(msg: error,gravity:ToastGravity.TOP,toastLength: Toast.LENGTH_LONG );
                    }
                  }
                },
                child: Text('Log In'),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    new Color(0xffb74093),
                  ),
                  shadowColor: MaterialStatePropertyAll(Color(0xffaabbcc)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Does Not Have Account?"),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SignupScreen.id);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.pink),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
