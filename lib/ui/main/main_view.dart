import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../base_view/base_view.dart';
import '../../router/route_name.dart';
import '../base_component/task_item.dart';
import '../home/home_view.dart';
import '../manager/manager_view.dart';
import 'main_controller.dart';
import 'package:hexcolor/hexcolor.dart';

class MainView extends BaseView<MainController> {
   MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Obx(() =>  Scaffold(
      backgroundColor: Colors.white,
      body:
        _getBody(controller.indexTab.value),
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () async {Get.toNamed(AppRouteName.add);},
        child: const Icon(Icons.add),
        backgroundColor: HexColor("#855B28"), //icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        shape: const CircularNotchedRectangle(), //shape of notch
        notchMargin:
        5, //notche margin between floating button and bottom appbar
        child:
        Row(
          //children inside bottom appbar
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.home,
                    color: HexColor(controller.icTab1Color.value)),
                onPressed: () {
                  controller.selectTab(0);
                }),
            IconButton(
                icon: Icon(Icons.file_copy,
                    color: HexColor(controller.icTab2Color.value)),
                onPressed: () {
                  controller.selectTab(1);
                }),
            IconButton(
                icon: Icon(Icons.notifications,
                    color: HexColor(controller.icTab3Color.value)),
                onPressed: () {
                  controller.selectTab(2);
                }),
            IconButton(
                icon: Icon(Icons.settings,
                    color: HexColor(controller.icTab4Color.value)),
                onPressed: () {
                  controller.selectTab(3);
                }),
          ],
        )
      ),
    ));
  }

  Widget _getBody(int index) {
    if (index == 0) {
      return HomeView();
    } else if (index == 1) {
      return ManagerView();
    } else if (index == 2) {
      return Center(child: Text("Home3"));
    } else {
      return Center(child: Text("Home4"));
    }
  }

  List<TaskItem> listTask = <TaskItem>[
    TaskItem(titleTask: "Task A", contendTask: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", priority: 1),
    TaskItem(titleTask: "Task B", contendTask: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", priority: 2),
    TaskItem(titleTask: "Task C", contendTask: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", priority: 3),
    TaskItem(titleTask: "Task D", contendTask: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", priority: 3),];

}
