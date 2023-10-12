import 'package:get/get.dart';
import 'package:todo_app/base_view/base_controller.dart';

import '../base_component/task_item.dart';

class ManagerController extends BaseController {
  final listTaskData = <TaskItem>[
    TaskItem("Task A", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor X", 1),].obs;

  final colorTab1 = "#FFFFFF".obs;
  final colorTab2 = "#FFFFFF".obs;
  final colorTab3 = "#FFFFFF".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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