import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/config/constants/app_color.dart';
import 'package:todoapp/config/constants/images_url.dart';
import 'package:todoapp/config/constants/strings.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/view_model/ongoingtodo_bloc/ongoingtodo_bloc.dart';
import 'package:todoapp/views/user_view/create_edit_todo_format/edit_or_view.dart';
import 'package:todoapp/views/user_view/menu/animated_menu.dart';

Widget introductionStack(BuildContext context, int page) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  List pageString = [introduction0, introduction1, introduction2];
  List pageNum = [true, false, true];
  return Column(
    children: [
      SizedBox(
        height: height * 0.84,
        width: width,
        child: Stack(
          children: [
            pageNum[page]
                ? Positioned(
                    left: width * 0.1,
                    top: height * 0.06,
                    child: Container(
                      margin: const EdgeInsets.only(left: 60, bottom: 100),
                      height: height * 0.7,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: secondaryColor,
                          width: 4,
                        ),
                      ),
                    ),
                  )
                : Positioned(
                    right: width * 0.1,
                    top: height * 0.06,
                    child: Container(
                      margin: const EdgeInsets.only(right: 60, bottom: 100),
                      height: height * 0.7,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: secondaryColor,
                          width: 4,
                        ),
                      ),
                    ),
                  ),
            pageNum[page]
                ? Positioned(
                    left: width * 0.1,
                    top: page == 2 ? height * 0.18 : height * 0.22,
                    child: Container(
                      color: backgroundColor,
                      child: Text(
                        pageString[page],
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  )
                : Positioned(
                    right: width * 0.05,
                    top: height * 0.22,
                    child: Container(
                      color: backgroundColor,
                      child: Text(
                        pageString[page],
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
            pageNum[page]
                ? Positioned(
                    left: width * 0.12,
                    bottom: height * 0.01,
                    child: dottedContainer(
                      pageNum[page],
                      height,
                    ),
                  )
                : Positioned(
                    right: width * 0.12,
                    bottom: height * 0.01,
                    child: dottedContainer(
                      pageNum[page],
                      height,
                    ),
                  ),
          ],
        ),
      ),
    ],
  );
}

Widget loginFields(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Email",
        style: Theme.of(context).textTheme.headline2,
      ),
      TextField(
        style: Theme.of(context).textTheme.bodyText1,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        cursorHeight: 24,
        decoration: InputDecoration(
          hintText: "something@email.com",
          hintStyle: Theme.of(context).textTheme.bodyText1,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: lightPrimaryColor,
              width: 2.0,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: lightPrimaryColor,
              width: 2.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
              width: 2.0,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        "Password",
        style: Theme.of(context).textTheme.headline2,
      ),
      TextField(
        style: Theme.of(context).textTheme.bodyText1,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: "password123",
          hintStyle: Theme.of(context).textTheme.bodyText1,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: lightPrimaryColor,
              width: 2.0,
            ),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: lightPrimaryColor,
              width: 2.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
              width: 2.0,
            ),
          ),
        ),
      ),
    ],
  );
}

