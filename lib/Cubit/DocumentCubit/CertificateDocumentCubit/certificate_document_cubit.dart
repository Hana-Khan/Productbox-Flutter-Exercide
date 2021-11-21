import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/DocumentsCounterCubit/document_counter_cubit.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/DocumentsCounterCubit/document_counter_state.dart';
import 'package:productbox_flutter_exercise/Data/Models/DocumentsModel.dart';

part 'certificate_document_state.dart';

class CertificateDocumentCubit extends Cubit< CertificateDocumentState> {
  CertificateDocumentCubit() : super( CertificatedocumentInitial());

  
  Future<void> uploadCertificateDocument({String? documentTitle,ImageSource? source})async {
    try {
      emit(CertificateUploading());
      final documentModel=await DocumentCounterCubit().pickFile(documentTitle: documentTitle,source: source);
      emit(CertificateUploaded(document: documentModel));
    } catch (e) {

    }
  }

}
