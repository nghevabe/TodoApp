import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/DateItem.dart';
import 'package:todo_app/utils/util_components.dart';

class MyManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: StatefulManagerBody());
  }
}

class StatefulManagerBody extends StatefulWidget {
  StatefulManagerBody({Key? key}) : super(key: key);

  @override
  ManagerBody createState() {
    return new ManagerBody();
  }
}

Widget _headerScreen() {

  List<DateItem> listDate = <DateItem>[
    DateItem("Mon", "8", false),
    DateItem("Mon", "8", false),
    DateItem("Mon", "8", false),
    DateItem("Mon", "8", false),
    DateItem("Mon", "8", false),
    DateItem("Mon", "8", false),];

  return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg_header.png"),
          fit: BoxFit.cover,
        ),
      ),
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 42.0),
            alignment: Alignment.center,
            child: Text(
              "December",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        // listDate
          SizedBox(height:12),
          StatefulListItemDate(listDate: listDate)
        ],
      )
  );
}

Widget _cardHeader() {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.only(top: 180.0),
    alignment: Alignment.topLeft,
    child: Container(
      decoration:  const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          )
      ),
      child: StateTabMenu(selectedIndex: 0),
    ),
  );
}

class ManagerBody extends State<StatefulManagerBody> {

  ManagerBody({Key? key}) : super();
  String value = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            _cardManager(),
            _cardBody(),
            SizedBox(height: 16),
            CardTaskItem(
              titleTask: "Sleep",
              contendTask:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
              priority: 3,
            ),
            SizedBox(height: 16),
            CardTaskItem(
              titleTask: "Sleep",
              contendTask:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
              priority: 2,
            ),
            SizedBox(height: 16),
            CardTaskItem(
              titleTask: "Sleep",
              contendTask:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
              priority: 1,
            ),
            SizedBox(height: 16),
            CardTaskItem(
              titleTask: "Sleep",
              contendTask:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
              priority: 1,
            ),
            SizedBox(height: 16),
            CardTaskItem(
              titleTask: "Sleep",
              contendTask:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor",
              priority: 1,
            )
          ],
        ));
  }
}

class StateTabMenu extends StatefulWidget {
  StateTabMenu({Key? key, required this.selectedIndex}) : super();
  int selectedIndex;

  @override
  TabMenu createState() {
    return TabMenu(selectedIndex: selectedIndex);
  }

}

class TabMenu extends State<StateTabMenu> {
  TabMenu({Key? key, required this.selectedIndex}) : super();
  int selectedIndex;

  @override
  Widget build(BuildContext context) {
    String colorTab1 = "#FFFFFF";
    String colorTab2 = "#FFFFFF";
    String colorTab3 = "#FFFFFF";
    if (selectedIndex == 0) {
      colorTab1 = "#855B28";
      colorTab2 = "#FFFFFF";
      colorTab3 = "#FFFFFF";
    } else if (selectedIndex == 1) {
      colorTab1 = "#FFFFFF";
      colorTab2 = "#855B28";
      colorTab3 = "#FFFFFF";
    } else {
      colorTab1 = "#FFFFFF";
      colorTab2 = "#FFFFFF";
      colorTab3 = "#855B28";
    }
    return Container(
      padding: EdgeInsets.only(top: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    onTapHandler(0);
                  },
                  child: Container(
                    child: Text(
                      "Todo",
                      style: TextStyle(
                        color: HexColor("#855B28"),
                        fontSize: 16.0,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  height: 2,
                  width: 50,
                  color: HexColor(colorTab1),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    print("Clike 2");
                    onTapHandler(1);
                  },
                  child: Container(
                    child: Text(
                      "In progress",
                      style:
                      TextStyle(color: HexColor("#855B28"), fontSize: 16.0),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  height: 2,
                  width: 50,
                  color: HexColor(colorTab2),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        print("Clike 3");
                        onTapHandler(2);
                      },
                      child: Container(
                        child: Text(
                          "Done",
                          style: TextStyle(
                              color: HexColor("#855B28"), fontSize: 16.0),
                        ),
                      )),
                  SizedBox(height: 4),
                  Container(
                    height: 2,
                    width: 50,
                    color: HexColor(colorTab3),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTapHandler(int index) {
    setState(() {
      selectedIndex = index;
      StateTabMenu(selectedIndex: index);
    });
  }

}

Widget _cardBody() {
  return Container(
    color: HexColor("#E6E6E6"),
    height: 2.0,
    margin: EdgeInsets.only(left: 10.0, right: 10.0),
  );
}

Widget _cardManager(){

  return Stack(
    children: <Widget>[
      _headerScreen(),
      _cardHeader(),
    ],
  );
}


class StatefulListItemDate extends StatefulWidget {
  StatefulListItemDate({Key? key, required this.listDate}) : super(key: key);
  List<DateItem> listDate;

  @override
  ListItemDate createState() {
    return ListItemDate(listDate: listDate);
  }
}

class ListItemDate extends State<StatefulListItemDate> {
  ListItemDate({Key? key, required this.listDate}) : super();
  List<DateItem> listDate;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: listDate.asMap().entries.map((entry) {
            int index = entry.key;
            DateItem item = entry.value;
            return GestureDetector(
            onTap: () {
                onClickItem(index);
              },
              child: ItemDateCard(dayOfWeek: item.dayOfWeek,
                dayOfMonth: item.dayOfMonth, isSelected: item.isSelected));
          }).toList()
            )
        ),
    );

  }

  void onClickItem(int index) {
    setState(() {
      clearListDate();
      listDate[index].isSelected = true;
      StatefulListItemDate(listDate: listDate);
    });
  }

  void clearListDate(){
    for (int i = 0; i < listDate.length; i++) {
      listDate[i].isSelected = false;
    }
  }
  
}

// SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Container(
// margin: EdgeInsets.only(top: 8.0),
// child: Row(
// children: [
// _itemDate(),
// _itemDate(),
// _itemDate(),
// _itemDate(),
// _itemDate(),
// _itemDate(),
// _itemDate(),
// ],
// ),
// ),
// ),

class ItemDateCard extends StatelessWidget {
  ItemDateCard({Key? key,
    required this.dayOfWeek,
    required this.dayOfMonth,
    required this.isSelected}) : super(key: key);

  String dayOfWeek;
  String dayOfMonth;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    double transparentValue = 0.0;
    if (isSelected) {
      transparentValue = 0.55;
    }
    return Container(
      width: 60.0,
      height: 66.0,
      margin: EdgeInsets.only(left: 12.0, right: 12.0),
      padding: EdgeInsets.only(left: 8.0, top: 12.0, right: 8.0, bottom: 12.0),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(transparentValue),
          borderRadius:
          BorderRadius.all(Radius.circular(16))),
      child: Column(
        children: [
          Container(
            child: Text(
              dayOfWeek,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 4),
          Container(
            margin: EdgeInsets.only(top: 4.0),
            child: Text(
              dayOfMonth,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// class ListItemDate extends State<StatefulItemDate> {
//   ListItemDate({Key? key, required this.listDate}) : super();
//   List<DateItem> listDate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView.builder(
//         itemCount: listDate.length,
//         scrollDirection: Axis.horizontal,
//         shrinkWrap: true,
//         itemBuilder: (context,index)=> ItemDateCard(dayOfWeek: listDate[index].dayOfWeek,
//             dayOfMonth: listDate[index].dayOfMonth),
//       ),
//     );
//   }
//
// }
