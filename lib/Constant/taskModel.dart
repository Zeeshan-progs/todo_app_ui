import 'dart:ui';

class TaskModel {
  bool? isDone = false;
  String? taskTitle;
  Color? taskColor;

  TaskModel({this.isDone, this.taskColor, this.taskTitle});
}
