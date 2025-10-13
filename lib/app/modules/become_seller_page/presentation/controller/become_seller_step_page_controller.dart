import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BecomeSellerStepPageController extends GetxController {
  final TextEditingController firstNameTec = TextEditingController();
  final TextEditingController lastNameTec = TextEditingController();

  final TextEditingController businessNameTec = TextEditingController();
  final TextEditingController businessTypeTec = TextEditingController();
  final TextEditingController streetTec = TextEditingController();
  final TextEditingController cityTec = TextEditingController();

  bool firstNameFilled = false;
  bool lastNameFilled = false;

  int progressedIndex = 1;

  void increaseProgressIndex() {
    progressedIndex++;
    update();
  }

  void decreaseProgressIndex() {
    progressedIndex--;
    update();
  }

  void setFirstNameFilled(bool value) {
    firstNameFilled = value;
    update();
  }

  void setLastNameFilled(bool value) {
    lastNameFilled = value;
    update();
  }

  @override
  void onClose() {
    firstNameTec.dispose();
    lastNameTec.dispose();
    businessNameTec.dispose();
    businessTypeTec.dispose();
    streetTec.dispose();
    cityTec.dispose();
    super.onClose();
  }
}
