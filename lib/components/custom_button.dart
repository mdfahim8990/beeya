import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton({Key? key,
    required this.onPressed,
    this.buttonCornerRadius,
    this.buttonTextSize,
    this.borderColor,
    required this.backGroundColor,
    this.textColor,
    this.buttonText,
    this.icons})
      : super(key: key);
  Color? textColor;
  Color backGroundColor;
  Color? borderColor;
  String? buttonText;
  double? buttonTextSize;
  double? buttonCornerRadius;
  GestureTapCallback onPressed;
  Widget? icons;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        //minimumSize: Size.fromHeight(10), // Set this
        padding: EdgeInsets.all(5),
        foregroundColor: textColor ?? Colors.white,
        backgroundColor: backGroundColor,
        side: BorderSide(color: borderColor ?? backGroundColor, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(buttonCornerRadius ?? 8),
        ), // Text Color (Foreground color)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icons ?? SizedBox(),
          Padding(
            padding: const EdgeInsets.all(1.5),
            child: Text(
              buttonText ?? "",
              style: TextStyle(
                  fontSize: buttonTextSize ?? 14, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
