import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:generate_image/core/services/services.dart';
import '../constant/apptheme.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) {
    Locale locale = const Locale("en");
    myServices.sharedPreferences.setString("lang", langcode);
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPreLang = myServices.sharedPreferences.getString("lang");
    // if (sharedPreLang == "ar") {
    //   language = const Locale("ar");
    // } else if (sharedPreLang == "en") {
    //   language = const Locale("en");
    //   appTheme = themeEnglish;
    // } else {
    //   language = Locale(Get.deviceLocale!.languageCode);
    // }
    language = const Locale("en");

    appTheme = themeEnglish;
    super.onInit();
  }
}
