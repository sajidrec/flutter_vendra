import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';

import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        initialRoute: AppRoutes.splashRoute,
        debugShowCheckedModeBanner: false,
        getPages: AppPages.pages,
        theme: ThemeData(
          // textTheme: GoogleFonts.ptSerifTextTheme(Theme.of(context).textTheme),
          fontFamily: "SFPro",
          scaffoldBackgroundColor: AppColors.primaryWhite,
        ),
      ),
    );
  }
}
