import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';
class RegisterWidget extends StatelessWidget {
  const RegisterWidget({
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:Alignment.center,
      child: Text(
        'Register Here',
        style: GoogleFonts.nunito(
          fontSize: 18.0.sp,
          color: ColorsConstants.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}