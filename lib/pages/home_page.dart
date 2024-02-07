import 'package:flutter/material.dart';
import 'package:todoapp/pages/dialog_box.dart';
import 'package:todoapp/util/todo_tile.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _controller = TextEditingController();


  // list of todo tasks
  List todoList = [
    ["Make Tutorial", false],
    ["Buy Groceries", false]
  ];

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  // save new task 
  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }


  // create a new task 
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller, 
          onSave: () { saveNewTask(); }, 
          onCancel: () => Navigator ,
          
        );
      }
    );    
  }
  
  // delete task 
  void deleteTask (int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("TO Do"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed:createNewTask,
        tooltip: "Add Task",
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
        
        // foregroundColor: Colors.black87,
      ),

      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder:  (context, index){
          return TodoTile(
            taskName: todoList[index][0], 
            taskCompleted: todoList[index][1], 
            onChanged: (value) =>checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask ,
          );
        }

      ),
    );
  }
}