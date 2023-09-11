import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../base_view/base_view.dart';
import 'main_controller.dart';
import 'package:hexcolor/hexcolor.dart';

class MainView extends BaseView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Obx(() =>  Scaffold(
      backgroundColor: Colors.white,
      body:
        _getBody(controller.indexTab.value),
      floatingActionButton: FloatingActionButton(
        //Floating action button on Scaffold
        onPressed: () async {},
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
      return Center(child: Text("Home1"));
    } else if (index == 1) {
      return Center(child: Text("Home2"));
    } else if (index == 2) {
      return Center(child: Text("Home3"));
    } else {
      return Center(child: Text("Home4"));
    }
  }
}
