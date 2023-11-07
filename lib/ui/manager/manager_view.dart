import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/ui/base_component/task_item.dart';
import '../../base_view/base_view.dart';
import '../../router/route_name.dart';
import '../base_component/util_components.dart';
import '../detail/detail_screen.dart';
import 'manager_controller.dart';

class ManagerView extends BaseView<ManagerController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => _managerBody(context, controller));
  }
}

bool testDate(String inputDate, String fromDate, String toDate) {
  var inputFormat = DateFormat('dd/MM/yyyy');
  DateTime dtFrom = inputFormat.parse(fromDate);
  DateTime dtTo = inputFormat.parse(toDate);
  DateTime dtInput = inputFormat.parse(inputDate);

  return dtInput.isAfter(dtFrom) && dtInput.isBefore(dtTo);
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
          TaskItem item = entry.value;
          return GestureDetector(
              onTap: () async {
                print("Bidv Click Item Task: " + item.titleTask.toString());

                /*
                final dataBack = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen()),
                );
                */

                Get.toNamed(AppRouteName.detail, arguments: item);

              },
              child: CardTaskItem(
                titleTask: item.titleTask ?? "",
                contendTask: item.contendTask ?? "",
                priority: item.priority.toString(), point: item.point ?? 1,
              ));
        }).toList(),
      ),
    ],
  ));
}

Widget _tabMenu(ManagerController controller) {
  print("tabMenu");
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
      _headerScreen(controller),
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

Widget _headerScreen(ManagerController controller) {
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
              controller.title.value,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          // listDate
          SizedBox(height: 12),
          _listItemDate(controller)
        ],
      ));
}

Widget _listItemDate(ManagerController controller) {
  return Expanded(
    child: Container(
        margin: EdgeInsets.only(top: 8.0, bottom: 36),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: controller.listDate.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {controller.clickOnDate(index);},
                child: _itemDateCard(
                    controller.listDate[index].dayOfWeek,
                    controller.listDate[index].dayOfMonth,
                    controller.listDate[index].isSelected),
              );
            })),
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
