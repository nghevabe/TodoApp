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
        _listOverView()
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
    padding: const EdgeInsets.only(left: 16.0, top: 16.0),
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
      margin: EdgeInsets.only(right: 16.0),
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
      child: new Card(
          child:Container(
            padding: EdgeInsets.only(top: 16.0),
            width: 200,
            height: 100,
            child:  Column(
              children: <Widget>[
                Text(taskNumber,
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    )),
                Text(contend,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    )),
              ],
            ),
          )
      ),
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 1, //spread radius
            blurRadius: 8, // blur radius
            offset: Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(left:8.0, right: 8.0),

    );
  }

}
