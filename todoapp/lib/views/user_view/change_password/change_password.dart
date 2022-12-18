import 'dart:async';
import 'package:flutter/material.dart';
import 'package:todoapp/config/constants/app_color.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({Key? key}) : super(key: key);

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  // ignore: unused_field
  late Animation<double> _animation;
  double _translateY = -500;
  bool _animType = true;
  bool showPass = false;

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
    return StatefulBuilder(
      builder: (context, setState) {
        return Transform.translate(
          offset: Offset(0, _translateY),
          child: SimpleDialog(
            insetPadding: EdgeInsets.zero,
            titlePadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
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
                        height: 370,
                        width: 10,
                        color: secondaryColor,
                      ),
                    ),
                    Positioned(
                      right: 40,
                      child: Container(
                        height: 370,
                        width: 10,
                        color: secondaryColor,
                      ),
                    ),
                    Positioned(
                      left: 10,
                      right: 10,
                      top: 140,
                      child: Container(
                        height: 210,
                        width: width,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 20, 25, 5),
                              child: Text(
                                "CurrentPassword",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: SizedBox(
                                height: 55,
                                child: TextField(
                                  cursorColor: lightPrimaryColor,
                                  obscureText: showPass,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textInputAction: TextInputAction.send,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        top: 10, left: 12),
                                    hintText: "something123",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(color: lighterPrimaryColor),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: lightPrimaryColor, width: 2.0),
                                    ),
                                    disabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: lightPrimaryColor, width: 2.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primaryColor, width: 2.0),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showPass = !showPass;
                                        });
                                      },
                                      icon: !showPass
                                          ? const Icon(
                                              Icons.visibility,
                                              color: lightPrimaryColor,
                                            )
                                          : const Icon(
                                              Icons.visibility_off,
                                              color: lightPrimaryColor,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                              child: Text(
                                "NewPassword",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                              child: SizedBox(
                                height: 55,
                                child: TextField(
                                  cursorColor: lightPrimaryColor,
                                  obscureText: showPass,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textInputAction: TextInputAction.send,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        top: 10, left: 12),
                                    hintText: "something123",
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(color: lighterPrimaryColor),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: lightPrimaryColor, width: 2.0),
                                    ),
                                    disabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: lightPrimaryColor, width: 2.0),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primaryColor, width: 2.0),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showPass = !showPass;
                                        });
                                      },
                                      icon: !showPass
                                          ? const Icon(
                                              Icons.visibility,
                                              color: lightPrimaryColor,
                                            )
                                          : const Icon(
                                              Icons.visibility_off,
                                              color: lightPrimaryColor,
                                            ),
                                    ),
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
                    Positioned(
                      top: 360,
                      right: 10,
                      left: 10,
                      child: Container(
                        height: 60,
                        width: width,
                        decoration: const  BoxDecoration(
                          color: primaryColor,
                          borderRadius:BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(
                              () {
                                _animType = false;
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
                          child: Text(
                            "Change Password",
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      color: secondaryColor,
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
