import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ListingsPage extends StatelessWidget {
  const ListingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 332.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Text("data"),
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
        itemCount: 12,
      ),
    );
  }
}
