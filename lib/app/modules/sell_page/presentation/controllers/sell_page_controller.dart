import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellPageController extends GetxController {
  final TextEditingController lotTitleTec = TextEditingController();
  final TextEditingController categoryTec = TextEditingController();
  final TextEditingController subCategoryTec = TextEditingController();
  final TextEditingController specialCategoryTec = TextEditingController();
  final TextEditingController descriptionTec = TextEditingController();

  bool lotTitleFilled = false;
  bool subCategoryFilled = false;
  bool descriptionFilled = false;

  void setLotTitleFilled(bool value) {
    lotTitleFilled = value;
    update();
  }

  void setSubCategoryFilled(bool value) {
    subCategoryFilled = value;
    update();
  }

  void setDescriptionFilled(bool value) {
    descriptionFilled = value;
    update();
  }

  int progressedIndex = 1;

  int selectedCategoryIndex = -1;

  setSelectedCategoryIndex(int index) {
    selectedCategoryIndex = index;
    update();
  }

  void increaseProgressIndex() {
    progressedIndex++;
    update();
  }

  void decreaseProgressIndex() {
    if (progressedIndex > 0) {
      progressedIndex--;
    }

    update();
  }

  @override
  void onClose() {
    lotTitleTec.dispose();
    categoryTec.dispose();
    subCategoryTec.dispose();
    specialCategoryTec.dispose();
    descriptionTec.dispose();
    super.onClose();
  }
}
