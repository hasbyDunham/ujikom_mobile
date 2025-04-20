import 'package:get/get.dart';

import '../modules/berita/bindings/berita_binding.dart';
import '../modules/berita/views/berita_view.dart';
import '../modules/beritaF/bindings/berita_f_binding.dart';
import '../modules/beritaF/views/berita_f_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/kontak/bindings/kontak_binding.dart';
import '../modules/kontak/views/kontak_view.dart';
import '../modules/login_gone/bindings/login_binding.dart';
import '../modules/login_gone/views/login_view.dart';
import '../modules/lokasi/bindings/lokasi_binding.dart';
import '../modules/lokasi/views/lokasi_view.dart';
import '../modules/pengumuman/bindings/pengumuman_binding.dart';
import '../modules/pengumuman/views/pengumuman_view.dart';
import '../modules/profileF/bindings/profile_f_binding.dart';
import '../modules/profileF/views/profile_f_view.dart';
import '../modules/register_gone/bindings/register_binding.dart';
import '../modules/register_gone/views/register_view.dart';

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
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    // GetPage(
    //   name: _Paths.PROFILE,
    //   page: () => ProfileView(),
    //   binding: ProfileBinding(),
    // ),
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
    GetPage(
      name: _Paths.PROFILE_F,
      page: () => const ProfileFView(),
      binding: ProfileFBinding(),
    ),
    GetPage(
      name: _Paths.KONTAK,
      page: () => const KontakView(),
      binding: KontakBinding(),
    ),
    GetPage(
      name: _Paths.LOKASI,
      page: () => const LokasiView(),
      binding: LokasiBinding(),
    ),
  ];
}
