import 'package:ata_mid/main.dart';
import 'package:ata_mid/task.dart';
import 'package:flutter/material.dart';

class CancedTask extends StatefulWidget {
  const CancedTask({ Key? key }) : super(key: key);

  @override
  _CancedTaskState createState() => _CancedTaskState();
}

class _CancedTaskState extends State<CancedTask> {
  List<Task> cancelTask=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskList.forEach((element) {
      if(element.cancel){
        cancelTask.add(element);
      }
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("canceld task"),),
      body: ListView.builder(itemCount: cancelTask.length, itemBuilder: (context, index) {
        Task task=cancelTask[index];
        return Card(
          child: ListTile(
            leading: IconButton(onPressed: (){
              setState(() {
                taskList.remove(task);
                cancelTask.remove(task);
              });
            }, icon: Icon(Icons.delete)),
            title: Text(task.title),
            trailing: ElevatedButton(onPressed: (){
              setState(() {
                cancelTask.remove(task);
                task.cancel = false;

              });
            }, child: Text("restore")),
          ),
        );
      },),
    );
  }
}