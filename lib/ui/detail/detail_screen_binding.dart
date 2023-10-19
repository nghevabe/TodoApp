import 'package:get/get.dart';
import 'package:todo_app/ui/detail/detail_screen_controller.dart';

class DetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailScreenController());
  }

}