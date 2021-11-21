import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:productbox_flutter_exercise/Data/Models/UserModel.dart';
import 'package:productbox_flutter_exercise/Data/Repositories/user_repository_interface.dart';

class UserRepository implements IUserRepository{
  Client client = Client();
  
  Future<List<UserModel>> fetchAllUsers() async {

    try {
      final url = 'https://jsonplaceholder.typicode.com/users';
      var response = await client.get(Uri.parse(url));
      var responseBody = jsonDecode(response.body);
      final usersList = List<UserModel>.of(
        responseBody.map<UserModel>(
          (json) => UserModel.fromJson(json),
        ),
      );
      print('Userlist???');
      print(usersList);
      return usersList;
    } catch (e) {
      throw e;
    }
  }

  Future<bool?> authenticateUser(String username, String password, List<UserModel> usersList) async {
    bool result = false;
    try {
      usersList.forEach((user) {
        if(user.email!.toLowerCase()==username.toLowerCase() && password.toLowerCase()==user.email!.toLowerCase()){
          result= true;
        }
      });
    } catch (e) {
      return false;
    }
    return result;
    
  }

}