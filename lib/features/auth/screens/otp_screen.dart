import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  static const String routeName = "/otp-screen";
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
