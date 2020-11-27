import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todolist/state.dart';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = 'df14c6d2-f1c8-4d1f-9b11-9a47a9d3e451';

class Api {
  static Future addTodo(StuffTodo todo) async {
    var json = jsonEncode(StuffTodo.toJson(todo));
    await http.post('$API_URL/todos?key=$API_KEY',
        body: json, headers: {'Content-Type': 'application/json'});
  }

  static Future deleteTodo(String todoId) async {
    await http.delete('$API_URL/todos/$todoId?key=$API_KEY');
  }

  static Future updateTodo(StuffTodo todo, todoId) async {
    var json = jsonEncode(StuffTodo.toJson(todo));
    await http.put('$API_URL/todos/$todoId?key=$API_KEY',
        body: json, headers: {'Content-Type': 'application/json'});
  }

  static Future<List<StuffTodo>> fetchTodos() async {
    var response = await http.get('$API_URL/todos?key=$API_KEY');
    var json = jsonDecode(response.body);

    return json.map<StuffTodo>((data) {
      return StuffTodo.fromJson(data);
    }).toList();
  }
}
