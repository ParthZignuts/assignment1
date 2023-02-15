
import 'package:flutter/material.dart';
class custom_password extends StatelessWidget {
   custom_password({
    required this.lable,
    required this.hintTxt,
    required this.controller,
    required this.saveData,
     required this.setState,
  }) ;


  String lable;
  String hintTxt;
  TextEditingController controller;
  Function saveData;
  Function setState;

  @override
  Widget build(BuildContext context) {
    bool showPassword=true;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(

        keyboardType: TextInputType.text,
        controller: controller,
        onChanged: saveData(),
        obscuringCharacter: '*',
        obscureText: showPassword,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: showPassword
                ? Icon(Icons.remove_red_eye)
                : Icon(Icons.close),
            onPressed: () {
              setState(showPassword);
            },
            tooltip: "Show Password",
          ),
          focusColor: Colors.pinkAccent,
          labelText: lable,
          hintText: hintTxt,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }
}