import 'package:flutter/material.dart';
import 'package:your_project_name/add_task_screen.dart'; // Import the AddTaskScreen widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListScreen(), // Example: Navigate to the TaskListScreen initially
      routes: {
        '/addTask': (context) => AddTaskScreen(), // Define a route for AddTaskScreen
      },
    );
  }
}
