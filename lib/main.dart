import 'package:first_bloc/cubits/active_todo_count/active_todo_count_cubit.dart';
import 'package:first_bloc/cubits/filtered_todos/filtered_todos_cubit.dart';
import 'package:first_bloc/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:first_bloc/cubits/todo_list/todo_list_cubit.dart';
import 'package:first_bloc/cubits/todo_search/todo_search_cubit.dart';
import 'package:first_bloc/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterCubit>(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider<TodoSearchCubit>(
          create: (context) => TodoSearchCubit(),
        ),
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<ActiveTodoCountCubit>(
          create: (context) => ActiveTodoCountCubit(
            initialActiveTodoCount:
                context.read<TodoListCubit>().state.todos.length,
            todoListCubit: BlocProvider.of<TodoListCubit>(context),
          ),
        ),
        BlocProvider<FilteredTodosCubit>(
          create: (context) => FilteredTodosCubit(
            initialTodos: context.read<TodoListCubit>().state.todos,
            todoFilterCubit: BlocProvider.of<TodoFilterCubit>(context),
            todoSearchCubit: BlocProvider.of<TodoSearchCubit>(context),
            todoListCubit: BlocProvider.of<TodoListCubit>(context),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: const BottomBar(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 100.0,
              fontWeight: FontWeight.bold,
            ),
            headline6: TextStyle(
              fontSize: 30.0,
            ),
            bodyText1: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            bodyText2: TextStyle(
              fontSize: 18.0,
              height: 1.5,
              fontWeight: FontWeight.w500,
            ),
            caption: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          fontFamily: 'WednesdayAdventure',
        ),
      ),
    );
  }
}
