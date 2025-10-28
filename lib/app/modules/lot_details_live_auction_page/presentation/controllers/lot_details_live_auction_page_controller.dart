import 'package:get/get.dart';

class LotDetailsLiveAuctionPageController extends GetxController {
  int sliderIndex = 0;

  List<bool> expanedStatusList = [false, false, false];

  void setExpandedStatusList({required int index, required bool value}) {
    expanedStatusList[index] = value;
    update();
  }

  void setSliderIndex(int index) {
    sliderIndex = index;
    update();
  }
}
