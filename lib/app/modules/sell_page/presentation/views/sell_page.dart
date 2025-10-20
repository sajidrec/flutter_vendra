import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/controllers/sell_page_controller.dart';
import 'package:vendra_app/app/modules/sell_page/presentation/widgets/progress_bar_widget.dart';

class SellPage extends StatelessWidget {
  const SellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SellPageController>(
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: GetBuilder<SellPageController>(
                builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ProgressBarWidget(
                        progressedIndex: controller.progressedIndex,
                        progressLength: controller.pages.length,
                        controller: controller,
                      ),
                      controller.pages[controller.progressedIndex - 1],
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
