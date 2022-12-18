import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/config/constants/app_color.dart';
import 'package:todoapp/config/constants/images_url.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/view_model/ongoingtodo_bloc/ongoingtodo_bloc.dart';

class EditOrViewToDo extends StatefulWidget {
  const EditOrViewToDo({Key? key, required this.todo, required this.whatPage})
      : super(key: key);
  final ToDoModel todo;
  final int whatPage;

  @override
  State<EditOrViewToDo> createState() => _EditOrViewToDoState();
}

class _EditOrViewToDoState extends State<EditOrViewToDo>
    with TickerProviderStateMixin {
  //create todo fields and inputs
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController type = TextEditingController();

  bool notificationStatusTemp = false;
  bool completedStatusTemp = false;
  int notificationStatusInt = 0;
  int completedStatusInt = 0;
  DateTime? deadlineDate;
  TimeOfDay? deadlineTime;

  late AnimationController _animationController;
  // ignore: unused_field
  late Animation<double> _animation;
  double _translateY = -500;
  bool animType = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {
          if (animType) {
            if (_translateY < 0) {
              _translateY = _translateY + 125;
            }
          } else {
            if (_translateY > -500) {
              _translateY = _translateY - 125;
            }
          }
        });
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    widget.todo;
    if (widget.todo.completedStatus) {
      completedStatusTemp = true;
    } else {
      completedStatusTemp = false;
    }
    if (widget.todo.notificationStatus) {
      notificationStatusTemp = true;
    } else {
      notificationStatusTemp = false;
    }
    return StatefulBuilder(
      builder: (context, setState) {
        return Transform.translate(
          offset: Offset(0, _translateY),
          child: SimpleDialog(
            insetPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.transparent,
            children: [
              SizedBox(
                height: height,
                width: width,
                child: Stack(
                  children: [
                    //pillars for textfields of todo
                    Positioned(
                      left: 40,
                      child: Container(
                        height: 160,
                        width: 10,
                        color: secondaryColor,
                      ),
                    ),
                    Positioned(
                      right: 40,
                      child: Container(
                        height: 160,
                        width: 10,
                        color: secondaryColor,
                      ),
                    ),
                    //pillars for save button

                    Positioned(
                      left: 10,
                      right: 10,
                      top: 140,
                      child: Container(
                        height: height * 0.52,
                        width: width,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.07,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: width,
                                    child: Center(
                                      child: Text(widget.todo.title),
                                    ),
                                  ),
                                  const Positioned(
                                    right: 5,
                                    bottom: 2,
                                    child: Text('title'),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 2,
                              thickness: 2,
                              indent: 0,
                              endIndent: 0,
                              color: primaryColor,
                            ),
                            Expanded(
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: width,
                                    child: Center(
                                      child: Text(widget.todo.details),
                                    ),
                                  ),
                                  const Positioned(
                                    right: 5,
                                    bottom: 2,
                                    child: Text('details'),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 2,
                              thickness: 2,
                              indent: 0,
                              endIndent: 0,
                              color: primaryColor,
                            ),
                            SizedBox(
                              height: height * 0.06,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: width,
                                    child: Center(
                                      child: Text(widget.todo.type),
                                    ),
                                  ),
                                  const Positioned(
                                    right: 5,
                                    bottom: 2,
                                    child: Text('type'),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 2,
                              thickness: 2,
                              indent: 0,
                              endIndent: 0,
                              color: primaryColor,
                            ),
                            SizedBox(
                              height: height * 0.07,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: width,
                                    child: Center(
                                      child: Text(
                                        widget.todo.deadlineDate.toString(),
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    right: 5,
                                    bottom: 2,
                                    child: Text('deadline'),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 2,
                              thickness: 2,
                              indent: 0,
                              endIndent: 0,
                              color: primaryColor,
                            ),
                            SizedBox(
                              height: height * 0.1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  widget.whatPage == 2
                                      ? SizedBox(
                                          height: height * 0.1,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 40,
                                                  width: 40,
                                                  child: completedStatusTemp
                                                      ? Container(
                                                          height: 20,
                                                          width: 20,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    primaryColor,
                                                                width: 1),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.asset(
                                                              logoUrl),
                                                        )
                                                      : Container(
                                                          height: 20,
                                                          width: 20,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color:
                                                                    primaryColor,
                                                                width: 1),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.asset(
                                                              cancelUrl),
                                                        ),
                                                ),
                                                const Text("CompletedStatus"),
                                              ],
                                            ),
                                          ),
                                        )
                                      : BlocListener<OngoingtodoBloc,
                                          OngoingtodoState>(
                                          listener: (context, state) {},
                                          child: SizedBox(
                                            height: height * 0.1,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                    height: 40,
                                                    width: 40,
                                                    child: CupertinoSwitch(
                                                      thumbColor:
                                                          secondaryColor,
                                                      activeColor:
                                                          lighterPrimaryColor,
                                                      value:
                                                          completedStatusTemp,
                                                      onChanged: (value) {
                                                        setState(
                                                          () {
                                                            completedStatusTemp =
                                                                !completedStatusTemp;
                                                            if (completedStatusTemp) {
                                                              completedStatusInt =
                                                                  1;
                                                            } else {
                                                              completedStatusInt =
                                                                  0;
                                                            }
                                                            ToDoModel todoSave =
                                                                ToDoModel(
                                                              id: widget
                                                                  .todo.id,
                                                              userId: widget
                                                                  .todo.userId,
                                                              title: widget
                                                                  .todo.title,
                                                              details: widget
                                                                  .todo.details,
                                                              type: widget
                                                                  .todo.type,
                                                              deadlineDate: widget
                                                                  .todo
                                                                  .deadlineDate,
                                                              deadlineTime: widget
                                                                  .todo
                                                                  .deadlineTime,
                                                              notificationStatus:
                                                                  widget.todo
                                                                      .notificationStatus,
                                                              completedStatus:
                                                                  completedStatusTemp,
                                                              isDeadlineOver: widget
                                                                  .todo
                                                                  .isDeadlineOver,
                                                            );
                                                            context
                                                                .read<
                                                                    OngoingtodoBloc>()
                                                                .add(
                                                                  UpdateToDo(
                                                                      todo:
                                                                          todoSave),
                                                                );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  const Text("CompletedStatus"),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                  BlocListener<OngoingtodoBloc,
                                      OngoingtodoState>(
                                    listener: (context, state) {},
                                    child: SizedBox(
                                      height: height * 0.1,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 40,
                                              width: 40,
                                              child: CupertinoSwitch(
                                                thumbColor: secondaryColor,
                                                activeColor:
                                                    lighterPrimaryColor,
                                                value: notificationStatusTemp,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      if (widget.whatPage !=
                                                          2) {
                                                        notificationStatusTemp =
                                                            !notificationStatusTemp;
                                                        if (notificationStatusTemp) {
                                                          notificationStatusInt =
                                                              1;
                                                        } else {
                                                          notificationStatusInt =
                                                              0;
                                                        }
                                                        ToDoModel todoSave =
                                                            ToDoModel(
                                                          id: widget
                                                              .todo.id,
                                                          userId: widget
                                                              .todo.userId,
                                                          title:
                                                              widget.todo.title,
                                                          details: widget
                                                              .todo.details,
                                                          type:
                                                              widget.todo.type,
                                                          deadlineDate: widget
                                                              .todo
                                                              .deadlineDate,
                                                          deadlineTime: widget
                                                              .todo
                                                              .deadlineTime,
                                                          notificationStatus:
                                                              notificationStatusTemp,
                                                          completedStatus: widget
                                                              .todo
                                                              .completedStatus,
                                                          isDeadlineOver: widget
                                                              .todo
                                                              .isDeadlineOver,
                                                        );
                                                        context
                                                            .read<
                                                                OngoingtodoBloc>()
                                                            .add(
                                                              UpdateToDo(
                                                                  todo:
                                                                      todoSave),
                                                            );
                                                      }
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            const Text("notification"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 50,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(
                              () {
                                animType = false;
                                _animationController.forward();
                              },
                            );
                            Timer(
                              const Duration(milliseconds: 100),
                              () {
                                Navigator.pop(context);
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.close,
                            color: primaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
