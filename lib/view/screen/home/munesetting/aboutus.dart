import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:generate_image/core/constant/color.dart';
import 'package:generate_image/core/constant/imageassets.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        foregroundColor: AppColor.primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColor.backgroundColor,
            statusBarIconBrightness: Brightness.dark),
        centerTitle: true,
        title: Text("About Us".tr),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Image.asset(
                AppImageAssets.onBoardingImageLogo,
                alignment: Alignment.center,
                color: AppColor.primaryColor,
                fit: BoxFit.fill,
              ),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                child: Text(
                  "We are IEEE Obour Student Branch, Our location is at Faculty of Computer Science Obour University.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 15, color: AppColor.black.withOpacity(0.4)),
                )),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("IEEE OSB | ©2023")],
            ),
          ],
        ),
      ),
    );
  }
}
