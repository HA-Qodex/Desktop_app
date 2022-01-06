import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:windows_app/controller/home_controller.dart';

class AppsPage extends StatelessWidget {
  AppsPage({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery
    //     .of(context)
    //     .size
    //     .height;
    // final width = MediaQuery
    //     .of(context)
    //     .size
    //     .width;
    return GetX<HomeController>(
      builder: (controller) {
        return GestureDetector(
          onTap: (){
            controller.small != controller.small;
          },
          child: AnimatedContainer(duration: const Duration(milliseconds: 2000),
            height: controller.small.value ? 200 : 400,
            width: controller.small.value ? 200 : 400,
            color: Colors.yellow,
          ),
        );
      },
    );
  }
}
