import 'package:flutter/material.dart';

import '../misc/colors.dart';
import 'app_text.dart';
class ResponsiveButton extends StatelessWidget {
  ResponsiveButton({Key? key, this.isResponsive,this.width=120}) : super(key: key);
  bool? isResponsive;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true?double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor
        ),
        child: Row(
          mainAxisAlignment: isResponsive==true? MainAxisAlignment.spaceBetween: MainAxisAlignment.center,
          children: [
            isResponsive==true?Container(margin: EdgeInsets.only(left: 20),child: AppText(text: 'Book Trip Now',color: Colors.white,)):Container(),
            Image.asset('assets/img/button-one.png')
          ],
        ),
      ),
    );
  }
}
