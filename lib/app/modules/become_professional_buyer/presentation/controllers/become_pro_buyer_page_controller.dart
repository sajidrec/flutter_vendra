import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BecomeProBuyerPageController extends GetxController {
  bool firstNameFilled = false;
  bool lastNameFilled = false;

  int progressedIndex = 1;

  final TextEditingController firstNameTEC = TextEditingController();
  final TextEditingController lastNameTEC = TextEditingController();

  void setFirstNameFilled(bool value) {
    firstNameFilled = value;
    update();
  }

  void setLastNameFilled(bool value) {
    lastNameFilled = value;
    update();
  }

  void increaseProgressIndex() {
    progressedIndex++;
    update();
  }

  void decreaseProgressIndex() {
    if (progressedIndex > 0) {
      progressedIndex--;
    }

    update();
  }

  @override
  void onClose() {
    super.onClose();
    firstNameTEC.dispose();
    lastNameTEC.dispose();
  }
}
