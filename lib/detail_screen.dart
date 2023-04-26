import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/TaskItem.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StatefulDetailBody();
  }
}

class StatefulDetailBody extends StatefulWidget {
  StatefulDetailBody({Key? key}) : super(key: key);

  @override
  DetailBody createState() {
    return DetailBody();
  }
}

class DetailBody extends State<StatefulDetailBody> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          SizedBox(height: 36),
          StateHeaderScreen(),
          SizedBox(height: 18),
          _titleTask(),
          SizedBox(height: 32),
          _contentTask(),
          SizedBox(height: 36),
          _footerScreen(),
          Expanded(child: SizedBox()),
          buttonStatus()
        ],
      ),
    );
  }
}

class StateHeaderScreen extends StatefulWidget {

  StateHeaderScreen({Key? key}) : super();

  @override
  HeaderScreen createState() {
    return HeaderScreen();
  }

}

class HeaderScreen extends State<StateHeaderScreen> {
  List<TaskItem> listTask = <TaskItem>[];
  String dataLoaded = "";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void _getData() async {
    final SharedPreferences prefs = await _prefs;
    // dataSaved = prefs.getString('task_2')!;
    setState(() {
      // listTask[0].titleTask = prefs.getString('task_2')!;
      dataLoaded = prefs.getString('task_data')!;
      print("dataLoaded Detail: " + dataLoaded);
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }


  @override
  Widget build(BuildContext context) {
    if (dataLoaded.isNotEmpty) {
      final parsed = jsonDecode(dataLoaded).cast<Map<String, dynamic>>();

      listTask = parsed.map<TaskItem>((json) =>
          TaskItem.fromJson(json)).toList();
    }
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 16.0),
          child: SvgPicture.asset('assets/ic_back_left.svg'),
        ),
        Expanded(
          child: SizedBox(),
        ),
        Container(
          margin: EdgeInsets.only(right: 20.0),
          child: SvgPicture.asset('assets/ic_share.svg'),
        ),
        Container(
          margin: EdgeInsets.only(right: 20.0),
          child: SvgPicture.asset('assets/ic_edit.svg'),
        ),
        Container(
          margin: EdgeInsets.only(right: 12.0),
          child: GestureDetector(
              onTap: () {
                print("Click Delete");
                onDelete(0, listTask);
              },
              child: SvgPicture.asset('assets/ic_delete.svg')),
        ),
      ],
    );
  }

  void onDelete(int index, List<TaskItem> listTask) async {

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      listTask.removeAt(index);

      String jsonstring = json.encode(listTask);

      print("jsonstring Saved: "+jsonstring);

      prefs.setString('task_data', jsonstring);
      print("Delete done");

      Future.delayed(Duration(seconds: 3), () {
        Navigator.pop(context, true);
      });

    });

  }

}

Widget _titleTask() {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 16.0),
    child: Text("Task Bidv 1",
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        )),
  );
}

Widget _contentTask() {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 16.0, right: 16.0),
    child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
        style: TextStyle(
          fontSize: 16.0,
          color: HexColor("#7E7E7E"),
        )),
  );
}

Widget _footerScreen() {
  return Row(
    children: [
      Container(
          child: Container(
        margin: EdgeInsets.only(left: 16.0),
        padding:
            EdgeInsets.only(left: 10.0, top: 6.0, right: 10.0, bottom: 6.0),
        decoration: BoxDecoration(
            color: HexColor("#FF9900"),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Text("High",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      )),
      Expanded(child: SizedBox()),
      Container(
          margin: const EdgeInsets.only(left: 12.0, top: 4.0),
          child: Row(
            children: [
              SvgPicture.asset('assets/ic_star.svg'),
              Container(
                margin: const EdgeInsets.only(right: 36.0),
                child: Container(
                  margin: EdgeInsets.only(left: 4.0),
                  child: const Text("3",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
              )
            ],
          )),
      Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(right: 16.0),
          child: Row(
            children: [
              SvgPicture.asset('assets/ic_calender.svg'),
              Container(
                margin: EdgeInsets.only(left: 4.0, top: 1.0),
                child: const Text("31 July 2021",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              )
            ],
          )),
    ],
  );
}

class buttonStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              backgroundColor: Colors.white,
              context: context,
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                        width: 40.0,
                        height: 4.0,
                        margin: EdgeInsets.only(top: 8.0),
                        decoration: BoxDecoration(
                            color: HexColor("#DEDEDE"),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                    Container(
                      margin: EdgeInsets.only(top: 24.0, bottom: 28.0),
                      child: Text("Select Status"),
                    ),
                    buttonDone(),
                    buttonInProgress(),
                    buttonToDo(),
                    Container(
                        width: 120.0,
                        height: 4.0,
                        margin: EdgeInsets.only(top: 12.0, bottom: 10.0),
                        decoration: BoxDecoration(
                            color: HexColor("#DEDEDE"),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12)))),
                  ],
                );
              });
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Text("DONE"),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // <-- Radius
          ),
          primary: HexColor("#855B28"), // background
          onPrimary: Colors.white, // foreground
        ),
      ),
    );
  }
}

class buttonDone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
        child: TextButton(
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Text("Done",
                style: TextStyle(
                  fontSize: 16.0,
                  color: HexColor("#FFFFFF"),
                )),
          ),
        ),
        decoration: BoxDecoration(
            color: HexColor("#855B28"),
            borderRadius: BorderRadius.all(Radius.circular(12))));
  }
}

class buttonInProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
        child: TextButton(
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Text("In Progress",
                style: TextStyle(
                  fontSize: 16.0,
                  color: HexColor("#855B28"),
                )),
          ),
        ),
        decoration: BoxDecoration(
            color: HexColor("#F7F2F2"),
            borderRadius: BorderRadius.all(Radius.circular(12))));
  }
}

class buttonToDo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 32.0),
        child: TextButton(
          onPressed: () {},
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Text("To Do",
                style: TextStyle(
                  fontSize: 16.0,
                  color: HexColor("#855B28"),
                )),
          ),
        ),
        decoration: BoxDecoration(
            color: HexColor("#F7F2F2"),
            borderRadius: BorderRadius.all(Radius.circular(12))));
  }
}
