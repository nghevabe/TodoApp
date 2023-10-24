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

  void getTaskData() {


      // final parsed = jsonDecode(dataLoaded).cast<Map<String, dynamic>>();

      // listTaskData.value = parsed.map<TaskItem>((json) => TaskItem.fromJson(json)).toList();

     listTaskData.value = <TaskItem>[
      TaskItem(titleTask: "Task A", contendTask: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod XXX", priority: 1),
      TaskItem(titleTask: "Task B", contendTask: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod XXX", priority: 2),
      TaskItem(titleTask: "Task C", contendTask: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod XXX", priority: 3),
      TaskItem(titleTask: "Task D", contendTask: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod XXX", priority: 3),];

      print("itemData Count: "+ listTaskData.length.toString());


  }

}