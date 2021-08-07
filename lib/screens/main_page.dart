import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provideres/task.dart';
import 'package:todoapp/provideres/task_provider.dart';
import 'package:todoapp/screens/all.dart';
import 'package:todoapp/screens/complete.dart';
import 'package:todoapp/screens/notComplete.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool showvalue = false;
  final myController = TextEditingController();
  int count = 0;
  final List<Task> items = [];

  void bottomSheet() {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            )),
            child: Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: myController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Enter Name',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Complete?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Checkbox(
                            value: this.showvalue,
                            onChanged: (bool value) {
                              setState(() {
                                this.showvalue = value;
                              });
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 100,
                      height: 50,
                      child: TextButton(
                          child: Text(
                            "Add Task",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.blueAccent),
                          ),
                          onPressed: () {
                            myController.text;
                            items.add(Task(
                                valueText: myController.text,
                                chekValueText: showvalue));
                            Provider.of<TaskProvider>(context, listen: false)
                                .add(items[count]);
                            count++;
                            Navigator.pop(context);
                            print(count.toString());
                            print(showvalue);
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        resizeToAvoidBottomInset:false ,
        floatingActionButton: FloatingActionButton.extended(
          icon: Icon(Icons.done_all),
          label: Text("Add"),
          onPressed: () {
            bottomSheet();
          },
        ),
        appBar: AppBar(
          title: Text("To Do App"),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.clear_all_outlined),
                text: "All",
              ),
              Tab(
                icon: Icon(Icons.browser_not_supported_rounded),
                text: "Not Complete",
              ),
              Tab(
                icon: Icon(Icons.done_all),
                text: "Complete",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            All(),
            NotComplete(),
            Complete(),
          ],
        ),
      ),
    );
  }
}
