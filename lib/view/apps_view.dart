import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:windows_app/controller/home_controller.dart';

class AppsPage extends StatelessWidget {
  AppsPage({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Apps")),
    );
  }
}
