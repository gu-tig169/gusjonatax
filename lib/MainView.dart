import 'package:flutter/material.dart';
import 'TodoList.dart';
import 'state.dart';
import 'package:provider/provider.dart';

import 'SecondView.dart';

Widget _popup() {
  return PopupMenuButton(
      itemBuilder: (context) => [
            PopupMenuItem(
              child: Text('all'),
            ),
            PopupMenuItem(
              child: Text('done'),
            ),
            PopupMenuItem(
              child: Text('undone'),
            )
          ],
      icon: Icon(
        Icons.more_vert,
        size: 25,
        color: Colors.black,
      ));
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[400],
          title: Text('TIG169 TODO', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          actions: [
            _popup(),
          ],
        ),
        body: Consumer<MyState>(
          builder: (context, state, child) => TodoList(state.list),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.grey[350],
            onPressed: () async {
              var newTask = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondView(StuffTodo(task: ''))));
              if (newTask != null) {
                Provider.of<MyState>(context, listen: false).addTodo(newTask);
              }
            }));
  }
}
