import 'package:flutter/material.dart';
import 'package:vendra_app/app/core/constants/app_colors.dart';
import 'package:vendra_app/app/core/data/models/lot_details_model.dart';

class LotDetailsTimeAuctionPage extends StatelessWidget {
  const LotDetailsTimeAuctionPage({super.key, required this.lotDetailsModel});

  final LotDetailsModel lotDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primaryWhite),
      body: SafeArea(
        child: SingleChildScrollView(child: Column(children: [])),
      ),
    );
  }
}
