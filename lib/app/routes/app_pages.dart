import 'package:get/get.dart';
import 'package:vendra_app/app/modules/splash_page/presentation/binding/splash_page_binding.dart';
import 'package:vendra_app/app/modules/splash_page/presentation/views/splash_page.dart';
import '../modules/home_page/presentation/bindings/home_binding.dart';
import '../modules/home_page/presentation/views/home_page.dart';
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
  ];
}
