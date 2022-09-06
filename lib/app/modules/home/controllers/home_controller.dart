import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final selectedIndex = 0.obs;

  void increment() => selectedIndex.value++;
}
