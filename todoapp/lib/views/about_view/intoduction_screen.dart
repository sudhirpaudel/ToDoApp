import 'package:flutter/material.dart';
import 'package:todoapp/config/constants/app_color.dart';
import 'package:todoapp/config/constants/widgets.dart';
import 'package:todoapp/views/auth_view/signup_screen.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int pageNo = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List pageStatus = [
      [true, false, false],
      [false, true, false],
      [false, false, true],
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.84,
            child: PageView(
              pageSnapping: true,
              onPageChanged: (page) => setState(() {
                pageNo = page;
              }),
              children: [
                introductionStack(context, 0),
                introductionStack(context, 1),
                introductionStack(context, 2),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: width / 3,
                ),
                !pageStatus[pageNo][0]
                    ? Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          border: Border.all(
                            color: primaryColor,
                            width: 2,
                          ),
                        ),
                      )
                    : Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          border: Border.all(
                            color: primaryColor,
                            width: 2,
                          ),
                        ),
                      ),
                !pageStatus[pageNo][1]
                    ? Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          border: Border.all(
                            color: primaryColor,
                            width: 2,
                          ),
                        ),
                      )
                    : Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          border: Border.all(
                            color: primaryColor,
                            width: 2,
                          ),
                        ),
                      ),
                !pageStatus[pageNo][2]
                    ? Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          border: Border.all(
                            color: primaryColor,
                            width: 2,
                          ),
                        ),
                      )
                    : Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          border: Border.all(
                            color: primaryColor,
                            width: 2,
                          ),
                        ),
                      ),
                pageStatus[pageNo][2]
                    ? SizedBox(
                        width: width / 3,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const SignupScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "SignUp >",
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                ?.copyWith(color: primaryColor),
                          ),
                        ),
                      )
                    : SizedBox(
                        width: width / 3,
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
