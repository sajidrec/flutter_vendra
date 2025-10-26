import 'package:get/get.dart';

class OtpVerifyPageController extends GetxController {
  bool pinFilled = false;

  void setPinFilledStatus(bool value) {
    pinFilled = value;
    update();
  }
}
