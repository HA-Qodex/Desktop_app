import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:windows_app/controller/home_controller.dart';
import 'package:windows_app/resources/colors.dart';

class NavigationPage extends StatelessWidget {
  NavigationPage({Key? key}) : super(key: key);

  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(children: [
          Container(
            color: AppColors.secondBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset("assets/store.png")),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Microsoft Store",
                      style: TextStyle(color: Colors.black87, fontSize: 12),
                    ),
                  ],
                ),
                Flexible(
                  child: Container(
                    height: 30,
                    width: 450,
                    decoration: BoxDecoration(
                        color: AppColors.lightShadowColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              color: AppColors.lightShadowColor,
                              offset: Offset(1, 1)),
                          BoxShadow(
                              color: AppColors.shadowColor,
                              offset: Offset(-1, -1)),
                        ]),
                    child: Row(
                      children: const [
                        Expanded(
                          child: TextField(
                            maxLines: 1,
                            style:
                                TextStyle(fontSize: 14, color: Colors.black),
                            decoration: InputDecoration(
                              hintText: "Search apps, games, movies and more",
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 3.0),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.backgroundColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.backgroundColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            CupertinoIcons.search,
                            color: Colors.black87,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.shadowColor,
                      child: Image.asset("assets/profile.png")),
                )
              ],
            ),
          ),
          Expanded(
              child: Row(children: [
            GetX<HomeController>(builder: (controller) {
              return Container(
                padding: const EdgeInsets.only(top: 10),
                width: 70,
                height: height,
                color: AppColors.secondBackgroundColor,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: homeController.pages.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                homeController.selectedIndex.value = index;
                              },
                              child:
                                  GetX<HomeController>(builder: (controller) {
                                return Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: homeController.selectedIndex.value ==
                                        index
                                        ? Colors.blue.withOpacity(0.1)
                                        : AppColors.secondBackgroundColor,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    children: [
                                      GetX<HomeController>(
                                        builder: (controller) {
                                          return Visibility(
                                            visible: homeController
                                                        .selectedIndex.value ==
                                                    index
                                                ? true
                                                : false,
                                            child: Container(
                                              width: 3,
                                              height: 30,
                                              color: Colors.blue,
                                            ),
                                          );
                                        },
                                      ),
                                      Expanded(
                                        child: GetX<HomeController>(
                                            builder: (controller) {
                                          return Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              homeController.icons[index],
                                              Visibility(
                                                  visible: homeController
                                                              .selectedIndex
                                                              .value ==
                                                          index
                                                      ? false
                                                      : true,
                                                  child: homeController
                                                      .title[index]),
                                            ],
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            );
                          }),
                    ),
                    Column(
                      children: [
                        Container(
                          height: 50,
                          color: AppColors.secondBackgroundColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.local_mall_outlined,
                                size: 30,
                              ),
                              Text(
                                "Library",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          color: AppColors.secondBackgroundColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.help_outline,
                                size: 30,
                              ),
                              Text(
                                "Help",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
            Expanded(child: GetX<HomeController>(
              builder: (controller) {
                return controller.pages[controller.selectedIndex.value];
              },
            ))
          ]))
        ]));
  }
}
