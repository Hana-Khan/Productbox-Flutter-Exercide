import 'package:productbox_flutter_exercise/Data/Models/UserModel.dart';

abstract class IUserRepository{
  Future<List<UserModel>> fetchAllUsers();
  Future<bool?> authenticateUser(String username, String password, List<UserModel> usersList);
}