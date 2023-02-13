import 'package:flutter/material.dart';

class textFormFiled extends StatelessWidget {
  TextEditingController controller;

  String hintText;
  String titleText;


  textFormFiled(
      {required this.controller,
      required this.hintText,
      required this.titleText,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(

        keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          focusColor: Colors.pinkAccent,
          labelText: titleText,
          hintText: hintText,
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
