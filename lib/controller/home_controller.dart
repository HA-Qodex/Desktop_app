import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/apps_view.dart';
import '../view/games_view.dart';
import '../view/home_view.dart';
import '../view/movie_view.dart';

class HomeController extends GetxController {
  final caroselController = CarouselController();

  var selectedIndex = 0.obs;
  var currentIndex = 0.obs;
  var secondarySelectedIndex = 0.obs;
  var small = true.obs;

  var icons = [
    const Icon(
      Icons.home_outlined,
      size: 30,
      color: Colors.black54,
    ),
    const Icon(
      Icons.app_registration_outlined,
      size: 30,
      color: Colors.black54,
    ),
    const Icon(
      Icons.sports_esports_outlined,
      size: 30,
      color: Colors.black54,
    ),
    const Icon(
      Icons.live_tv_outlined,
      size: 30,
      color: Colors.black54,
    ),
  ].obs;

  var title = [
    const Text(
      "Home",
      style: TextStyle(
        fontSize: 10,
        color: Colors.black54,
      ),
    ),
    const Text(
      "Apps",
      style: TextStyle(
        fontSize: 10,
        color: Colors.black54,
      ),
    ),
    const Text(
      "Games",
      style: TextStyle(
        fontSize: 10,
        color: Colors.black54,
      ),
    ),
    const Text(
      "Movies & TV",
      style: TextStyle(
        fontSize: 10,
        color: Colors.black54,
      ),
    ),
  ].obs;

  var pages = [
    HomePage(),
    AppsPage(),
    GamesPage(),
    MoviePage(),
  ].obs;

  var slideImageList = [
    "assets/banner/banner_1.jpg",
    "assets/banner/banner_2.jpg",
    "assets/banner/banner_3.png",
    "assets/banner/banner_4.jpg",
    "assets/banner/banner_5.jpeg",
    "assets/banner/banner_6.jpg",
    "assets/banner/banner_7.png"
  ].obs;

  var bannerTitle = [
    "The Witcher",
    "Minecraft",
    "Among Us",
    "Halo INFINITE",
    "Angry Bird",
    "Asphalt 9",
    "Watch Dogs LEGION"
  ].obs;

  List<Tile> map<Tile>(List list, Function function) {
    List<Tile> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(function(i, list[i]));
    }
    return result;
  }

  var topFreeAppsImage = [
    "assets/product/itune.png",
    "assets/product/xbox.png",
    "assets/product/disnep.png",
    "assets/product/tiktok.png",
    "assets/product/icloud.png",
    "assets/product/netflix.png"
  ];

  var topFreeAppsName = [
    "iTune",
    "Xbox",
    "disnep",
    "tiktok",
    "icloud",
    "netflix"
  ];

  var topFreeAppsCategory = [
    "Music",
    "Entertainment",
    "Entertainment",
    "Entertainment",
    "Productivity",
    "Entertainment",
  ];

  var topFreeAppsRatings = [
    3,4,2,5,3,4
  ];
}
