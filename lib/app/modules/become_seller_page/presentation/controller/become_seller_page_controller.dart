import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:fuzzy/fuzzy.dart';

class BecomeSellerPageController extends GetxController {
  late final List<String> stateList;

  // late Fuzzy fuse;
  Fuzzy? fuse;
  List<String> filteredStateList = [];
  int selectedIndex = -1;

  Future<void> loadStates() async {
    final String response = await rootBundle.loadString(
      'lib/app/core/data/datasources/states_info.json',
    );

    final List<dynamic> data = json.decode(response);
    stateList = data.map((e) => e.toString()).toList();
    filteredStateList = List.from(stateList); // Initially show all

    fuse = Fuzzy(
      stateList,
      options: FuzzyOptions(
        findAllMatches: true,
        tokenize: true,
        threshold: 0.5,
      ),
    );

    update();
  }

  void searchStates(String query) {
    if (fuse == null) return;

    if (query.isEmpty) {
      filteredStateList = List.from(stateList);
    } else {
      final result = fuse!.search(query);
      filteredStateList = result.map((r) => r.item.toString()).toList();
    }
    update();
  }

  void selectIndex(int index) {
    selectedIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadStates();
  }
}
