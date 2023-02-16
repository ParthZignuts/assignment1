// import 'package:flutter/material.dart';
//
// class TextFormField extends StatefulWidget {
//   TextInputType keyboardType;
//   Function(dynamic value) onChanged;
//   InputDecoration decoration;
//   String? Function(dynamic value) validator;
//
//
//    TextFormField({Key? key, required this.keyboardType, required controller, required  this.onChanged, required this.decoration, required this.validator}) : super(key: key);
//
//   @override
//   State<TextFormField> createState() => _TextFormFieldState();
// }
//
// class _TextFormFieldState extends State<TextFormField> {
//   var email;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: TextFormField(
//         validator: (value) {
//           if (value!.isEmpty || value == null) {
//             return '* Required';
//           } else if (!value.contains('@') || !value.contains('.')) {
//             return "Email Id  Not Valid";
//           } else {
//             return null;
//           }
//         },
//         keyboardType: TextInputType.text,
//         controller: co,
//         onChanged: (value) => email = value,
//         decoration: InputDecoration(
//           focusColor: Colors.pinkAccent,
//           labelText: 'Email',
//           hintText: 'xyz@gmail.com',
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20),
//             borderSide: BorderSide(
//               color: Colors.pink,
//             ),
//           ),
//         ),
//       ),
//     );
//
//   }
// }
