import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/base_view/base_controller.dart';
import '../base_component/task_item.dart';

class DetailScreenController extends BaseController {
  final taskItem = TaskItem().obs;
  final listTaskData = <TaskItem>[].obs;

  String dataLoaded = "";
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    taskItem.value = Get.arguments;
  }

  void deleteTask() async {
    SharedPreferences prefs = await _prefs;
    if (prefs.getString('task_data') != null) {
      dataLoaded = prefs.getString('task_data')!;
      final parsed = jsonDecode(dataLoaded).cast<Map<String, dynamic>>();
      listTaskData.value =
          parsed.map<TaskItem>((json) => TaskItem.fromJson(json)).toList();

      for (int i = 0; i < listTaskData.length; i++) {
        if (listTaskData[i].id == taskItem.value.id){
          listTaskData.removeAt(i);
          break;
        }
      }

      String jsonstring = json.encode(listTaskData);

      await prefs.setString('task_data', jsonstring);
      print("Delete done");
    }
  }
}
