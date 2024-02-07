import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {

  // text editing controller to get access to what the user typed
  TextEditingController myController = TextEditingController();


  // greet message variable
  String greetingMessage = "";

  // greet user method
  void greetUser(){
    String userName = myController.text;

    setState(() {
  greetingMessage = "Hello, " + userName;
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              // greet user message
              Text(greetingMessage),
        
              //textfield
              TextField(
                controller: myController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Type your name...",
                ),
              ),
        
              // button
              ElevatedButton(onPressed: greetUser, child: const Text("Tap"),),
            ],
          ),
        ),
      ),
    );
  }
}