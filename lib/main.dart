import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provideres/task_provider.dart';
import 'package:todoapp/screens/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(context)=>TaskProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    ),
    );
  }
}
