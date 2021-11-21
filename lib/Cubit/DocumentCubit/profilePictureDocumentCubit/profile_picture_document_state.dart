
import 'package:equatable/equatable.dart';
import 'package:productbox_flutter_exercise/Data/Models/DocumentsModel.dart';

abstract class ProfilePictureDocumentState extends Equatable {
  const ProfilePictureDocumentState();

  @override
  List<Object> get props => [];
}

class ProfilepicturedocumentInitial extends ProfilePictureDocumentState {}


class ProfilePictureUploading extends ProfilePictureDocumentState {
  @override
  List<Object> get props => ['uploading'];
}

class ProfilePictureUploaded extends ProfilePictureDocumentState {
  final DocumentModel? document;
  ProfilePictureUploaded({this.document});
  @override
  List<Object> get props => ['upload'];
}
