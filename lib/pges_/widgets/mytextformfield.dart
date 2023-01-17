import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';



class MyTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final FontWeight? fontWeight;
final double? width;
final double? height;
final double? fontSize;
  final String? labelText;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color? fillColor;
  final Color onFocusedBorderColor;
  final Color onEnabledBorderColor;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  const MyTextFormField(
      {super.key,
this.fontWeight,
      this.fontSize,
      this.onTap,
      this.width,
      this.height,
      this.controller,
      this.fillColor,
      this.validator,
      required this.hintText,
      required this.obscureText,
      this.labelTextColor,
       this.labelText,
      this.hintTextColor,
      required this.onFocusedBorderColor,
      required this.onEnabledBorderColor});

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width:widget.width ,height:widget.height ,
      child: TextFormField(
        onTap: widget.onTap,
        validator: widget.validator,
        obscureText: widget.obscureText,
        // maxLines: 1,
        controller: widget.controller,
        decoration: InputDecoration(
          labelStyle:     GoogleFonts.montserrat(
              color: Colors.black,
               fontWeight: FontWeight.w500
          ),
          hintStyle: TextStyle(
            color: widget.hintTextColor,
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
          fillColor: widget.fillColor,
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(10.0),
          //   borderSide:
          //       BorderSide(color: widget.onFocusedBorderColor, width: 1),
          // ),
          filled: true,
          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
            
              color: HexColor('#F7F7F8'),
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}