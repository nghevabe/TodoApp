import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../base_view/base_controller.dart';
import '../base_component/task_item.dart';

class AddTaskController extends BaseController {
  final listTaskItem = <TaskItem>[].obs;
  final inputTitle = "".obs;
  final inputContend = "".obs;
  final inputPoint = 0.obs;
  final inputPriority = "".obs;
  final inputDate = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void saveTask(TaskItem taskItem) async {
    TaskItem item = TaskItem(
        titleTask: taskItem.titleTask,
        contendTask: taskItem.contendTask,
        priority: taskItem.priority);

    listTaskItem.add(item);

    String jsonstring = json.encode(listTaskItem);

    print("jsonstring Saved: " + jsonstring);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('task_data', jsonstring);

  }

}