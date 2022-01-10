import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  final caroselController = CarouselController();
  var currentIndex = 0.obs;
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
