import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';

class Titles extends StatelessWidget {
  final text;
  const Titles({
    Key? key, this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:Alignment.center,
      child: Text(
        text,
        style: GoogleFonts.nunito(
          fontSize: 28.0.sp,
          color: ColorsConstants.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

