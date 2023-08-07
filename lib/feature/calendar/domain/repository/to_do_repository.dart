import 'package:todoapp/feature/calendar/data/models/to_do_model.dart';

abstract class ToDoRepository {
  List<ToDoModel> getTasks();
  void writeTasks();
}
