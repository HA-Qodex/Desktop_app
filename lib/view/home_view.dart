import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:windows_app/controller/home_controller.dart';

import '../resources/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GetX<HomeController>(builder: (controller) {
          return Column(
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    items: controller.slideImageList.map((image) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          width: width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    image),
                                fit: BoxFit.fill),
                            // borderRadius: BorderRadius.circular(5),
                          ),
                        );
                      });
                    }).toList(),
                    options: CarouselOptions(
                        height: height * 0.7,
                        enlargeCenterPage: true,
                        autoPlay: controller.slideImageList.length > 1
                            ? true
                            : false,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        autoPlayInterval: const Duration(seconds: 5),
                        viewportFraction: 1,
                        autoPlayAnimationDuration:
                        const Duration(seconds: 1),
                        initialPage: 0,
                        onPageChanged: (index, _) {
                          controller.currentIndex.value = index;
                        }),
                  ),
                  Positioned(
                    bottom: 5,
                    right: 50,
                    left: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: controller.map<Widget>(controller.slideImageList,
                              (index, directory) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0),
                              child: Icon(Icons.circle,
                                  size: 10,
                                  color: controller.currentIndex == index
                                      ? AppColors.secondary
                                      : Colors.white),
                            );
                          }),
                    ),
                  ),
                ],
              )
            ],
          );
        }),
      ],
    );
  }
}
