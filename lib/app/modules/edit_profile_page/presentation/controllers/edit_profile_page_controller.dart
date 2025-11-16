import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditProfilePageController extends GetxController {
  bool obscureText = true;

  TextEditingController nameTEC = TextEditingController();
  TextEditingController userNameTEC = TextEditingController();
  TextEditingController emailTEC = TextEditingController();
  TextEditingController passTEC = TextEditingController();

  void toggleObscureText() {
    obscureText = !obscureText;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    nameTEC.text = "Alex Morgan";
    userNameTEC.text = "alex_morgan";
    emailTEC.text = "alexmorgan@example.com";
    passTEC.text = "123456";
  }

  @override
  void onClose() {
    nameTEC.dispose();
    userNameTEC.dispose();
    emailTEC.dispose();
    passTEC.dispose();
    super.onClose();
  }
}
