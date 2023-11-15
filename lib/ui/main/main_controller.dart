import 'package:get/get.dart';
import 'package:todo_app/base_view/base_controller.dart';

class MainController extends BaseController {

  final indexTab = 0.obs;
  final indexTabStatus = 0.obs;
  final icTab1Color = "".obs;
  final icTab2Color = "".obs;
  final icTab3Color = "".obs;
  final icTab4Color = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    icTab1Color.value = "#855B28";
    icTab2Color.value = "#5F6368";
    icTab3Color.value = "#5F6368";
    icTab4Color.value = "#5F6368";
  }

  void selectTab(int tab, int? tabStatus) {
    indexTab.value = tab;
    indexTabStatus.value = tabStatus ?? 0;

    if(tab == 0) {
      icTab1Color.value = "#855B28";
      icTab2Color.value = "#5F6368";
      icTab3Color.value = "#5F6368";
      icTab4Color.value = "#5F6368";
    } else if(tab==1) {
      icTab1Color.value = "#5F6368";
      icTab2Color.value = "#855B28";
      icTab3Color.value = "#5F6368";
      icTab4Color.value = "#5F6368";

    } else if(tab==2) {
      icTab1Color.value = "#5F6368";
      icTab2Color.value = "#5F6368";
      icTab3Color.value = "#855B28";
      icTab4Color.value = "#5F6368";

    } else {
      icTab1Color.value = "#5F6368";
      icTab2Color.value = "#5F6368";
      icTab3Color.value = "#5F6368";
      icTab4Color.value = "#855B28";
    }

  }

}