import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final TextEditingController searchTEC = TextEditingController();

  int sliderIndex = 0;

  void changeSliderIndex({required int activeIndex}) {
    sliderIndex = activeIndex;
    update();
  }

  @override
  void onClose() {
    searchTEC.dispose();
    super.onClose();
  }
}
