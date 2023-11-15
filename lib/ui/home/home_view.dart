import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/ui/base_component/task_item.dart';
import '../../base_view/base_view.dart';

import '../../router/route_name.dart';
import '../base_component/empty_task_view.dart';
import '../base_component/util_components.dart';
import 'home_controller.dart';

class HomeView extends BaseView<HomeController> {
  //MyHome({Key? key, required this.listTask}) : super(key: key);
  // List<TaskItem> listTask;
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return StatefulHomeBody(listTask: listTask);
    return Obx(() => _homeBody(context, controller.listTaskData, controller));
  }
}

Widget _homeBody(
    BuildContext context, List<TaskItem> listTask, HomeController controller) {
  return SingleChildScrollView(
      child: Container(
    child: Column(
      children: [
        _headerScreen(),
        _titleOverview(controller),
        SizedBox(height: 16),
        _listOverView(controller),
        _titleHighPriority(),
        SizedBox(height: 16),
        Visibility(
          visible: controller.listTaskData.isEmpty,
          child: Padding(
              padding: EdgeInsets.only(top: 32),
              child: EmptyTaskView(
                  title: 'No tasks',
                  contend:
                      'There is no task assigned to you. Check back later.')),
        ),
        Visibility(
          visible: controller.listTaskData.isNotEmpty,
          child: _listHighPriority(listTask),
        ),
        SizedBox(height: 32),
      ],
    ),
  ));
}

Widget _listHighPriority(List<TaskItem> listTask) {
  final listItem =
      listTask.where((item) => item.status == 1 || item.status == 2).toList();
  return Column(
    children: listItem.asMap().entries.map((entry) {
      TaskItem item = entry.value;
      return GestureDetector(
          onTap: () async {
            Get.toNamed(AppRouteName.detail, arguments: item);
          },
          child: CardTaskItem(
            titleTask: item.titleTask.toString(),
            contendTask: item.contendTask.toString(),
            priority: item.priority ?? 1,
            point: item.point ?? 1,
            dateTime: item.dateTime.toString(),
          ));
    }).toList(),
  );
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
  ));
}

Widget _titleDate() {
  return Container(
    margin: EdgeInsets.only(left: 12.0),
    width: 200,
    child: const Text("Thứ 3, 21 tháng 2, 2023",
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

Widget _titleOverview(HomeController controller) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 16.0, top: 32.0),
    child: Text("Overview",
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.black,
        )),
  );
}

Widget _listOverView(HomeController controller) {
  return Container(
    child: Column(
      children: <Widget>[
        _upperOverView(controller),
        _lowerOverView(controller)
      ],
    ),
  );
}

Widget _upperOverView(HomeController controller) {
  return Container(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      _cardOverView(controller.todoCount.value.toString(), "To do", "#855B28", controller, 0),
      _cardOverView(controller.inProgressCount.value.toString(), "In Progress",
          "#000000", controller, 1),
    ],
  ));
}

Widget _lowerOverView(HomeController controller) {
  return Container(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      _cardOverView(controller.doneCount.value.toString(), "Done", "#36976A", controller, 2),
      _cardOverView("2", "To Day", "#FF9900", controller, 0)
    ],
  ));
}

Widget _titleHighPriority() {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 16.0, top: 32.0),
    child: const Text("High Priority",
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.black,
        )),
  );
}

Widget _cardOverView(String taskNumber, String contend, String textColor, HomeController controller, int indexStatus) {
  return Container(
    child: Card(
        child: InkWell(
          onTap: () {controller.goToManagerWithStatus(indexStatus);},
          child: Container(
      padding: const EdgeInsets.only(
            left: 32.0, top: 16.0, right: 32.0, bottom: 16.0),
      child: Column(
          children: <Widget>[
            Container(
              width: 110,
              alignment: Alignment.center,
              child: Text(taskNumber,
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: HexColor(textColor),
                  )),
            ),
            Container(
              width: 110,
              alignment: Alignment.center,
              child: Text(contend,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: HexColor(textColor),
                  )),
            ),
          ],
      ),
    ),
        )),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: HexColor("#C4C4C4").withOpacity(0.2), //color of shadow
          spreadRadius: 1.0, //spread radius
          blurRadius: 3, // blur radius
          offset: const Offset(5, 5), // changes position of shadow
        ),
      ],
    ),
    // margin: const EdgeInsets.only(left: 2.0, right: 2.0),
  );
}
