import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/apps_view.dart';
import '../view/games_view.dart';
import '../view/home_view.dart';
import '../view/movie_view.dart';

class HomeController extends GetxController{

  var selectedIndex = 0.obs;
  var currentIndex = 0.obs;
  var secondarySelectedIndex = 0.obs;
  var small = true.obs;

  var icons = [
    const Icon(
      Icons.home_outlined,
      size: 30,
    ),
    const Icon(
      Icons.app_registration_outlined,
      size: 30,
    ),
    const Icon(
      Icons.sports_esports_outlined,
      size: 30,
    ),
    const Icon(
      Icons.live_tv_outlined,
      size: 30,
    ),
  ].obs;

  var title = [
    const Text(
      "Home",
      style: TextStyle(fontSize: 10),
    ),
    const Text(
      "Apps",
      style: TextStyle(fontSize: 10),
    ),
    const Text(
      "Games",
      style: TextStyle(fontSize: 10),
    ),
    const Text(
      "Movies & TV",
      style: TextStyle(fontSize: 10),
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

  List<Tile> map<Tile>(List list, Function function) {
    List<Tile> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(function(i, list[i]));
    }
    return result;
  }
}