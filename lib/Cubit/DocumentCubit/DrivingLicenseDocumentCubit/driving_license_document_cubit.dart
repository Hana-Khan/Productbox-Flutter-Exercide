import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/DocumentsCounterCubit/document_counter_cubit.dart';
import 'package:productbox_flutter_exercise/Data/Models/DocumentsModel.dart';

part 'driving_license_document_state.dart';

class DrivingLicenseDocumentCubit extends Cubit< DrivingLicenseDocumentState> {
  DrivingLicenseDocumentCubit() : super( DrivingLicensedocumentInitial());
  
  Future<void> uploadDrivingLicenseDocument({String? documentTitle,ImageSource? source})async {
    try {
      emit(DrivingLicenseUploading());
      final documentModel=await DocumentCounterCubit().pickFile(documentTitle: documentTitle,source:source);
      emit(DrivingLicenseUploaded(document: documentModel));
    } catch (e) {

    }
  }
  
}
