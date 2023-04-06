import 'package:bloc_api/api_service.dart';
import 'package:bloc_api/bloc/post_bloc.dart';
import 'package:bloc_api/bloc/post_event.dart';
import 'package:bloc_api/bloc/post_state.dart';
import 'package:bloc_api/post.dart';
import 'package:bloc_api/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostView(),
    );
  }
}
