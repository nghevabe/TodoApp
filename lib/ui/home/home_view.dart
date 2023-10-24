import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/ui/base_component/task_item.dart';
import '../../base_view/base_view.dart';

import '../base_component/util_components.dart';
import 'home_controller.dart';

class HomeView extends BaseView<HomeController> {
  //MyHome({Key? key, required this.listTask}) : super(key: key);

  // List<TaskItem> listTask;
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return StatefulHomeBody(listTask: listTask);
    controller.getTaskData();
    return Obx(() => _homeBody(context, controller.listTaskData));
  }
}

Widget _homeBody(BuildContext context, List<TaskItem> listTask) {
  return SingleChildScrollView(
      child: Column(
    children: [
      _headerScreen(),
      _titleOverview(),
      SizedBox(height: 16),
      _listOverView(),
      _titleHighPriority(),
      SizedBox(height: 16),
      Column(
        children: listTask.asMap().entries.map((entry) {
          int index = entry.key;
          TaskItem item = entry.value;
          return GestureDetector(
              onTap: () async {
                print(
                    "Bidv Home Click Item Task: " + item.titleTask.toString());

                // final dataBack = await Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => DetailScreen()),
                // );
                //
                // if (dataBack) {
                //   setState(() {
                //     print("dataBack Home");
                //     _getTaskData();
                //   });
                // }
              },
              child: CardTaskItem(
                titleTask: item.titleTask.toString(),
                contendTask: item.contendTask.toString(),
                priority: item.priority ?? 0,
              ));
        }).toList(),
      ),
      SizedBox(height: 32),
    ],
  ));
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

Widget _titleOverview() {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 16.0, top: 32.0),
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
        SizedBox(height: 4),
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
        children: <Widget>[
          _cardOverView("5", "Todo", "#855B28"),
          _cardOverView("8", "In Progress", "#000000"),
        ],
      ));
}

Widget _lowerOverView() {
  return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _cardOverView("12", "Done", "#36976A"),
          _cardOverView("2", "To Day", "#FF9900")
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

Widget _cardOverView(String taskNumber, String contend, String textColor) {
  return Container(
    child: Card(
        child: Container(
      padding: const EdgeInsets.only(
          left: 32.0, top: 16.0, right: 32.0, bottom: 16.0),
      child: Column(
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
            child: Text(contend,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: HexColor(textColor),
                )),
          ),
        ],
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
    margin: const EdgeInsets.only(left: 2.0, right: 2.0),
  );
}
