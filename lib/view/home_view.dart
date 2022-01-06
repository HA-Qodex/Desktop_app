import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                clipBehavior: Clip.none,
                children: [
                  CarouselSlider(
                    carouselController: controller.caroselController,
                    items: controller.slideImageList.map((image) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          width: width,
                          foregroundDecoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                                Colors.transparent,
                                Colors.black
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0, 0.2, 0.8, 1],
                            ),
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(image), fit: BoxFit.fill),
                            // borderRadius: BorderRadius.circular(5),
                          ),
                        );
                      });
                    }).toList(),
                    options: CarouselOptions(
                        height: height * 0.7,
                        enlargeCenterPage: true,
                        autoPlay:
                            controller.slideImageList.length > 1 ? true : false,
                        autoPlayCurve: Curves.linearToEaseOut,
                        autoPlayInterval: const Duration(seconds: 5),
                        viewportFraction: 1,
                        enableInfiniteScroll: true,
                        pageSnapping: true,
                        pauseAutoPlayInFiniteScroll: true,
                        scrollDirection: Axis.horizontal,
                        autoPlayAnimationDuration: const Duration(seconds: 1),
                        initialPage: 0,
                        onPageChanged: (index, _) {
                          controller.currentIndex.value = index;
                        }),
                  ),
                  Positioned(
                    bottom: -(height * 0.15),
                    child: Container(
                      width: width,
                      decoration: const BoxDecoration(gradient: LinearGradient(colors: [
                        Colors.black,
                        // Colors.black87,
                        Colors.white
                      ],begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: controller.map<Widget>(
                              controller.slideImageList, (index, directory) {
                            return Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.currentIndex.value = index;
                                  },
                                  child: Container(
                                      height: 150,
                                      width: 250,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border:
                                              controller.currentIndex == index
                                                  ? Border.all(
                                                      color: Colors.blue,
                                                      width: 3)
                                                  : null,
                                          image: DecorationImage(
                                              image: AssetImage(directory),
                                              fit: BoxFit.fill,
                                              colorFilter:
                                                  controller.currentIndex ==
                                                          index
                                                      ? ColorFilter.mode(
                                                          Colors.black
                                                              .withOpacity(0.4),
                                                          BlendMode.darken)
                                                      : null)),
                                      child: Visibility(
                                        visible:
                                            controller.currentIndex == index
                                                ? true
                                                : false,
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              controller.bannerTitle[index],
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            )),
                                      )),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
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
