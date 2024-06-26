import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:generate_image/controller/onboarding_controller.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static/static.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              children: [
                ...List.generate(
                  onBoardingList.length,
                  (index) => AnimatedContainer(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    duration: const Duration(milliseconds: 900),
                    width:controller.currentPage == index? 25:8,
                    height: 5,
                    decoration: BoxDecoration(
                      color: controller.currentPage == index
                          ? AppColor.secondColor
                          : AppColor.backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ));
  }
}
