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
  final TextEditingController searchCountryTec = TextEditingController();

  late final List<String> stateList;
  Fuzzy? fuse;

  late final List<Map<String, dynamic>> countryList;
  List<Map<String, dynamic>> filteredCountryList = [];
  Fuzzy? countryFuse;
  Map<String, dynamic>? selectedCountry;

  List<String> filteredStateList = [];
  String? selectedState;

  bool firstNameFilled = false;
  bool lastNameFilled = false;

  bool businessNameFilled = false;
  bool businessTypeFilled = false;
  bool streetFilled = false;
  bool cityFilled = false;

  int progressedIndex = 1;

  @override
  void onInit() {
    super.onInit();
    loadStates();
    loadCountries();
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

  void setBusinessNameFilled(bool value) {
    businessNameFilled = value;
    update();
  }

  void setBusinessTypeFilled(bool value) {
    businessTypeFilled = value;
    update();
  }

  void setStreetFilled(bool value) {
    streetFilled = value;
    update();
  }

  void setCityFilled(bool value) {
    cityFilled = value;
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

  Future<void> loadCountries() async {
    final String response = await rootBundle.loadString(
      'lib/app/core/data/datasources/country_info.json',
    );
    final List<dynamic> data = json.decode(response);
    countryList = data.map((e) => Map<String, dynamic>.from(e)).toList();
    filteredCountryList = List.from(countryList);

    countryFuse = Fuzzy(
      countryList.map((e) => e['name']).toList(),
      options: FuzzyOptions(threshold: 0.5),
    );
    update();
  }

  void searchCountries(String query) {
    if (countryFuse == null) return;
    if (query.isEmpty) {
      filteredCountryList = List.from(countryList);
    } else {
      final results = countryFuse!.search(query);
      filteredCountryList = results
          .map((r) => countryList.firstWhere((c) => c['name'] == r.item))
          .toList();
    }
    update();
  }

  void selectCountry(Map<String, dynamic> country) {
    selectedCountry = (selectedCountry?['name'] == country['name'])
        ? null
        : country;
    update();
  }

  bool isCountrySelected(Map<String, dynamic> country) {
    return selectedCountry != null &&
        selectedCountry!['name'] == country['name'];
  }

  @override
  void onClose() {
    firstNameTec.dispose();
    lastNameTec.dispose();
    businessNameTec.dispose();
    businessTypeTec.dispose();
    streetTec.dispose();
    cityTec.dispose();
    searchCountryTec.dispose();
    super.onClose();
  }
}
