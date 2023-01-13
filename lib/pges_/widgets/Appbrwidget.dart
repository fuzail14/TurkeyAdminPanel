import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
TextStyle Car_St =
GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w800);

class DMC_widget_appbr extends StatelessWidget {
  final String text;
  final String image;
  final VoidCallback onpressed;
  DMC_widget_appbr(
      {required this.onpressed, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onpressed,
          child: Icon(
            Icons.arrow_back_ios,
            size: 30,
          ),
        ),
        Text(text,style:Car_St,),
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(image),
        )
      ],

    );

  }
}
