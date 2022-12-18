part of 'ongoingtodo_bloc.dart';

@immutable
abstract class OngoingtodoState {}

class OngoingtodoInitial extends OngoingtodoState {
  final List<ToDoModel> todos;
  OngoingtodoInitial({this.todos = const<ToDoModel>[]});
}
