import 'package:get/get.dart';

class BuyerProfilePageController extends GetxController {
  bool editMode = false;

  void toggleEditMode() {
    editMode = !editMode;
    update();
  }
}
