import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/constant/color.dart';

AppBar buildAppBar() {
  return AppBar(
    toolbarHeight: 0,
    elevation: 0,
    systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColor.primaryColor,
        statusBarIconBrightness: Brightness.light),
  );
}