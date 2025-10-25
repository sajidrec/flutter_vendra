import 'package:vendra_app/app/modules/security_settings_page/controllers/security_settings_page_controller.dart';

class PasswordHelper {
  static void checkPasswordValidity({
    required String value,
    required SecuritySettingsPageController controller,
  }) {
    if (value.length >= 8) {
      controller.setAtLeast8Char(true);
    } else {
      controller.setAtLeast8Char(false);
    }

    bool atLeastOneNumber = false;

    bool presentUpperCase = false;
    bool presentLowerCase = false;

    for (int i = 0; i < value.length; i++) {
      if (value.codeUnitAt(i) >= '0'.codeUnitAt(0) &&
          value.codeUnitAt(i) <= '9'.codeUnitAt(0)) {
        atLeastOneNumber = true;
      }

      if (value.codeUnitAt(i) >= 'a'.codeUnitAt(0) &&
          value.codeUnitAt(i) <= 'z'.codeUnitAt(0)) {
        presentLowerCase = true;
      }
      if (value.codeUnitAt(i) >= 'A'.codeUnitAt(0) &&
          value.codeUnitAt(i) <= 'Z'.codeUnitAt(0)) {
        presentUpperCase = true;
      }
    }

    controller.setAtLeast1Number(atLeastOneNumber);

    controller.setBothUpperAndLowerCase(presentLowerCase && presentUpperCase);
  }
}
