import 'package:productbox_flutter_exercise/Data/Models/PostModel.dart';

import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:productbox_flutter_exercise/Data/Models/PostModel.dart';
abstract class IPostRepository{
  Future<List<PostModel>> fetchAllPosts();
}


class PostRepository implements IPostRepository{
  Client client = Client();
  
  Future<List<PostModel>> fetchAllPosts() async {

    try {
      final url = 'https://picsum.photos/v2/list';
      var response = await client.get(Uri.parse(url));
      var responseBody = jsonDecode(response.body);
      final postsList = List<PostModel>.of(
        responseBody.map<PostModel>(
          (json) => PostModel.fromJson(json),
        ),
      );

      print(postsList);
      return postsList;
    } catch (e) {
      throw e;
    }
  }


}