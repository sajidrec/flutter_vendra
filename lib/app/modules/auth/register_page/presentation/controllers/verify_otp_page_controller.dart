import 'package:get/get.dart';

class VerifyOtpPageController extends GetxController {
  bool pinFilled = false;

  void setPinFilledStatus(bool value) {
    pinFilled = value;
    update();
  }
}
