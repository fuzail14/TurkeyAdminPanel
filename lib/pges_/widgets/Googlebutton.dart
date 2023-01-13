import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle Google_st=GoogleFonts.aBeeZee(fontWeight:FontWeight.w900,fontSize:15);

class Googlebtn extends StatelessWidget {
 final  onpressed;
 final String text;
 final String image;
  Googlebtn({required this.image, required this.text,required this.onpressed});
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
            // backgroundColor: Colors.white,
            // foregroundColor: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:20),
            child: Row(
              children: [

              //  Sizebox.SMALLLARGEW,
                Image.asset(
                  image,
                  height: 40,
                ),
                // Sizebox.SMALLSMALLW,
                Text(text,style:Google_st,)
              ],
            ),
          ),

        ));
  }
}
