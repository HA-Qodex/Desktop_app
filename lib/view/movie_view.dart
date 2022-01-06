import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GetX<HomeController>(
        builder: (controller) {
          return GestureDetector(
            onTap: (){
              controller.small != controller.small;
            },
            child: AnimatedContainer(duration: const Duration(milliseconds: 2000),
              height: controller.small.value ? 200 : 400,
              width: controller.small.value ? 50 : 50,
              color: Colors.yellow,
            ),
          );
        },
      )
    );
  }
}
