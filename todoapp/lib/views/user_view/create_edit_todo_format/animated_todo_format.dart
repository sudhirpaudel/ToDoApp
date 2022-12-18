import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todoapp/config/constants/app_color.dart';
import 'package:todoapp/config/constants/images_url.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/view_model/ongoingtodo_bloc/ongoingtodo_bloc.dart';

class AnimatedTodoFormat extends StatefulWidget {
  const AnimatedTodoFormat({Key? key}) : super(key: key);

  @override
  State<AnimatedTodoFormat> createState() => _AnimatedTodoFormatState();
}

class _AnimatedTodoFormatState extends State<AnimatedTodoFormat>
    with TickerProviderStateMixin {
  //create todo fields and inputs
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController type = TextEditingController();

  bool notificationStatus = false;
  int notificationStatusInt = 0;
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
                      right: 110,
                      top: height * 0.5 + 140,
                      child: Container(
                        height: 40,
                        width: 10,
                        color: secondaryColor,
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: height * 0.5 + 140,
                      child: Container(
                        height: 40,
                        width: 10,
                        color: secondaryColor,
                      ),
                    ),
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
                                  TextField(
                                    controller: title,
                                    cursorColor: primaryColor,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    cursorHeight: 26,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 0),
                                      hintText: "something",
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              color: lighterPrimaryColor),
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
                            SizedBox(
                              height: height * 0.28,
                              child: Stack(
                                children: [
                                  TextField(
                                    controller: description,
                                    maxLines: 7,
                                    cursorColor: primaryColor,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    textInputAction: TextInputAction.send,
                                    keyboardType: TextInputType.multiline,
                                    cursorHeight: 26,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          15, 10, 15, 0),
                                      hintText: "something",
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              color: lighterPrimaryColor),
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
                                  TextField(
                                    controller: type,
                                    cursorColor: primaryColor,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    cursorHeight: 26,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 0),
                                      hintText: "health , personal , office",
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                              color: lighterPrimaryColor),
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
                              height: height * 0.1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: height * 0.1,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime(
                                                    DateTime.now().year + 2),
                                                builder: (context, child) {
                                                  return Theme(
                                                    data: Theme.of(context)
                                                        .copyWith(
                                                      colorScheme:
                                                          const ColorScheme
                                                              .light(
                                                        primary: primaryColor,
                                                        onPrimary:
                                                            secondaryColor,
                                                        onSurface:
                                                            darkTextColor,
                                                      ),
                                                      textButtonTheme:
                                                          TextButtonThemeData(
                                                        style: TextButton
                                                            .styleFrom(
                                                          primary: Colors
                                                              .red, // button text color
                                                        ),
                                                      ),
                                                    ),
                                                    child: child!,
                                                  );
                                                },
                                              ).then((date) {
                                                setState(() {
                                                  deadlineDate = date;
                                                });
                                              });
                                              showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now(),
                                                  builder: (context, child) {
                                                    return Theme(
                                                      data: Theme.of(context)
                                                          .copyWith(
                                                        colorScheme:
                                                            const ColorScheme
                                                                .light(
                                                          primary: primaryColor,
                                                          onPrimary:
                                                              secondaryColor,
                                                          onSurface:
                                                              darkTextColor,
                                                        ),
                                                        textButtonTheme:
                                                            TextButtonThemeData(
                                                          style: TextButton
                                                              .styleFrom(
                                                            primary: Colors
                                                                .red, // button text color
                                                          ),
                                                        ),
                                                      ),
                                                      child: child!,
                                                    );
                                                  }).then((time) {
                                                setState(() {
                                                  deadlineTime = time;
                                                });
                                              });
                                            },
                                            child: SizedBox(
                                              height: 34,
                                              width: 34,
                                              child: SvgPicture.asset(
                                                  calenderSvg,
                                                  color: primaryColor,
                                                  semanticsLabel: 'calender'),
                                            ),
                                          ),
                                          const Text("deadline"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
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
                                              activeColor: lighterPrimaryColor,
                                              value: notificationStatus,
                                              onChanged: (value) {
                                                setState(() {
                                                  notificationStatus =
                                                      !notificationStatus;
                                                });
                                              },
                                            ),
                                          ),
                                          const Text("notification"),
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
                            setState(() {
                              animType = false;
                              _animationController.forward();
                            });
                            Timer(const Duration(milliseconds: 100), () {
                              Navigator.pop(context);
                            });
                          },
                          icon: const Icon(
                            Icons.close,
                            color: primaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      left: width - 150,
                      top: height * 0.52 + 150,
                      child: Container(
                        height: 55,
                        width: width,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                          // border: Border.all(color: secondaryColor, width: 1),
                        ),
                        child: BlocListener<OngoingtodoBloc, OngoingtodoState>(
                          listener: (context, state) {},
                          child: TextButton(
                            onPressed: () {
                              if (notificationStatus) {
                                notificationStatusInt = 0;
                              } else {
                                notificationStatusInt = 1;
                              }
                              ToDoModel todoSave = ToDoModel(
                                id: 22,
                                userId: '21',
                                title: title.value.text,
                                details: description.value.text,
                                type: type.value.text,
                                deadlineDate: deadlineDate!,
                                deadlineTime: deadlineDate!,
                                notificationStatus: notificationStatus,
                                completedStatus: false,
                                isDeadlineOver: false,
                              );
                              context.read<OngoingtodoBloc>().add(
                                    AddToDo(todo: todoSave),
                                  );
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Text(
                                "SAVE",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    ?.copyWith(color: secondaryColor),
                              ),
                            ),
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
