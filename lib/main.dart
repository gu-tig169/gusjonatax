import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
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
        body: _list(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondView()));
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.grey[350]));
  }

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

  Widget _list() {
    var myList = [
      'Write a book',
      'Do homework',
      'Tidy Room',
      'Watch Tv',
      'Nap',
      'Shop groceries',
      'Have fun',
      'Meditate'
    ];
    return ListView(
      children: myList.map((item) => _item(item)).toList(),
    );
  }

  Widget _item(text) {
    return ListTile(
        leading: Checkbox(value: false, onChanged: (val) {}),
        title: Text(text),
        trailing: FlatButton.icon(
            onPressed: () {}, label: Text(''), icon: Icon(Icons.delete)));
  }
}

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[400],
          title: Text('TIG169 TODO', style: TextStyle(color: Colors.black)),
          centerTitle: true),
      body: Center(
        child: Column(
          children: [
            _nameInputField(),
            _button(),
          ],
        ),
      ),
    );
  }

  Widget _nameInputField() {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 20),
        child: TextField(
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2)),
              hintText: 'What are you going to do?'),
        ));
  }

  Widget _button() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      FlatButton.icon(
          onPressed: () {}, label: Text('ADD'), icon: Icon(Icons.add))
    ]);
  }
}
