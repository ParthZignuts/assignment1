import 'package:assignment_1/screens/home_screen.dart';
import 'package:assignment_1/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import '../widget/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordContoller = TextEditingController();
  bool showPassword=true;
  var formkey = new GlobalKey<FormState>();
  var scaffoldKey = new GlobalKey<ScaffoldState>();

  _showSnackbar() {
    var snackBar = new SnackBar(
      content: Text("LogIn Successful!!"),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                    bottomRight: Radius.circular(50)
                  ),
                  gradient: LinearGradient(
                    colors: [(new Color(0xffaabbcc)), (new Color(0xffb74093))],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return '* Required';
                    } else if (!value.contains('@') || !value.contains('.')) {
                      return "Email Id  Not Valid";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  controller: _emailContoller,
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
              Padding(
                padding: const EdgeInsets.all(10.0),
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
                  obscureText: showPassword,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: showPassword?Icon(Icons.remove_red_eye): Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                         showPassword=!showPassword;
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
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                    _showSnackbar();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Does Not Have Account?"),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
