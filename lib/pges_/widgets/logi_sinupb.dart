import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Helper/colorsconst.dart';

TextStyle Google_st =
    GoogleFonts.aBeeZee(fontWeight: FontWeight.w900, fontSize: 15);

class log_sigup extends StatelessWidget {
  final onpressed;
  final String text;
  final double? height;
  final double? width;

  log_sigup(
      {required this.text, required this.onpressed, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(),
        child: ElevatedButton(
          onPressed: onpressed,
          style: ElevatedButton.styleFrom(
            // shape: const RoundedRectangleBorder(borderRadius: Sizebox.LARGEMID),
            // side: const BorderSide(color: Colors.grey, width: 0.5),
             backgroundColor: HexColor('#13326E'),
            // foregroundColor: Colors.black,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Center(
              child: Text(
            text,
            style: Google_st,
          )),
        ));
  }
}
