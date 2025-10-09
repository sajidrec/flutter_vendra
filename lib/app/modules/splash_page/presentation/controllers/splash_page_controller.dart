import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Get.offAllNamed(AppRoutes.onBoardingRoute);
  }
}
