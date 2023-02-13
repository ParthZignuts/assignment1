import 'package:assignment_1/screens/home_screen.dart';
import 'package:assignment_1/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordContoller = TextEditingController();
  TextEditingController _confirmPasswordContoller = TextEditingController();
  TextEditingController _nameContoller = TextEditingController();
  bool showPassword = true;

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  String _email = '';
  String _pass = '';

  _showSnackbar() {
    var snackBar = new SnackBar(
      content: Text("Signup Successful!!"),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  String? validatePassword(String value) {}

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
                    bottomRight:Radius.circular(50)
                  ),
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
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: showPassword?Icon(Icons.remove_red_eye): Icon(Icons.close),
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
                  obscureText: showPassword,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: showPassword?Icon(Icons.remove_red_eye): Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    _showSnackbar();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
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
