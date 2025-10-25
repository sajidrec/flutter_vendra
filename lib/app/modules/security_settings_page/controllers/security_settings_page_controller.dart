import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecuritySettingsPageController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController passwordTEC = TextEditingController();
  final TextEditingController newPasswordTEC = TextEditingController();
  final TextEditingController confirmPasswordTEC = TextEditingController();

  bool obscurePass = true;
  bool obscureNewPass = true;
  bool obscureConfirmPass = true;

  bool bothPasswordMatch = false;

  bool atLeast8Char = false;
  bool atLeast1Number = false;
  bool bothUpperAndLowerCase = false;

  void setBothPasswordMatch(bool value) {
    bothPasswordMatch = value;
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

  void toggleObscurePass() {
    obscurePass = !obscurePass;
    update();
  }

  void toggleObscureNewPass() {
    obscureNewPass = !obscureNewPass;
    update();
  }

  void toggleConfirmPass() {
    obscureConfirmPass = !obscureConfirmPass;
    update();
  }

  @override
  void onClose() {
    super.onClose();

    passwordTEC.dispose();
    newPasswordTEC.dispose();
    confirmPasswordTEC.dispose();
  }
}
