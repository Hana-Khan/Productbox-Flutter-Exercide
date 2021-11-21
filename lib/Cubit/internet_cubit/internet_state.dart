part of 'internet_cubit.dart';

enum ConnectionType {
  wifi,
  mobile,
}

abstract class InternetState extends Equatable {
  @override
  List<Object> get props => [];
}

class InternetInitial extends InternetState {}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType? connectionType;

  InternetConnected({this.connectionType});
}

class InternetConnectedState extends InternetState {}

class InternetDisconnectedState extends InternetState {}

class InternetDisconnected extends InternetState {}
