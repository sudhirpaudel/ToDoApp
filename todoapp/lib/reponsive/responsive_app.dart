import 'package:flutter/material.dart';
import 'package:todoapp/config/constants/constraints.dart';

class ResponsiveApp extends StatelessWidget {
  final Widget webLayout;
  final Widget mobileLayout;

  const ResponsiveApp({
    Key? key,
    required this.mobileLayout,
    required this.webLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        return webLayout;
      } else {
        return mobileLayout;
      }
    });
  }
}
