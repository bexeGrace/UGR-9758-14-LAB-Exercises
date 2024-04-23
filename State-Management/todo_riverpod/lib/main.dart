import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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
      completed: json['completed'] as String,
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

final todoProvider = FutureProvider<List<Todo>>((ref) async {
  return fetchPost();
});

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

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    return Scaffold(
      body: Center(
        child: todos.when(
          data: (todo) => ListView.builder(
            itemCount: todo.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todo[index].title),
                subtitle: Text(todo[index].title),
              );
            },
          ),
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text(' $error'),
        ),
      ),
    );
  }
}
