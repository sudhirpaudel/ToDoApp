import 'package:flutter/material.dart';
import 'package:todoapp/views/about_view/intoduction_screen.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return const Scaffold(
      body: IntroductionScreen(),
      //  body: LoginScreen(),
      //body: HomePageLayout(),
    );
  }
}