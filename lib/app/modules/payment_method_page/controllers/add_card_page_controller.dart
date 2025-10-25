import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddCardPageController extends GetxController {
  final TextEditingController cardNumberTec = TextEditingController();
  final TextEditingController cardHolderNameTec = TextEditingController();
  final TextEditingController expireDateTec = TextEditingController();
  final TextEditingController cvcTec = TextEditingController();
  final TextEditingController addressTec = TextEditingController();
  final TextEditingController zipTec = TextEditingController();

  bool saveCardInfoForLater = false;

  void toggleSaveCardInfoForLater(){
    saveCardInfoForLater = !saveCardInfoForLater;
    update();
  }


  @override
  void onClose() {
    cardNumberTec.dispose();
    cardHolderNameTec.dispose();
    expireDateTec.dispose();
    cvcTec.dispose();
    addressTec.dispose();
    zipTec.dispose();
    super.onClose();
  }
}
