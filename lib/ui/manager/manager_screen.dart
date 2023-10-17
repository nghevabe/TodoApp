import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/ui/base_component/date_item.dart';
import 'package:todo_app/ui/base_component/task_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/ui/base_component/util_components.dart';
import 'dart:convert';

import '../detail/detail_screen.dart';

class MyManager extends StatelessWidget {
  List<TaskItem> listTask;
  MyManager(this.listTask, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: StatefulManagerBody(listTask: listTask));
  }
}

class StatefulManagerBody extends StatefulWidget {
  StatefulManagerBody({Key? key, required this.listTask}) : super(key: key);
  List<TaskItem> listTask;

  @override
  ManagerBody createState() {
    return ManagerBody();
  }
}

class ManagerBody extends State<StatefulManagerBody> {

  String dataLoaded = "";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  void _getTaskData() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      dataLoaded = prefs.getString('task_data')!;

      final parsed = jsonDecode(dataLoaded).cast<Map<String, dynamic>>();

      widget.listTask = parsed.map<TaskItem>((json) => TaskItem.fromJson(json)).toList();

      print("dataLoaded Manager: "+dataLoaded);
      print("itemData Count: "+ widget.listTask.length.toString());
    });

  }

  @override
  void initState() {
    super.initState();
    print("Manager Loaded");
    _getTaskData();
  }

  @override
  Widget build(BuildContext context) {
    print("Manager Loaded 2");
    return SingleChildScrollView(
        child: Column(
          children: [
            StateCardManager(selectedIndex: 0, listTask: widget.listTask,),
            _cardBody(),
            SizedBox(height: 16),
            Column(
              children:
              widget.listTask.asMap().entries.map((entry) {
                int index = entry.key;
                TaskItem item = entry.value;
                return  GestureDetector(
                    onTap: () async {
                      print("Bidv Click Item Task: "+item.titleTask);
                      final dataBack = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailScreen()),
                      );
                    },
                    child: CardTaskItem(titleTask: item.titleTask, contendTask: item.contendTask,
                      priority: item.priority,)
                );
              }).toList(),
            ),
          ],
        ));
  }
}

Widget _headerScreen() {

  List<DateItem> listDate = <DateItem>[
    DateItem("Mon", "8", false),
    DateItem("Tue", "9", false),
    DateItem("Wed", "10", false),
    DateItem("Thu", "11", false),
    DateItem("Fri", "12", false),
    DateItem("Sat", "13", false),];

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
            child: const Text(
              "December",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        // listDate
          const SizedBox(height:12),
          StatefulListItemDate(listDate: listDate)
        ],
      )
  );
}

class StateCardHeader extends StatefulWidget {

  StateCardHeader({Key? key, required this.selectedIndex, required this.listTask}) : super();
  int selectedIndex;
  List<TaskItem> listTask;

  @override
  CardHeader createState() {
    return CardHeader();
  }

}

class CardHeader extends State<StateCardHeader> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 180.0),
      alignment: Alignment.topLeft,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: StateTabMenu(selectedIndex: 0),
      ),
    );
  }
}



class StateTabMenu extends StatefulWidget {
  StateTabMenu({Key? key, required this.selectedIndex}) : super();
  int selectedIndex;

  @override
  TabMenu createState() {
    return TabMenu();
  }

}

class TabMenu extends State<StateTabMenu> {
  @override
  Widget build(BuildContext context) {
    String colorTab1 = "#FFFFFF";
    String colorTab2 = "#FFFFFF";
    String colorTab3 = "#FFFFFF";
    if (widget.selectedIndex == 0) {
      colorTab1 = "#855B28";
      colorTab2 = "#FFFFFF";
      colorTab3 = "#FFFFFF";
    } else if (widget.selectedIndex == 1) {
      colorTab1 = "#FFFFFF";
      colorTab2 = "#855B28";
      colorTab3 = "#FFFFFF";
    } else {
      colorTab1 = "#FFFFFF";
      colorTab2 = "#FFFFFF";
      colorTab3 = "#855B28";
    }
    return Container(
      padding: EdgeInsets.only(top: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    onTapHandler(0);
                  },
                  child: Container(
                    child: Text(
                      "Todo",
                      style: TextStyle(
                        color: HexColor("#855B28"),
                        fontSize: 16.0,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  height: 2,
                  width: 50,
                  color: HexColor(colorTab1),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print("Clike 2");
                    onTapHandler(1);
                  },
                  child: Container(
                    child: Text(
                      "In progress",
                      style:
                      TextStyle(color: HexColor("#855B28"), fontSize: 16.0),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  height: 2,
                  width: 50,
                  color: HexColor(colorTab2),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        print("Clike 3");
                        onTapHandler(2);
                      },
                      child: Container(
                        child: Text(
                          "Done",
                          style: TextStyle(
                              color: HexColor("#855B28"), fontSize: 16.0),
                        ),
                      )),
                  SizedBox(height: 4),
                  Container(
                    height: 2,
                    width: 50,
                    color: HexColor(colorTab3),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTapHandler(int index) {
    setState(() {
      widget.selectedIndex = index;
      StateTabMenu(selectedIndex: index);
    });
  }

}

Widget _cardBody() {
  return Container(
    color: HexColor("#E6E6E6"),
    height: 2.0,
    margin: EdgeInsets.only(left: 10.0, right: 10.0),
  );
}

class StateCardManager extends StatefulWidget{
  StateCardManager({Key? key, required this.selectedIndex, required this.listTask})
      : super();
  int selectedIndex;
  List<TaskItem> listTask;

  @override
  CardManager createState() {
    return CardManager();
  }

}

class CardManager extends State<StateCardManager> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _headerScreen(),
        StateCardHeader(selectedIndex: widget.selectedIndex, listTask: widget.listTask),
      ],
    );

  }

}

class StatefulListItemDate extends StatefulWidget {
  StatefulListItemDate({Key? key, required this.listDate}) : super(key: key);
  List<DateItem> listDate;

  @override
  ListItemDate createState() {
    return ListItemDate();
  }
}

class ListItemDate extends State<StatefulListItemDate> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: widget.listDate.asMap().entries.map((entry) {
            int index = entry.key;
            DateItem item = entry.value;
            return GestureDetector(
            onTap: () {
                onClickItem(index);
              },
              child: ItemDateCard(dayOfWeek: item.dayOfWeek,
                dayOfMonth: item.dayOfMonth, isSelected: item.isSelected));
          }).toList()
            )
        ),
    );

  }

  void onClickItem(int index) {
    setState(() {
      clearListDate();
      widget.listDate[index].isSelected = true;
      StatefulListItemDate(listDate: widget.listDate);
    });
  }

  void clearListDate(){
    for (int i = 0; i < widget.listDate.length; i++) {
      widget.listDate[i].isSelected = false;
    }
  }
  
}

class ItemDateCard extends StatelessWidget {
  ItemDateCard({Key? key,
    required this.dayOfWeek,
    required this.dayOfMonth,
    required this.isSelected}) : super(key: key);

  String dayOfWeek;
  String dayOfMonth;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    double transparentValue = 0.0;
    if (isSelected) {
      transparentValue = 0.55;
    }
    return Container(
      width: 60.0,
      height: 66.0,
      margin: EdgeInsets.only(left: 12.0, right: 12.0),
      padding: EdgeInsets.only(left: 8.0, top: 12.0, right: 8.0, bottom: 12.0),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(transparentValue),
          borderRadius:
          BorderRadius.all(Radius.circular(16))),
      child: Column(
        children: [
          Container(
            child: Text(
              dayOfWeek,
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
              dayOfMonth,
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
}
