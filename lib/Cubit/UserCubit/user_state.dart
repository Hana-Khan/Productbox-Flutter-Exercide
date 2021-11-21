
import 'package:equatable/equatable.dart';
import 'package:productbox_flutter_exercise/Data/Models/UserModel.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UsersListInitial extends UserState {
  @override
  List<Object> get props => ['initial'];
}

class UsersListLoading extends UserState {
  
  @override
  List<Object> get props => ['loading'];
}

class UsersListEmptyState extends UserState {
  @override
  List<Object> get props => ['list empty'];
}


class UsersListLoaded extends UserState {
  final List<UserModel> users;
  UsersListLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class UsersListError extends UserState {
  @override
  List<Object> get props => ['error'];
}
