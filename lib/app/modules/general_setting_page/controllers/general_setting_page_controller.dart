import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GeneralSettingPageController extends GetxController {
  final TextEditingController shopNameTEC = TextEditingController();
  final TextEditingController locationTEC = TextEditingController();
  final TextEditingController emailTEC = TextEditingController();
  final TextEditingController contactNameTEC = TextEditingController();
  final TextEditingController openingHourTEC = TextEditingController();

  bool alwaysOpen = false;

  void setAlwaysOpenValue(bool value) {
    alwaysOpen = value;
    update();
  }

  @override
  void onClose() {
    shopNameTEC.dispose();
    locationTEC.dispose();
    emailTEC.dispose();
    contactNameTEC.dispose();
    openingHourTEC.dispose();
    super.onClose();
  }
}
