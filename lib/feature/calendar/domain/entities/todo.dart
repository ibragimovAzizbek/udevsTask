import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ToDoEntity extends Equatable {
  final DateTime? time;
  final String? name;
  final String? description;
  final String? location;
  final Color? color;
  final String? reminderTime;

  const ToDoEntity({
    this.time,
    this.name,
    this.description,
    this.location,
    this.color,
    this.reminderTime,
  });

  @override
  List<Object?> get props {
    return [
      time,
      name,
      description,
      location,
      color,
      reminderTime,
    ];
  }
}
