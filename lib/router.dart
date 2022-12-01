import 'package:flutter/material.dart';
import 'package:whatsappcloneflutter/common/widgets/error.dart';
import 'package:whatsappcloneflutter/features/auth/screens/login_screen.dart';
import 'package:whatsappcloneflutter/features/auth/screens/otp_screen.dart';
import 'package:whatsappcloneflutter/features/auth/screens/user_information_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => const LoginScreen());

    case OtpScreen.routeName:
      final verificationId = routeSettings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OtpScreen(
          verificationId: verificationId,
        ),
      );

    case UserInformationScreen.routeName:
      return MaterialPageRoute(
          builder: (context) => const UserInformationScreen());

    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: ErrorScreen(error: "This page doesn't exists"),
              ));
  }
}
