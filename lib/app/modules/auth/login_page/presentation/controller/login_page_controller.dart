import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailTEC = TextEditingController();
  final passTEC = TextEditingController();

  bool obscurePass = true;

  bool validEmail = false;
  bool validPass = false;

  bool atLeast8Char = false;
  bool atLeast1Number = false;
  bool bothUpperAndLowerCase = false;

  void toggleObscurePass() {
    obscurePass = !obscurePass;
    update();
  }

  void setValidEmail(bool value) {
    validEmail = value;
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
    emailTEC.dispose();
    passTEC.dispose();
    super.onClose();
  }
}
