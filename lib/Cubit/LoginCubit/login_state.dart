part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  
  @override
  List<Object> get props => ['initial'];
}

class LoginLoading extends LoginState {
  
  @override
  List<Object> get props => ['loading'];
}


class LoginSuccess extends LoginState {
  final String loginResult;
  LoginSuccess(this.loginResult);

  @override
  List<Object> get props => [loginResult];
}

class LoginUnsuccess extends LoginState {
  final String loginResult;
  LoginUnsuccess(this.loginResult);
  @override
  List<Object> get props => [loginResult];
}
class LoginError extends LoginState {
  final String loginResult;
  LoginError(this.loginResult);
  @override
  List<Object> get props => ['error'];
}


class LoginNoInternetError extends LoginState {
  @override
  List<Object> get props => ['no internet'];
}
