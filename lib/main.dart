import 'package:flutter/material.dart';
import 'package:flutter_app_for_desktop_test/screens/TestScreen.dart';
import 'package:flutter_app_for_desktop_test/value/Strings.dart';

import 'value/AppColor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: new Strings().appName,
      theme: ThemeData(
        primaryColor: AppColor.primaryColor,
        accentColor: AppColor.primaryColor,
      ),
      home: TestScreen(),
    );
  }

}

