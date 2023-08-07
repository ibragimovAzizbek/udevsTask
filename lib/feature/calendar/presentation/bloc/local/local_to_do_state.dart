import 'package:equatable/equatable.dart';
import 'package:todoapp/feature/calendar/data/models/to_do_model.dart';

abstract class LocalToDoState extends Equatable {
  final List? data;
  final String? error;

  const LocalToDoState({this.data, this.error});

  @override
  List<Object> get props => [];
}

class LocalToDoInitial extends LocalToDoState {
  const LocalToDoInitial();
}

class LocalToDoLoading extends LocalToDoState {
  const LocalToDoLoading();
}

class LocalToDoDone extends LocalToDoState {
  const LocalToDoDone(List<ToDoModel> data) : super(data: data);
}

class LocalToDoError extends LocalToDoState {
  const LocalToDoError(String error) : super(error: error);
}
