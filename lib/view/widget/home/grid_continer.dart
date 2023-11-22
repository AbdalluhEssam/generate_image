import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

Widget buildGridContainer(text, image, {void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Card(
      color: AppColor.primaryColor,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              width: 50,
              height: 50,
              color: AppColor.white,
            ),
            Text(text,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.white,

                ))
          ],
        ),
      ),
    ),
  );
}
