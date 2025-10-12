import '../../controllers/registration_page_controller.dart';

class EmailHelper {
  static void checkEmailValidity({
    required String value,
    required RegistrationPageController controller,
  }) {
    bool isValidEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);

    controller.setValidEmail(isValidEmail);
  }
}
