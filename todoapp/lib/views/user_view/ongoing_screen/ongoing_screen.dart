import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/config/constants/app_color.dart';
import 'package:todoapp/config/constants/widgets.dart';
import 'package:todoapp/view_model/ongoingtodo_bloc/ongoingtodo_bloc.dart';

class OngoingScreen extends StatefulWidget {
  const OngoingScreen({Key? key}) : super(key: key);

  @override
  State<OngoingScreen> createState() => _OngoingScreenState();
}

class _OngoingScreenState extends State<OngoingScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 130,
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                menuIcon(context),
                SizedBox(
                  height: 140,
                  width: width - 80,
                  child: Center(
                    child: Text(
                      "Ongoing ToDo's",
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: secondaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: Center(
              child: Text(
                "Hi! Sudhir . Your Ongoing ToDo's ",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<OngoingtodoBloc, OngoingtodoState>(
              builder: (context, state) {
                if (state is OngoingtodoInitial) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: state.todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return todoView(context,state.todos[index] ,1);
                    },
                  );
                } else {
                  return const Text('No Tasks...');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
