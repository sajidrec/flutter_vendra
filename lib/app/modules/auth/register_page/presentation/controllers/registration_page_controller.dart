import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistrationPageController extends GetxController {
  final fullNameTEC = TextEditingController();
  final emailTEC = TextEditingController();
  final passTEC = TextEditingController();

  bool obscurePass = true;

  bool acceptTermsAndCondition = false;

  bool atLeast8Char = false;
  bool atLeast1Number = false;
  bool bothUpperAndLowerCase = false;

  bool validName = false;

  bool validEmail = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setAtLeast8Char(bool value) {
    atLeast8Char = value;
    update();
  }

  void setValidName(bool value) {
    validName = value;
    update();
  }

  setValidEmail(bool value) {
    validEmail = value;
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

  void toggleAcceptTermsAndCondition() {
    acceptTermsAndCondition = !acceptTermsAndCondition;
    update();
  }

  @override
  void onClose() {
    fullNameTEC.dispose();
    emailTEC.dispose();
    passTEC.dispose();
    super.onClose();
  }
}
