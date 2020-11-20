import 'package:flutter/material.dart';
import 'state.dart';

class SecondView extends StatefulWidget {
  final StuffTodo todo;

  SecondView(this.todo);

  @override
  State<StatefulWidget> createState() {
    return SecondViewState(todo);
  }
}

class SecondViewState extends State<SecondView> {
  String task;
  bool checkbox;

  TextEditingController textEditingController;
  SecondViewState(StuffTodo todo) {
    this.task = todo.task;
    this.checkbox = todo.checkbox;

    textEditingController = TextEditingController(text: todo.task);

    textEditingController.addListener(() {
      setState(() {
        task = textEditingController.text;
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[400],
          title: Text('TIG169 TODO', style: TextStyle(color: Colors.black)),
          centerTitle: true),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                  hintText: 'What are you going to do?'),
            ),
            _button(),
          ],
        ),
      ),
    );
  }

  Widget _button() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      FlatButton.icon(
          onPressed: () {
            Navigator.pop(context, StuffTodo(checkbox: false, task: task));
          },
          label: Text('ADD'),
          icon: Icon(Icons.add))
    ]);
  }
}
