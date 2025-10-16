import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/views/lot_details_page.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/views/price_and_auction_type_page.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/views/upload_lot_photo_page.dart';

class SellPageController extends GetxController {
  final TextEditingController lotTitleTec = TextEditingController();
  final TextEditingController categoryTec = TextEditingController();
  final TextEditingController subCategoryTec = TextEditingController();
  final TextEditingController specialCategoryTec = TextEditingController();
  final TextEditingController descriptionTec = TextEditingController();
  final TextEditingController auctionPriceTec = TextEditingController();
  final TextEditingController startDateTec = TextEditingController();
  final TextEditingController endDateTec = TextEditingController();

  bool lotTitleFilled = false;
  bool subCategoryFilled = false;
  bool descriptionFilled = false;

  bool timeAuctionMode = false;
  bool liveAuctionMode = false;

  int auctionPrice = 0;

  List<Widget> pages = [
    LotDetailsPage(),
    UploadLotPhotoPage(),
    PriceAndAuctionTypePage(),
  ];

  List<PlatformFile> pickedFiles = [];

  @override
  void onInit() {
    super.onInit();
    auctionPriceTec.text = auctionPrice.toString();
    startDateTec.text = "DD/MM/YY";
    endDateTec.text = "DD/MM/YY";
  }

  Future<void> pickStartDateForTimedAuction(BuildContext context) async {
    final startDate = await showDatePicker(
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColors.primaryPurple,
            onPrimary: AppColors.primaryWhite,
            onSurface: AppColors.primaryBlack, // body text color
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryPurple, // cancel/ok buttons
            ),
          ),
        ),
        child: child!,
      ),
      context: context,
      firstDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
      lastDate: DateTime(DateTime.now().year + 50),
    );

    if (startDate == null) {
      startDateTec.text = "DD/MM/YY";
    } else {
      startDateTec.text = startDate.toString();
    }
  }

  Future<void> pickEndDateForTimedAuction(BuildContext context) async {
    final startDate = await showDatePicker(
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: AppColors.primaryPurple,
            onPrimary: AppColors.primaryWhite,
            onSurface: AppColors.primaryBlack,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryPurple,
            ),
          ),
        ),
        child: child!,
      ),
      context: context,
      firstDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day + 1,
      ),
      lastDate: DateTime(DateTime.now().year + 50),
    );

    if (startDate == null) {
      endDateTec.text = "DD/MM/YY";
    } else {
      endDateTec.text = startDate.toString();
    }
  }

  void toggleTimeAuctionMode() {
    if (!timeAuctionMode) {
      liveAuctionMode = false;
    }
    timeAuctionMode = !timeAuctionMode;
    update();
  }

  void toggleLiveAuctionMode() {
    if (!liveAuctionMode) {
      timeAuctionMode = false;
    }
    liveAuctionMode = !liveAuctionMode;
    update();
  }

  Future<void> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      pickedFiles = result.files;
      update();
    }
  }

  void deleteFile(int index) {
    pickedFiles.removeAt(index);
    update();
  }

  void increaseAuctionPrice() {
    auctionPrice++;
    auctionPriceTec.text = auctionPrice.toString();
    update();
  }

  void decreaseAuctionPrice() {
    if (auctionPrice > 0) {
      auctionPrice--;
      auctionPriceTec.text = auctionPrice.toString();
    }
    update();
  }

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
    auctionPriceTec.dispose();
    startDateTec.dispose();
    endDateTec.dispose();
    super.onClose();
  }
}
