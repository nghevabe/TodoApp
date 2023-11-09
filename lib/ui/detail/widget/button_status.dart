import 'package:flutter/material.dart';
import 'package:todo_app/ui/detail/detail_screen_controller.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../base_component/bottom_sheet_status.dart';

class ButtonStatus extends StatelessWidget {
  final int status;
  final BuildContext context;
  final DetailScreenController detailScreenController;

  const ButtonStatus(
      {required this.status,
      required this.context,
      required this.detailScreenController});

  @override
  Widget build(BuildContext context) {
    String title = "";
    String colorBackground = "";
    String colorText = "";
    switch (status) {
      case 1:
        title = 'To do';
        colorText = "#FFFFFF";
        colorBackground = '#855B28';
        break; // The switch statement must be told to exit, or it will execute every case.
      case 2:
        title = 'In Progress';
        colorText = "#FFFFFF";
        colorBackground = '#638C79';
        break;
      case 3:
        title = 'Done';
        colorText = "#FFFFFF";
        colorBackground = '#36976A';
        break;
      case 4:
        title = 'Cancel';
        colorText = "#FFFFFF";
        colorBackground = '#F7F2F2';
        break;
    }
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: ElevatedButton(
        onPressed: () {
          BottomSheetStatus(
                  context: context,
                  detailScreenController: detailScreenController)
              .show();
        },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Text(title,
              style: TextStyle(
                fontSize: 12.0,
                color: HexColor(colorText),
              )),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // <-- Radius
          ),
          backgroundColor: HexColor(colorBackground), // background
          foregroundColor: Colors.white, // foreground
        ),
      ),
    );
  }
}
