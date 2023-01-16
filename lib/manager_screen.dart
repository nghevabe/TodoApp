import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/TaskItem.dart';
import 'package:todo_app/utils/util_components.dart';

class MyManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: StatefulManagerBody());
  }
}

class StatefulManagerBody extends StatefulWidget {
  StatefulManagerBody({Key? key}) : super(key: key);

  @override
  ManagerBody createState() {
    return new ManagerBody();
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
    padding: const EdgeInsets.only(left: 16.0),

  );
}

Widget _cardHeader() {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 180.0),
    alignment: Alignment.topLeft,
    child: Container(
      decoration:  const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          )
      ),
      child: _tabMenu(),
    ),
  );
}

class ManagerBody extends State<StatefulManagerBody> {

  ManagerBody({Key? key}) : super();
  String value = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        _cardManager(),
        _cardBody(),
        CardTaskItem(
          titleTask: "Sleep",
          contendTask:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
          priority: 3,
        ),
        SizedBox(height: 16),
        CardTaskItem(
          titleTask: "Sleep",
          contendTask:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
          priority: 2,
        ),
        SizedBox(height: 16),
        CardTaskItem(
          titleTask: "Sleep",
          contendTask:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
          priority: 1,
        )
      ],
    ));
  }
}

Widget _tabMenu() {
  return Container(
    padding: EdgeInsets.only(top: 16.0, bottom: 10.0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Text("To do",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: HexColor("#855B28"),
              )),
        ),
        Expanded(
          child: Text("In Progress",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: HexColor("#855B28"),
              )),
        ),
        Expanded(
          child: Text("Done",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: HexColor("#855B28"),
              )),
        ),
      ],
    ),
  );
}

Widget _cardBody() {
  return Container(
    margin: EdgeInsets.only(left: 10.0, right: 10.0),
    child: Column(
      children: [
        Divider(
          color: HexColor("#E6E6E6"),
        )
      ],
    ),
  );
}

Widget _cardManager(){

  return Stack(
    children: <Widget>[
      _headerScreen(),
      _cardHeader(),
    ],
  );
}
