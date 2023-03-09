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

          DecoratedBox(
              decoration: BoxDecoration(
                color: HexColor("#F4F6F8"), //background color of dropdown button
                border: Border.all(color: HexColor("#C3A87B"), width:1), //border of dropdown button
                borderRadius: BorderRadius.circular(4), //border raiuds of dropdown button
              ),

              child:Padding(
                  padding: EdgeInsets.only(left:12, right:8),
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
                    icon: Padding( //Icon at tail, arrow bottom is default icon
                        padding: EdgeInsets.only(left:8),
                        child:Icon(Icons.arrow_circle_down_sharp)
                    ),
                    iconEnabledColor: HexColor("#C3A87B"), //Icon color
                    style: TextStyle(  //te
                        color: Colors.grey, //Font color
                        fontSize: 16 //font size on dropdown button
                    ),
                    dropdownColor: HexColor("#855B28"), //dropdown background color
                  )
              )
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