import 'package:flutter/material.dart';
import 'TodoList.dart';
import 'state.dart';
import 'package:provider/provider.dart';

import 'SecondView.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var filterBy = 'all';
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[400],
          title: Text('TIG169 TODO', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          actions: [
            PopupMenuButton(
                onSelected: (value) {
                  setState(() {
                    filterBy = value;
                  });
                },
                itemBuilder: (context) => [
                      PopupMenuItem(child: Text('all'), value: 'all'),
                      PopupMenuItem(child: Text('done'), value: 'done'),
                      PopupMenuItem(child: Text('undone'), value: 'undone'),
                    ],
                icon: Icon(
                  Icons.more_vert,
                  size: 25,
                  color: Colors.black,
                ))
          ],
        ),
        body: Consumer<MyState>(
            builder: (context, state, child) => TodoList(
                  _filterList(state.list, filterBy),
                )),
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

List<StuffTodo> _filterList(list, filterBy) {
  if (filterBy == 'all') return list;
  if (filterBy == 'undone')
    return (list.where((todo) => todo.checkbox == false).toList());
  if (filterBy == 'done')
    return (list.where((todo) => todo.checkbox == true).toList());
  return null;
}
