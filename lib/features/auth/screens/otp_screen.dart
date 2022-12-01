import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsappcloneflutter/features/auth/controller/auth_controller.dart';
import 'package:whatsappcloneflutter/utils/colors.dart';

class OtpScreen extends ConsumerWidget {
  final String verificationId;
  static const String routeName = "/otp-screen";
  const OtpScreen({super.key, required this.verificationId});

  void verifyOtp(WidgetRef ref, BuildContext context, String userOtp) {
    ref.read(authControllerProvider).verifyOtp(
          context,
          verificationId,
          userOtp,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verifying your number"),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text("We have sent an SMS with code."),
            SizedBox(
              width: size.width * 0.5,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "- - - - - -",
                  hintStyle: TextStyle(fontSize: 30),
                ),
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  if (val.length == 6) {
                    verifyOtp(ref, context, val.trim());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
