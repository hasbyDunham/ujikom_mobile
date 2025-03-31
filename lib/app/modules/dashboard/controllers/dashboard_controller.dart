// ignore_for_file: duplicate_import

// import 'package:aisha_crud2/app/data/detail_event_response.dart.dart';
// import 'package:aisha_crud2/app/data/event_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:aisha_crud2/app/data/event_response.dart';
// import 'package:statemanagement/app/data/event_response.dart';

// import '../../../utils/api.dart';
import '../views/index_view.dart';
// import '../views/profile_view.dart';
// import '../views/your_event_view.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;
  // final _getConnect = GetConnect();
  final token = GetStorage().read('token');

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    IndexView(),
    // YourEventView(),
    // ProfileView(),
  ];

 

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}