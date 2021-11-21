import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productbox_flutter_exercise/Data/Models/DocumentsModel.dart';

class ThumbnailWidget extends StatelessWidget {
  final DocumentModel? document;
  ThumbnailWidget({this.document});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(8.sp, 4.sp, 8.sp, 4.sp),
      child: document!.documentExtension == 'pdf'?Image(
        image: MemoryImage(document!.documentFile!.bytes),
      ):Image.file(
        document!.documentFile!,
        fit: BoxFit.fill,
      ),
    );
  }
}