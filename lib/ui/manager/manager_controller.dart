import 'package:get/get.dart';
import 'package:todo_app/base_view/base_controller.dart';

import '../base_component/date_item.dart';
import '../base_component/task_item.dart';

class ManagerController extends BaseController {
  final listTaskData = <TaskItem>[].obs;
  final listDate = <DateItem>[].obs;
  final title = "December".obs;

  final colorTab1 = "#855B28".obs;
  final colorTab2 = "#FFFFFF".obs;
  final colorTab3 = "#FFFFFF".obs;

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

  void getTaskData() {
    // final parsed = jsonDecode(dataLoaded).cast<Map<String, dynamic>>();

    // listTaskData.value = parsed.map<TaskItem>((json) => TaskItem.fromJson(json)).toList();

    listTaskData.value = <TaskItem>[
      TaskItem(
          titleTask: "Task A",
          contendTask: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod XXX",
          priority: 1),
      TaskItem(
          titleTask: "Task B",
          contendTask: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod XXX",
          priority: 2),
      TaskItem(
          titleTask: "Task C",
          contendTask: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod XXX",
          priority: 3),
      TaskItem(
          titleTask: "Task D",
          contendTask: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod XXX",
          priority: 3),
    ];

    print("itemData Count: " + listTaskData.length.toString());
  }
}
