import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/DocumentsCounterCubit/document_counter_cubit.dart';
import 'package:productbox_flutter_exercise/Cubit/DocumentCubit/profilePictureDocumentCubit/profile_picture_document_state.dart';

class ProfilePictureDocumentCubit extends Cubit<ProfilePictureDocumentState> {
  ProfilePictureDocumentCubit() : super(ProfilepicturedocumentInitial());

Future<void> uploadProfilePictureDocument({String? documentTitle,ImageSource? source})async {
    try {
      emit(ProfilePictureUploading());
      final documentModel=await DocumentCounterCubit().pickFile(documentTitle: documentTitle,source: source);
      emit(ProfilePictureUploaded(document: documentModel));
    } catch (e) {

    }
  }

}

