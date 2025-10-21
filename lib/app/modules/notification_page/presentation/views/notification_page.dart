import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryWhite,
          title: Text("Notifications"),
          centerTitle: true,
        ),
        body: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => Row(children: [

          ]),
          separatorBuilder: (context, index) => SizedBox(height: 10.h),
          itemCount: 100,
        ),
      ),
    );
  }
}
