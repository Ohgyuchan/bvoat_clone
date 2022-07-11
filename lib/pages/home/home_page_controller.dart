import 'package:bvoat_clone/pages/home/home_enum.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  static HomePageController get instance => Get.find();
  var selectedHomeEnum = HomeEnum.store.obs;

  onTap(value) {
    selectedHomeEnum.value = HomeEnum.values.elementAt(value);
  }
}
