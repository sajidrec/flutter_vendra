import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPassPageController extends GetxController {
  final TextEditingController emailTEC = TextEditingController();

  bool validEmail = false;

  void setValidEmail(bool value) {
    validEmail = value;
    update();
  }

  @override
  void onClose() {
    emailTEC.dispose();
    super.onClose();
  }
}
