
import 'package:equatable/equatable.dart';

abstract class DocumentCounterState extends Equatable {
  int? counterValue;
  bool isUploadComplete;
  DocumentCounterState({
    required this.counterValue,
    required this.isUploadComplete,
  });

}

class DocumentCounterInitial implements DocumentCounterState {

  @override
  int? counterValue;

  @override
  bool isUploadComplete;

  
  
  DocumentCounterInitial({
    this.counterValue,
    required this.isUploadComplete,
  });

  @override
  bool? get stringify => throw UnimplementedError();
  @override
  List<Object> get props => [isUploadComplete];
  
}

class DocumentCounterIncrementState implements DocumentCounterState {
  @override
  int? counterValue;
  @override
  bool isUploadComplete;
  DocumentCounterIncrementState({
    this.counterValue,
    required this.isUploadComplete,
  });

  @override
  List<Object> get props => ['uploading'];

  @override
  bool? get stringify => throw UnimplementedError();
}

