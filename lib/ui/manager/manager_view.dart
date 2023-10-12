import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/ui/base_component/task_item.dart';
import '../../base_view/base_view.dart';

import '../base_component/date_item.dart';
import '../base_component/util_components.dart';
import 'manager_controller.dart';

class ManagerView extends BaseView<ManagerController> {
  @override
  Widget build(BuildContext context) {
    controller.getTaskData();
    return Obx(() => _managerBody(context, controller));
  }
}

Widget _managerBody(BuildContext context, ManagerController controller) {
  return SingleChildScrollView(
      child: Column(
    children: [
      _cardManager(controller),
      _cardBody(),
      SizedBox(height: 16),
      Column(
        children: controller.listTaskData.asMap().entries.map((entry) {
          int index = entry.key;
          TaskItem item = entry.value;
          return GestureDetector(
              onTap: () async {
                print("Bidv Click Item Task: " + item.titleTask);

                // final dataBack = await Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => DetailScreen()),
                // );
              },
              child: CardTaskItem(
                titleTask: item.titleTask,
                contendTask: item.contendTask,
                priority: item.priority,
              ));
        }).toList(),
      ),
    ],
  ));
}

Widget _tabMenu(ManagerController controller) {
  return Container(
    padding: EdgeInsets.only(top: 16.0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  controller.clickOnTab(0);
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
                color: HexColor(controller.colorTab1.value),
              )
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  controller.clickOnTab(1);
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
                color: HexColor(controller.colorTab2.value),
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
                      controller.clickOnTab(2);
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
                  color: HexColor(controller.colorTab3.value),
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _cardManager(ManagerController controller) {
  return Stack(
    children: <Widget>[
      _headerScreen(),
      _cardHeader(controller),
    ],
  );
}

Widget _cardHeader(ManagerController controller) {
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
      child: _tabMenu(controller),
    ),
  );
}

Widget _cardBody() {
  return Container(
    color: HexColor("#E6E6E6"),
    height: 2.0,
    margin: EdgeInsets.only(left: 10.0, right: 10.0),
  );
}

Widget _headerScreen() {
  List<DateItem> listDate = <DateItem>[
    DateItem("Mon", "8", false),
    DateItem("Tue", "9", false),
    DateItem("Wed", "10", false),
    DateItem("Thu", "11", false),
    DateItem("Fri", "12", false),
    DateItem("Sat", "13", false),
  ];

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
          // listDate
          SizedBox(height: 12),
          _listItemDate(listDate)
        ],
      ));
}

Widget _listItemDate(List<DateItem> listDate) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Container(
        margin: EdgeInsets.only(top: 8.0),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: listDate.asMap().entries.map((entry) {
              int index = entry.key;
              DateItem item = entry.value;
              return GestureDetector(
                  onTap: () {},
                  child: _itemDateCard(
                      item.dayOfWeek, item.dayOfMonth, item.isSelected));
            }).toList())),
  );
}

Widget _itemDateCard(String dayOfWeek, String dayOfMonth, bool isSelected) {
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
        borderRadius: BorderRadius.all(Radius.circular(16))),
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
