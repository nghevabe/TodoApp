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
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StatefulMainScreen(),
    );
  }
}

class StatefulMainScreen extends StatefulWidget {
  StatefulMainScreen({Key? key}) : super(key: key);

  @override
  MainScreen createState() {
    return new MainScreen(title: 'Home',);
  }

}

class MainScreen extends State<StatefulMainScreen> {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String dataSaved = "";

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final SharedPreferences prefs = await _prefs;
    // dataSaved = prefs.getString('task_2')!;
    // print("data: "+dataSaved);
    setState(() => dataSaved = prefs.getString('task_2')!);
  }

  List<TaskItem> listTask = <TaskItem>[];

  TaskItem taskItem = TaskItem("Task X", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", 1);
  int selectedIndex = 0;
  String icColor1 = "#5F6368";
  String icColor2 = "#5F6368";
  String icColor3 = "#5F6368";
  String icColor4 = "#5F6368";

  //Widget _Home = MyHome(listTask);
  Widget _Noti = MyNotification();
  Widget _Setting = MySetting();

  MainScreen({Key? key, required this.title}) : super();
  final String title;
  String value = "";
  @override
  Widget build(BuildContext context) {

    print("dataSaved: "+dataSaved);
    listTask = <TaskItem>[
      TaskItem("Task A", "Content "+dataSaved, 1),
      TaskItem("Task B", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", 2),
      TaskItem("Task C", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", 3),
      TaskItem("Task D", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", 3),];

    return Scaffold(
      backgroundColor: Colors.white,
      body: StatefulGetBody(selectedIndex: selectedIndex, icColor1: icColor1, icColor2: icColor2,
          icColor3: icColor3, icColor4: icColor4, notiScreen: _Noti, settingScreen: _Setting, listTaskItem: listTask),
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreen()),
          );

          // TaskItem item = TaskItem("Task Bidv", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", 3);
          //
          // String jsonstring = json.encode(listTask);
          // print("json data: "+ jsonstring);
          //
          // onAddItem();

          //code to execute on button press
        },
        child: Icon(Icons.add),
        backgroundColor: HexColor("#855B28"),//icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar( //bottom navigation bar on scaffold
        shape: CircularNotchedRectangle(), //shape of notch
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

  void onTapHandler(int index)  {
    this.setState(() {
      this.selectedIndex = index;
    });
  }

  void onAddItem()  {
    this.setState(() {
      listTask.add(taskItem);
    });
  }

}

class StatefulGetBody extends StatefulWidget {
  StatefulGetBody({Key? key, required this.selectedIndex, required this.icColor1,
    required this.icColor2, required this.icColor3, required this.icColor4,
    required this.listTaskItem, required this.notiScreen,
    required this.settingScreen}) : super();
  int selectedIndex = 0;
  String icColor1 = "#5F6368";
  String icColor2 = "#5F6368";
  String icColor3 = "#5F6368";
  String icColor4 = "#5F6368";
  Widget notiScreen = MyNotification();
  Widget settingScreen = MySetting();
  List<TaskItem> listTaskItem;

  @override
  GetBody createState() {
    return GetBody(selectedIndex: selectedIndex, icColor1: icColor1, icColor2: icColor2,
    icColor3: icColor3, icColor4: icColor4, notiScreen: notiScreen, settingScreen: settingScreen, listTaskItem: listTaskItem);
  }

}

class GetBody extends State<StatefulGetBody>  {
  GetBody({Key? key, required this.selectedIndex, required this.icColor1,
    required this.icColor2, required this.icColor3, required this.icColor4,
    required this.listTaskItem, required this.notiScreen,
    required this.settingScreen}) : super();
  int selectedIndex;
  String icColor1;
  String icColor2;
  String icColor3;
  String icColor4;
  Widget notiScreen;
  Widget settingScreen;
  List<TaskItem> listTaskItem;

  @override
  Widget build(BuildContext context) {

    if (selectedIndex == 0) {
      icColor1 = "#855B28";
      icColor2 = "#5F6368";
      icColor3 = "#5F6368";
      icColor4 = "#5F6368";
      return MyHome(listTaskItem);
    } else if (selectedIndex == 1) {
      icColor1 = "#5F6368";
      icColor2 = "#855B28";
      icColor3 = "#5F6368";
      icColor4 = "#5F6368";
      return MyManager(listTaskItem);
    } else if (selectedIndex == 2) {
      icColor1 = "#5F6368";
      icColor2 = "#5F6368";
      icColor3 = "#855B28";
      icColor4 = "#5F6368";
      return notiScreen;
    } else {
      icColor1 = "#5F6368";
      icColor2 = "#5F6368";
      icColor3 = "#5F6368";
      icColor4 = "#855B28";
      return settingScreen;
    }
  }
}

