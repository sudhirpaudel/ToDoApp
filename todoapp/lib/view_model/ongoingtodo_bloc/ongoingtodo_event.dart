part of 'ongoingtodo_bloc.dart';

@immutable
abstract class OngoingtodoEvent {}

class GetToDo extends OngoingtodoEvent {
  final List<ToDoModel> todos;

  GetToDo({this.todos = const <ToDoModel>[]});
  @override
  // ignore: override_on_non_overriding_member
  
  List<Object> get props => [todos];
}

class AddToDo extends OngoingtodoEvent {
  final ToDoModel todo;
  AddToDo({required this.todo});
  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [todo];
}

class UpdateToDo extends OngoingtodoEvent {
  final ToDoModel todo;
 UpdateToDo({required this.todo});
  @override
  // ignore: override_on_non_overriding_member
  List<Object> get props => [todo];
}
