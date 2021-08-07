import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provideres/task_provider.dart';
import 'package:todoapp/widget/Dialog.dart';

class NotComplete extends StatelessWidget {
  var dialog = Dialoge();

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, TP, child) {
        return Scaffold(
            body: TP.basketItems.length == 0
                ? Center(
                    child: Text("Please Add Task"),
                  )
                : ListView.builder(
                    itemCount: TP.basketItems.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white54,
                        ),
                        child: TP.basketItems[index].chekValueText
                            ? null
                            : ListTile(
                                title: TP.basketItems[index].chekValueText
                                    ? null
                                    : Text(TP.basketItems[index].valueText,
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.blue,
                                        )),
                                trailing: TP.basketItems[index].chekValueText
                                    ? null
                                    : IconButton(
                                        onPressed: () {
                                          dialog.ADialog(
                                              context: context,
                                              onPressed: () {
                                                Navigator.pop(context);
                                                TP.delete(TP.basketItems
                                                    .removeAt(index));
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
                  ));
      },
    );
  }
}
