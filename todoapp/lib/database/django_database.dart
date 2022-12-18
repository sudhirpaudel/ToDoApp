import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todoapp/model/todo_model.dart';

Future<List<ToDoModel>> getOngoingTodos() async {
  var response = await http.get(Uri.parse('http://10.0.2.2:8000/todos/'));
  var json =  response.body;
  return  toDoModelFromJson(json);
}
