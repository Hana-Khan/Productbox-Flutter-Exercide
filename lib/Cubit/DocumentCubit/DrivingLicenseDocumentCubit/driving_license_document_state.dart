part of 'driving_license_document_cubit.dart';

abstract class  DrivingLicenseDocumentState extends Equatable {
  const  DrivingLicenseDocumentState();

  @override
  List<Object> get props => [];
}

class  DrivingLicensedocumentInitial extends  DrivingLicenseDocumentState {}


class  DrivingLicenseUploading extends  DrivingLicenseDocumentState {
  @override
  List<Object> get props => ['uploading'];
}

class  DrivingLicenseUploaded extends  DrivingLicenseDocumentState {
  final DocumentModel? document;
   DrivingLicenseUploaded({this.document});
  @override
  List<Object> get props => ['upload'];
}
