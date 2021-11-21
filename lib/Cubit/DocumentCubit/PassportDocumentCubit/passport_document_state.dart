import 'package:equatable/equatable.dart';
import 'package:productbox_flutter_exercise/Data/Models/DocumentsModel.dart';

abstract class PassportDocumentState extends Equatable {
  const  PassportDocumentState();

  @override
  List<Object> get props => [];
}

class PassportDocumentInitial extends  PassportDocumentState {}


class  PassportUploading extends  PassportDocumentState {
  @override
  List<Object> get props => ['uploading'];
}

class PassportUploaded extends  PassportDocumentState {
  final DocumentModel? document;
   PassportUploaded({this.document});
  @override
  List<Object> get props => ['upload'];
}
