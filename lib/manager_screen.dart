import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
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
    width: double.infinity,
    height: 200,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 42.0),
            alignment: Alignment.center,
            child: Text(
              "December",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  _itemDate(),
                  _itemDate(),
                  _itemDate(),
                  _itemDate(),
                  _itemDate(),
                  _itemDate(),
                  _itemDate(),
                ],
              ),
            ),
          ),
        ],
      )
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
        ),
        SizedBox(height: 16),
        CardTaskItem(
          titleTask: "Sleep",
          contendTask:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
          priority: 1,
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
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  "Todo",
                  style: TextStyle(
                      color: HexColor("#855B28"),
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 4),
              Container(
                height: 2,
                width: 50,
                color: HexColor("#855B28"),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  "In progress",
                  style: TextStyle(
                      color: HexColor("#855B28"),
                      fontSize: 16.0),
                ),
              ),
              SizedBox(height: 4),
              Container(
                height: 2,
                width: 50,
                color: HexColor("#FFFFFF"),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    "Done",
                    style: TextStyle(
                        color: HexColor("#855B28"),
                        fontSize: 16.0),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  height: 2,
                  width: 50,
                  color: HexColor("#FFFFFF"),
                )
              ],
            ),
          ),
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

Widget _getListItemDate() {
  return Row(
    children: [
      _itemDate(),
      _itemDate(),
      _itemDate(),
      _itemDate(),
      _itemDate(),
      _itemDate(),
    ],
  );
}

Widget _itemDate(){
  return Container(
    height: 66.0,
    margin: EdgeInsets.only(left: 12.0, right: 12.0),
    padding: EdgeInsets.only(left: 8.0, top: 12.0, right: 8.0, bottom: 12.0),
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.55),
        borderRadius:
        BorderRadius.all(Radius.circular(16))),
    child: Column(
      children: [
        Container(
          child: Text(
            "Mon",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 4),
        Container(
          margin: EdgeInsets.only(top: 4.0),
          child: Text(
            "18",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
