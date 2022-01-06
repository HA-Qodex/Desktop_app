import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:windows_app/controller/home_controller.dart';
import 'package:windows_app/resources/colors.dart';

import 'apps_view.dart';
import 'movie_view.dart';

// class HomePage extends StatelessWidget {
//   HomePage({Key? key}) : super(key: key);
//
//   final homeController = Get.put(HomeController());
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: Column(
//         children: [
//           Container(
//             color: AppColors.secondBackgroundColor,
//             child: Row(
//               children: [
//                 Container(
//                     height: 40,
//                     width: 40,
//                     padding: const EdgeInsets.all(5.0),
//                     child: Image.asset("assets/store.png")),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 const Text(
//                   "Microsoft Store",
//                   style: TextStyle(color: Colors.black87, fontSize: 12),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: width * 0.07),
//                     child: Container(
//                       height: 30,
//                       decoration: BoxDecoration(
//                           color: AppColors.lightShadowColor,
//                           borderRadius: BorderRadius.circular(5),
//                           boxShadow: const [
//                             BoxShadow(
//                                 color: AppColors.lightShadowColor,
//                                 offset: Offset(1, 1)),
//                             BoxShadow(
//                                 color: AppColors.shadowColor,
//                                 offset: Offset(-1, -1)),
//                           ]),
//                       child: Row(
//                         children: const [
//                           Expanded(
//                             child: TextField(
//                               maxLines: 1,
//                               style:
//                                   TextStyle(fontSize: 14, color: Colors.black),
//                               decoration: InputDecoration(
//                                 hintText: "Search apps, games, movies and more",
//                                 contentPadding: EdgeInsets.symmetric(
//                                     vertical: 15.0, horizontal: 3.0),
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                       color: AppColors.backgroundColor),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                       color: AppColors.backgroundColor),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Icon(
//                             CupertinoIcons.search,
//                             color: Colors.black87,
//                             size: 20,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 10.0),
//                   child: CircleAvatar(
//                       radius: 15,
//                       backgroundColor: AppColors.shadowColor,
//                       child: Image.asset("assets/profile.png")),
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//             child: Row(
//               children: [
//                 GetX<HomeController>(builder: (controller) {
//                   return Container(
//                     padding: const EdgeInsets.only(top: 10),
//                     width: 70,
//                     color: AppColors.secondBackgroundColor,
//                     child: ListView.builder(
//                         itemCount: controller.pages.length,
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onTap: () {
//                               controller.selectedIndex.value = index;
//                             },
//                             child: Container(
//                               height: 50,
//                               color: controller.selectedIndex.value == index
//                                   ? Colors.grey.withOpacity(0.4)
//                                   : AppColors.secondBackgroundColor,
//                               child: Row(
//                                 children: [
//                                   Visibility(
//                                     visible:
//                                         controller.selectedIndex.value == index
//                                             ? true
//                                             : false,
//                                     child: Container(
//                                       width: 3,
//                                       height: 30,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         controller.icons[index],
//                                         Visibility(
//                                             visible: controller
//                                                         .selectedIndex.value ==
//                                                     index
//                                                 ? false
//                                                 : true,
//                                             child: controller.title[index]),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         }),
//                   );
//                 }),
//                 Expanded(
//                   child: Container(
//                     color: Colors.green,
//                     child: GetX<HomeController>(
//                       builder: (controller) {
//                         return Text(controller.selectedIndex.value.toString());
//                       },
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           homeController.selectedIndex.value++;
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

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
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: Container(
                      height: 30,
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
                          Icon(
                            CupertinoIcons.search,
                            color: Colors.black87,
                            size: 20,
                          ),
                        ],
                      ),
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
                Obx((){return Container(
                padding: const EdgeInsets.only(top: 10),
                width: 70,
                color: AppColors.secondBackgroundColor,
                child: ListView.builder(
                    itemCount: homeController.pages.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          homeController.selectedIndex.value = index;
                        },
                        child: Container(
                          height: 50,
                          color: homeController.selectedIndex.value == index
                              ? Colors.grey.withOpacity(0.4)
                              : AppColors.secondBackgroundColor,
                          child: Row(
                            children: [
                              Visibility(
                                visible: homeController.selectedIndex.value == index
                                    ? true
                                    : false,
                                child: Container(
                                  width: 3,
                                  height: 30,
                                  color: Colors.blue,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    homeController.icons[index],
                                    Visibility(
                                        visible:
                                        homeController.selectedIndex.value ==
                                                    index
                                                ? false
                                                : true,
                                        child: homeController.title[index]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }),
            Expanded(
              child: Center(
                child: Container(
                  height: height,
                  width: width*0.4,
                  color: Colors.green,
                  child:Obx(() {
                    return Container(
                      padding: const EdgeInsets.only(top: 10),
                      width: 70,
                      color: AppColors.secondBackgroundColor,
                      child: ListView.builder(
                          itemCount: homeController.pages.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                homeController.selectedIndex.value = index;
                                print(homeController.selectedIndex.value);
                              },
                              child: Container(
                                height: 50,
                                color: homeController.selectedIndex.value ==
                                    index
                                    ? Colors.grey.withOpacity(0.4)
                                    : AppColors.secondBackgroundColor,
                                child: Row(
                                  children: [
                                    Visibility(
                                      visible: homeController.selectedIndex
                                          .value == index
                                          ? true
                                          : false,
                                      child: Container(
                                        width: 3,
                                        height: 30,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          homeController.icons[index],
                                          Visibility(
                                              visible:
                                              homeController.selectedIndex
                                                  .value ==
                                                  index
                                                  ? false
                                                  : true,
                                              child: homeController
                                                  .title[index]),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  }),
              ),
            )
            )]))
        ]));
  }
}
