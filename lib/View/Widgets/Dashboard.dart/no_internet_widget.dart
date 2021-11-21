
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Align(
          alignment:Alignment.bottomCenter,
          child: Icon(
            Icons.wifi_off,
            size:50.sp,
            color: ColorsConstants.lightGreyColor,
          ),
        ),
      ),
      SizedBox(height: 20.sp,),
      Expanded(
        child: Align(
          alignment:Alignment.topCenter,
          child: Text(
            'No internet connection',
            style: GoogleFonts.nunito(
              fontSize: 16.0.sp,
              color: ColorsConstants.black,
            ),
          ),
        ),
      ),
    ],
    );
  }
}
