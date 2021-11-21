import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:productbox_flutter_exercise/Utils/colors_constants.dart';
import 'package:productbox_flutter_exercise/View/Widgets/full_screen_image.dart';

class AuthorPostWidget extends StatelessWidget {
  const AuthorPostWidget({
    Key? key,
    required this.postsUrl,
  }) : super(key: key);

  final String postsUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (_) {
            return FullScreenImage(
              imageUrl:
              postsUrl,
              tag: postsUrl,
            );
          }));
        },
      child: Hero(
        tag: postsUrl,
        child: Container(
          decoration: BoxDecoration(
            color: ColorsConstants.lightGreyColor,
            image: new DecorationImage(
              fit: BoxFit.fill,
              image:
              new CachedNetworkImageProvider(
                  postsUrl
              )
            )
          ),
        ),
      ),
    );
  }
}
