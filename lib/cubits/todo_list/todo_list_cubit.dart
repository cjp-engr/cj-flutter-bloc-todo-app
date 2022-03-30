import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_bloc/models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String desc) {
    final newTodo = Todo(description: desc);
    final newTodos = [...state.todos, newTodo];

    emit(state.copyWith(todos: newTodos));
  }

  void editTodo(String id, String desc) {
    final editTodo = state.todos.map(
      (Todo todo) {
        if (id == todo.id) {
          return Todo(
            id: todo.id,
            description: desc,
            completed: todo.completed,
          );
        }
        return todo;
      },
    ).toList();

    emit(state.copyWith(todos: editTodo));
  }

  void toggleTodo(String id) {
    final togTodo = state.todos.map(
      (Todo todo) {
        if (id == todo.id) {
          return Todo(
            id: todo.id,
            description: todo.description,
            completed: !todo.completed,
          );
        }
        return todo;
      },
    ).toList();
    emit(state.copyWith(todos: togTodo));
  }

  void removeTodo(Todo todo) {
    final remTodo = state.todos.where((Todo t) => t.id != todo.id).toList();
    emit(state.copyWith(todos: remTodo));
  }
}
