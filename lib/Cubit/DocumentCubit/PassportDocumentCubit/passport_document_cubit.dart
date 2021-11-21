import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/PassportDocumentCubit/passport_document_state.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/DocumentsCounterCubit/document_counter_cubit.dart';

class PassportDocumentCubit extends Cubit<PassportDocumentState> {
  PassportDocumentCubit() : super(PassportDocumentInitial());

  Future<void> uploadPassportDocument({String? documentTitle,ImageSource? source})async {
    try {
      emit(PassportUploading());
      final documentModel=await DocumentCounterCubit().pickFile(documentTitle: documentTitle,source: source);
      emit(PassportUploaded(document: documentModel));
    } catch (e) {

    }
  }
}
