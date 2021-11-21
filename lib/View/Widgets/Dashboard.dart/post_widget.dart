
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/View/Widgets/Dashboard.dart/author_post_widget.dart';
import 'package:productbox_flutter_exercise/View/Widgets/Dashboard.dart/authors_info_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key, required this.authorProfileImageUrl,required this.authorName,required this.postsUrl,
  }) : super(key: key);

  final String authorProfileImageUrl;
  final String authorName;
  final String postsUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.sp,
      child: Column(
        children: [
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.bottomCenter,
              child: AuthorInfoRowWidget(
                authorProfileImageUrl: authorProfileImageUrl, 
                authorName: authorName,
              )
            ),
          ),
          Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.topCenter,
              child: AuthorPostWidget(postsUrl: postsUrl,),
            ),
          ),
        ],
      ),
    );
  }
}

