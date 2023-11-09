import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../router/route_name.dart';
import '../detail/detail_screen_controller.dart';
import 'package:hexcolor/hexcolor.dart';

class ButtonItemStatus extends StatelessWidget {
  const ButtonItemStatus({
    required this.title,
    required this.colorCodeText,
    required this.colorCodeBackGround,
    required this.status,
    required this.controller,
  });

  final String title;
  final String colorCodeText;
  final String colorCodeBackGround;
  final int status;
  final DetailScreenController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 32.0),
        child: TextButton(
          onPressed: () {
            controller.updateStatus(status);
            Future.delayed(const Duration(milliseconds: 1500), () {
              Get.offAllNamed(AppRouteName.main);
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(title,
                style: TextStyle(
                  fontSize: 12.0,
                  color: HexColor(colorCodeText),
                )),
          ),
        ),
        decoration: BoxDecoration(
            color: HexColor(colorCodeBackGround),
            borderRadius: BorderRadius.all(Radius.circular(12))));
  }
}
