import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/apps_view.dart';
import '../view/games_view.dart';
import '../view/home_view.dart';
import '../view/movie_view.dart';

class NavigationController extends GetxController{

  final caroselController = CarouselController();

  var selectedIndex = 0.obs;
  var secondarySelectedIndex = 0.obs;

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

}