dottedContainer(bool what, double height) {
  return RotatedBox(
    quarterTurns: what ? 1 : 0,
    child: SizedBox(
      height: height * 0.2,
      width: height * 0.2,
      child: Column(
        children: [
          for (var i = 0; i < 8; i++)
            Row(
              children: [
                for (var j = 0; j < 8; j++)
                  Container(
                    height: height * 0.025,
                    width: height * 0.025,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Container(
                        height: height * 0.005,
                        width: height * 0.005,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor.withOpacity(
                            0.1 * ((i * j) / 5),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    ),
  );
}

Widget todoView(BuildContext context, ToDoModel todo, int whatPage) {
  if (whatPage == 2) {
    if (todo.completedStatus || todo.isDeadlineOver) {
      return todoViewMain(
        context,
        todo,
        whatPage,
      );
    } else {
      return const SizedBox();
    }
  } else {
    if (todo.completedStatus && todo.isDeadlineOver) {
      return todoViewMain(
        context,
        todo,
        whatPage,
      );
    } else {
      return const SizedBox();
    }
  }
}

Widget todoViewMain(
  BuildContext context,
  ToDoModel todo,
  int whatPage,
) {
  bool notificationStatusTemp = true;
  if (todo.notificationStatus ) {
    notificationStatusTemp = true;
  } else {
    notificationStatusTemp = false;
  }
  return StatefulBuilder(
    builder: (context, setState) {
      return TextButton(
        onPressed: () {
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (_) => EditOrViewToDo(
              todo: todo,
              whatPage: whatPage,
            ),
          );
        },
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: lightSecondaryColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primaryColor),
            boxShadow: [
              BoxShadow(
                color: lighterPrimaryColor,
                spreadRadius: 0.5,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(
                height: 35,
                child: Stack(
                  children: [
                    const SizedBox(
                      height: 35,
                      width: double.infinity,
                    ),
                    Positioned(
                      left: 15,
                      bottom: 5,
                      child: Text(
                        todo.title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: primaryColor),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 1,
                      child: Text(
                        todo.type,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(color: primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 2,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: primaryColor,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: SizedBox(
                  height: 34,
                  child: Text(
                    todo.details,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: primaryColor),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 20,
                      child:
                          todo.isDeadlineOver  && todo.completedStatus 
                              ? Row(
                                  children: [
                                    const Icon(
                                      Icons.timer_outlined,
                                      color: primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${todo.deadlineDate.year}/${todo.deadlineDate.month}/${todo.deadlineDate.day}  ${todo.deadlineTime.hour}:${todo.deadlineTime.minute}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(color: primaryColor),
                                    )
                                  ],
                                )
                              : Row(
                                  children: [
                                    todo.completedStatus 
                                        ? Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: primaryColor,
                                                  width: 1),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(logoUrl),
                                          )
                                        : Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: primaryColor,
                                                  width: 1),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(cancelUrl),
                                          )
                                  ],
                                ),
                    ),
                    BlocListener<OngoingtodoBloc, OngoingtodoState>(
                      listener: (context, state) {},
                      child: Positioned(
                        top: 10,
                        right: 20,
                        child: Row(
                          children: [
                            Transform.rotate(
                              angle: 315,
                              child: const Icon(
                                Icons.notifications_outlined,
                                color: primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Transform.scale(
                                scale: 0.7,
                                child: CupertinoSwitch(
                                  thumbColor: notificationStatusTemp
                                      ? secondaryColor
                                      : lightSecondaryColor,
                                  activeColor: lighterPrimaryColor,
                                  value: notificationStatusTemp,
                                  onChanged: (value) {
                                    setState(
                                      () {
                                        if (whatPage != 2) {
                                          notificationStatusTemp =
                                              !notificationStatusTemp;
                                          
                                          ToDoModel todoSave = ToDoModel(
                                              id: todo.id,
                                              userId: todo.userId,
                                              title: todo.title,
                                              details: todo.details,
                                              type: todo.type,
                                              deadlineDate: todo.deadlineDate,
                                              deadlineTime: todo.deadlineTime,
                                              notificationStatus:
                                                  notificationStatusTemp,
                                              completedStatus:
                                                  todo.completedStatus,
                                              isDeadlineOver:
                                                  todo.isDeadlineOver,
                                                  );
                                          context.read<OngoingtodoBloc>().add(
                                                UpdateToDo(todo: todoSave),
                                              );
                                        }
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget menuIcon(BuildContext context) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      color: secondaryColor,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: IconButton(
      onPressed: () {
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (_) => const AnimatedMenu(),
        );
      },
      icon: const Icon(
        Icons.menu,
        color: primaryColor,
        size: 30,
      ),
    ),
  );
}
