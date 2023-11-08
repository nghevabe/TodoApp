import 'package:flutter/material.dart';
import 'package:todo_app/ui/detail/detail_screen_controller.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../base_component/bottom_sheet_status.dart';

class ButtonStatus extends StatelessWidget {
  final String title;
  final BuildContext context;
  final DetailScreenController detailScreenController;

  const ButtonStatus(
      {super.key,
      required this.title,
      required this.context,
      required this.detailScreenController});

  @override
  Widget build(BuildContext context) {
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
              style: const TextStyle(
                fontSize: 12.0,
              )),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // <-- Radius
          ),
          backgroundColor: HexColor("#855B28"), // background
          foregroundColor: Colors.white, // foreground
        ),
      ),
    );
  }
}
