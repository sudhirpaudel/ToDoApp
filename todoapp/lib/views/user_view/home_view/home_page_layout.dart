import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/config/constants/widgets.dart';
import 'package:todoapp/database/django_database.dart';
import 'package:todoapp/view_model/ongoingtodo_bloc/ongoingtodo_bloc.dart';
import 'package:todoapp/config/constants/time_container.dart';
import 'package:todoapp/views/user_view/create_edit_todo_format/animated_todo_format.dart';

class HomePageLayout extends StatefulWidget {
  const HomePageLayout({Key? key}) : super(key: key);

  @override
  State<HomePageLayout> createState() => _HomePageLayoutState();
}

class _HomePageLayoutState extends State<HomePageLayout> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context1) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              List x = await getOngoingTodos();
              print('aa');
              print(x);
              showDialog(
                context: context,
                builder: (_) => BlocProvider<OngoingtodoBloc>.value(
                  value: context1.read<OngoingtodoBloc>(),
                  child: const AnimatedTodoFormat(),
                ),
              );
            },
            tooltip: 'Add ToDo',
            child: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          body: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      const TimeContainer(),
                      SizedBox(
                        child: Center(
                          child: Text(
                            "Hi! Sudhir . Your ToDo's ",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    left: 20,
                    top: 50,
                    child: menuIcon(context),
                  ),
                ],
              ),
              Expanded(
                child: BlocBuilder<OngoingtodoBloc, OngoingtodoState>(
                  builder: (context, state) {
                    if (state is OngoingtodoInitial) {
                      if (state.todos.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(20),
                          child: Text("NoTasks"),
                        );
                      } else {
                        return ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: state.todos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return todoView(context, state.todos[index], 0);
                          },
                        );
                      }
                    } else {
                      return const Text('No Tasks...');
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
