import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mvp/models/boxes.dart';
import 'package:mvp/models/todo.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  validated() {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      _onFormSubmtit();
      print('Form Validated');
    } else {
      print('Form not Validated');
      return;
    }
  }

  late String title;
  late String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
        centerTitle: true,
      ),
      body: SafeArea(child: Form(key: _formkey, 
      child: Padding(padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            onChanged: (value) {
              title = value;
            },
            autofocus: false,
            decoration: InputDecoration(
              labelText: 'title'
            ),
            validator: (String? value) {
              if (value ==  null || value.trim().length == 0)
              {
                return 'Required';
              }
              return null;
            }
          ),
          TextFormField(
            onChanged: (value) {
              description = value;
            },
            autofocus: false,
            decoration: InputDecoration(
              labelText: 'description'
            ),
            validator: (String? value) {
              if (value ==  null || value.trim().length == 0)
              {
                return 'Required';
              }
              return null;
            }
          ),
          ElevatedButton(onPressed: (){
            validated();
          }, child: Text('add todo')),
        ],
      ),))),
    );
  }

  void _onFormSubmtit(){
    Box<todo> todoBox = Hive.box<todo>(HiveBoxes.todo);
    todoBox.add(todo(title: title, description: description));

    Navigator.of(context).pop();
  }
}
