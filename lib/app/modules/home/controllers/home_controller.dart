import 'package:get/get.dart';

class HomeController extends GetxController {
  void goToBerita() {
    Get.toNamed('/berita'); // Navigasi ke halaman berita
  }

  void goToPengumuman() {
    Get.toNamed('/pengumuman'); // Navigasi ke halaman pengumuman
  }
}
