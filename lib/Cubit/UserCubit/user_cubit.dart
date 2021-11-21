import 'package:bloc/bloc.dart';
import 'package:productbox_flutter_exercise/Cubit/UserCubit/user_state.dart';
import 'package:productbox_flutter_exercise/Data/Repositories/user_repository_interface.dart';

class UserCubit extends Cubit<UserState> {
  final IUserRepository _userRepository;
  UserCubit(this._userRepository) : super(UsersListInitial());

  Future<void> getListOfUsers()async {
    try {
      emit(UsersListLoading());
      final usersList=await _userRepository.fetchAllUsers();
      emit(UsersListLoaded(usersList));
    } catch (e) {
      emit(UsersListError());
    }
  }
}
