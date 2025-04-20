import 'package:get/get.dart';

import '../controllers/berita_f_controller.dart';

class BeritaFBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BeritaFController>(
      () => BeritaFController(),
    );
  }
}
