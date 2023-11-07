import 'package:flutter/cupertino.dart';

class TaskItem {
  final String? id;
  final String? titleTask;
  final String? contendTask;
  final int? priority;
  final String? dateTime;
  final int? point;
  final int? status; // 1 - to do, 2 - in progress, 3 - done, 4 - cancel

  TaskItem({Key? key, this.id, this.titleTask,
    this.contendTask, this.priority, this.dateTime, this.point, this.status});

  factory TaskItem.fromJson(Map<String, dynamic> json) {
    return TaskItem(
        id: json['id'] as String,
        titleTask: json['titleTask'] as String,
        contendTask: json['contendTask'] as String,
        priority: json['priority'] as int,
        dateTime: json['dateTime'] as String,
        point: json['point'] as int,
        status: json['status'] as int
    );
  }

  Map<String, dynamic> toJson() => _itemToJson(this);

  Map<String, dynamic> _itemToJson(TaskItem instance) {
    return <String, dynamic>{
      'id': instance.id,
      'titleTask': instance.titleTask,
      'contendTask': instance.contendTask,
      'priority': instance.priority,
      'dateTime': instance.dateTime,
      'point': instance.point,
      'status': instance.status,
    };
  }
}