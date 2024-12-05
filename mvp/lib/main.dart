import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mvp/models/boxes.dart';
import 'package:mvp/models/todo.dart';
import 'package:mvp/todolist/todo_list_screen.dart';
import 'package:mvp/views/list.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(todoAdapter());
  await Hive.openBox<todo>(HiveBoxes.todo);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title : 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TodoListScreen(title: 'Todo List'),
    );
  }
}


