import 'package:flutter/cupertino.dart';

class TaskItem {
  final String? titleTask;
  final String? contendTask;
  final int? priority;

  TaskItem({Key? key, this.titleTask,
    this.contendTask, this.priority});

  factory TaskItem.fromJson(Map<String, dynamic> json) {
    return TaskItem(
        titleTask: json['titleTask'] as String,
        contendTask: json['contendTask'] as String,
        priority: json['priority'] as int);
  }

  Map<String, dynamic> toJson() => _itemToJson(this);

  Map<String, dynamic> _itemToJson(TaskItem instance) {
    return <String, dynamic>{
      'titleTask': instance.titleTask,
      'contendTask': instance.contendTask,
      'priority': instance.priority
    };
  }
}