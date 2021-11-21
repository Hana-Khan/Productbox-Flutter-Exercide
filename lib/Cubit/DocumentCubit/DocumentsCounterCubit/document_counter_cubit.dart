import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:native_pdf_renderer/native_pdf_renderer.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/DocumentsCounterCubit/document_counter_state.dart';
import 'package:productbox_flutter_exercise/Data/Models/DocumentsModel.dart';

class DocumentCounterCubit extends Cubit<DocumentCounterState> {
  DocumentCounterCubit() : super(DocumentCounterInitial(counterValue: 0,isUploadComplete: false,));

  
  Future<DocumentModel> pickFile({String? documentTitle, ImageSource? source})async{
    var documentFile;
    FilePickerResult? result;
    if(source==ImageSource.camera){
      
      final image= await ImagePicker().pickImage(source: source!);
      documentFile=File(image!.path);
    }else{
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'pdf'],
      );
        if (result != null && result.files.single.extension=='pdf'){
          try {
            final document = await PdfDocument.openFile(result.files.single.path!);
            final page = await document.getPage(1);
            final pageImage = await page.render(width: page.width, height: page.height);
            await page.close();
            documentFile= pageImage;
            
          print('pdf selected');
          } on PlatformException catch (error) {
            print(error);
          }
        }else{
          print('image selected');
          documentFile= File(result!.files.single.path!);
        }
    }

    return DocumentModel(
      documentTitle: documentTitle,
      documentExtension: result!=null?result.files.single.extension:documentFile.path.split('/').last,
      documentFile:documentFile!
    );
      
      
  }



  bool hasPDFExtention(PlatformFile file){
    if(file.extension=='pdf'){
      return true;
    }else
      return false;
  }

  void documentCounterIncrement(){
    emit(DocumentCounterIncrementState(counterValue: state.counterValue! + 1,isUploadComplete: true));
  }

}