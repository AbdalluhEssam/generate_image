import 'package:flutter/material.dart';
import 'package:generate_image/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:generate_image/core/class/statusrequest.dart';
import 'package:generate_image/core/constant/imageassets.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataView({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.none
        ? const Center(
            child: Text(
              "Waiting....",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColor.white
              ),
              textDirection: TextDirection.ltr,
            ),
          )
        : statusRequest == StatusRequest.loading
            ? Container(
                color: AppColor.primaryColor,
                child: Lottie.asset(
                  AppImageAssets.animation,
                ),
              )
            : statusRequest == StatusRequest.offlineFailure
                ? Center(
                    child: Lottie.asset(AppImageAssets.offline,
                        width: Get.width * 0.8, height: Get.width * 0.8),
                  )
                : statusRequest == StatusRequest.serverFailure
                    ? Center(
                        child: Lottie.asset(AppImageAssets.server,
                            width: Get.width * 0.8, height: Get.width * 0.8),
                      )
                    : statusRequest == StatusRequest.failure
                        ? Center(
                            child: Lottie.asset(AppImageAssets.notData,
                                width: Get.width * 0.8,
                                height: Get.width * 0.8),
                          )
                        : widget;
  }
}

class HandlingDataViewNot extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataViewNot({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAssets.loadingAnimation,
                width: Get.width * 0.8, height: Get.width * 0.8),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(AppImageAssets.offline,
                    width: Get.width * 0.8, height: Get.width * 0.8),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(AppImageAssets.server,
                        width: Get.width * 0.8, height: Get.width * 0.8),
                  )
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            "assets/lottie/empty.json",
                            // width: 300,
                            // height: 300,
                            alignment: Alignment.center,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("cart".tr),
                        ],
                      ))
                    : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataRequest({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(AppImageAssets.loadingAnimation,
                width: Get.width * 0.8, height: Get.width * 0.8),
          )
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(AppImageAssets.offline,
                    width: Get.width * 0.8, height: Get.width * 0.8),
              )
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(AppImageAssets.server,
                        width: Get.width * 0.8, height: Get.width * 0.8),
                  )
                : widget;
  }
}
