import 'package:get/get.dart';
import 'package:todo_app/ui/detail/detail_screen_controller.dart';
import 'package:flutter/material.dart';
import '../../base_view/base_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class DetailScreenView extends BaseView<DetailScreenController> {
  @override
  Widget build(BuildContext context) {
    return _detailBody();
  }
}

Widget _detailBody() {

    return Card(
      child: Column(
        children: [
          SizedBox(height: 36),
          // StateHeaderScreen(),
          SizedBox(height: 18),
          _titleTask(),
          SizedBox(height: 32),
          _contentTask(),
          SizedBox(height: 36),
          _footerScreen(),
          Expanded(child: SizedBox()),
          // buttonStatus()
        ],
      ),
    );

}

Widget _titleTask() {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 16.0),
    child: Text("Task Bidv 1",
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        )),
  );
}

Widget _contentTask() {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 16.0, right: 16.0),
    child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
        style: TextStyle(
          fontSize: 16.0,
          color: HexColor("#7E7E7E"),
        )),
  );
}

Widget _footerScreen() {
  return Row(
    children: [
      Container(
          child: Container(
            margin: EdgeInsets.only(left: 16.0),
            padding:
            EdgeInsets.only(left: 10.0, top: 6.0, right: 10.0, bottom: 6.0),
            decoration: BoxDecoration(
                color: HexColor("#FF9900"),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Text("High",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
          )),
      Expanded(child: SizedBox()),
      Container(
          margin: const EdgeInsets.only(left: 12.0, top: 4.0),
          child: Row(
            children: [
              SvgPicture.asset('assets/ic_star.svg'),
              Container(
                margin: const EdgeInsets.only(right: 36.0),
                child: Container(
                  margin: EdgeInsets.only(left: 4.0),
                  child: const Text("3",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
              )
            ],
          )),
      Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(right: 16.0),
          child: Row(
            children: [
              SvgPicture.asset('assets/ic_calender.svg'),
              Container(
                margin: EdgeInsets.only(left: 4.0, top: 1.0),
                child: const Text("31 July 2021",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              )
            ],
          )),
    ],
  );
}

