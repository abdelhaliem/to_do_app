import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provideres/task.dart';
import 'package:todoapp/provideres/task_provider.dart';
import 'package:todoapp/widget/Dialog.dart';

class All extends StatelessWidget {
  List<Task> itme = [];
  var dialog = Dialoge();

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (ctx, TP, child) {
      return Scaffold(
        body: TP.basketItems.length == 0
            ? Center(
                child: Text("Please Add Task"),
              )
            : ListView.builder(
                itemCount: TP.basketItems.length,
                itemBuilder: (ctx, i) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white54,
                    ),
                    child: ListTile(
                      title: Text(TP.basketItems[i].valueText,
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),),
                      trailing: IconButton(
                        onPressed: () {
                          dialog.ADialog(
                              context: context,
                              onPressed: () {
                                Navigator.pop(context);
                                TP.delete(TP.basketItems.removeAt(i));
                              });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
              ),
      );
    });
  }
}
