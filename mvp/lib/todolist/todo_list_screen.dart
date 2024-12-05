import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mvp/models/boxes.dart';
import 'package:mvp/models/todo.dart';
import 'package:mvp/todolist/add_todo_screen.dart';

class TodoListScreen extends StatefulWidget {
  final String title;
  const TodoListScreen({super.key, required this.title});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
          valueListenable: Hive.box<todo>(HiveBoxes.todo).listenable(),
          builder: (context, Box<todo> box, _) {
            if (box.values.isEmpty) {
              return Center(
                child: Text("Todo Listring is Empty"),
              );
            }
            return ListView.builder(
                itemCount: box.values.length,
                itemBuilder: (context, index) {
                  todo? res = box.getAt(index);
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                    ),
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      res!.delete();
                    },
                    child: ListTile(
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
          tooltip: 'Add Todo',
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddTodoScreen()));
          }),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}