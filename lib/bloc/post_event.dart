import 'package:equatable/equatable.dart';

abstract class ApiEvent extends Equatable {
  const ApiEvent();

  @override
  List<Object?> get props => [];
}

class FetchPosts extends ApiEvent {
  const FetchPosts();
}
