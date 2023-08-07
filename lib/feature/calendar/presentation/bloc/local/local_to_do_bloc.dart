import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'local_to_do_event.dart';
import 'local_to_do_state.dart';

class LocalToDoBloc extends Bloc<LocalToDoEvent, LocalToDoState> {
  LocalToDoBloc() : super(const LocalToDoInitial()) {
    on<LocalToDoEvent>((event, emit) {});
  }

  TextEditingController eventName = TextEditingController();
  TextEditingController eventDescription = TextEditingController();
  TextEditingController eventLocation = TextEditingController();
  TextEditingController eventTime = TextEditingController();

  ValueNotifier<Color?> dropDownValue = ValueNotifier(null);

  DateTime taskTime = DateTime.now();

  changeTime(DateTime time) {
    taskTime = time;
    print(taskTime);
  }

  changeColor(Color color) {
    dropDownValue.value = color;
  }
}
