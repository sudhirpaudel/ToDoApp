import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todoapp/config/constants/app_color.dart';
import 'package:todoapp/views/user_view/finished_todo/finished_todo_screen.dart';
import 'package:todoapp/views/user_view/home_view/home_page_layout.dart';
import 'package:todoapp/views/user_view/ongoing_screen/ongoing_screen.dart';
import 'package:todoapp/views/user_view/settings_view/settings_screen.dart';

class AnimatedMenu extends StatefulWidget {
  const AnimatedMenu({Key? key}) : super(key: key);

  @override
  State<AnimatedMenu> createState() => _AnimatedMenuState();
}

class _AnimatedMenuState extends State<AnimatedMenu>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  // ignore: unused_field
  late Animation<double> _animation;
  double _translateY = -500;
  bool _animType = true;

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
          if (_animType) {
            if (_translateY < 0) {
              _translateY = _translateY + 100;
            }
          } else {
            if (_translateY > -500) {
              _translateY = _translateY - 100;
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
    return StatefulBuilder(builder: (context, setState) {
      return Transform.translate(
        offset: Offset(0, _translateY),
        child: SimpleDialog(
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          backgroundColor: Colors.transparent,
          children: [
            SizedBox(
              width: width,
              height: height,
              child: Stack(
                children: [
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
                  Positioned(
                    left: 10,
                    right: 10,
                    top: 140,
                    child: Container(
                      height: 206,
                      width: width,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: TextButton(
                              onPressed: () {
                                 Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const HomePageLayout(),
                                      ),
                                    );
                              },
                              child: Center(
                                child: Text(
                                  'Home Page',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
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
                            height: 50,
                            child: TextButton(
                              onPressed: () {
                                 Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const OngoingScreen(),
                                      ),
                                    );
                              },
                              child: Center(
                                child: Text(
                                  'Ongoing todo',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
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
                            height: 50,
                            child: TextButton(
                              onPressed: () {
                                 Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const FinishedToDoScreen(),
                                      ),
                                    );
                              },
                              child: Center(
                                child: Text(
                                  'Finished todo',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
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
                            height: 50,
                            child: TextButton(
                              onPressed: () {
                                 Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const SettingsScreen(),
                                      ),
                                    );
                              },
                              child: Center(
                                child: Text(
                                  'Settings',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
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
                            _animType = false;
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
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
