import 'package:get/get.dart';

class DashboardController extends GetxController {
  var currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    update();
  }
}
