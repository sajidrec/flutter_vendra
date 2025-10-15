import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendra_app/app/core/constants/app_keys.dart';

class BecomeSellerPageController extends GetxController {
  late bool verifiedSeller;

  Future<void> setVerifiedSeller(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(AppKeys.verifiedSellerKey, value);
    verifiedSeller = value;
    update();
  }

  Future<void> getVerifiedSellerStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    verifiedSeller =
        sharedPreferences.getBool(AppKeys.verifiedSellerKey) ?? false;
    update();
  }

  @override
  void onInit() async {
    super.onInit();

    getVerifiedSellerStatus();

    update();
  }
}
