import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendra_app/app/core/constants/app_keys.dart';

class SettingsPageController extends GetxController {
  bool emailUpdate = false;
  bool smsUpdate = false;
  bool pushNotification = false;

  bool inBuyerMode = false;

  @override
  void onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    inBuyerMode = sharedPreferences.getBool(AppKeys.inBuyerModeKey) ?? false;

    update();

    super.onInit();
  }

  Future<void> toggleBuyerModeStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setBool(AppKeys.inBuyerModeKey, !inBuyerMode);

    inBuyerMode = !inBuyerMode;

    update();
  }

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
