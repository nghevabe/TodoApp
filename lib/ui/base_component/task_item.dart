import 'package:flutter/cupertino.dart';

class TaskItem {
  final String? titleTask;
  final String? contendTask;
  final int? priority;
  final String? dateTime;
  final int? point;

  TaskItem({Key? key, this.titleTask,
    this.contendTask, this.priority, this.dateTime, this.point});

  factory TaskItem.fromJson(Map<String, dynamic> json) {
    return TaskItem(
        titleTask: json['titleTask'] as String,
        contendTask: json['contendTask'] as String,
        priority: json['priority'] as int,
        dateTime: json['dateTime'] as String,
        point: json['point'] as int
    );
  }

  Map<String, dynamic> toJson() => _itemToJson(this);

  Map<String, dynamic> _itemToJson(TaskItem instance) {
    return <String, dynamic>{
      'titleTask': instance.titleTask,
      'contendTask': instance.contendTask,
      'priority': instance.priority,
      'dateTime': instance.dateTime,
      'point': instance.point,
    };
  }
}