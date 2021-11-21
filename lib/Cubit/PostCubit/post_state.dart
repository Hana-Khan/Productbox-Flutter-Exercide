
import 'package:equatable/equatable.dart';
import 'package:productbox_flutter_exercise/Data/Models/PostModel.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostsListInitial extends PostState {
  @override
  List<Object> get props => ['initial'];
}

class PostsListLoading extends PostState {
  
  @override
  List<Object> get props => ['loading'];
}

class PostsListEmptyState extends PostState {
  @override
  List<Object> get props => ['list empty'];
}


class PostsListLoaded extends PostState {
  final List<PostModel> posts;
  PostsListLoaded(this.posts);

  @override
  List<Object> get props => [posts];
}

class PostsListError extends PostState {
  @override
  List<Object> get props => ['error'];
}
class PostsNoInternetError extends PostState {
  @override
  List<Object> get props => ['no iternet'];
}