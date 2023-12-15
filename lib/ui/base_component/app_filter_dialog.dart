import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/ui/base_component/button_primary.dart';
import 'package:todo_app/ui/base_component/custom_dialog.dart';
import 'package:hexcolor/hexcolor.dart';

class AppFilterDialog {
  final String titleHeader;
  final BuildContext context;
  final Function(String value)? onSubmit;

  AppFilterDialog({
    required this.titleHeader,
    required this.context,
    required this.onSubmit,
  });

  Future show() {
    String searchValue = "";
    return CustomDialog().show(
        context,
        content: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
          ),
          backgroundColor: Colors.white,
          child: Container(
            height: 200,
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.only(top: 12, bottom: 24),
                    child: Text(titleHeader, style: TextStyle(
                      fontSize: 24,
                      color: HexColor("#C3A87B")
                    ))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Input title Task",
                        filled: true,
                        fillColor: HexColor("#F4F6F8"),
                        hintStyle: const TextStyle(
                            fontSize: 16.0),
                        contentPadding: const EdgeInsets.all(15),
                        enabledBorder: OutlineInputBorder(
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:
                          BorderSide(color: HexColor("#C3A87B"), width: 1.0),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4))),
                    onChanged: (value) {
                      searchValue = value;
                    },
                  ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16.0),
                  child: ButtonPrimary(
                      title: 'Summit',
                      colorCodeText: '#FFFFFF',
                      colorCodeBackGround: '#C3A87B',
                      onClick: () {
                        onSubmit!(searchValue);
                        Get.back();
                      },),
                )
              ],
            ),

          ),
        ));
  }
}