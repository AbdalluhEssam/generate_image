// ignore_for_file: avoid_print, unused_local_variable
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:generate_image/core/services/services.dart';
import 'package:generate_image/data/datasource/remote/homedata.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/model/courses_home_model.dart';

abstract class HomeController extends GetxController {
  getData();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  static const String apiKey =
      "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";
  List<ImagesModel> images = [];
  late TextEditingController prompt;
  int? currentIndex;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late StatusRequest statusRequest;

  @override
  void onInit() {
    statusRequest = StatusRequest.none;
    prompt = TextEditingController();
    super.onInit();
  }

  @override
  getData() {
    if (formKey.currentState?.validate() == true) {
      images.clear();
      statusRequest = StatusRequest.loading;
      update();
      homeData.getImageData(apiKey, prompt.text).then((value) {
        statusRequest = handlingData(value);
        log("========================================================================$value");
        if (StatusRequest.success == statusRequest) {
          List image = value["data"];
          images.addAll(image.map((image) => ImagesModel.fromJson(image)));
          update();
        }
      }).catchError((onError) {
        log(onError.toString());
        update();
      });
    }

    update();
  }
}
