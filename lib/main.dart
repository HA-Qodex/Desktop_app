import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:windows_app/view/navigation_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavigationPage(),
    );
  }
}
