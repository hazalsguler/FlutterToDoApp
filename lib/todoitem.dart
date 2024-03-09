import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.title});
  final String title;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  bool isChecked = false;
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.notes_outlined, size: 50,),
          Text(widget.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
            ),
          ),
          Checkbox(value: isChecked, onChanged: (val) =>{
            setState(() {
              isChecked = val!;
            })
          }),
        ],
      ),
    );
  }
}
