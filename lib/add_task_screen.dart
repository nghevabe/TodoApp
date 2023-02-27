import 'package:flutter/material.dart';

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
                  fillColor: Colors.grey,
                  contentPadding: const EdgeInsets.all(15),
                  enabledBorder: const OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: const BorderSide(color: Colors.grey, width: 0.0),
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
                  fillColor: Colors.grey,
                  contentPadding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 100),
                  enabledBorder: const OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: const BorderSide(color: Colors.grey, width: 0.0),
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

          SizedBox(height: 12),

          DropdownButton<String>(
            items: <String>['Low', 'Medium', 'High'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          )
        ],
      ),
    );
  }
}