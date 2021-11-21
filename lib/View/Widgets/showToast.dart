import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';

Future showToastMessage({String? msg}){
  return Fluttertoast.showToast(
      backgroundColor: ColorsConstants.white,
      textColor: ColorsConstants.black,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 14.0.sp,
      msg: msg??""
  );
}
