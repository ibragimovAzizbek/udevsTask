import 'package:todoapp/feature/calendar/data/models/to_do_model.dart';
import 'package:todoapp/feature/calendar/domain/repository/to_do_repository.dart';

class ToDoRepositoryImpl extends ToDoRepository {
  ToDoRepositoryImpl();

  @override
  List<ToDoModel> getTasks() {
    throw UnimplementedError();
  }

  @override
  void writeTasks() {
    throw UnimplementedError();
  }
}
