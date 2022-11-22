import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScreenLayout;
  final Widget desktopScreenLayout;

  const ResponsiveLayout(
      {super.key,
      required this.mobileScreenLayout,
      required this.desktopScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 938) {
          return desktopScreenLayout;
        }
        return mobileScreenLayout;
      },
    );
  }
}
