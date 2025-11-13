import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MessagePageController extends GetxController {
  final TextEditingController msgTEC = TextEditingController();

  @override
  void onClose() {
    msgTEC.dispose();
    super.onClose();
  }
}
