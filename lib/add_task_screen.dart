import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/TaskItem.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const AddTaskBody(),
      },
    );
  }
}

class AddTaskBody extends StatelessWidget {
  const AddTaskBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body:  Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: AddTaskForm(),
          ),
        ),
      ),
    );
  }
}

class AddTaskForm extends StatefulWidget {
  AddTaskForm();
  String titleTask = "";
  String contentTask = "";
  String priorityTask = "";
  String pointTask = "";
  String dateTask = "";

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();

}

class _AddTaskFormState extends State<AddTaskForm> {
  final double _formProgress = 0;
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(

        children: [
          LinearProgressIndicator(value: _formProgress),
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
                  hintStyle: TextStyle(fontSize: 16.0, color: HexColor("#828282")),
                  contentPadding: const EdgeInsets.all(15),
                  enabledBorder:  OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:  BorderSide(color: HexColor("#C3A87B"), width: 1.0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4))),
              onChanged: (value) {
                // do something
                setState(() {
                  widget.titleTask = value;
                });

              },
            ),
          ),

          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 16.0,top: 24.0),
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
                  hintStyle: TextStyle(fontSize: 16.0, color: HexColor("#828282")),
                  contentPadding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 100),
                  enabledBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: BorderSide(color: HexColor("#C3A87B"), width: 1.0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4))),
              onChanged: (value) {
                // do something
                setState(() {
                  widget.contentTask = value;
                });

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
                        border: Border.all(color: HexColor("#C3A87B"), width: 1),
                        //border of dropdown button
                        borderRadius: BorderRadius.circular(
                            4), //border raiuds of dropdown button
                        boxShadow: [
                          BoxShadow(
                            color: HexColor("#C4C4C4").withOpacity(0.2), //color of shadow
                            spreadRadius: 1.0, //spread radius
                            blurRadius: 3, // blur radius
                            offset: const Offset(4, 4), // changes position of shadow
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
                              DropdownMenuItem(child: Text("Low"), value: "Low"),
                              DropdownMenuItem(
                                  child: Text("Medium"), value: "Medium"),
                              DropdownMenuItem(child: Text("High"), value: "High"),
                            ],
                            onChanged: (value) {
                              //get value when changed
                              setState(() {
                                widget.priorityTask = value.toString();
                              });
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
                            dropdownColor:
                            HexColor("#855B28"), //dropdown background color
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
                              offset: const Offset(4, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        margin: EdgeInsets.only(right: 16.0),
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: HexColor("#F4F6F8"),
                              //background color of dropdown button
                              border: Border.all(color: HexColor("#C3A87B"), width: 1),
                              //border of dropdown button
                              borderRadius: BorderRadius.circular(4),
                              //border raiuds of dropdown button
                            ),
                            child: Container(
                                padding: EdgeInsets.only(left: 12, right: 12),
                                child: DropdownButton(
                                  underline: SizedBox(),
                                  value: "1",
                                  items: [
                                    //add items in the dropdown
                                    DropdownMenuItem(child: Text("1"), value: "1"),

                                    DropdownMenuItem(child: Text("2"), value: "2"),

                                    DropdownMenuItem(child: Text("3"), value: "3"),
                                  ],
                                  onChanged: (value) {
                                    //get value when changed
                                    setState(() {
                                      widget.pointTask = value.toString();
                                    });
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
                                  dropdownColor:
                                  HexColor("#855B28"), //dropdown background color
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
                color: HexColor("#F4F6F8"), //background color of dropdown button
                border: Border.all(color: HexColor("#C3A87B"), width:1), //border of dropdown button
                borderRadius: BorderRadius.circular(4), //border raiuds of dropdown button
                boxShadow: [
                  BoxShadow(
                    color: HexColor("#C4C4C4").withOpacity(0.2), //color of shadow
                    spreadRadius: 1.0, //spread radius
                    blurRadius: 3, // blur radius
                    offset: const Offset(4, 4), // changes position of shadow
                  ),
                ],
              ),
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Row (
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
                        hintStyle: TextStyle(fontSize: 16.0, color: HexColor("#828282")),
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
                          setState(() {
                            dateInput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                    ),
                  ),

                  Expanded(child: Container(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset('assets/ic_calender.svg',
                        color: HexColor("#C3A87B")),))
                ],
              )

          ),

          SizedBox(height: 32),
          Expanded(child: Container()),
          BtnAdd(titleTask: widget.titleTask, contentTask: widget.contentTask,
              priorityTask: widget.priorityTask, pointTask: widget.pointTask, dateTask: dateInput.text),

        ],
      ),
    );
  }
}

class PointPicker extends StatefulWidget {
  PointPicker({Key? key}) : super();
  String pointTask = "";

  @override
  State<StatefulWidget> createState() {
    return _PointPicker();
  }
}

