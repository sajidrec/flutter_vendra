import 'package:get/get.dart';
import 'package:vendra_app/app/modules/auth/login_page/presentation/binding/login_page_binding.dart';
import 'package:vendra_app/app/modules/auth/login_page/presentation/views/login_page.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/binding/become_seller_page_binding.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/binding/become_seller_step_one_page_binding.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/views/become_seller_page.dart';
import 'package:vendra_app/app/modules/become_seller_page/presentation/views/become_seller_step_page.dart';
import 'package:vendra_app/app/modules/bottom_navbar_page/presentation/views/bottom_navbar_page.dart';
import 'package:vendra_app/app/modules/on_boarding_page/binding/on_boarding_page_binding.dart';
import 'package:vendra_app/app/modules/on_boarding_page/views/on_boarding_page.dart';
import 'package:vendra_app/app/modules/splash_page/presentation/binding/splash_page_binding.dart';
import 'package:vendra_app/app/modules/splash_page/presentation/views/splash_page.dart';
import '../modules/auth/register_page/presentation/binding/registration_page_binding.dart';
import '../modules/auth/register_page/presentation/views/registration_page.dart';
import '../modules/bottom_navbar_page/presentation/binding/bottom_navbar_page_binding.dart';
import '../modules/home_page/presentation/bindings/home_binding.dart';
import '../modules/home_page/presentation/views/home_page.dart';
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
      page: () => HomePage(),
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
  ];
}
