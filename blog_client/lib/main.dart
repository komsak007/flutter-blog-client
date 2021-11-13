import 'package:blog_client/Pages/HomePage.dart';
import 'package:blog_client/Pages/WelcomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'Pages/WelcomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = WelcomePage();
  final storage = FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    String token = await storage.read(key: "token");
    print(token);
    if (token != null) {
      setState(() {
        page = HomePage();
      });
    } else {
      page = WelcomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme:
              GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)),
      home: page,
    );
  }
}
