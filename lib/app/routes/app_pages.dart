import 'package:get/get.dart';

import '../modules/berita/bindings/berita_binding.dart';
import '../modules/berita/views/berita_view.dart';
import '../modules/beritaF/bindings/berita_f_binding.dart';
import '../modules/beritaF/views/berita_f_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/pengumuman/bindings/pengumuman_binding.dart';
import '../modules/pengumuman/views/pengumuman_view.dart';

// import '../modules/pengumuman/bindings/pengumuman_binding.dart';
// import '../modules/pengumuman/views/pengumuman_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME; // Halaman awalnya Home

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BERITA,
      page: () => BeritaView(),
      binding: BeritaBinding(),
    ),
    GetPage(
      name: _Paths.PENGUMUMAN,
      page: () => PengumumanView(),
      binding: PengumumanBinding(),
    ),
    GetPage(
      name: _Paths.BERITA_F,
      page: () => BeritaFView(),
      binding: BeritaFBinding(),
    ),
  ];
}
