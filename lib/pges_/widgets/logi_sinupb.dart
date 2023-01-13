import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Helper/colorsconst.dart';
TextStyle Google_st=GoogleFonts.aBeeZee(fontWeight:FontWeight.w900,fontSize:15);

class log_sigup extends StatelessWidget {
  final  onpressed;
  final String text;
  log_sigup({ required this.text,required this.onpressed});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: BoxDecoration(),
        child: ElevatedButton(
          onPressed:onpressed,
          style: ElevatedButton.styleFrom(
            // shape: const RoundedRectangleBorder(borderRadius: Sizebox.LARGEMID),
            // side: const BorderSide(color: Colors.grey, width: 0.5),
            // backgroundColor: AppColors.Button_color,
            // foregroundColor: Colors.black,
          ),
          child: Center(child: Text(text,style:Google_st,)),

        ));
  }
}
