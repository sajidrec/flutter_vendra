import 'package:get/get.dart';

class LotDetailsTimeAuctionPageController extends GetxController {
  int sliderIndex = 0;

  void setSliderIndex(int index) {
    sliderIndex = index;
    update();
  }
}
