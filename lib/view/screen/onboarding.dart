import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:generate_image/controller/onboarding_controller.dart';
import 'package:generate_image/core/constant/imageassets.dart';
import '../widget/onboarding/custom_appbar.dart';
import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customslider.dart';
import '../widget/onboarding/dotcontroller.dart';

class OnBoarding extends GetView<OnBoardingControllerImp> {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
        appBar: buildAppBar(),
        body: Container(
          clipBehavior: Clip.none,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AppImageAssets.onBoardingImageBackground))),
          child: InkWell(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  flex: 1,
                  child: Image.asset(
                    alignment: AlignmentDirectional.centerStart,
                    AppImageAssets.onBoardingImageLogo,
                    height: 60,
                    fit: BoxFit.cover,
                  )),
              const Expanded(flex: 5, child: CustomSliderOnBoarding()),
              const Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(child: CustomDotControllerOnBoarding()),
                        Flexible(flex: 2, child: CustomButtonOnBoarding())
                      ],
                    ),
                  )),
            ],
          )),
        ));
  }


}
