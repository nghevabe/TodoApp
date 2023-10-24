import 'package:get/get.dart';
import 'package:todo_app/base_view/base_controller.dart';
import '../base_component/task_item.dart';

class DetailScreenController extends BaseController {
  final dataLoaded = "".obs;
  final taskItem = TaskItem().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    taskItem.value = Get.arguments;
  }


}