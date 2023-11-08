import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/ui/detail/detail_screen_controller.dart';
import 'button_item_status.dart';

class BottomSheetStatus {
  final BuildContext context;
  final DetailScreenController detailScreenController;

  BottomSheetStatus(
      {required this.context, required this.detailScreenController});

  Future show() {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  width: 40.0,
                  height: 4.0,
                  margin: EdgeInsets.only(top: 8.0),
                  decoration: BoxDecoration(
                      color: HexColor("#DEDEDE"),
                      borderRadius: BorderRadius.all(Radius.circular(12)))),
              Container(
                margin: EdgeInsets.only(top: 24.0, bottom: 28.0),
                child: Text("Select Status"),
              ),
              ButtonItemStatus(
                  title: 'Done',
                  status: 3,
                  colorCodeText: '#FFFFFF',
                  colorCodeBackGround: '#855B28',
                  controller: detailScreenController),
              ButtonItemStatus(
                  title: 'In Progress',
                  status: 2,
                  colorCodeText: '#855B28',
                  colorCodeBackGround: '#F7F2F2',
                  controller: detailScreenController),
              ButtonItemStatus(
                  title: 'To Do',
                  status: 1,
                  colorCodeText: '#855B28',
                  colorCodeBackGround: '#F7F2F2',
                  controller: detailScreenController),
              Container(
                  width: 120.0,
                  height: 4.0,
                  margin: EdgeInsets.only(top: 12.0, bottom: 10.0),
                  decoration: BoxDecoration(
                      color: HexColor("#DEDEDE"),
                      borderRadius: BorderRadius.all(Radius.circular(12)))),
            ],
          );
        });
  }
}
