
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Utils/textstyles_constants.dart';
class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:90.sp,right: 90.sp),
      alignment:Alignment.center,
      child: Text(
        'Forgot Password?',
        style: TextStylesConstants.customTextStyle( context),
      ),
    );
  }
}
