import 'package:ata_mid/canced_task.dart';
import 'package:ata_mid/task.dart';
import 'package:ata_mid/task_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<Task> taskList = [];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      routes: {
        "/": (context) => TaskPage(),
        "/canceled": (context) => CancedTask(),
      },
    );
  }
}
