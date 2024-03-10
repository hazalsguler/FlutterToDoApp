import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constant/color.dart';

class AddNewTasksScreen extends StatelessWidget {
  const AddNewTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: Column(
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
            const Text("Task title"),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: const TextField(
                  decoration: InputDecoration(
                      filled: true, fillColor: Colors.white),
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Category"),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(milliseconds: 300),
                        content: Text("Category Selected 2"),
                      ),
                    );
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
                  },
                  child: Image.asset("lib/assets/images/Category2.png"),
                )
              ],
            ),
            const Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text("Date"),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(decoration: InputDecoration(filled: true, fillColor: Colors.white),
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
                          child: TextField(decoration: InputDecoration(filled: true, fillColor: Colors.white),
                          )
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
