
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';
import 'package:productbox_flutter_exercise/Utils/textstyles_constants.dart';

class TextFields extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final double? height;
  final double? width;
  final Widget? suffixIcon;
  final int? maxLines;
  final TextInputType? textInputType;
  String? Function(String?)? validator;
  TextFields({
    Key? key,
    this.controller,
    required this.hintText,
    this.height,
    this.width,
    this.suffixIcon,
    this.maxLines,
    this.textInputType,
    required this.validator,
  }) : super(key: key);
      

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: width ?? 320.0.sp,
      // height: height ?? 52.0.sp,
      child: TextFormField(
        controller: controller,
        validator:validator,
        keyboardType: textInputType ?? TextInputType.name,
        maxLines: maxLines ?? 1,
        cursorColor: ColorsConstants.primaryColor,
        style: TextStyle(
          color: ColorsConstants.black,
          fontSize: 12.sp,
        ),
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            suffixIcon: suffixIcon,
            hintStyle: TextStylesConstants.customTextStyle(context),
            errorStyle: TextStylesConstants.customTextStyle(context).copyWith(fontSize:11.sp,color:Colors.red.shade900),
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0.r),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 16.0.sp,horizontal: 18.sp),
            alignLabelWithHint: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide:BorderSide(color: Colors.red.shade900,width: 2),
              borderRadius: BorderRadius.circular(30.0.r),
            ),
            focusedErrorBorder :OutlineInputBorder(
              borderSide:BorderSide(color: Colors.red.shade900,width: 2),
              borderRadius: BorderRadius.circular(30.0.r),
            ),
          ),
      ),
    );
  }
}
