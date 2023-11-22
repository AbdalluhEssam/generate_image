import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomBottomAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData iconData;
  final bool isActive;

  const CustomBottomAppBar({
    Key? key,
    this.onPressed,
    required this.text,
    required this.iconData,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 6,
          ),
          Icon(
            iconData,
            color: isActive == true
                ? AppColor.secondColor
                : AppColor.black,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 12,
                color: isActive == true
                    ? AppColor.secondColor
                    : AppColor.black),
          )
        ],
      ),
    );
  }
}
