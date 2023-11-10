import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/ui/base_component/task_item.dart';
import '../../base_view/base_view.dart';
import '../../router/route_name.dart';
import '../base_component/empty_task_view.dart';
import '../base_component/tab_bar_menu.dart';
import '../base_component/util_components.dart';
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
    ],
  ));
}

Widget _buildList(ManagerController controller, int status) {
  final listItem = controller.listTaskData.where((item) => item.status == status).toList();
  if (listItem.isNotEmpty) {
    return Column(
      children: listItem
          .asMap()
          .entries
          .map((entry) {
        TaskItem item = entry.value;
        return GestureDetector(
            onTap: () async {
              Get.toNamed(AppRouteName.detail, arguments: item);
            },
            child: CardTaskItem(
              titleTask: item.titleTask ?? "",
              contendTask: item.contendTask ?? "",
              priority: item.priority ?? 1,
              point: item.point ?? 1,
              dateTime: item.dateTime.toString(),
            ));
      }).toList(),
    );
  } else {
    String emptyTitle = "";
    switch (status) {
      case 1:
        emptyTitle = 'To do';
        break; // The switch statement must be told to exit, or it will execute every case.
      case 2:
        emptyTitle = 'In Progress';
        break;
      case 3:
        emptyTitle = 'Done';
        break;
      case 4:
        emptyTitle = 'Cancel';
        break;
    }
    return  Padding(
        padding: EdgeInsets.only(top: 200),
        child: EmptyTaskView(title: "${'No tasks'} $emptyTitle", contend: 'There is no task assigned to you. Check back later.')
    );
  }
}

Widget _cardManager(ManagerController controller) {
  return Stack(
    children: <Widget>[
      _headerScreen(controller),
      Container(
        margin: EdgeInsets.only(top: 180.0),
        alignment: Alignment.topLeft,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              )),
          // child: _tabMenu(controller),
          child: TabBarMenu(controller: controller, tabs: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Text("To do",
                  style: TextStyle(
                    fontSize: 16.0,
                  )),
            ),
            Text("In progress",
                style: TextStyle(
                  fontSize: 16.0,
                )),
            Text("Done",
                style: TextStyle(
                  fontSize: 16.0,
                )),
          ], tabsView: [
            _buildList(controller, 1),
            _buildList(controller, 2),
            _buildList(controller, 3),
          ],),
        ),
      ),

    ],
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
                onTap: () {
                  controller.clickOnDate(index);
                },
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
