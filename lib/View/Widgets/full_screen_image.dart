
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Data/Models/DocumentsModel.dart';

class FullScreenImage extends StatelessWidget {
  final String? imageUrl;
  final String? tag;

  const FullScreenImage({Key? key, this.imageUrl, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: tag!,
            child: CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
              imageUrl: imageUrl!,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}



class FullScreenDocument extends StatelessWidget {
  final String? tag;
  final DocumentModel? document;

  const FullScreenDocument({Key? key, this.document, this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: tag!,
            child: InteractiveViewer(
              panEnabled: false, // Set it to false to prevent panning.
              minScale: 0.5,
              maxScale: 4,
              child: Container(
                margin:EdgeInsets.fromLTRB(8.sp, 4.sp, 8.sp, 4.sp),
                child:document!.documentExtension!='pdf'?
                Image.file(
                  document!.documentFile!,
                  fit: BoxFit.contain,
                ):Image(
                  image:MemoryImage(document!.documentFile!.bytes),
                ),
              ),
            )
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}