part of 'todo_list_cubit.dart';

/* 
Third cubit created. 
The state is modified first.
All the content except the {part of 'todo_list_cubit.dart';} were deleted
create variable filter and the constructor
extend Equatable
add toString
add copyWith
 */

class TodoListState extends Equatable {
  final List<Todo> todos;

  const TodoListState({
    required this.todos,
  });
  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(id: '1', description: 'Clean the room'),
      Todo(id: '2', description: 'Wash the dish'),
      Todo(id: '3', description: 'Do homework'),
    ]);
  }

  @override
  List<Object?> get props => [todos];

  @override
  String toString() => 'TodoListState(todos: $todos)';

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}
