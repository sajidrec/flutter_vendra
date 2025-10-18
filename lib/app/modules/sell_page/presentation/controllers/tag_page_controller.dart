import 'package:flutter/material.dart';
import 'package:fuzzy/fuzzy.dart';
import 'package:get/get.dart';

class TagPageController extends GetxController {
  final TextEditingController searchTEC = TextEditingController();

  List<String> selectedTags = ["Gadgets", "InteriorDesign"];
  List<String> unSelectedTags = ["Fashion", "Style", "Electronics"];
  List<String> searchResultList = [];

  void searchItem({required String query}) {
    final fuze = Fuzzy(unSelectedTags);
    final result = fuze.search(query);

    searchResultList = [];

    searchResultList = result.map((e) => e.toString()).toList();
    update();
  }

  void removeFromSelectedTags({required String tagName}) {
    selectedTags.remove(tagName);
    unSelectedTags.add(tagName);
    update();
  }

  void removeFromUnselectedTags({required String tagName}) {
    unSelectedTags.remove(tagName);
    selectedTags.add(tagName);
    update();
  }

  @override
  void onClose() {
    searchTEC.dispose();
    super.onClose();
  }
}
