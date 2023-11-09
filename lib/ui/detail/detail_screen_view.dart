import 'package:get/get.dart';
import 'package:todo_app/ui/detail/detail_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/ui/detail/widget/button_status.dart';
import '../../base_view/base_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../router/route_name.dart';


class DetailScreenView extends BaseView<DetailScreenController> {
  @override
  Widget build(BuildContext context) {
    return _detailBody(controller, context);
  }
}

Widget _detailBody(
    DetailScreenController detailScreenController, BuildContext context) {
  return Card(
    child: Column(
      children: [
        const SizedBox(height: 36),
        _headerScreen(context, detailScreenController),
        // StateHeaderScreen(),
        const SizedBox(height: 18),
        _titleTask(detailScreenController),
        const SizedBox(height: 32),
        _contentTask(detailScreenController),
        const SizedBox(height: 36),
        _footerScreen(detailScreenController),
        const Expanded(child: SizedBox()),
        ButtonStatus(
            status: detailScreenController.taskItem.value.status ?? 1,
            context: context,
            detailScreenController: detailScreenController),
      ],
    ),
  );
}

Widget _headerScreen(BuildContext context, DetailScreenController controller) {
  return Row(
    children: [
      InkWell(
        onTap: () {
          Get.back();
        },
        child: Container(
          margin: EdgeInsets.only(left: 16.0),
          child: SvgPicture.asset('assets/ic_back_left.svg'),
        ),
      ),
      Expanded(
        child: SizedBox(),
      ),
      Container(
        margin: EdgeInsets.only(right: 20.0),
        child: SvgPicture.asset('assets/ic_share.svg'),
      ),
      Container(
        margin: EdgeInsets.only(right: 20.0),
        child: SvgPicture.asset('assets/ic_edit.svg'),
      ),
      Container(
        margin: EdgeInsets.only(right: 12.0),
        child: GestureDetector(
            onTap: () {
              print("Click Delete");
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  content: const Text('Bạn có chắc muốn xóa Task này không ?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'false'),
                      child: const Text('Quay Lại'),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.deleteTask();
                        Navigator.pop(context, 'true');

                        Future.delayed(const Duration(milliseconds: 1500), () {
                          Get.offAllNamed(AppRouteName.main);
                        });
                        // onDelete(0, listTask);
                      },
                      child: const Text('Đồng Ý'),
                    ),
                  ],
                ),
              );
              // onDelete(0, listTask);
            },
            child: SvgPicture.asset('assets/ic_delete.svg')),
      ),
    ],
  );
}

Widget _titleTask(DetailScreenController controller) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 16.0),
    child: Text(controller.taskItem.value.titleTask ?? "",
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        )),
  );
}

Widget _contentTask(DetailScreenController controller) {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 16.0, right: 16.0),
    child: Text(controller.taskItem.value.contendTask.toString(),
        style: TextStyle(
          fontSize: 16.0,
          color: HexColor("#7E7E7E"),
        )),
  );
}

Widget _footerScreen(DetailScreenController controller) {
  String priorityValue;
  String priorityColor;

  int priority = controller.taskItem.value.priority ?? 1;

  if (priority == 1) {
    priorityValue = "Low";
    priorityColor = "#638C79";
  } else if (priority == 2) {
    priorityValue = "Medium";
    priorityColor = "#C3A87B";
  } else if (priority == 3) {
    priorityValue = "High";
    priorityColor = "#FF9900";
  } else {
    priorityValue = "None";
    priorityColor = "#FFFFFF";
  }

  return Row(
    children: [
      Container(
          child: Container(
        margin: EdgeInsets.only(left: 16.0),
        padding:
            EdgeInsets.only(left: 10.0, top: 6.0, right: 10.0, bottom: 6.0),
        decoration: BoxDecoration(
            color: HexColor(priorityColor),
            borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Text(priorityValue,
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
                  child: Text(controller.taskItem.value.point.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
                child: Text(controller.taskItem.value.dateTime.toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
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
