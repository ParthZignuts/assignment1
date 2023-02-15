import 'package:flutter/material.dart';


class customTextFormField extends StatelessWidget {
  String lable;
  String hintTxt;
  TextEditingController controller;
   Function saveData;
  customTextFormField({
    required this.lable,
    required this.hintTxt,
    required this.controller,
    required this.saveData,
  }) ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      onChanged: saveData(),
      validator: (value){
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
      decoration: InputDecoration(
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
    );
  }
}
