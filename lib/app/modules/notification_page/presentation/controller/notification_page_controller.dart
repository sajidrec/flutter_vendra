import 'package:get/get.dart';

class NotificationPageController extends GetxController {
  List<String> notificationCategoryList = ["All", "Bids", "Sales", "System"];
  int categoryIndex = 0;

  void setCategoryIndex(int index) {
    categoryIndex = index;
    update();
  }
}
