part of 'certificate_document_cubit.dart';

abstract class  CertificateDocumentState extends Equatable {
  const  CertificateDocumentState();

  @override
  List<Object> get props => [];
}

class  CertificatedocumentInitial extends  CertificateDocumentState {}


class  CertificateUploading extends  CertificateDocumentState {
  @override
  List<Object> get props => ['uploading'];
}

class  CertificateUploaded extends  CertificateDocumentState {
  final DocumentModel? document;
   CertificateUploaded({this.document});
  @override
  List<Object> get props => ['upload'];
}
