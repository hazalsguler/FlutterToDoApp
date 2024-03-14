import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constant/color.dart';
import 'package:todo_app/model/tasktype.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/service/todo_service.dart';

import '../model/task.dart';

class AddNewTasksScreen extends StatefulWidget {
  const AddNewTasksScreen({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;

  @override
  State<AddNewTasksScreen> createState() => _AddNewTasksScreenState();
}

class _AddNewTasksScreenState extends State<AddNewTasksScreen> {

TextEditingController titleController = TextEditingController();
TextEditingController userIdController = TextEditingController();
TextEditingController timeController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
TodoService todoService = TodoService();
TaskType taskType = TaskType.note;


  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: deviceHeight / 10,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  image: DecorationImage(image: AssetImage("lib/assets/images/headertwo.png"),
                  fit: BoxFit.cover
                )
              ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        } ,
                        icon: const Icon(
                          Icons.close,
                          size: 40,
                          color: Colors.white,
                        )),
                    Expanded(child: Text("Add New Task",
                      style: TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,)),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                  child: const Text("Task title")),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                  child:  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                        filled: true, fillColor: Colors.white),
                  ),
              ),
               Padding(
                padding: EdgeInsets.only(top: 20),
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text("Category"),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 300),
                              content: Text("Category Selected 2:"),
                            ),
                          );
                          setState(() {
                            taskType = TaskType.note;
                          });
                        },
                        child: Image.asset("lib/assets/images/Category.png"),
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 300),
                              content: Text("Category Selected"),
                            ),
                          );
                          setState(() {
                            taskType = TaskType.calendar;
                          });
                        },
                        child: Image.asset("lib/assets/images/Category1.png"),
                      ),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 300),
                              content: Text("Category Selected"),
                            ),
                          );
                          setState(() {
                            taskType = TaskType.contest;
                          });
                        },
                        child: Image.asset("lib/assets/images/Category2.png"),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text("User ID"),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: userIdController,
                                decoration: InputDecoration(filled: true, fillColor: Colors.white),
                              ))
                        ],
                      ),
                    ),
                      Expanded(
                      child: Column(
                        children: [
                          Text("Time"),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                              child: TextField(
                                controller: timeController,
                                decoration: InputDecoration(filled: true, fillColor: Colors.white),
                              )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                  child: Text("Description")),
               SizedBox(
                height: 300,
                child: TextField(
                  controller: descriptionController,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(filled: true, fillColor: Colors.white, isDense: true),
                ),
              ),
              ElevatedButton(onPressed: () {
                saveTodo();
                Navigator.pop(context);
              } ,
                  child: Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
  void saveTodo() {
    Todo newTodo =
        Todo(id: -1, todo: titleController.text, completed: false, userId: int.parse(userIdController.text),
        );
    todoService.addTodo(newTodo);
  }
}
