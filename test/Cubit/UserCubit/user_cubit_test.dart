import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:productbox_flutter_exercise/Cubit/UserCubit/user_cubit.dart';
import 'package:productbox_flutter_exercise/Cubit/UserCubit/user_state.dart';
import 'package:productbox_flutter_exercise/Data/Repositories/user_reposirtory.dart';

import '../../Data/Repositories/mock_user_repository.dart';

void main() {
  group('UserCubit test', (){
    late UserCubit? userCubit;
    MockUserRepository mockUserRepository;

    setUp((){
      EquatableConfig.stringify=true;//EquatableConfig.stringify = true is added to show Bloc’s states and its parameters pretty.
      mockUserRepository=MockUserRepository();
      userCubit=UserCubit(mockUserRepository);

      
    });

    tearDown((){
      userCubit!.close();
    });

    test('The initial state for the UserCubit is UsersListInitial(initial)', (){
      expect(userCubit!.state, UsersListInitial());
    });

    // 
    blocTest<UserCubit,UserState>(
      'The cubit should emit a UsersLoadedState([]) for succesful users load',
     build: ()=>userCubit!,
     act: (cubit)=>cubit.getListOfUsers(),
     expect:()=> [
       UsersListLoading(),
       UsersListLoaded(mockUsers),
     ]
    );

    test("Testing the network call", () async{
  //setup the test
    final userRepository = UserRepository();
    userRepository.client = MockClient((request) async {
      final mapJson =[{
        "id": 1,
        "name": "Leanne Graham",
        "username": "Bret",
        "email": "Sincere@april.biz",
        "address": {
          "street": "Kulas Light",
          "suite": "Apt. 556",
          "city": "Gwenborough",
          "zipcode": "92998-3874",
          "geo": {
            "lat": "-37.3159",
            "lng": "81.1496"
          }
        },
        "phone": "1-770-736-8031 x56442",
        "website": "hildegard.org",
        "company": {
          "name": "Romaguera-Crona",
          "catchPhrase": "Multi-layered client-server neural-net",
          "bs": "harness real-time e-markets"
        }
       
        }
      ];
      return Response(jsonEncode(mapJson),200);
    });
    final listOfUsers = await userRepository.fetchAllUsers();
    expect(listOfUsers.isNotEmpty, true);
    expect(listOfUsers[0].id, 1);
});
   

  });
}