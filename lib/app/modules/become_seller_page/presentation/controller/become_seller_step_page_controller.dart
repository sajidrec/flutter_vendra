import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fuzzy/fuzzy.dart';
import 'package:get/get.dart';

class BecomeSellerStepPageController extends GetxController {
  final TextEditingController firstNameTec = TextEditingController();
  final TextEditingController lastNameTec = TextEditingController();

  final TextEditingController businessNameTec = TextEditingController();
  final TextEditingController businessTypeTec = TextEditingController();
  final TextEditingController streetTec = TextEditingController();
  final TextEditingController cityTec = TextEditingController();

  final TextEditingController searchStateTec = TextEditingController();

  late final List<String> stateList;
  Fuzzy? fuse;

  List<String> filteredStateList = [];
  String? selectedState;

  bool firstNameFilled = false;
  bool lastNameFilled = false;

  int progressedIndex = 1;

  @override
  void onInit() {
    super.onInit();
    loadStates();
  }

  void increaseProgressIndex() {
    progressedIndex++;
    update();
  }

  void decreaseProgressIndex() {
    progressedIndex--;
    update();
  }

  void setFirstNameFilled(bool value) {
    firstNameFilled = value;
    update();
  }

  void setLastNameFilled(bool value) {
    lastNameFilled = value;
    update();
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

  @override
  void onClose() {
    firstNameTec.dispose();
    lastNameTec.dispose();
    businessNameTec.dispose();
    businessTypeTec.dispose();
    streetTec.dispose();
    cityTec.dispose();
    super.onClose();
  }
}
