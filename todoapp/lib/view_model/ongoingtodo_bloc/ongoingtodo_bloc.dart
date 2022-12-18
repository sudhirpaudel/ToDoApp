// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/database/django_database.dart';
import 'package:todoapp/model/todo_model.dart';

part 'ongoingtodo_event.dart';
part 'ongoingtodo_state.dart';

class OngoingtodoBloc extends Bloc<OngoingtodoEvent, OngoingtodoState> {
  OngoingtodoBloc() : super(OngoingtodoInitial()) {
    on<GetToDo>(_onGetToDo);
    on<AddToDo>(_addToDo);
    on<UpdateToDo>(_onUpdateToDo);
  }
  Future<void> _onGetToDo(GetToDo event, Emitter<OngoingtodoState> emit) async {
    var todosDb = await getOngoingTodos();
    emit(
      OngoingtodoInitial(todos: todosDb ),
    );
  }

  void _addToDo(AddToDo event, Emitter<OngoingtodoState> emit) {
    final state = this.state;
    if (state is OngoingtodoInitial) {
      emit(
        OngoingtodoInitial(
          todos: List.from(state.todos)..add(event.todo),
        ),
      );
      
    }
  }

  void _onUpdateToDo(UpdateToDo event, Emitter<OngoingtodoState> emit) {
    final state = this.state;
    if (state is OngoingtodoInitial) {
      List<ToDoModel> todos = (state.todos.map((todo) {
        return todo.id == event.todo.id ? event.todo : todo;
      })).toList();
      emit(
        OngoingtodoInitial(
          todos: todos,
        ),
      );
    }
  }
}
