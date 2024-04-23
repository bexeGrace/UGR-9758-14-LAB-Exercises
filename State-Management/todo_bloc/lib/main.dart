import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(BlocProvider(
    create: (BuildContext context) => TodoBloc(),
    child: const MyApp(),
  ));
}

class Todo {
  final int userId;
  final int id;
  final String title;
  final String completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['body'] as String,
    );
  }
}

Future<List<Todo>> fetchPost() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

  if (response.statusCode == 200) {
    final List<dynamic> body = jsonDecode(response.body);
    return body.map((dynamic item) => Todo.fromJson(item)).toList();
  } else {
    throw 'Failed to load post';
  }
}

class PostEvent {}

class FetchPost extends PostEvent {}

class TodoBloc extends Bloc<PostEvent, List<Todo>> {
  TodoBloc() : super([]) {
    on<FetchPost>((event, emit) async {
      emit(await fetchPost());
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, List<Todo>>(
        builder: (context, todoList) {
          if (todoList.isEmpty) {
            BlocProvider.of<TodoBloc>(context).add(FetchPost());
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todoList[index].title),
                subtitle: Text(todoList[index].title),
              );
            },
          );
        },
      ),
    );
  }
}
