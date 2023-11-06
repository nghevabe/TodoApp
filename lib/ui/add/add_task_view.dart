import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../base_view/base_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../router/route_name.dart';
import '../base_component/task_item.dart';
import 'add_task_controller.dart';

class AddTaskView extends BaseView<AddTaskController> {
  TextEditingController dateInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return _addTaskBody(controller, context);
  }

  Widget _addTaskBody(AddTaskController controller, BuildContext context) {
    return Card(
      child: _addTaskForm(context),
    );
  }

  Widget _addTaskForm(BuildContext context) {
    return Obx(() => Form(
      child: Column(
        children: [
          // LinearProgressIndicator(value: _formProgress),
          LinearProgressIndicator(value: 0),
          SizedBox(height: 40),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 16.0),
            child: const Text("Title",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                )),
          ),
          SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: HexColor("#C4C4C4").withOpacity(0.3), //color of shadow
                  spreadRadius: 1.0, //spread radius
                  blurRadius: 3, // blur radius
                  offset: const Offset(4, 4), // changes position of shadow
                ),
              ],
            ),
            margin: EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Task Title',
                  filled: true,
                  fillColor: HexColor("#F4F6F8"),
                  hintStyle:
                      TextStyle(fontSize: 16.0, color: HexColor("#828282")),
                  contentPadding: const EdgeInsets.all(15),
                  enabledBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:
                        BorderSide(color: HexColor("#C3A87B"), width: 1.0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4))),
              onChanged: (value) {
                controller.inputTitle.value = value;
              },
            ),
          ),

          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 16.0, top: 24.0),
            child: const Text("Content",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                )),
          ),

          SizedBox(height: 6),

          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: HexColor("#C4C4C4").withOpacity(0.3), //color of shadow
                  spreadRadius: 1.0, //spread radius
                  blurRadius: 3, // blur radius
                  offset: const Offset(4, 4), // changes position of shadow
                ),
              ],
            ),
            margin: EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              textAlignVertical: TextAlignVertical.top,
              keyboardType: TextInputType.multiline,
              minLines: 1, // <-- SEE HERE
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: 'Description Task',
                  filled: true,
                  fillColor: HexColor("#F4F6F8"),
                  hintStyle:
                      TextStyle(fontSize: 16.0, color: HexColor("#828282")),
                  contentPadding: const EdgeInsets.only(
                      left: 15, top: 15, right: 15, bottom: 100),
                  enabledBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:
                        BorderSide(color: HexColor("#C3A87B"), width: 1.0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4))),
              onChanged: (value) {
                controller.inputContend.value = value;
              },
            ),
          ),
          Row(
            children: [
              // PriorityPicker Widget
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 16.0, top: 24.0),
                    child: const Text("Priority",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(height: 12),
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 16.0),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: HexColor("#F4F6F8"),
                            //background color of dropdown button
                            border: Border.all(
                                color: HexColor("#C3A87B"), width: 1),
                            //border of dropdown button
                            borderRadius: BorderRadius.circular(
                                4), //border raiuds of dropdown button
                            boxShadow: [
                              BoxShadow(
                                color: HexColor("#C4C4C4")
                                    .withOpacity(0.2), //color of shadow
                                spreadRadius: 1.0, //spread radius
                                blurRadius: 3, // blur radius
                                offset: const Offset(
                                    4, 4), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Container(
                              width: 214,
                              padding: EdgeInsets.only(left: 12),
                              child: DropdownButton(
                                underline: SizedBox(),
                                value: "Low",
                                items: const [
                                  //add items in the dropdown
                                  DropdownMenuItem(
                                      child: Text("Low"), value: "Low"),
                                  DropdownMenuItem(
                                      child: Text("Medium"), value: "Medium"),
                                  DropdownMenuItem(
                                      child: Text("High"), value: "High"),
                                ],
                                onChanged: (value) {
                                  //get value when changed
                                  controller.inputPriority.value =
                                      value.toString();
                                  print("You selected $value");
                                },
                                icon: Container(
                                    //Icon at tail, arrow bott
                                    width: 130,
                                    alignment: Alignment.centerRight,
                                    child: SvgPicture.asset(
                                      'assets/ic_task.svg',
                                      color: HexColor("#C3A87B"),
                                    )),
                                iconEnabledColor: HexColor("#C3A87B"),
                                //Icon color
                                style: TextStyle(
                                    //te
                                    color: HexColor("#828282"), //Font color
                                    fontSize: 16 //font size on dropdown button
                                    ),
                                dropdownColor: HexColor(
                                    "#855B28"), //dropdown background color
                              ))))
                ],
              ),

              SizedBox(width: 16),

              // PointPicker Widget
              Expanded(
                  child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 24.0),
                    child: const Text("Point",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        )),
                  ),
                  SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: HexColor("#C4C4C4").withOpacity(0.2),
                          //color of shadow
                          spreadRadius: 1.0,
                          //spread radius
                          blurRadius: 3,
                          // blur radius
                          offset:
                              const Offset(4, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(right: 16.0),
                    child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: HexColor("#F4F6F8"),
                          //background color of dropdown button
                          border:
                              Border.all(color: HexColor("#C3A87B"), width: 1),
                          //border of dropdown button
                          borderRadius: BorderRadius.circular(4),
                          //border raiuds of dropdown button
                        ),
                        child: Container(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            child: DropdownButton(
                              underline: SizedBox(),
                              value: 1,
                              items: [
                                //add items in the dropdown
                                DropdownMenuItem(child: Text("1"), value: 1),

                                DropdownMenuItem(child: Text("2"), value: 2),

                                DropdownMenuItem(child: Text("3"), value: 3),
                              ],
                              onChanged: (value) {
                                //get value when changed
                                controller.inputPoint.value =
                                    int.parse(value.toString());
                                print("You selected $value");
                              },
                              icon: Expanded(
                                  child: Row(
                                children: [
                                  Expanded(child: Container()),
                                  Container(
                                      //Icon at tail, arrow bott
                                      alignment: Alignment.centerRight,
                                      child: SvgPicture.asset(
                                        'assets/ic_star.svg',
                                        color: HexColor("#C3A87B"),
                                      ))
                                ],
                              )),

                              iconEnabledColor: HexColor("#C3A87B"),
                              //Icon color
                              style: TextStyle(
                                  //te
                                  color: HexColor("#828282"), //Font color
                                  fontSize: 16 //font size on dropdown button
                                  ),
                              dropdownColor: HexColor(
                                  "#855B28"), //dropdown background color
                            ))),
                  )
                ],
              )),
            ],
          ),

          SizedBox(height: 24),

          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 16.0),
            child: const Text("Date time",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                )),
          ),
          SizedBox(height: 6),

          // DatePicker Widget
          Container(
              padding: EdgeInsets.only(left: 12.0, right: 12.0),
              decoration: BoxDecoration(
                color:
                    HexColor("#F4F6F8"), //background color of dropdown button
                border: Border.all(
                    color: HexColor("#C3A87B"),
                    width: 1), //border of dropdown button
                borderRadius:
                    BorderRadius.circular(4), //border raiuds of dropdown button
                boxShadow: [
                  BoxShadow(
                    color:
                        HexColor("#C4C4C4").withOpacity(0.2), //color of shadow
                    spreadRadius: 1.0, //spread radius
                    blurRadius: 3, // blur radius
                    offset: const Offset(4, 4), // changes position of shadow
                  ),
                ],
              ),
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 250.0,
                    child: TextField(
                      controller: dateInput,
//editing controller of this TextField
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Pick Date',
                        hintStyle: TextStyle(
                            fontSize: 16.0, color: HexColor("#828282")),
                      ),
                      readOnly: true,
//set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
//DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          controller.inputDate.value = formattedDate;
                        } else {}
                      },
                    ),
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset('assets/ic_calender.svg',
                        color: HexColor("#C3A87B")),
                  ))
                ],
              )),

          SizedBox(height: 32),
          Expanded(child: Container()),

          _btnAddTask(
              context,
              TaskItem(
                  titleTask: controller.inputTitle.value,
                  contendTask: controller.inputContend.value,
                  priority: controller.inputPoint.value)),
        ],
      ),
    ));
  }

  Widget _btnAddTask(BuildContext context, TaskItem taskItem) {
    List<TaskItem> listTaskItem = <TaskItem>[];
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: ElevatedButton(
        onPressed: () async {

          controller.saveTask(taskItem);
          // TaskItem item = TaskItem(
          //     titleTask: taskItem.titleTask,
          //     contendTask: taskItem.contendTask,
          //     priority: taskItem.priority);
          //
          // listTaskItem.add(item);
          //
          // String jsonstring = json.encode(listTaskItem);
          //
          // print("jsonstring Saved: " + jsonstring);
          //
          // final SharedPreferences prefs = await SharedPreferences.getInstance();
          // await prefs.setString('task_data', jsonstring);

          // Navigator.of(context, rootNavigator: true).pop(context);
          Future.delayed(const Duration(milliseconds: 1500), () {
            Get.offAllNamed(AppRouteName.main);
          });
        },
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Text("ADD"),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // <-- Radius
          ),
          primary: HexColor("#855B28"), // background
          onPrimary: Colors.white, // foreground
        ),
      ),
    );
  }
}
