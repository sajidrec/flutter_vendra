import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendra_app/app/core/constants/app_assets.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(AppAssets.trophyGreenIcon),
                  Text("Activity"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
