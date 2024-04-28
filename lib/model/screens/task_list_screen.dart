import 'package:flutter/material.dart';
import 'package:todo_list/model/todo_item.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<TodoItem> todoList = [
    TodoItem(id: '1', name: 'Task 1', isCompleted: false),
    TodoItem(id: '2', name: 'Task 2', isCompleted: true),
    TodoItem(id: '3', name: 'Task 3', isCompleted: false),
  ];

  List<TodoItem> filteredList = [];

  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredList = todoList;
  }

  void filterTasks(String query) {
    setState(() {
      searchQuery = query;
      filteredList = todoList
          .where((task) => task.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void editTask(int index) {
    // Implement editing task functionality
  }

  void deleteTask(int index) {
    setState(() {
      filteredList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search tasks',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                filterTasks(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                return Semantics(
                  label: filteredList[index].name,
                  child: ListTile(
                    title: Text(filteredList[index].name),
                    leading: Checkbox(
                      value: filteredList[index].isCompleted,
                      onChanged: (value) {
                        setState(() {
                          filteredList[index].isCompleted = value!;
                        });
                      },
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            editTask(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteTask(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Add Task Screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
