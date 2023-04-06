import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_api/api_service.dart';
import 'package:bloc_api/bloc/post_event.dart';
import 'package:bloc_api/bloc/post_state.dart';
import 'package:bloc_api/post.dart';

class PostBloc extends Bloc<ApiEvent, ApiState> {
  final ApiService apiService;

  PostBloc({required this.apiService}) : super(ApiInitial()) {
    on<FetchPosts>((event, emit) => _mapFetchPostsToState());
  }

  Stream<ApiState> _mapFetchPostsToState() async* {
    yield ApiLoading();
    try {
      final List<Post> posts = await apiService.getPosts();
      yield ApiLoaded(posts: posts);
    } catch (error) {
      yield ApiError(message: error.toString());
    }
  }

  @override
  Stream<ApiState> mapEventToState(ApiEvent event) async* {}
}
