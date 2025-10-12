
import 'package:vendra_app/app/modules/auth/login_page/presentation/controller/login_page_controller.dart';


class EmailHelper {
  static void checkEmailValidity({
    required String value,
    required LoginPageController controller,
  }) {
    bool isValidEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);

    controller.setValidEmail(isValidEmail);
  }
}
