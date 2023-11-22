import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:generate_image/controller/home/home_controller.dart';
import 'package:generate_image/core/services/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/class/statusrequest.dart';

abstract class PersonInfoController extends GetxController {
  initialData();

  editUser();
}

class PersonInfoControllerImp extends PersonInfoController {
  MyServices myServices = Get.find();

  late StatusRequest statusRequest;
  HomeControllerImp controllerHome = Get.put(HomeControllerImp());

  TextEditingController universityYear = TextEditingController();
  TextEditingController phone = TextEditingController();

  final ImagePicker picker = ImagePicker();
  File? profileImage;

  Future getProfileImage() async {
    await picker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        profileImage = File(value.path);
        update();
      } else {
        log('No Image Selected');
        update();
      }
    });
    //     .catchError((onError) {
    //   log(onError);
    // });

    update();
  }

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String? username;
  String? id;
  String? email;
  String? image;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("name");
    image = myServices.sharedPreferences.getString("image");
    email = myServices.sharedPreferences.getString("email");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    initialData();
    statusRequest = StatusRequest.success;

    super.onInit();
  }

  @override
  editUser() async {
    statusRequest = StatusRequest.loading;
  }
}
