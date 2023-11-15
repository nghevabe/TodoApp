import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../manager/manager_controller.dart';

class TabBarMenu extends StatelessWidget {
  TabBarMenu(
      {required this.controller,
      required this.tabs,
      required this.tabsView,
      this.initialIndex});

  final ManagerController controller;
  final List<Widget> tabs;
  final List<Widget> tabsView;
  final int? initialIndex;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: initialIndex ?? 0,
        child: Column(
          children: [
            Container(
              child: TabBar(
                physics: const NeverScrollableScrollPhysics(),
                indicatorColor: HexColor("#855B28"),
                labelColor: HexColor("#855B28"),
                unselectedLabelColor: HexColor("#7E7E7E"),
                tabs: tabs,
              ),
            ),
            Expanded(
              child: Container(
                height: 600,
                child: TabBarView(
                  children: tabsView,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
            )
          ],
        ));
  }
}
