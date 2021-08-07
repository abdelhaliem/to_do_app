import 'package:flutter/material.dart';
import 'package:todoapp/provideres/task.dart';

class TaskProvider with ChangeNotifier {
  List<Task>_items=[];

  void add (Task item){
    _items.add(item);
    notifyListeners();
  }
  void delete (Task item){
    _items.remove(item);
    notifyListeners();
  }
  int get count{
    return _items.length;
  }
  List<Task> get basketItems{
    return _items;
  }
}