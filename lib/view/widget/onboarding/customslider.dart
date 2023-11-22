import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:generate_image/controller/onboarding_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        clipBehavior: Clip.none,
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  onBoardingList[i].image!,
                  width: Get.width,
                  fit: BoxFit.contain,
                ),
                Column(
                  children: [
                    Text(
                      onBoardingList[i].text!,
                      style: const TextStyle(
                          height: 1.2,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColor.backgroundColor),
                    ),
                    SizedBox(
                      height: Get.width * 0.12,
                    ),
                    Text(
                      onBoardingList[i].body!,
                      style: TextStyle(
                          height: 1.2,
                          fontWeight: FontWeight.w400,
                          color: AppColor.backgroundColor.withOpacity(0.6),
                          fontSize: 18),
                    ),
                  ],
                )
              ],
            ));
  }
}
