import 'package:flutter/material.dart';
import 'package:todoapp/feature/calendar/domain/entities/todo.dart';

class ToDoModel extends ToDoEntity {
  const ToDoModel({
    DateTime? time,
    String? name,
    String? description,
    String? location,
    Color? color,
    String? reminderTime,
  });

  factory ToDoModel.fromJson(Map<String, dynamic> map) {
    return ToDoModel(
      time: map['time'] ?? "",
      name: map['name'] ?? "",
      description: map['description'] ?? "",
      location: map['location'] ?? "",
      color: map['color'] ?? "",
      reminderTime: map['reminderTime'] ?? "",
    );
  }
}
