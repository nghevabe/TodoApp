import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/base_view/base_controller.dart';

import '../base_component/task_item.dart';

class HomeController extends BaseController {
  String dataLoaded = "";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final listTaskData = <TaskItem>[
    TaskItem(titleTask: "Task A", contendTask: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor X", priority: 1),].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  void getTaskData() async {
    SharedPreferences prefs = await _prefs;
    if (prefs.getString('task_data') != null) {
      dataLoaded = prefs.getString('task_data')!;
      final parsed = jsonDecode(dataLoaded).cast<Map<String, dynamic>>();
      listTaskData.value =
          parsed.map<TaskItem>((json) => TaskItem.fromJson(json)).toList();
    }
  }

}