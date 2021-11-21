import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/PassportDocumentCubit/passport_document_cubit.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/PassportDocumentCubit/passport_document_state.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/DocumentsCounterCubit/document_counter_cubit.dart';

import 'package:productbox_flutter_exercise/View/Widgets/UploadDocuments/thumbnail_image_widget.dart';
import 'package:productbox_flutter_exercise/View/Widgets/full_screen_image.dart';
import 'package:productbox_flutter_exercise/View/Widgets/UploadDocuments/upload_document_button_widget.dart';

class UploadPassportWidget extends StatelessWidget {
  const UploadPassportWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PassportDocumentCubit, PassportDocumentState>(
      listener: (context, state) {
        if (state is PassportUploaded) {
          BlocProvider.of<DocumentCounterCubit>(context).documentCounterIncrement();
        }
      },
      builder: (context, state) {
      if (state is PassportUploaded) {
        return UploadDocumentButtonWidget(
          title: 'Passport',
          thumbnailWidget:ThumbnailWidget(document:state.document,),
          onPressed: () async {
            if (state.document != null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) {
                    return FullScreenDocument(
                      document: state.document,
                      tag: state.document!.documentTitle,
                    );
                  }));
            } else{
            showDialog<ImageSource>(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text("Choose image source"),
                    actions: [
                        TextButton(
                          child: Text("Camera"), 
                          onPressed: () => Navigator.pop(context, ImageSource.camera),
                        ),
                        TextButton(
                          child: Text("Gallery"), 
                          onPressed: () => Navigator.pop(context, ImageSource.gallery),
                        ),
                    ]
                  ),
                ).then((source) {
                  if(source!=null){
                    BlocProvider.of<PassportDocumentCubit>(context)
                    .uploadPassportDocument(
                        documentTitle: 'Passport',source: source);
                }else
                  print('camera gallery not selected');
                }
              );
            }
          },
        );
      }
      else{
        return UploadDocumentButtonWidget(
          title: 'Passport',
          thumbnailWidget: Container(),
          onPressed: () async {
            showDialog<ImageSource>(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text("Choose image source"),
                    actions: [
                        TextButton(
                          child: Text("Camera"), 
                          onPressed: () => Navigator.pop(context, ImageSource.camera),
                        ),
                        TextButton(
                          child: Text("Gallery"), 
                          onPressed: () => Navigator.pop(context, ImageSource.gallery),
                        ),
                    ]
                  ),
                ).then((source) {
                  if(source!=null){
                    BlocProvider.of<PassportDocumentCubit>(context)
                    .uploadPassportDocument(
                        documentTitle: 'Passport',source: source);
                }else
                  print('camera gallery not selected');
              }
            );
          },
        );
        }
      }
    );
  }
}