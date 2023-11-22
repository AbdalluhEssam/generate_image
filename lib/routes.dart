import 'package:generate_image/view/screen/home/chatGptPage.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:generate_image/core/constant/routes.dart';
import 'package:generate_image/core/middleware/mymiddleware.dart';
import 'package:generate_image/main.dart';
import 'package:generate_image/view/screen/home/home.dart';
import 'package:generate_image/view/screen/home/munesetting/aboutus.dart';
import 'package:generate_image/view/screen/home/munesetting/helppage.dart';
import 'package:generate_image/view/screen/home/splash_screen.dart';
import 'package:generate_image/view/screen/language.dart';
import 'package:generate_image/view/screen/onboarding.dart';

List<GetPage<dynamic>>? routes = [
  //Auth
  GetPage( name: "/", page: () => const HomePage(),
      // middlewares: [MyMiddleWare()]
  ),
  // GetPage(name: "/", page: () => const TestView()),
  GetPage(name: AppRoute.language, page: () => const Language()),

  //OnBoarding

  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),

  // HOME
  GetPage(name: AppRoute.home, page: () => const HomePage()),
  GetPage(name: AppRoute.myHomePage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.chatGptPage, page: () => const ChatGptPage()),
  GetPage(name: AppRoute.aboutUs, page: () => const AboutUs()),
  GetPage(name: AppRoute.helpPage, page: () => const HelpPage()),
  GetPage(name: AppRoute.mySplashScreen, page: () => const MySplashScreen()),
];
