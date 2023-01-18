import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/TaskItem.dart';
import 'package:todo_app/home_screen.dart';

import 'manager_screen.dart';
import 'notification_screen.dart';
import 'setting_screen.dart';

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

  //Widget _Home = MyHome(listTask);
  Widget _Noti = MyNotification();
  Widget _Setting = MySetting();

  MainScreen({Key? key, required this.title}) : super();
  final String title;
  String value = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () {
          onAddItem();
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

  Widget getBody()  {
    if(this.selectedIndex == 0) {
      this.icColor1 = "#855B28";
      this.icColor2 = "#5F6368";
      this.icColor3 = "#5F6368";
      this.icColor4 = "#5F6368";
      return MyHome(listTask);
    } else if(this.selectedIndex==1) {
      this.icColor1 = "#5F6368";
      this.icColor2 = "#855B28";
      this.icColor3 = "#5F6368";
      this.icColor4 = "#5F6368";
      return MyManager(listTask);
    } else if(this.selectedIndex==2) {
      this.icColor1 = "#5F6368";
      this.icColor2 = "#5F6368";
      this.icColor3 = "#855B28";
      this.icColor4 = "#5F6368";
      return this._Noti;
    } else {
      this.icColor1 = "#5F6368";
      this.icColor2 = "#5F6368";
      this.icColor3 = "#5F6368";
      this.icColor4 = "#855B28";
      return this._Setting;
    }
  }

}

