import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';

class UploadDocumentButtonWidget extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  final Widget? thumbnailWidget;
  const UploadDocumentButtonWidget({
    Key? key,
    this.title,
    this.onPressed,
    this.thumbnailWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50.0.sp,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(
          left: 18.sp,
          right: 10.sp,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0.r),
          color: ColorsConstants.white,
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                title ?? '',
                style: TextStyle(
                  fontSize: 18.0.sp,
                  color: ColorsConstants.primaryColorDark,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: ColorsConstants.white,
                margin:EdgeInsets.fromLTRB(8.sp,4.sp,8.sp,4.sp),
                child: thumbnailWidget,
              ),
            )
          ],
        ),
      ),
    );
  }
}
