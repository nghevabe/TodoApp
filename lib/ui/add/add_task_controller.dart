import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../base_view/base_controller.dart';
import '../base_component/task_item.dart';

class StatusTaskConstant {
  static const int todo = 1;
  static const int inProgress = 2;
  static const int done = 3;
  static const int cancel = 4;
}

class AddTaskController extends BaseController {
  final listTaskItem = <TaskItem>[].obs;
  final inputTitle = "".obs;
  final inputContend = "".obs;
  final inputPoint = 1.obs;
  final inputPriority = 1.obs;
  final inputDate = "Pick date".obs;

  String dataLoaded = "";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadTask();
  }

  void saveTask(TaskItem taskItem) async {
    final idTask = DateTime.now().millisecondsSinceEpoch;
    TaskItem item = TaskItem(
        id: idTask.toString(),
        titleTask: taskItem.titleTask,
        contendTask: taskItem.contendTask,
        priority: taskItem.priority,
        point: taskItem.point,
        dateTime: taskItem.dateTime,
        status: StatusTaskConstant.todo);

    listTaskItem.add(item);

    String jsonstring = json.encode(listTaskItem);

    print("jsonstring Saved: " + jsonstring);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('task_data', jsonstring);
  }

  void loadTask() async {
    SharedPreferences prefs = await _prefs;
    if (prefs.getString('task_data') != null) {
      dataLoaded = prefs.getString('task_data')!;
      final parsed = jsonDecode(dataLoaded).cast<Map<String, dynamic>>();
      listTaskItem.value =
          parsed.map<TaskItem>((json) => TaskItem.fromJson(json)).toList();
    }
  }
}
