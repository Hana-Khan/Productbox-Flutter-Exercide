import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:productbox_flutter_exercise/Cubit/PostCubit/post_state.dart';
import 'package:productbox_flutter_exercise/Cubit/internet_cubit/internet_cubit.dart';
import 'package:productbox_flutter_exercise/Data/Repositories/post_repository.dart';

class PostCubit extends Cubit<PostState> {
  final IPostRepository _PostRepository;
  PostCubit(this._PostRepository) : super(PostsListInitial());
  StreamSubscription? connectivityStreamSubscription;
  Future<void> getListOfPosts()async {
    try {
      final isInternetConnected =await InternetCubit(connectivity: Connectivity()).checkInternetConnection();
      if (isInternetConnected) {
        emit(PostsListLoading());
        final postsList=await _PostRepository.fetchAllPosts();
        emit(PostsListLoaded(postsList));
      }else{
        emit(PostsNoInternetError());
        connectivityStreamSubscription =Connectivity().onConnectivityChanged.listen(
          (connectivityResult) async {
            if (connectivityResult == ConnectivityResult.wifi || connectivityResult == ConnectivityResult.mobile) {
                emit(PostsListLoading());
                final postsList=await _PostRepository.fetchAllPosts();
                emit(PostsListLoaded(postsList));
              }
          });
      }
    }catch (e) {
      emit(PostsListError());
    }
  }
}
