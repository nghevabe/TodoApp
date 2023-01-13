import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/TaskItem.dart';

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
        ),
        SizedBox(height: 16),
        CardTaskItem(
          titleTask: "Sleep",
          contendTask:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
        ),
        SizedBox(height: 16),
        CardTaskItem(
          titleTask: "Sleep",
          contendTask:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
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

Widget _cardManager(){

  return Stack(
    children: <Widget>[
      _headerScreen(),
      _cardHeader(),
    ],
  );
}
