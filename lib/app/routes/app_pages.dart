import 'package:get/get.dart';
import 'package:vendra_app/app/modules/on_boarding_page/binding/on_boarding_page_binding.dart';
import 'package:vendra_app/app/modules/on_boarding_page/views/on_boarding_page.dart';
import 'package:vendra_app/app/modules/splash_page/presentation/binding/splash_page_binding.dart';
import 'package:vendra_app/app/modules/splash_page/presentation/views/splash_page.dart';
import '../modules/home_page/presentation/bindings/home_binding.dart';
import '../modules/home_page/presentation/views/home_page.dart';
import '../modules/on_boarding_page/views/on_boarding_page_02.dart';
import '../modules/on_boarding_page/views/on_boarding_page_03.dart';
import '../modules/on_boarding_page/views/on_boarding_page_04.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.homeRoute,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.splashRoute,
      page: () => SplashPage(),
      binding: SplashPageBinding(),
    ),
    GetPage(
      name: AppRoutes.onBoardingRoute,
      page: () => OnBoardingPage(),
      binding: OnBoardingPageBinding(),
    ),
    GetPage(
      name: AppRoutes.onBoardingRoute2,
      page: () => OnBoardingPage02(),
      binding: OnBoardingPageBinding(),
    ),
    GetPage(
      name: AppRoutes.onBoardingRoute3,
      page: () => OnBoardingPage03(),
      binding: OnBoardingPageBinding(),
    ),
    GetPage(
      name: AppRoutes.onBoardingRoute4,
      page: () => OnBoardingPage04(),
      binding: OnBoardingPageBinding(),
    ),
  ];
}
