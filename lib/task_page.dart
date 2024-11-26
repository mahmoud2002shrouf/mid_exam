import 'dart:convert';

import 'package:ata_mid/data.dart';
import 'package:ata_mid/main.dart';
import 'package:ata_mid/task.dart';
import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  TextEditingController taskController = TextEditingController();
  void getTask() {
    final res = jsonDecode(taskJson) as List;
    taskList = res.map(
      (e) {
        return Task.fromJson(e);
      },
    ).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("todo list"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                  controller: taskController,
                  decoration: const InputDecoration(labelText: "add a task"),
                )),
                ElevatedButton(
                    onPressed: () {
                      if (taskController.text.isNotEmpty) {
                        setState(() {
                          taskList.add(Task(title: taskController.text));
                        });
                      }
                    },
                    child: Text("add")),
                IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: Icon(Icons.refresh))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  Task task = taskList[index];
                  return !task.cancel? Card(
                    child: ListTile(
                      leading: IconButton(
                          onPressed: () {
                            setState(() {
                              task.done = !task.done;
                            });
                          },
                          icon: Icon(task.done
                              ? Icons.check_box
                              : Icons.check_box_outline_blank)),
                      title: Text(task.title),
                      trailing: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              task.cancel = true;
                            });
                          },
                          child: Text("cancel")),
                    ),
                  ):Container();
                },
              ),
            )
          ],
        ),
      ),
    
    floatingActionButton: Align(
      alignment: Alignment.bottomCenter,
      child: ElevatedButton(onPressed: (){
        Navigator.pushNamed(context, "/canceled");
      }, child: Text("show canceled task"),),
    ),
    );
  }
}
