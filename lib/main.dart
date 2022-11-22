import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsappcloneflutter/firebase_options.dart';
import 'package:whatsappcloneflutter/screens/desktop_layout_screen.dart';
import 'package:whatsappcloneflutter/screens/mobile_layout_screen.dart';
import 'package:whatsappcloneflutter/utils/colors.dart';
import 'package:whatsappcloneflutter/utils/response_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WhatsappFlutter",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileLayoutScreen(),
        desktopScreenLayout: DesktopLayoutScreen(),
      ),
    );
  }
}