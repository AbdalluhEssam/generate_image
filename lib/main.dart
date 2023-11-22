import 'package:generate_image/core/class/local_notification.dart';
import 'package:generate_image/view/widget/home/customButtonAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'binding.dart';
import 'controller/home/homescreen_controller.dart';
import 'core/constant/color.dart';
import 'core/localization/changelocal.dart';
import 'core/services/services.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.init();
  await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LocaleController());
    return GetMaterialApp(
      locale: const Locale("en"),
      debugShowCheckedModeBanner: false,
      title: 'AL Haddad',
      theme: ThemeData(
        useMaterial3: true,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: AppColor.backgroundColor),
        scaffoldBackgroundColor: AppColor.backgroundColor,
        drawerTheme: const DrawerThemeData(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColor.white,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: AppColor.white,
          foregroundColor: AppColor.primaryColor,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              color: AppColor.black, fontSize: 20, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.black),
          bodyLarge: TextStyle(
              color: AppColor.black, fontSize: 14, fontWeight: FontWeight.w400),
          bodyMedium: TextStyle(
              height: 2,
              fontWeight: FontWeight.bold,
              color: AppColor.black,
              fontSize: 14),
        ),
        primarySwatch: Colors.blue,
      ),
      initialBinding: MyBinding(),
      getPages: routes,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              backgroundColor:
                  controller.i == 2 ? AppColor.primaryColor : AppColor.white,
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {},
                child: const Icon(
                  Icons.shopping_bag,
                  color: AppColor.backgroundColor,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(
                color: AppColor.primaryColor,
                shadowColor: AppColor.primaryColor,
                shape: const CircularNotchedRectangle(),
                notchMargin: 10,
                padding: const EdgeInsets.all(1),
                child: Row(
                  children: [
                    ...List.generate(controller.listPage.length + 1, (index) {
                      int i = index > 2 ? index - 1 : index;
                      return index == 2
                          ? const Spacer()
                          : CustomButtonAppBar(
                              text: controller.bottomAppBar[i]['title'],
                              onPressed: () {
                                controller.changePage(i);
                              },
                              iconData: controller.bottomAppBar[i]['icon'],
                              isActive: controller.i == i ? true : false,
                            );
                    })
                  ],
                ),
              ),
              body: controller.listPage.elementAt(controller.i),
            ));
  }
}
