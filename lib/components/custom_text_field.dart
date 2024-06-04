import 'package:beeya/config/them_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      this.validator,
      this.hintText,
      this.keyboardType,
      this.onFieldSubmitted,
      this.focusNode,
      this.levelText,
      this.hintColor,
      this.levelColor,
      this.prefixIcon,
      this.suffixIcon,
        this.obscureText,
      this.enabledBorderColor,
      this.focusedBorderColors,
      this.inputFormatters, this.textInputAction,
        this.maxLength,
        this.onTap
      });

  TextEditingController controller = TextEditingController();

  final String? hintText;
  final String? levelText;
  final TextInputType? keyboardType;
  Function? validator;
  final FocusNode? focusNode;
  final Function? onFieldSubmitted;
  final Color? hintColor;
  final Color? levelColor;
  final Color? focusedBorderColors;
  final Color? enabledBorderColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  List<TextInputFormatter>? inputFormatters;
  TextInputAction? textInputAction;
  int? maxLength;
 final VoidCallback ? onTap;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return TextFormField(
      onTap: onTap,
        controller: controller,
        obscureText: obscureText??false,
        keyboardType: keyboardType,
        focusNode: focusNode,
        onFieldSubmitted: (value) => onFieldSubmitted!(value),
        validator: (input) => validator!(input),
        inputFormatters: inputFormatters??[],
        textInputAction: textInputAction,
        maxLength: maxLength,
        decoration: InputDecoration(
          labelText: levelText,
          labelStyle: TextStyle(color: levelColor ?? themPinkColor,fontSize: 14),
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor ?? Colors.black26),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          //contentPadding: const EdgeInsets.only(bottom: -10.0),
          //icon: Icon(Icons.email),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: enabledBorderColor ?? Colors.black26,width: 1.5),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: focusedBorderColors ?? themPinkColor,width: 1.5),
          ),
        ),

    );
  }
}
