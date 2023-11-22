import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:generate_image/controller/home/home_controller.dart';
import 'package:generate_image/core/constant/color.dart';
import 'package:lottie/lottie.dart';
import '../../../core/constant/imageassets.dart';
import '../../../core/constant/routes.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  HomeControllerImp controller = Get.put(HomeControllerImp());

  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      await Get.toNamed(AppRoute.myHomePage);
    });
  }

  @override
  void initState() {
    startTimer();
    controller.update();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColor.primaryColor,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImageAssets.onBoardingImageBackground))
          ),
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                    margin: EdgeInsets.only(top: Get.width * 0.1),
                    child: Image.asset(
                      AppImageAssets.onBoardingImageLogo,
                    )),
              ),
              const Spacer(
                flex: 3,
              ),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    LottieBuilder.asset(
                      "assets/lottie/loading_animation.json",
                      width: Get.width * 0.6,
                    ),
                    const Spacer(),
                    Text(
                      "IEEE OSB | ©2023",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: AppColor.backgroundColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
