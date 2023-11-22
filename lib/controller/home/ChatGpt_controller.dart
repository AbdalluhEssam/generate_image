// ignore_for_file: avoid_print, unused_local_variable
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:generate_image/data/model/massage_model.dart';
import 'package:get/get.dart';
import 'package:generate_image/core/services/services.dart';
import 'package:generate_image/data/datasource/remote/homedata.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

abstract class ChatGptController extends GetxController {
  getData();
}

class ChatGptControllerImp extends ChatGptController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  static const String apiKey =
      "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";
  List<MassageModel> message = [];
  List<String> messageMe = [];
  late TextEditingController content;
  int? currentIndex;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late StatusRequest statusRequest;

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.none;
    content = TextEditingController();
    super.onInit();
  }

  @override
  getData() {
    update();
    if (formKey.currentState?.validate() == true) {
      message.add(MassageModel.fromJson({"role": "messageMe", "content": content.text}));
      update();
      homeData.chatGptData(apiKey, content.text).then((value) {
        statusRequest = handlingData(value);
        log("========================================================================$value");
        if (StatusRequest.success == statusRequest) {
          update();
          message.add(MassageModel.fromJson(value["choices"][0]['message']));
          log("========================================================================${message[1].content}");

          update();
        }
      }).catchError((onError) {
        log(onError.toString());
        update();
      });
    }
    content.clear();
    update();
  }
}
