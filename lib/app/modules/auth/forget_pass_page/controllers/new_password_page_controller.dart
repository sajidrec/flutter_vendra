import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NewPasswordPageController extends GetxController {
  final TextEditingController passTEC = TextEditingController();
  final TextEditingController confirmPassTEC = TextEditingController();

  bool bothPassMatched = false;

  bool atLeast8Char = false;
  bool atLeast1Number = false;
  bool bothUpperAndLowerCase = false;

  setBothPassMatchedStatus(bool value) {
    bothPassMatched = value;
    update();
  }

  void setAtLeast8Char(bool value) {
    atLeast8Char = value;
    update();
  }

  void setAtLeast1Number(bool value) {
    atLeast1Number = value;
    update();
  }

  void setBothUpperAndLowerCase(bool value) {
    bothUpperAndLowerCase = value;
    update();
  }

  @override
  void onClose() {
    passTEC.dispose();
    confirmPassTEC.dispose();
    super.onClose();
  }
}
