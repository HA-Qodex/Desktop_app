import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:windows_app/controller/home_controller.dart';
import 'package:windows_app/resources/colors.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            GetX<HomeController>(builder: (controller) {
              return Column(
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
                          ),
                        );
                      });
                    }).toList(),
                    options: CarouselOptions(
                        height: height * 0.6,
                        enlargeCenterPage: false,
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
                  Container(
                    width: width,
                    height: 155,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, AppColors.backgroundColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
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
                                    height: 130,
                                    width: 230,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: controller.currentIndex == index
                                            ? Border.all(
                                                color: Colors.blue, width: 3)
                                            : null,
                                        image: DecorationImage(
                                            image: AssetImage(directory),
                                            fit: BoxFit.fill,
                                            colorFilter:
                                                controller.currentIndex == index
                                                    ? ColorFilter.mode(
                                                        Colors.black
                                                            .withOpacity(0.4),
                                                        BlendMode.darken)
                                                    : null)),
                                    child: Visibility(
                                      visible: controller.currentIndex == index
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
                  )
                ],
              );
            }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                width: width,
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Top free apps",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.left,
                        )),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: homeController.topFreeAppsName.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  width: 150,
                                  height: 250,
                                  padding: const EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.backgroundColor),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                          child: Image.asset(
                                            homeController.topFreeAppsImage[index],
                                            height: 100,
                                            width: 100,
                                          )),
                                      const SizedBox(height: 20,),
                                      Text(
                                        homeController.topFreeAppsName[index],
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(height: 5,),
                                      Text(
                                        homeController.topFreeAppsCategory[index],
                                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(height: 5,),
                                      RatingBarIndicator(
                                        itemCount: 5,
                                        itemSize: 15.0,
                                        unratedColor: Colors.grey,
                                        rating: 3,
                                        itemBuilder: (BuildContext context, int index) {
                                          return const Icon(Icons.star, size: 12, color: Colors.black,);
                                        },),
                                      const Spacer(),
                                      const Text(
                                        "Free",
                                        style: TextStyle(
                                            color: Colors.black),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(width:10),
                                    ],
                                  ),
                                ),
                              );
                            }
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