class _PointPicker extends State<PointPicker> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
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
                offset: const Offset(4, 4), // changes position of shadow
              ),
            ],
          ),
          margin: EdgeInsets.only(right: 16.0),
          child: DecoratedBox(
              decoration: BoxDecoration(
                color: HexColor("#F4F6F8"),
                //background color of dropdown button
                border: Border.all(color: HexColor("#C3A87B"), width: 1),
                //border of dropdown button
                borderRadius: BorderRadius.circular(4),
                //border raiuds of dropdown button
              ),
              child: Container(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: DropdownButton(
                    underline: SizedBox(),
                    value: "1",
                    items: [
                      //add items in the dropdown
                      DropdownMenuItem(child: Text("1"), value: "1"),

                      DropdownMenuItem(child: Text("2"), value: "2"),

                      DropdownMenuItem(child: Text("3"), value: "3"),
                    ],
                    onChanged: (value) {
                      //get value when changed
                      setState(() {
                        widget.pointTask = value.toString();
                      });
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
                    dropdownColor:
                        HexColor("#855B28"), //dropdown background color
                  ))),
        )
      ],
    ));
  }
}

class PriorityPicker extends StatefulWidget {
  PriorityPicker({Key? key}) : super();
  String priorityTask = "";

  @override
  State<StatefulWidget> createState() {
    return _PriorityPicker();
  }
}

class _PriorityPicker extends State<PriorityPicker> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
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
                  border: Border.all(color: HexColor("#C3A87B"), width: 1),
                  //border of dropdown button
                  borderRadius: BorderRadius.circular(
                      4), //border raiuds of dropdown button
                  boxShadow: [
                    BoxShadow(
                      color: HexColor("#C4C4C4").withOpacity(0.2), //color of shadow
                      spreadRadius: 1.0, //spread radius
                      blurRadius: 3, // blur radius
                      offset: const Offset(4, 4), // changes position of shadow
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
                        DropdownMenuItem(child: Text("Low"), value: "Low"),
                        DropdownMenuItem(
                            child: Text("Medium"), value: "Medium"),
                        DropdownMenuItem(child: Text("High"), value: "High"),
                      ],
                      onChanged: (value) {
                        //get value when changed
                        setState(() {
                          widget.priorityTask = value.toString();
                        });
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
                      dropdownColor:
                          HexColor("#855B28"), //dropdown background color
                    ))))
      ],
    );
  }
}

class BtnAdd extends StatefulWidget {
  BtnAdd({Key? key, required this.titleTask, required this.contentTask,
  required this.priorityTask, required this.pointTask, required this.dateTask}) : super();
  String titleTask;
  String contentTask;
  String priorityTask;
  String pointTask;
  String dateTask;

  @override
  State<StatefulWidget> createState() {
    return _BtnAdd();
  }
}

class _BtnAdd extends State<BtnAdd> {

  List<TaskItem> listTaskItem = <TaskItem>[];
  String dataLoaded = "";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  void _getTaskData() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      dataLoaded = prefs.getString('task_data')!;

      final parsed = jsonDecode(dataLoaded).cast<Map<String, dynamic>>();

      listTaskItem = parsed.map<TaskItem>((json) => TaskItem.fromJson(json)).toList();

      print("itemData Count: "+ listTaskItem.length.toString());
    });
  }


  @override
  void initState() {
    super.initState();
    _getTaskData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: ElevatedButton(
        // onPressed: () {
        //   Navigator.pop(context);
        // },
        onPressed: () async {
          // print("titleTask: "+widget.titleTask);
          // print("contentTask: "+widget.contentTask);
          // print("priorityTask: "+widget.priorityTask);
          // print("pointTask: "+widget.pointTask);
          // print("dateTask: "+widget.dateTask);

          // setState() callback argument returned a Future.
          // TaskItem item = TaskItem("Task Bidv 1", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor", 2);


          TaskItem item = TaskItem(widget.titleTask, widget.contentTask, int.parse(widget.pointTask));

          print("itemData Count 2: "+ listTaskItem.length.toString());
          listTaskItem.add(item);

          String jsonstring = json.encode(listTaskItem);

          print("jsonstring Saved: "+jsonstring);

          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('task_data', jsonstring);
          print("Saved done");

          Navigator.of(context, rootNavigator: true).pop(context);
          // Navigator.pop(context);
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

class DatePicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DatePicker();
  }
}

class _DatePicker extends State<DatePicker> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

        padding: EdgeInsets.only(left: 12.0, right: 12.0),
        decoration: BoxDecoration(
          color: HexColor("#F4F6F8"), //background color of dropdown button
          border: Border.all(color: HexColor("#C3A87B"), width:1), //border of dropdown button
          borderRadius: BorderRadius.circular(4), //border raiuds of dropdown button
          boxShadow: [
            BoxShadow(
              color: HexColor("#C4C4C4").withOpacity(0.2), //color of shadow
              spreadRadius: 1.0, //spread radius
              blurRadius: 3, // blur radius
              offset: const Offset(4, 4), // changes position of shadow
            ),
          ],
        ),
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Row (
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
                  hintStyle: TextStyle(fontSize: 16.0, color: HexColor("#828282")),
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
                    setState(() {
                      dateInput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {}
                },
              ),
            ),

            Expanded(child: Container(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset('assets/ic_calender.svg',
                  color: HexColor("#C3A87B")),))
          ],
        )

    );
  }
}
