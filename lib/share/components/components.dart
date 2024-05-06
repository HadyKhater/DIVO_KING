import 'package:divo_king/share/contst/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget defultText(
        {required String text,
        required double fontSize,
        required FontWeight fontWeight,
        Color? color}) =>
    Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color ?? Colors.white),
    );

Widget defultTextFormFiled({
  TextEditingController? controller,
  TextInputType? type,
  Function(String)? onSubmitted,
  Function(String)? onChanged,
  required String hintText,
  bool isPassword = false,
  IconData? suffix,
  Color? colorIconSuffix,
  IconData? prefix,
  String? Function(String?)? validator,
  FocusNode? focusNode,
  void Function()? suffixPressed,
  Function()? onTap,
  bool? isLoading,
}) =>
    TextFormField(
      onTap: onTap,
      focusNode:focusNode ,
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffix !=null? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix
          ),
        ): null,

        suffixIconColor: colorIconSuffix,
        prefixIcon: Icon(prefix),
        prefixIconColor: Colors.grey.withOpacity(0.5),
        hintStyle: TextStyle(
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w400,
          color: Color(0xffA9A9A9),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27.0.r),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(27.0.r),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );

Widget defaultButton({
  required void Function()? onPressed,
  required String text,
  double? width,
}) =>
    Container(
      height: 57.0.h,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(28.0.r),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 18.0.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white),
        ),
      ),
    );
Widget defultTextButton({
  required void Function()? onPressed,
  Color? color,
  required String text,
  double? fontSize,
  FontWeight? fontWeight,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ),
    );
Widget defaultButtonEmpty({
  required String text,
   double? width,
   double? height,
   double? radius,
   Color? color,
   Color? colorBackground,
   Color? textColor,
  onTap,
}) =>
GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10) ?? BorderRadius.circular(10.0.r),
          border:Border.all(color:color ?? Colors.grey) ?? Border.all(color: Colors.grey),
          color: colorBackground
        ),
        child: Center(
            child: defultText(
                text: text,
                fontSize: 14.0.sp,
                fontWeight: FontWeight.w400,
                color: textColor ?? Color(0xffA9A9A9))),
      ),
    );

Widget containershowModalBottomSheet({
  Widget? child,
}) => Container(
      width: 375.0.w,
      height: 592.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0.r),
        color: Colors.white,
      ),
    );
