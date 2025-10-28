import 'package:get/get.dart';
import 'package:vendra_app/app/core/data/models/lot_details_model.dart';
import 'package:vendra_app/app/modules/auth/forget_pass_page/binding/forget_pass_page_binding.dart';
import 'package:vendra_app/app/modules/auth/forget_pass_page/views/forget_pass_page.dart';
import 'package:vendra_app/app/modules/auth/login_page/presentation/binding/login_page_binding.dart';
import 'package:vendra_app/app/modules/auth/login_page/presentation/views/login_page.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/binding/become_seller_page_binding.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/binding/become_seller_step_one_page_binding.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/views/become_seller_page.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/views/become_seller_step_page.dart';
import 'package:vendra_app/app/modules/bottom_navbar_page/presentation/views/bottom_navbar_page.dart';
import 'package:vendra_app/app/modules/favorite_page/presentation/binding/favorite_page_binding.dart';
import 'package:vendra_app/app/modules/favorite_page/presentation/views/favorite_page.dart';
import 'package:vendra_app/app/modules/general_setting_page/bindings/general_setting_page_binding.dart';
import 'package:vendra_app/app/modules/general_setting_page/views/general_setting_page.dart';
import 'package:vendra_app/app/modules/lot_details_live_auction_page/presentation/bindings/lot_details_live_auction_page_binding.dart';
import 'package:vendra_app/app/modules/lot_details_live_auction_page/presentation/views/lot_details_live_auction_page.dart';
import 'package:vendra_app/app/modules/lot_details_time_auction_page/views/lot_details_time_auction_page.dart';
import 'package:vendra_app/app/modules/notification_page/presentation/binding/notification_page_binding.dart';
import 'package:vendra_app/app/modules/on_boarding_page/binding/on_boarding_page_binding.dart';
import 'package:vendra_app/app/modules/on_boarding_page/views/on_boarding_page.dart';
import 'package:vendra_app/app/modules/payment_method_page/binding/add_card_page_binding.dart';
import 'package:vendra_app/app/modules/payment_method_page/binding/payment_method_page_binding.dart';
import 'package:vendra_app/app/modules/payment_method_page/views/add_card_page.dart';
import 'package:vendra_app/app/modules/payment_method_page/views/payment_method_page.dart';
import 'package:vendra_app/app/modules/security_settings_page/bindings/security_settings_page_binding.dart';
import 'package:vendra_app/app/modules/security_settings_page/views/security_settings_page.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/binding/sell_page_binding.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/binding/tag_page_binding.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/views/lot_details_page.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/views/lot_under_review_page.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/views/sell_page.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/views/tags_page.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/views/upload_lot_photo_page.dart';
import 'package:vendra_app/app/modules/seller_auction_item_detail_page/presentation/binding/seller_auction_item_detail_page_binding.dart';
import 'package:vendra_app/app/modules/seller_auction_item_detail_page/presentation/views/seller_auction_item_detail_page.dart';
import 'package:vendra_app/app/modules/seller_profile_page/presentation/binding/seller_profile_binding.dart';
import 'package:vendra_app/app/modules/seller_profile_page/presentation/views/seller_profile_page.dart';
import 'package:vendra_app/app/modules/settings_page/presentation/binding/settings_page_binding.dart';
import 'package:vendra_app/app/modules/settings_page/presentation/views/settings_page.dart';
import 'package:vendra_app/app/modules/splash_page/presentation/binding/splash_page_binding.dart';
import 'package:vendra_app/app/modules/splash_page/presentation/views/splash_page.dart';
import '../core/data/models/auction_item_model.dart';
import '../modules/auth/register_page/presentation/binding/registration_page_binding.dart';
import '../modules/auth/register_page/presentation/views/registration_page.dart';
import '../modules/bottom_navbar_page/presentation/binding/bottom_navbar_page_binding.dart';
import '../modules/home_page/presentation/bindings/home_binding.dart';
import '../modules/home_page/presentation/views/home_page.dart';
import '../modules/lot_details_time_auction_page/binding/lot_details_time_auction_page_binding.dart';
import '../modules/notification_page/presentation/views/notification_page.dart';
import '../modules/on_boarding_page/views/on_boarding_page_02.dart';
import '../modules/on_boarding_page/views/on_boarding_page_03.dart';
import '../modules/on_boarding_page/views/on_boarding_page_04.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashRoute,
      page: () => SplashPage(),
      binding: SplashPageBinding(),
    ),
    GetPage(
      name: AppRoutes.bottomNavRoute,
      page: () => BottomNavbarPage(),
      binding: BottomNavbarPageBinding(),
    ),
    GetPage(
      name: AppRoutes.homeRoute,
      page: () =>
          HomePage(auctionItemModel: AuctionItemModel.fromJson(Get.arguments)),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.onBoardingRoute,
      page: () => OnBoardingPage(),
      binding: OnBoardingPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.onBoardingRoute2,
      page: () => OnBoardingPage02(),
      binding: OnBoardingPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.onBoardingRoute3,
      page: () => OnBoardingPage03(),
      binding: OnBoardingPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.onBoardingRoute4,
      page: () => OnBoardingPage04(),
      binding: OnBoardingPageBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: AppRoutes.registrationRoute,
      page: () => RegistrationPage(),
      binding: RegistrationPageBinding(),
    ),
    GetPage(
      name: AppRoutes.loginRoute,
      page: () => LoginPage(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: AppRoutes.becomeSellerRoute,
      page: () => BecomeSellerPage(),
      binding: BecomeSellerPageBinding(),
    ),
    GetPage(
      name: AppRoutes.becomeSellerStepRoute,
      page: () => BecomeSellerStepPage(),
      binding: BecomeSellerStepPageBinding(),
    ),
    GetPage(
      name: AppRoutes.sellRoute,
      page: () => SellPage(),
      binding: SellPageBinding(),
    ),
    GetPage(
      name: AppRoutes.tagsRoute,
      page: () => TagsPage(),
      binding: TagPageBinding(),
    ),
    GetPage(
      name: AppRoutes.lotUnderReviewRoute,
      page: () => LotUnderReviewPage(),
    ),

    GetPage(
      name: AppRoutes.sellerProfileRoute,
      page: () => SellerProfilePage(),
      binding: SellerProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.lotDetailsRoute,
      page: () => LotDetailsPage(),
      binding: SellPageBinding(),
    ),
    GetPage(
      name: AppRoutes.uploadPhotoRoute,
      page: () => UploadLotPhotoPage(),
      binding: SellPageBinding(),
    ),
    GetPage(
      name: AppRoutes.liveAuctionDetailsRoute,
      page: () => SellerAuctionItemDetailPage(
        auctionItemModel: AuctionItemModel.fromJson(Get.arguments),
      ),
      binding: SellerAuctionItemDetailPageBinding(),
    ),
    GetPage(
      name: AppRoutes.notificationRoute,
      page: () => NotificationPage(),
      binding: NotificationPageBinding(),
    ),
    GetPage(
      name: AppRoutes.favoriteRoute,
      page: () => FavoritePage(),
      binding: FavoritePageBinding(),
    ),
    GetPage(
      name: AppRoutes.settingsRoute,
      page: () => SettingsPage(),
      binding: SettingsPageBinding(),
    ),
    GetPage(
      name: AppRoutes.generalSettingRoute,
      page: () => GeneralSettingPage(),
      binding: GeneralSettingPageBinding(),
    ),
    GetPage(
      name: AppRoutes.securitySettingsRoute,
      page: () => SecuritySettingsPage(),
      binding: SecuritySettingsPageBinding(),
    ),
    GetPage(
      name: AppRoutes.paymentMethodRoute,
      page: () => PaymentMethodPage(),
      binding: PaymentMethodPageBinding(),
    ),
    GetPage(
      name: AppRoutes.addCardRoute,
      page: () => AddCardPage(),
      binding: AddCardPageBinding(),
    ),
    GetPage(
      name: AppRoutes.forgetPassRoute,
      page: () => ForgetPassPage(),
      binding: ForgetPassPageBinding(),
    ),
    GetPage(
      name: AppRoutes.lotDetailsTimeAuctionPage,
      page: () => LotDetailsTimeAuctionPage(
        lotDetailsModel: LotDetailsModel.fromJson(Get.arguments),
      ),
      binding: LotDetailsTimeAuctionPageBinding(),
    ),
    GetPage(
      name: AppRoutes.lotDetailsLiveAuctionPage,
      page: () => LotDetailsLiveAuctionPage(
        lotDetailsModel: LotDetailsModel.fromJson(Get.arguments),
      ),
      binding: LotDetailsLiveAuctionPageBinding(),
    ),
  ];
}
