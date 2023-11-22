import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:generate_image/controller/onboarding_controller.dart';

import '../../../core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: MaterialButton(
        minWidth: 150,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
        onPressed: () {
          controller.next();
        },
        color: AppColor.secondColor,
        textColor: Colors.white,
        textTheme: ButtonTextTheme.accent,
        child:const  Text("Next",style: TextStyle(fontSize: 18)),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget? child;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle(
            side: const MaterialStatePropertyAll(BorderSide(
              color: AppColor.backgroundColor,
            )),
            foregroundColor:
            const MaterialStatePropertyAll(AppColor.backgroundColor),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ))),
        onPressed: onPressed,
        child: child);
  }
}
