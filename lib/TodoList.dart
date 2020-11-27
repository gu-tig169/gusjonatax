import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'state.dart';

class TodoList extends StatelessWidget {
  final List<StuffTodo> list;

  TodoList(this.list);

  Widget build(BuildContext context) {
    return ListView(
      children: list.map((todo) => _todoItem(context, todo)).toList(),
    );
  }

  Widget _todoItem(context, StuffTodo todo) {
    return CheckboxListTile(
        title: Text(
          todo.task,
          style: TextStyle(
              decoration: (todo.checkbox
                  ? TextDecoration.lineThrough
                  : TextDecoration.none)),
        ),
        activeColor: Colors.grey,
        checkColor: Colors.black,
        secondary: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            var state = Provider.of<MyState>(context, listen: false);
            state.deleteTodo(todo);
          },
        ),
        value: todo.checkbox,
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool value) {
          var state = Provider.of<MyState>(context, listen: false);
          state.checkingBox(todo, value);
        });
  }
}
