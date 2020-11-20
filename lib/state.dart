import 'package:flutter/material.dart';

class StuffTodo {
  String task;
  bool checkbox;

  StuffTodo({this.task, this.checkbox});

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

  List<StuffTodo> get list => _list;

  void addTodo(StuffTodo todo) {
    _list.add(todo);
    notifyListeners();
  }

  void deleteTodo(StuffTodo todo) {
    _list.remove(todo);
    notifyListeners();
  }

  void checkingBox(StuffTodo todo) {
    var ind = list.indexOf(todo);
    _list[ind].check();
    notifyListeners();
  }
}
