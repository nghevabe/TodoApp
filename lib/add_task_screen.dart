import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SignUpScreen(),
      },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm();

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();

  double _formProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(value: _formProgress),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 16.0,top: 24.0),
            child: const Text("Title",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                )),
          ),
          SizedBox(height: 6),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'BIDV',
                  filled: true,
                  fillColor: HexColor("#F4F6F8"),
                  contentPadding: const EdgeInsets.all(15),
                  enabledBorder:  OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:  BorderSide(color: HexColor("#C3A87B"), width: 0.0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4))),
              onChanged: (value) {
                // do something
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

            margin: EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              textAlignVertical: TextAlignVertical.top,
              keyboardType: TextInputType.multiline,
              minLines: 1, // <-- SEE HERE
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: 'Input contents',
                  filled: true,
                  fillColor: HexColor("#F4F6F8"),
                  contentPadding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 100),
                  enabledBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: BorderSide(color: HexColor("#C3A87B"), width: 0.0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4))),
              onChanged: (value) {
                // do something
              },
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 16.0,top: 24.0),
            child: const Text("Priority",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                )),
          ),

          SizedBox(height: 12),
          Row(
            children: [
              _priorityPicker(),
              SizedBox(width: 6),
              _pointPicker()
            ],
          ),

          SizedBox(height: 24)

          // DropdownButton<String>(
          //   items: <String>['Low', 'Medium', 'High'].map((String value) {
          //     return DropdownMenuItem<String>(
          //       value: value,
          //       child: Text(value),
          //     );
          //   }).toList(),
          //   onChanged: (_) {},
          // )
        ],
      ),
    );
  }
}

Widget _pointPicker() {

  return
    Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 16.0),
        child:
        DecoratedBox(
            decoration: BoxDecoration(
              color: HexColor("#F4F6F8"), //background color of dropdown button
              border: Border.all(color: HexColor("#C3A87B"), width:1), //border of dropdown button
              borderRadius: BorderRadius.circular(4), //border raiuds of dropdown button
            ),

            child:Container(
                width: 124,
                padding: EdgeInsets.only(left:12),
                child:DropdownButton(
                  underline: SizedBox(),
                  value: "1",
                  items: [ //add items in the dropdown
                    DropdownMenuItem(
                        child: Text("1"),
                        value: "1"
                    ),

                    DropdownMenuItem(
                        child: Text("2"),
                        value: "2"
                    ),

                    DropdownMenuItem(
                        child: Text("3"),
                        value: "3"
                    ),

                  ],
                  onChanged: (value){ //get value when changed
                    print("You selected $value");
                  },
                  icon: Container(
                    //Icon at tail, arrow bott
                      width: 96,
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.arrow_circle_down_sharp)),
                  iconEnabledColor: HexColor("#C3A87B"), //Icon color
                  style: TextStyle(  //te
                      color: Colors.grey, //Font color
                      fontSize: 16 //font size on dropdown button
                  ),
                  dropdownColor: HexColor("#855B28"), //dropdown background color
                )
            )
        )
    );

}

Widget _priorityPicker() {

  return
    Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(left: 16.0),
        child:
        DecoratedBox(
            decoration: BoxDecoration(
              color: HexColor("#F4F6F8"), //background color of dropdown button
              border: Border.all(color: HexColor("#C3A87B"), width:1), //border of dropdown button
              borderRadius: BorderRadius.circular(4), //border raiuds of dropdown button
            ),

            child:Container(
                width: 214,
                padding: EdgeInsets.only(left:12),
                child:DropdownButton(
                  underline: SizedBox(),
                  value: "Low",
                  items: [ //add items in the dropdown
                    DropdownMenuItem(
                        child: Text("Low"),
                        value: "Low"
                    ),

                    DropdownMenuItem(
                        child: Text("Medium"),
                        value: "Medium"
                    ),

                    DropdownMenuItem(
                        child: Text("High"),
                        value: "High"
                    ),

                  ],
                  onChanged: (value){ //get value when changed
                    print("You selected $value");
                  },
                  icon: Container(
                    //Icon at tail, arrow bott
                    width: 134,
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_circle_down_sharp)),
                iconEnabledColor: HexColor("#C3A87B"), //Icon color
                  style: TextStyle(  //te
                      color: Colors.grey, //Font color
                      fontSize: 16 //font size on dropdown button
                  ),
                  dropdownColor: HexColor("#855B28"), //dropdown background color
                )
            )
        )
    );

}