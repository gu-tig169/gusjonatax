import 'package:flutter/material.dart';
import 'package:todolist/state.dart';
import 'MainView.dart';
import 'package:provider/provider.dart';

void main() {
  var state = MyState();
  state.fetchList();

  runApp(ChangeNotifierProvider(create: (context) => state, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}
