import 'package:get/get.dart';
import 'app_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppService());
  }
}
