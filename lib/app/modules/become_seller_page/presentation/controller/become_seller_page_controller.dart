import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:fuzzy/fuzzy.dart';
class BecomeSellerPageController extends GetxController {
  late final List<String> stateList;
  Fuzzy? fuse;

  List<String> filteredStateList = [];
  String? selectedState; // store selected state value

  @override
  void onInit() {
    super.onInit();
    loadStates();
  }

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

  void selectState(String state) {
    if (selectedState == state) {
      selectedState = null;
    } else {
      selectedState = state;
    }
    update();
  }

  bool isSelected(String state) {
    return selectedState == state;
  }
}

