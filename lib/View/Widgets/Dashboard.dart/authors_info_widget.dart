
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';

class AuthorInfoRowWidget extends StatelessWidget {
  const AuthorInfoRowWidget({
    Key? key,
    required this.authorProfileImageUrl,
    required this.authorName,
  }) : super(key: key);

  final String authorProfileImageUrl;
  final String authorName;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 18.sp,
          ),
          Expanded(
            child: Align(
              alignment:
                  Alignment.centerRight,
              child: Container(
                margin:
                    EdgeInsets.fromLTRB(
                  0.sp,
                  8.sp,
                  0.sp,
                  8.sp,
                ),
                padding: EdgeInsets.only(
                    left: 7.sp),
                alignment:
                    Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsConstants
                      .white,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new CachedNetworkImageProvider(
                          authorProfileImageUrl)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(
                              0xFFFFC16F)
                          .withOpacity(
                              0.1),
                      offset:
                          Offset(0, 3.0),
                      blurRadius: 6.0.r,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Align(
              alignment:
                  Alignment.centerLeft,
              child: Container(
                child: Text(
                  authorName,
                  style:GoogleFonts.nunito(
                    fontSize: 14.0.sp,
                    color: ColorsConstants
                        .black,
                    fontWeight:
                        FontWeight.w800,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}