import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SupportPageController extends GetxController {
  TextEditingController msgTEC = TextEditingController();

  @override
  void onClose() {
    msgTEC.dispose();
    super.onClose();
  }
}
