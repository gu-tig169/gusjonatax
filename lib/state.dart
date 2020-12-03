import 'package:flutter/material.dart';

import 'api.dart';

class StuffTodo {
  String task;
  bool checkbox;
  String id;

  StuffTodo({this.task, this.checkbox, this.id});

  static Map<String, dynamic> toJson(StuffTodo todo) {
    return {
      'title': todo.task,
      'done': todo.checkbox,
    };
  }

  static StuffTodo fromJson(Map<String, dynamic> json) {
    return StuffTodo(
      id: json['id'],
      task: json['title'],
      checkbox: json['done'],
    );
  }

  void check() {
    if (this.checkbox == false) {
      this.checkbox = true;
    } else {
      this.checkbox = false;
    }
  }
}

class MyState extends ChangeNotifier {
  List<StuffTodo> _list = [];

  Future fetchList() async {
    List<StuffTodo> list = await Api.fetchTodos();
    _list = list;
    notifyListeners();
  }

  List<StuffTodo> get list => _list;

  void addTodo(StuffTodo todo) async {
    await Api.addTodo(todo);
    await fetchList();
  }

  void deleteTodo(StuffTodo todo) async {
    await Api.deleteTodo(todo.id);
    await fetchList();
  }

  void checkingBox(StuffTodo todo, bool checkbox) async {
    todo.checkbox = checkbox;
    await Api.updateTodo(todo, todo.id);
    await fetchList();
  }
}
