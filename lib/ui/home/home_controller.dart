import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/base_view/base_controller.dart';

import '../base_component/task_item.dart';

class HomeController extends BaseController {
  String dataLoaded = "";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final listTaskData = <TaskItem>[
    TaskItem("Task A", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor X", 1),].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

  }

  void getTaskData() {


      // final parsed = jsonDecode(dataLoaded).cast<Map<String, dynamic>>();

      // listTaskData.value = parsed.map<TaskItem>((json) => TaskItem.fromJson(json)).toList();

     listTaskData.value = <TaskItem>[
      TaskItem("Task A", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod XXX", 1),
      TaskItem("Task B", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod XXX", 2),
      TaskItem("Task C", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod XXX", 3),
      TaskItem("Task D", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod XXX", 3),];

      print("itemData Count: "+ listTaskData.length.toString());


  }

}