import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:productbox_flutter_exercise/Cubit/internet_cubit/internet_cubit.dart';
import 'package:productbox_flutter_exercise/Data/Repositories/user_reposirtory.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
    final UserRepository _userRepository;

  LoginCubit(this._userRepository) : super(LoginInitial());

  Future<void> authenticateUser(String username, String password)async {    
    try {
      final isInternetConnected =await InternetCubit(connectivity: Connectivity()).checkInternetConnection();
      if (isInternetConnected) {
        emit(LoginLoading());
        final usersList=await _userRepository.fetchAllUsers();
        print(usersList);
        final loginResult=await _userRepository.authenticateUser(username, password, usersList);
        if(loginResult==true){
          emit(LoginSuccess('Sign in Successful'));
          // emit(LoginInitial());
        }
        else{
          emit(LoginUnsuccess('Sign in unsuccessful'));
          // emit(LoginInitial());
        }
      }else{
        emit(LoginNoInternetError());
        emit(LoginInitial());
      }
    } catch (e) {
      emit(LoginError('Something went wrong, Try again.'));
      emit(LoginInitial());
    }
  }
}
