import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialoge {
  void ADialog({BuildContext context, Function onPressed}){
    final size = MediaQuery.of(context).size;
    var ad = CupertinoAlertDialog(
      content: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child:
              Text("Do you want to delete the task?"),
            ),
            Divider(),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed:onPressed,
                  child: Text("Ok"),
                ),
              ],
            )
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ad;
        });
  }
}