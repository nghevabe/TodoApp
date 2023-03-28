import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/TaskItem.dart';
import 'package:todo_app/add_task_screen.dart';
import 'package:todo_app/home_screen.dart';

import 'manager_screen.dart';
import 'notification_screen.dart';
import 'setting_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


// test commit
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const StatefulMainScreen(),
    );
  }
}

class StatefulMainScreen extends StatefulWidget {
  const StatefulMainScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainScreen();
  }

}

class MainScreen extends State<StatefulMainScreen> {

  List<TaskItem> listTask = <TaskItem>[
    TaskItem("Task A", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", 1),
    TaskItem("Task B", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", 2),
    TaskItem("Task C", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", 3),
    TaskItem("Task D", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", 3),];

  TaskItem taskItem = TaskItem("Task X", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", 1);
  int selectedIndex = 0;
  String icColor1 = "#5F6368";
  String icColor2 = "#5F6368";
  String icColor3 = "#5F6368";
  String icColor4 = "#5F6368";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void _getData() async {
    final SharedPreferences prefs = await _prefs;
    // dataSaved = prefs.getString('task_2')!;
    setState(() {
      listTask[0].titleTask = prefs.getString('task_2')!;
    });
  }

  // Widget _Noti = MyNotification();
  // Widget _Setting = MySetting();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {

    if(selectedIndex == 0) {
      icColor1 = "#855B28";
      icColor2 = "#5F6368";
      icColor3 = "#5F6368";
      icColor4 = "#5F6368";
    } else if(selectedIndex==1) {
      icColor1 = "#5F6368";
      icColor2 = "#855B28";
      icColor3 = "#5F6368";
      icColor4 = "#5F6368";

    } else if(selectedIndex==2) {
      icColor1 = "#5F6368";
      icColor2 = "#5F6368";
      icColor3 = "#855B28";
      icColor4 = "#5F6368";

    } else {
      icColor1 = "#5F6368";
      icColor2 = "#5F6368";
      icColor3 = "#5F6368";
      icColor4 = "#855B28";

    }

    void onTapHandler(int index)  {
      setState(() {
        selectedIndex = index;
      });
    }

    void onAddItem()  {
      setState(() {
        listTask.add(taskItem);
      });
    }



    return Scaffold(
      backgroundColor: Colors.white,
      body: StatefulGetBody(selectedIndex: selectedIndex, listTaskItem: listTask),
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );

          // TaskItem item = TaskItem("Task Bidv", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", 3);
          //
          // String jsonstring = json.encode(listTask);
          // print("json data: "+ jsonstring);
          //
          // onAddItem();

          //code to execute on button press
        },
        child: const Icon(Icons.add),
        backgroundColor: HexColor("#855B28"),//icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar( //bottom navigation bar on scaffold
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin: 5, //notche margin between floating button and bottom appbar
        child: Row( //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home, color: HexColor(icColor1)), onPressed: () {onTapHandler(0);},),
            IconButton(icon: Icon(Icons.file_copy, color: HexColor(icColor2)), onPressed: () {onTapHandler(1);},),
            IconButton(icon: Icon(Icons.notifications, color: HexColor(icColor3)), onPressed: () {onTapHandler(2);},),
            IconButton(icon: Icon(Icons.settings, color: HexColor(icColor4)), onPressed: () {onTapHandler(3);},),
          ],
        ),
      ),
    );

  }

}

class StatefulGetBody extends StatefulWidget {
  StatefulGetBody({Key? key, required this.selectedIndex,
    required this.listTaskItem}) : super();
  int selectedIndex;
  List<TaskItem> listTaskItem;

  @override
  State<StatefulWidget> createState() {
    return GetBody();
  }

}

class GetBody extends State<StatefulGetBody>  {

  @override
  Widget build(BuildContext context) {
    if (widget.selectedIndex == 0) {
      return MyHome(widget.listTaskItem);
    } else if (widget.selectedIndex == 1) {
      return MyManager(widget.listTaskItem);
    } else if (widget.selectedIndex == 2) {
      return MyNotification();
    } else {
      return MySetting();
    }
  }
}

