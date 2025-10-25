import 'package:get/get.dart';

class SettingsPageController extends GetxController {
  bool emailUpdate = false;
  bool smsUpdate = false;
  bool pushNotification = false;

  void toggleEmailUpdate() {
    emailUpdate = !emailUpdate;
    update();
  }

  void toggleSmsUpdate() {
    smsUpdate = !smsUpdate;
    update();
  }

  void togglePushNotification() {
    pushNotification = !pushNotification;
    update();
  }
}
