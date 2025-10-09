import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';

class OnBoardingPageController extends GetxController {
  int currentIndex = 0;

  final List<String> imgList = [
    AppAssets.watchImage,
    AppAssets.watchImage,
    AppAssets.watchImage,
    AppAssets.watchImage,
  ];

  void setCurrentIndex(int index) {
    currentIndex = index;
    update();
  }
}
