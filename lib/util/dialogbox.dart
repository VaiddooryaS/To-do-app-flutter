import 'package:flutter/material.dart';
import 'package:todo_app/util/buttons.dart';

// ignore: must_be_immutable
class Dialogbox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final mycontroller;
  VoidCallback onSave;
  VoidCallback onCancel;
  Dialogbox({super.key,
  required this.mycontroller,
  required this.onCancel,
  required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(0)), // 👈 no rounding
        side: BorderSide(
          color: Colors.yellow[600]!, // 👈 border color
          width: 6,             // 👈 border thickness
        ),
      ),
      content: Container(
        height: 150,

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0,right: 0,top: 15,bottom: 30),
              child: TextField(
                controller: mycontroller,
                decoration:InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:"Enter new task",),),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              //save button
              Buttons(text: "Save", onPressed:onSave),
              SizedBox(width: 20,),
              Buttons(text: "Cancel", onPressed:onCancel),
              //cancel button
            ],)
          ],
        ),
      ),
    );
  }
}