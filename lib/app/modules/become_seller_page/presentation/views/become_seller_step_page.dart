import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/become_seller_step_page_controller.dart';


import '../widgets/business_info_page_widget.dart';
import '../widgets/document_upload_page_widget.dart';
import '../widgets/personal_information_page_widget.dart';
import '../widgets/progress_bar_widget.dart';
import '../widgets/tax_vat_number_page_widget.dart';

class BecomeSellerStepPage extends StatelessWidget {
  BecomeSellerStepPage({super.key});

  late final List _pages = [
    PersonalInformationPageWidget(),

    BusinessInfoPageWidget(),

    TaxVatNumberPageWidget(),

    DocumentUploadPageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<BecomeSellerStepPageController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProgressBarWidget(
                    progressedIndex: controller.progressedIndex,
                    progressLength: _pages.length,
                    controller: controller,
                  ),
                  _pages[max((controller.progressedIndex - 1), 0)],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
