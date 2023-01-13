import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Helper/colorsconst.dart';

class productfield extends StatelessWidget {
  TextInputType? textInputType;
  double? height;
  double? width;
  TextEditingController controller;
  String? text;
  bool?enable;
  productfield(
      {
        this.enable,
        required this.controller,
      required this.text,
      required this.height,
      required this.width,
        required this.textInputType
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(top:10),
      height: height,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          color: AppColors.unselected_c),
      alignment: Alignment.center,
      child: TextFormField(
        enabled:enable,
        controller:controller,
        textAlign: TextAlign.start,
        keyboardType: textInputType,
        maxLines: null,
        decoration: InputDecoration(
          alignLabelWithHint: false,
          hintText: text,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
