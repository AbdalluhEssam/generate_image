import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:generate_image/core/constant/color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

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
        title: const Text("Contact us"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  color: AppColor.primaryColor,
                  height: 2,
                  width: 300,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: buildMenuItem(
                      icon: Icons.phone_outlined,
                      text: "0100 061 5819".tr,
                      onClicked: () {
                        calling();
                      }),
                ),
                Container(
                  color: AppColor.primaryColor,
                  height: 2,
                  width: 300,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: buildMenuItem(
                      icon: Icons.mail,
                      text: "info@ieee-osb.com",
                      onClicked: () {
                        sentMail();
                      }),
                ),
                Container(
                  color: AppColor.primaryColor,
                  height: 2,
                  width: 300,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  width: Get.width * 0.70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildMedia(
                          icon: Icons.facebook,
                          text: "Facebook",
                          onPressed: () {
                            facebook();
                          }),
                      buildMedia(
                          icon: FontAwesome.whatsapp,
                          text: "Whatsapp",
                          onPressed: () {
                            whatsapp();
                          }),
                      buildMedia(
                          icon: FontAwesome.linkedin,
                          text: "Linked In",
                          onPressed: () {
                            webSite();
                          }),
                    ],
                  ),
                ),
                const Text(
                  "IEEE OSB | ©2023",
                  style: TextStyle(color: AppColor.black),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  whatsapp() async {
    const url = "whatsapp://send?phone=+2001000615819";
    await launchUrlString(url);
  }

  facebook() async {
    const url = 'https://www.facebook.com/profile.php?id=100086469804756';
    await launchUrlString(url);
  }

  webSite() async {
    const url =
        'https://www.linkedin.com/company/ieee-obour-institute/mycompany/';
    await launchUrlString(url);
  }

  calling() async {
    const url = 'tel:01000615819';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not lanuch $url';
    }
  }

  sentMail() async {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');
    }

// ···
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'ieeeobour7@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Welcome To IEEE OSB',
      }),
    );
    launchUrl(emailLaunchUri);
  }
}

Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked,
}) {
  const color = AppColor.primaryColor;
  const hoverColor = AppColor.black;
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: const TextStyle(color: hoverColor),
    ),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

Widget buildMedia(
    {required String text,
    required IconData icon,
    void Function()? onPressed}) {
  const color = AppColor.secondColor;
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        IconButton(
          onPressed: onPressed,
          iconSize: 30,
          icon: Icon(
            icon,
            color: color,
          ),
        ),
        Text(
          text,
          style: const TextStyle(color: AppColor.secondColor, fontSize: 10),
        ),
      ],
    ),
  );
}
