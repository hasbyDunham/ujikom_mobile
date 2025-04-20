// import 'package:get/get.dart';

// class HomeController extends GetxController {
//   void goToBerita() {
//     Get.toNamed('/berita'); // Navigasi ke halaman berita
//   }

//   void goToPengumuman() {
//     Get.toNamed('/pengumuman'); // Navigasi ke halaman pengumuman
//   }
// }

import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}

