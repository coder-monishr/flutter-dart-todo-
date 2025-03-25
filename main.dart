import 'package:flutter/material.dart';

void main() {
 runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
 const TodoApp({super.key});

 @override
 Widget build(BuildContext context) {
 return MaterialApp(
 debugShowCheckedModeBanner: false,
 home: TodoHomePage(),
 );
 }
}

class TodoHomePage extends StatefulWidget {
 @override
 _TodoHomePageState createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
 final List<String> _tasks = [];
 final TextEditingController _taskController = TextEditingController();

 void _addTask() {
 if (_taskController.text.isNotEmpty) {
 setState(() {
 _tasks.add(_taskController.text);
 _taskController.clear();
 });
 }
 }

 void _removeTask(int index) {
 setState(() {
 _tasks.removeAt(index);
 });
 }

 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(title: const Text("To-Do List")),
 body: Column(
 children: [
 Padding(
 padding: const EdgeInsets.all(8.0),
 child: TextField(
 controller: _taskController,
 decoration: InputDecoration(
 labelText: "Enter Task",
 border: OutlineInputBorder(),
 ),
 ),
 ),
 Expanded(
 child: ListView.builder(
 itemCount: _tasks.length,
 itemBuilder: (context, index) {
 return Card(
 child: ListTile(
 title: Text(_tasks[index]),
 trailing: IconButton(
 icon: Icon(Icons.delete, color: Colors.red),
 onPressed: () => _removeTask(index),
 ),
 ),
 );
 },
 ),
 ),
 ],
 ),
 floatingActionButton: FloatingActionButton(
 onPressed: _addTask,
 child: const Icon(Icons.add),
 ),
 );
 }
}