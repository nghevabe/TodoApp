import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/TaskItem.dart';

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
            width: double.infinity,
            padding: const EdgeInsets.only(left: 4.0, top: 8.0, right: 8.0, bottom: 8.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                  child: Text(titleTask,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                  child: Text(contendTask,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.only(left: 12.0, top: 8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/ic_star.svg'),
                              Container(
                                margin: const EdgeInsets.only(left: 4.0, top: 1.0),
                                child:const Text("3",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),
                              )
                            ],
                          )
                      ),

                      Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 42.0, top: 8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/ic_calender.svg'),
                              Container(
                                margin: EdgeInsets.only(left: 4.0, top: 1.0),
                                child:const Text("31 July 2021",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )),
                              )
                            ],
                          )
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
            spreadRadius: 0.2, //spread radius
            blurRadius: 4, // blur radius
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      margin: const EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0),

    );
  }

}