import 'package:productbox_flutter_exercise/Data/Models/UserModel.dart';
import 'package:productbox_flutter_exercise/Data/Repositories/user_repository_interface.dart';


  final mockUsers=<UserModel>[
    UserModel(
      id: 1,
      name: 'Ahmad',
      email:'ahmad@exp.com',
      address: Address(
        street: "Kulas Light",
        suite: "Apt. 556",
        city: "Gwenborough",
        zipcode: "92998-3874",
        geo: Geo(
          lat: "-37.3159",
          lng:"81.1496"
        )
      ),
      phone: "1-770-736-8031 x56442",
      website: "hildegard.org",
      company: Company(
        name: "Romaguera-Crona",
        catchPhrase: "Multi-layered client-server neural-net",
        bs: "harness real-time e-markets"
      )
    ),
    UserModel(
      id: 2,
      name: 'Ali',
      email:'ali@exp.com',
      address: Address(
        street: "Victor  Light",
        suite: "Apt. 556",
        city: "Gwenborough",
        zipcode: "90566-7771",
        geo: Geo(
          lat: "-37.3159",
          lng:"81.1496"
        )
      ),
      phone: "010-692-6593 x09125",
      website: "hildegard.org",
      company: Company(
        name: "Deckow-Crist",
        catchPhrase: "Proactive didactic contingency",
        bs: "synergize scalable supply-chains"
      )
    ),
  ];

class MockUserRepository implements IUserRepository{

  @override
  Future<bool?> authenticateUser(String username, String password, List<UserModel> usersList) {
    // TODO: implement authenticateUser
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> fetchAllUsers() async =>
    Future.delayed(Duration(seconds: 2),()=>[...mockUsers]);

  

}