import 'package:get/get.dart';
import 'package:todo_app/ui/main/main_controller.dart';

import '../home/home_controller.dart';

class MainBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => HomeController());
  }

}