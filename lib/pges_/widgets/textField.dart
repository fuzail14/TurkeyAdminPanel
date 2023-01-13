import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FieldText extends StatelessWidget {
final String hintText;
 bool obscure=true;
String? Function(String?)? validator;
 final TextEditingController controller;
final Function(String?)?onchange;
FieldText({required this.hintText,this.onchange, required this.controller,required this.obscure, required this.validator});
  @override
  Widget build(BuildContext context) {
    return Container(
      child:TextFormField(
        validator:validator,
        obscureText:obscure,
        controller:controller,
        decoration: InputDecoration(
            hintText:hintText,
            contentPadding: EdgeInsets.all(20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25))),
        onChanged: onchange
      ),

    );
  }
}
