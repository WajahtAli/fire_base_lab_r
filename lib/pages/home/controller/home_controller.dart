import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt count = 0.obs;

  void incr() {
    count.value++;
  }

  void decr() {
    count.value--;
  }
}
