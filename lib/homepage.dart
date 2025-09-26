import 'package:flutter/material.dart';
import 'package:todo_app/util/dialogbox.dart';
import 'package:todo_app/util/tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State <Homepage> createState() =>  _HomepageState();
}

class  _HomepageState extends State <Homepage> {

  final control =TextEditingController();

  //list that stores all the task
  List todolist = [['install flutter',false],['make to-do app',true]];
  
  //action when the checkbox is changed or tapped
  void checkboxchanged(bool? value,int index){
    setState(() {
      todolist[index][1] = !todolist[index][1];
    });
  }

  void saveNewTask(){
    setState(() {
      todolist.add([control.text,false]);
      control.clear();
      Navigator.of(context).pop();
    });
  }

  //to add new task in existing task list
  void createNewTask(){showDialog(
    context: context,
    builder: (context){
      return Dialogbox(
        mycontroller: control,
        onSave: saveNewTask,
        onCancel: ()=>Navigator.of(context).pop(),
      );
      },
    );
  }
  
 void deleteTask(int index){
  setState(() {
    todolist.removeAt(index);
  });
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[900],
        
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.checklist,color: Colors.white,size:40,weight: 30,),
            SizedBox(width: 8,),
            Text('To Do App', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 22, ),),
          ],
        ),
              
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.blue[200],
        hoverColor: Colors.lightBlue,
        
         shape: CircleBorder(
          side: BorderSide(
            color: Colors.blue[900]!, // 👈 border color
            width: 5,             // 👈 border thickness
            ),
          ),
        child: Icon(Icons.add),),
      
      body: ListView.builder(
        itemCount: todolist.length ,
        itemBuilder: (context, index) => 
        Tile(
          Taskname: todolist[index][0], 
          taskcompleted:  todolist[index][1], 
          onChanged:(value) =>checkboxchanged(value,index),
          deleteTile:(context)=>deleteTask(index) ,
          ),
      ),
    );
  }
}