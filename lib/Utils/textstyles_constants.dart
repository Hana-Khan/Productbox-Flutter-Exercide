
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';

class TextStylesConstants {

  static TextStyle customTextStyle(BuildContext context) {
    return GoogleFonts.nunito(
      color: ColorsConstants.lightGreyColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w800,
    );
  }
}
