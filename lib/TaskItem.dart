class TaskItem {
  String titleTask;
  String contendTask;
  int priority;

  TaskItem(this.titleTask, this.contendTask, this.priority);

  factory TaskItem.fromJson(dynamic json) {
    return TaskItem(json['titleTask'] as String,
        json['contendTask'] as String, json['priority'] as int);
  }

  Map<String, dynamic> toJson() => _itemToJson(this);

  Map<String, dynamic> _itemToJson(TaskItem instance) {
    return <String, dynamic>{
      'title': instance.titleTask,
      'contend': instance.contendTask,
      'priority': instance.priority
    };
  }
}