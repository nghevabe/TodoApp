import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'manager_screen.dart';
import 'notification_screen.dart';
import 'setting_screen.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyStatefulHomeScreen(),
    );
  }
}

class MyStatefulHomeScreen extends StatefulWidget {
  MyStatefulHomeScreen({Key? key}) : super(key: key);

  @override
  MyHomeScreen createState() {
    return new MyHomeScreen(title: 'Home',);
  }

}

class MyHomeScreen extends State<MyStatefulHomeScreen> {
  List<TaskItem> listTask = <TaskItem>[
    TaskItem("Task A", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),
    TaskItem("Task B", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),
    TaskItem("Task C", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),
    TaskItem("Task D", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor"),];

  TaskItem taskItem = TaskItem("Task X", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor");
  int selectedIndex = 0;
  String icColor1 = "#5F6368";
  String icColor2 = "#5F6368";
  String icColor3 = "#5F6368";
  String icColor4 = "#5F6368";

  //Widget _Home = MyHome(listTask);
  Widget _Manager = MyManager();
  Widget _Noti = MyNotification();
  Widget _Setting = MySetting();

  MyHomeScreen({Key? key, required this.title}) : super();
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
      return this._Manager;
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

class StatefulHomeBody extends StatefulWidget {
  StatefulHomeBody({Key? key, required this.listTask}) : super(key: key);
  List<TaskItem> listTask;

  @override
  HomeBody createState() {
    return new HomeBody(listTask: listTask);
  }
}

class HomeBody extends State<StatefulHomeBody> {

  HomeBody({Key? key, required this.listTask}) : super();
  List<TaskItem> listTask;
  String value = "";


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child:
      Column(
        children: [
          _headerScreen(),
          _titleOverview(),
          SizedBox(height: 16),
          _listOverView(),
          _titleHighPriority(),
          SizedBox(height: 16),
          Column(
            children:
              listTask.map((item) {
                return CardTaskItem(titleTask: "Sleep", contendTask: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",);
                return ListTile(
                    title: Text(item.titleTask),
                    onTap: ()=>{
                     print("GGG")
                    }
                );
              }).toList(),
          )
        ],
      ));

  }
}

class ListTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
    for (var i = 0; i < 6; i++)
        CardTaskItem(titleTask: "Sleep", contendTask: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",),
        SizedBox(height: 16),
      ],
    );
  }
}

Widget _headerScreen() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/bg_header.png"),
        fit: BoxFit.cover,
      ),
    ),
    height: 200,
    padding: const EdgeInsets.only(left: 16.0, top: 48.0),
    child: Row(
      children: <Widget>[_avatar(), _titleHeader(), _goDetailButton()],
    ),
  );
}

Widget _avatar() {
  return Container(
    width: 56.0,
    height: 200.0,
    alignment: Alignment.topLeft,
    child: const Image(image: AssetImage("assets/avatar_1.png")),
  );
}

Widget _titleHeader() {
  return Container(
    margin: const EdgeInsets.only(top: 8.0),
    child: Column(
      children: <Widget>[
        _titleDate(),
        _titleName(),
      ],
    ),
  );
}

Widget _goDetailButton() {
  return Expanded(
    child: Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(right: 16.0, top: 24.0),
      child: SvgPicture.asset('assets/ic_back_black.svg'),
    )
  );

}

Widget _titleDate() {
  return Container(
    margin: EdgeInsets.only(left: 12.0),
    width: 200,
    child: const Text("Thứ 3, 27 tháng 12, 2022",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        )),
  );
}

Widget _titleName() {
  return Container(
    margin: EdgeInsets.only(left: 12.0),
    width: 200,
    child: Text("Tran Hoang Linh",
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )),
  );
}

Widget _titleOverview() {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 16.0,top: 32.0),
    child: const Text("Overview",
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.black,
        )),
  );
}

Widget _listOverView() {
  return Container(
      child: Column(
        children: <Widget>[
          _upperOverView(),
          SizedBox(height: 16),
          _lowerOverView()
        ],
      ),
  );
}

Widget _upperOverView() {
  return Container(
    alignment: Alignment.center,
     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[CardOverView(taskNumber: "5",contend: "Todo", textColor: "#855B28"),
          CardOverView(taskNumber: "8",contend: "In Progress", textColor: "#000000")],
      )
  );
}

Widget _lowerOverView() {
  return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[CardOverView(taskNumber: "12",contend: "Done", textColor: "#36976A"),
          CardOverView(taskNumber: "2",contend: "To Day", textColor: "#FF9900")],
      )
  );
}

class CardOverView extends StatelessWidget {
  const CardOverView({Key? key, required this.taskNumber, required this.contend, required this.textColor})
      : super(key: key);

  final String taskNumber;
  final String contend;
  final String textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child:Container(
            padding: const EdgeInsets.only(left: 32.0, top: 16.0, right: 32.0, bottom: 16.0),
            child:  Column(
              children: <Widget>[
                Container(
                  width: 100,
                  alignment: Alignment.center,
                  child: Text(taskNumber,
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: HexColor(textColor),
                      )),
                ),
                Container(
                  width: 100,
                  alignment: Alignment.center,
                  child:Text(contend,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: HexColor(textColor),
                      )),
                ),
              ],
            ),
          )
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 1, //spread radius
            blurRadius: 8, // blur radius
            offset: const Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.only(left:8.0, right: 8.0),

    );
  }

}

Widget _titleHighPriority() {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 16.0,top: 32.0),
    child: const Text("High Priority",
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.black,
        )),
  );
}

class CardTaskItem extends StatelessWidget {
  const CardTaskItem({Key? key, required this.titleTask, required this.contendTask})
      : super(key: key);

  final String titleTask;
  final String contendTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          //set border radius more than 50% of height and width to make circle
        ),
          child:Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 4.0, top: 8.0, right: 8.0, bottom: 8.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                  child: Text(titleTask,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                  child: Text(contendTask,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/ic_star.svg'),
                            Container(
                              margin: const EdgeInsets.only(left: 4.0, top: 1.0),
                              child:const Text("3",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  )),
                            )
                          ],
                        )
                      ),

                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 42.0, top: 8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/ic_calender.svg'),
                              Container(
                                margin: EdgeInsets.only(left: 4.0, top: 1.0),
                                child:const Text("31 July 2021",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
      ),


      decoration: BoxDecoration(
          // border: Border.all(
          //   color: Colors.red![500],
          // ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 1, //spread radius
            blurRadius: 8, // blur radius
            offset: const Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),

    );
  }

}

class MyHome extends StatelessWidget {
  //MyHome({Key? key, required this.listTask}) : super(key: key);

  List<TaskItem> listTask;
  MyHome(this.listTask, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulHomeBody(listTask: listTask);
  }
}

class TaskItem {
  String titleTask;
  String contendTask;

  TaskItem(this.titleTask, this.contendTask);
}

