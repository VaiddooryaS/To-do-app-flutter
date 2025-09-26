

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class Tile extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String Taskname;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)deleteTile;

  Tile({super.key,
  // ignore: non_constant_identifier_names
  required this.Taskname,
  required this.onChanged,
  required this.taskcompleted,
  required this.deleteTile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left :15,top :30,right :15,bottom :0.0,),
      
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(onPressed: deleteTile,
            icon:(Icons.delete),
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(13),),
          ]),
        
        child: Container(
          padding: EdgeInsets.all(20),
          // ignore: sort_child_properties_last
          child: Row(
            children: [
              
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SizedBox(
                  height: 35,
                  width: 25,
                  
                  child: Checkbox(
                    value: taskcompleted,onChanged: onChanged,
                    activeColor: Colors.black,),
                ),
              ),
        
              Text(Taskname,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.w800,
                decoration:taskcompleted? 
                TextDecoration.lineThrough:TextDecoration.none)),
            ],
          ),
          decoration: BoxDecoration(color: Colors.lightGreen[400],borderRadius: BorderRadius.circular(15),border: Border.all(color:Colors.green[900]!,width: 5)),
        ),
      ),
    );
  }
}