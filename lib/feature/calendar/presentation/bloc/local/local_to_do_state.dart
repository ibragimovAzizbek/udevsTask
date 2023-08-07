import 'package:equatable/equatable.dart';

abstract class LocalToDoState extends Equatable {
  final List? data;
  final String? error;

  const LocalToDoState({this.data, this.error});

  @override
  List<Object> get props => [data!, error!];
}

class LocalToDoInitial extends LocalToDoState {
  const LocalToDoInitial();
}

class LocalToDoLoading extends LocalToDoState {
  const LocalToDoLoading();
}

class LocalToDoDone extends LocalToDoState {
  const LocalToDoDone() : super();
}

class LocalToDoError extends LocalToDoState {
  const LocalToDoError(String error) : super(error: error);
}
