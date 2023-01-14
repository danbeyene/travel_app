import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_text.dart';

import '../misc/colors.dart';

class AppButtons extends StatelessWidget {
  final Color childColor;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  IconData? icon;
  String? text;
  bool? isIcon;
  AppButtons({Key? key,this.isIcon=false,this.text,this.icon, required this.childColor, required this.backgroundColor, required this.borderColor,required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: borderColor),
          color: backgroundColor),
      child: isIcon==false? Center(child: AppText(text: text!,color: childColor,)):Center(child: Icon(icon!,color: childColor,))
    );
  }
}
