import 'package:get/get.dart';
import 'package:generate_image/controller/home/home_controller.dart';
import 'package:generate_image/core/class/crud.dart';
import 'controller/home/personinformation_controller.dart';


class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.lazyPut(() => HomeControllerImp(), fenix: true);
    Get.lazyPut(() => PersonInfoControllerImp(), fenix: true);

  }
}
