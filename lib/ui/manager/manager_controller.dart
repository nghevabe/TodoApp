import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/base_view/base_controller.dart';

import '../base_component/date_item.dart';
import '../base_component/task_item.dart';

class ManagerController extends BaseController {
  String dataLoaded = "";
  final listTaskData = <TaskItem>[].obs;
  final listDate = <DateItem>[].obs;
  final title = "December".obs;

  final colorTab1 = "#855B28".obs;
  final colorTab2 = "#FFFFFF".obs;
  final colorTab3 = "#FFFFFF".obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initDates();
    getTaskData();
  }

  void clickOnDate(int index) {
    title.value = index.toString();
    for (int i = 0; i < listDate.length; i++) {
      listDate[i].isSelected = false;
    }
    listDate[index].isSelected = true;
    title.value = "December";
  }

  void clickOnTab(int index) {
    if (index == 0) {
      colorTab1.value = "#855B28";
      colorTab2.value = "#FFFFFF";
      colorTab3.value = "#FFFFFF";
    } else if (index == 1) {
      colorTab1.value = "#FFFFFF";
      colorTab2.value = "#855B28";
      colorTab3.value = "#FFFFFF";
    } else {
      colorTab1.value = "#FFFFFF";
      colorTab2.value = "#FFFFFF";
      colorTab3.value = "#855B28";
    }
  }

  void initDates() {
    listDate.value = <DateItem>[
      DateItem("Mon", "8", true),
      DateItem("Tue", "9", false),
      DateItem("Wed", "10", false),
      DateItem("Thu", "11", false),
      DateItem("Fri", "12", false),
      DateItem("Sat", "13", false),
    ];
  }

  void getTaskData() async {
    final listTaskDataX = <TaskItem>[
      TaskItem(
          titleTask: "Task A",
          contendTask:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor X",
          priority: 1,
          point: 1,
          dateTime: '2023-Nov-10',
          status: 1),
      TaskItem(
          titleTask: "Task A",
          contendTask:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor X",
          priority: 1,
          point: 1,
          dateTime: '2023-Nov-10',
          status: 1),
      TaskItem(
          titleTask: "Task A",
          contendTask:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor X",
          priority: 1,
          point: 1,
          dateTime: '2023-Nov-10',
          status: 1),
      TaskItem(
          titleTask: "Task A",
          contendTask:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor X",
          priority: 1,
          point: 1,
          dateTime: '2023-Nov-10',
          status: 1),
      TaskItem(
          titleTask: "Task A",
          contendTask:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor X",
          priority: 1,
          point: 1,
          dateTime: '2023-Nov-10',
          status: 1),
      TaskItem(
          titleTask: "Task A",
          contendTask:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor X",
          priority: 1,
          point: 1,
          dateTime: '2023-Nov-10',
          status: 1),
      TaskItem(
          titleTask: "Task A",
          contendTask:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor X",
          priority: 1,
          point: 1,
          dateTime: '2023-Nov-10',
          status: 1),
    ].obs;

    listTaskData.value = listTaskDataX;
    /*
    SharedPreferences prefs = await _prefs;
    if (prefs.getString('task_data') != null) {
      dataLoaded = prefs.getString('task_data')!;
      final parsed = jsonDecode(dataLoaded).cast<Map<String, dynamic>>();
      listTaskData.value =
          parsed.map<TaskItem>((json) => TaskItem.fromJson(json)).toList();
    }
     */
  }
}
