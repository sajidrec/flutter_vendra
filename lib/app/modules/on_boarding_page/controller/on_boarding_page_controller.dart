import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';

import '../../../routes/app_routes.dart';

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

  Future<void> requestNotificationPermission() async {
    var notificationStatus = await Permission.notification.status;
    var locationStatus = await Permission.location.status;
    if (notificationStatus.isDenied || locationStatus.isDenied) {
      await Permission.notification.request();
      await Permission.location.request();

      notificationStatus = await Permission.notification.status;
      locationStatus = await Permission.location.status;

      if (notificationStatus.isGranted && locationStatus.isGranted) {
        Get.offAllNamed(AppRoutes.homeRoute);
      }
    } else {
      Get.offAllNamed(AppRoutes.bottomNavRoute);
    }
  }
}
