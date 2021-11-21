import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';

class CircularStoryWidget extends StatelessWidget {
  const CircularStoryWidget({
    Key? key,
    required this.storyImageUrl, this.isFirstStory,
   
  }) : super(key: key);
  final  bool? isFirstStory;
  final String storyImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:isFirstStory!? EdgeInsets.fromLTRB(
        25.sp,
        0.sp,
        6.sp,
        0.sp,
      ):EdgeInsets.fromLTRB(
        6.sp,
        0.sp,
        6.sp,
        0.sp,
      ),
      child: AvatarView(
        radius: 42.r,
        borderWidth: 5.sp,
        borderColor:ColorsConstants.primaryColorDark,
        avatarType: AvatarType.CIRCLE,
        backgroundColor: Colors.red,
        imagePath: storyImageUrl,
        placeHolder: Container(
          child: Icon(
            Icons.person,
            size: 50.sp,
            color: ColorsConstants.white,
          ),
        ),
        errorWidget: Container(
          child: Icon(
            Icons.error,
            size: 50.sp,
            color: ColorsConstants.white,
          ),
        ),
      ),
    );
  }
}