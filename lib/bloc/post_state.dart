// ignore_for_file: recursive_getters

import 'package:bloc_api/post.dart';
import 'package:equatable/equatable.dart';

abstract class ApiState extends Equatable {
  const ApiState();

  @override
  List<Object?> get props => [];
}

class ApiInitial extends ApiState {}

class ApiLoaded extends ApiState {
  final List<Post> posts;

  const ApiLoaded({required this.posts});

  @override
  List<Object?> get props => [posts];
}

class ApiLoading extends ApiState {}

class ApiError extends ApiState {
  final String message;

  ApiError({required this.message});

  @override
  List<Object?> get props => [message];

  String get errorMessage => message;
}
