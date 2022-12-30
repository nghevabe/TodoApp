import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomeScreen(title: 'Home'),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  MyHomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  String value = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: HomeBody());
  }
}

class HomeBody extends StatelessWidget {
  HomeBody({Key? key}) : super(key: key);
  String value = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _headerScreen(),
        _titleOverview(),
        _listOverView(),
        _titleHighPriority(),
        SizedBox(height: 16),
        CardTaskItem(titleTask: "Buy Fruits", contendTask: "XXX",),
        SizedBox(height: 16),
        CardTaskItem(titleTask: "Buy Fruits", contendTask: "XXX",),

      ],
    );
  }
}

Widget _headerScreen() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/bg_header.png"),
        fit: BoxFit.cover,
      ),
    ),
    height: 200,
    padding: const EdgeInsets.only(left: 16.0, top: 48.0),
    child: Row(
      children: <Widget>[_avatar(), _titleHeader(), _goDetailButton()],
    ),
  );
}

Widget _avatar() {
  return Container(
    width: 56.0,
    height: 200.0,
    alignment: Alignment.topLeft,
    child: const Image(image: AssetImage("assets/avatar_1.png")),
  );
}

Widget _titleHeader() {
  return Container(
    margin: const EdgeInsets.only(top: 8.0),
    child: Column(
      children: <Widget>[
        _titleDate(),
        _titleName(),
      ],
    ),
  );
}

Widget _goDetailButton() {
  return Expanded(
    child: Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(right: 16.0, top: 24.0),
      child: SvgPicture.asset('assets/ic_back_black.svg'),
    )
  );

}

Widget _titleDate() {
  return Container(
    margin: EdgeInsets.only(left: 12.0),
    width: 200,
    child: const Text("Thứ 3, 27 tháng 12, 2022",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        )),
  );
}

Widget _titleName() {
  return Container(
    margin: EdgeInsets.only(left: 12.0),
    width: 200,
    child: Text("Tran Hoang Linh",
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )),
  );
}

Widget _titleOverview() {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 16.0,top: 32.0),
    child: const Text("Overview",
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.black,
        )),
  );
}

Widget _listOverView() {
  return Container(
    margin: EdgeInsets.only(top: 32.0),
      child: Column(
        children: <Widget>[
          _upperOverView(),
          SizedBox(height: 16),
          _lowerOverView()
        ],
      ),
  );
}

Widget _upperOverView() {
  return Container(
    alignment: Alignment.center,
     child: Row(
       mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[CardOverView(taskNumber: "5",contend: "Todo"),
          CardOverView(taskNumber: "8",contend: "In Progress")],
      )
  );
}

Widget _lowerOverView() {
  return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[CardOverView(taskNumber: "12",contend: "Done"),
          CardOverView(taskNumber: "2",contend: "To Day")],
      )
  );
}

class CardOverView extends StatelessWidget {
  CardOverView({Key? key, required this.taskNumber, required this.contend})
      : super(key: key);

  final String taskNumber;
  final String contend;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          child:Container(
            padding: const EdgeInsets.only(left: 32.0, top: 16.0, right: 32.0, bottom: 16.0),
            child:  Column(
              children: <Widget>[
                Container(
                  width: 100,
                  alignment: Alignment.center,
                  child: Text(taskNumber,
                      style: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      )),
                ),
                Container(
                  width: 100,
                  alignment: Alignment.center,
                  child:Text(contend,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      )),
                ),
              ],
            ),
          )
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 1, //spread radius
            blurRadius: 8, // blur radius
            offset: const Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.only(left:8.0, right: 8.0),

    );
  }

}

Widget _titleHighPriority() {
  return Container(
    alignment: Alignment.centerLeft,
    margin: EdgeInsets.only(left: 16.0,top: 32.0),
    child: const Text("High Priority",
        style: TextStyle(
          fontSize: 24.0,
          color: Colors.black,
        )),
  );
}

class CardTaskItem extends StatelessWidget {
  const CardTaskItem({Key? key, required this.titleTask, required this.contendTask})
      : super(key: key);

  final String titleTask;
  final String contendTask;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          //set border radius more than 50% of height and width to make circle
        ),
          child:Container(
            width: 340,
            height: 112,
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 12.0, top: 8.0),
                  child: const Text("Buy Fruits",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 12.0, top: 8.0),
                  child: const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(top: 12.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 12.0, top: 8.0),
                        child: const Text("3",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ),

                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 42.0, top: 8.0),
                        child: const Text("30 Dec 2022",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
      ),


      decoration: BoxDecoration(
          // border: Border.all(
          //   color: Colors.red![500],
          // ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 1, //spread radius
            blurRadius: 8, // blur radius
            offset: const Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.only(left:8.0, right: 8.0),

    );
  }

}

