import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:untitled/constants/colors.dart';


import '../model/todo.dart';
import '../widgets/todo_item.dart';

class ToDo_screen extends StatefulWidget {
  const ToDo_screen({super.key});
  //ToDo_screen({Key? key}) :super(key: key);

  static const routeName = '/ToDo_Screen';

  @override
  State<ToDo_screen> createState() => _ToDoState();

}

class _ToDoState extends State<ToDo_screen> {
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();

  List<ToDo> _foundToDo = [];

  void initState(){
    _foundToDo = todosList;
    super.initState();
  }

 
  // This widget is the root of your application
  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              searchBox(),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: Text(
                        'All ToDos',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    for(ToDo todo in _foundToDo.reversed)
                      ToDoItem(
                        todo: todo,
                        onToDoChanged: _handleToDoChange,
                        onDeleteItem: _deleteToDoItem,
                        ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom:  20,
                        right: 20,
                        left: 20,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const[BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: TextField(
                        controller: _todoController,
                        decoration: InputDecoration(
                          hintText: 'Add new todo item',
                          border: InputBorder.none
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                    ),
                    child: ElevatedButton(
                      child: Text('+', style: TextStyle(fontSize: 40,),),
                      onPressed: (){
                        _addToDoItem(_todoController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: tdBlue,
                        minimumSize: Size(60, 60),
                        elevation: 10,
                      ),
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
      ],
    );
  }
  void _handleToDoChange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });

  }

  void _deleteToDoItem(String id){
    setState(() {
      
    todosList.removeWhere((item) => item.id == id);
    });
  }





  void _addToDoItem(String toDo){
    setState(() {
    todosList.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(),
     todoText: toDo
     ));

    });
    _todoController.clear();
  }



  void _runFilter(String enteredKeyword){

    List<ToDo> results = [];
    if( enteredKeyword.isEmpty){
      results = todosList;
    }else {
      results = todosList.where((item) => item.todoText!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _foundToDo = results;
    });

  }



Widget searchBox(){
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20) 
              ),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefix: Icon(
                    Icons.search,
                    color:tdBlack,
                    size:20
                    ),
                    prefixIconConstraints:
                     BoxConstraints(
                      maxHeight: 20,
                      minWidth: 25,
                      ), 
                      border: InputBorder.none,
                      hintText:  'Search',
                      hintStyle: TextStyle(color: tdGrey),
                ),
              ),
          );
  }


}