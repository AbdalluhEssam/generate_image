import 'package:generate_image/view/screen/home/chatGptPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:generate_image/core/constant/icon_broken.dart';
import '../../view/screen/home/home.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentPage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int i = 0;
  List<Widget> listPage = [
    const HomePage(),
    const HomePage(),
    const ChatGptPage(),
    const HomePage(),
  ];
  List bottomAppBar = [
    {"title": "الصفحة الرئسية", "icon": IconBroken.Home},
    {"title": "الخدمات", "icon": IconBroken.Category},
    {"title": "الاشعارات", "icon": IconBroken.Notification},
    {"title": "اتصل بنا", "icon": IconBroken.Call},
  ];

  @override
  changePage(currentPage) {
    i = currentPage;
    update();
  }
}
