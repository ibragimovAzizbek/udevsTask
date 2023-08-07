import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/feature/calendar/presentation/bloc/local/local_to_do_state.dart';

import '../../../data/data_source/sql_db_service.dart';

class LocalToDoCubit extends Cubit<LocalToDoState> {
  LocalToDoCubit() : super(const LocalToDoInitial()) {
    refreshJournals();
  }

  TextEditingController eventName = TextEditingController();
  TextEditingController eventDescription = TextEditingController();
  TextEditingController eventLocation = TextEditingController();
  TextEditingController eventTime = TextEditingController();

  ValueNotifier<Color?> dropDownValue = ValueNotifier(null);

  DateTime taskTime = DateTime.now();

  ValueNotifier<List<Map<String, dynamic>>> eventList = ValueNotifier([]);

  checkStatus(int? id) {
    if (id != null) {
      final existingJournal =
          eventList.value.firstWhere((element) => element['id'] == id);
      eventName.text = existingJournal['title'];
      eventDescription.text = existingJournal['description'];
      eventLocation.text = existingJournal['location'];
      eventTime.text = existingJournal['reminderTime'];
      taskTime = DateTime.parse(existingJournal['time']);
    }
  }

  void refreshJournals() async {
    final data = await SQLHelper.getItems();
    eventList.value = data;
    print("..number value: ${data.length}");
  }

  Future<void> addItem() async {
    await SQLHelper.createItem(
      taskTime.toIso8601String(),
      eventName.text,
      eventDescription.text,
      eventLocation.text,
      dropDownValue.value.toString(),
      eventTime.text,
    );

    refreshJournals();
    print("..number of items ${eventList.value.length}");
  }

  Future<void> updateItem(int id) async {
    await SQLHelper.updateItem(
      id,
      taskTime.toIso8601String(),
      eventName.text,
      eventDescription.text,
      eventLocation.text,
      dropDownValue.value.toString(),
      eventTime.text,
    );

    refreshJournals();
    print("..number of items ${eventList.value.length}");
  }

  Future<void> removeEvent(int id) async {
    await SQLHelper.deleteItem(id);

    refreshJournals();
    print("..number of items ${eventList.value.length}");
  }

  changeTime(DateTime time) {
    taskTime = time;
    print(taskTime);
  }

  changeColor(Color color) {
    dropDownValue.value = color;
  }
}
