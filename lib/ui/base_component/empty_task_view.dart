import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyTaskView extends StatelessWidget {
  const EmptyTaskView(
      {Key? key,
        required this.title,
        required this.contend})
      : super(key: key);

  final String title;
  final String contend;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset('assets/ic_task_empty.svg'),
          const SizedBox(height: 12),
          Text(title,
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          const SizedBox(height: 6),
          Text(contend,
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ))
        ],
      ),
    );
  }

}