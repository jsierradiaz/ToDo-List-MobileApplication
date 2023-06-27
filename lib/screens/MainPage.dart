import 'package:flutter/material.dart';
import 'package:untitled/screens/Todo.dart';
import 'package:untitled/screens/Calendar.dart';
import './defaults/defaults.dart';
import 'package:untitled/constants/colors.dart';

import '../widgets/todo_item.dart';
import '../model/todo.dart';

// This can be in its own file
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}
var indexClicked = 0;

class _MainPageState extends State<MainPage>{
  final todosList = ToDo.todoList();

  List<ToDo> _foundToDo = [];

  final pages  = [
    ToDo_screen(),
    Calendar_screen(),
    Center(
      child: Text("Started"),
    ),
    Center(
      child: Text("Sent"),
    ),
    Center(
      child: Text("Draft"),
    ),
    Center(
      child: Text("Trash"),
    ), 
    Center(
      child: Text("Spam"),
    ), 
  ];
   updateState(int index){
    return (){
        setState(() {
          indexClicked = index;
        });
        Navigator.pop(context);
     };
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: _buildAppBar(),

          body: pages[indexClicked],
          drawer: Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/avatar.jpg'),
                      ),
                    ),
                    padding: EdgeInsets.all(0),
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                            ),
                            //ElevatedButton(onPressed: (){}, child: CircleAvatar(radius: 40),
                          CircleAvatar(
                            radius: 40,
                           backgroundImage: AssetImage('assets/images/avatar.jpg'),
                          ),
                          
                          SizedBox(height: 10,
                          ),
                          Text('Place Holder: Name'
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Email Place holder'),
                        ],
                      ),

                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        AppListTile(
                          index: 0,
                          onTap: updateState(0),
                        ),

                        AppListTile(
                          index: 1,
                          onTap: updateState(1),
                        ),

                        AppListTile(
                          index: 2,
                          onTap: updateState(2),
                        ),
                        
                        AppListTile(
                          index: 3,
                          onTap: updateState(3),
                        ),

                        AppListTile(
                          index: 4,
                          onTap: updateState(4),
                        ),

                        AppListTile(
                          index: 5,
                          onTap: updateState(5),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),

    );
  }
 

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdGrey,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        //Icon(
          //Icons.menu,
          //color: tdBlack,
           //size: 30,
           //),
           Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/avatar.jpg')),
           )
      ]),
    );
  }
}

class AppListTile extends StatelessWidget {
  /*
  const AppListTile({
    super.key,
    required this.index,
    required this.onTap,
  });
  */


  const AppListTile ({
    Key? key,
    required this.index, required this.onTap,
  }): super(key: key);

  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        onTap: onTap,
        selected: indexClicked == index,
        selectedTileColor: Colors.blue[100],
        leading: Icon(Defaults.drawerItemIcon[index],
        size: 35,
        color: indexClicked == index
            ? Defaults.drawerItemSelectedColor
            : Defaults.drawerItemColor
        ),
        title: Text(
            Defaults.drawerItemText[index],
          ),
        ),
    );
  }
}