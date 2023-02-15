import 'package:assignment_1/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatefulWidget {
  static final String id = 'signupscreen';
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //TextEditing Controller For TextFormField
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordContoller = TextEditingController();
  TextEditingController _confirmPasswordContoller = TextEditingController();
  TextEditingController _nameContoller = TextEditingController();

  //variables For Changing State of show password
  bool showPassword = true;
  bool showConfirmPas = true;

  //key for Maintain the FormField
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;
  String name = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Heading Part of Signup Screen
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
                    colors: [(new Color(0xffb74093)), (new Color(0xffaabbcc))],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
              ),

              // textFormField For name
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return '* Required';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  controller: _nameContoller,
                  onChanged: (value) => name = value,
                  decoration: InputDecoration(
                    focusColor: Colors.pinkAccent,
                    labelText: 'Name',
                    hintText: 'Enter Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
              ),

              // textFormField For EmailId
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

              // textFormField For Password
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
                  onChanged: (value) => password = value,
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

              // textFormField For Confirm Password
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "* Required";
                    } else if (value != _passwordContoller.text) {
                      return 'Password Miss-Match ';
                    }
                  },
                  keyboardType: TextInputType.text,
                  controller: _confirmPasswordContoller,
                  obscureText: showConfirmPas,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: showConfirmPas
                          ? Icon(Icons.remove_red_eye)
                          : Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          showConfirmPas = !showConfirmPas;
                        });
                      },
                      tooltip: "Show Password",
                    ),
                    focusColor: Colors.pinkAccent,
                    labelText: 'Confirm Password',
                    hintText: 'Enter Same password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
              ),

              // Button For Submitting Form
              ElevatedButton(
                onPressed: () async {
                  showDialog(context: context, builder: (context){
                    return Center(child: CircularProgressIndicator());
                  });
                  if (formKey.currentState!.validate()) {
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      if (newUser.user != null) {
                        await newUser.user?.updateDisplayName(name);
                        Navigator.pushNamed(context, LoginScreen.id);
                      }
                    } on FirebaseAuthException catch (e) {
                      String error= e.message ?? 'Signup Successfully';
                      Fluttertoast.showToast(msg: error,gravity:ToastGravity.TOP,toastLength: Toast.LENGTH_LONG );
                    }
                  }
                },
                child: Text('Sign In'),
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
}
