import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsappcloneflutter/common/utils/utils.dart';
import 'package:whatsappcloneflutter/common/widgets/custom_button.dart';
import 'package:whatsappcloneflutter/features/auth/controller/auth_controller.dart';
import 'package:whatsappcloneflutter/utils/colors.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = "/login-screen";
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        countryListTheme: const CountryListThemeData(bottomSheetHeight: 500),
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    if (country != null && phoneController.text.isNotEmpty) {
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, "+${country!.phoneCode}$phoneNumber");
    } else {
      showSnackBar(context: context, content: "Fill out all the fields!");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Enter your phone number"),
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Whatsapp will need to verify your phone number"),
            const SizedBox(height: 10),
            TextButton(
                onPressed: () => pickCountry(),
                child: const Text("Pick Country")),
            const SizedBox(height: 10),
            Row(
              children: [
                if (country != null) Text("+${country!.phoneCode}"),
                const SizedBox(width: 10),
                SizedBox(
                  width: size.width * 0.70,
                  child: TextField(
                    controller: phoneController,
                    decoration: const InputDecoration(hintText: "phone number"),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.60),
            SizedBox(
              width: 90,
              child: CustomButton(
                onPressed: () => sendPhoneNumber(),
                text: "Next",
              ),
            )
          ],
        ),
      ),
    );
  }
}
