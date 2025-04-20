part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const LOGIN = _Paths.LOGIN;
  static const REGISTER = _Paths.REGISTER;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const BERITA = _Paths.BERITA;
  static const PENGUMUMAN = _Paths.PENGUMUMAN;
  static const BERITA_F = _Paths.BERITA_F;
  static const PROFILE_F = _Paths.PROFILE_F;
  static const KONTAK = _Paths.KONTAK;
  static const LOKASI = _Paths.LOKASI;
}

abstract class _Paths {
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const REGISTER = '/register';
  static const DASHBOARD = '/dashboard';
  static const BERITA = '/berita';
  static const PENGUMUMAN = '/pengumuman';
  static const BERITA_F = '/berita-f';
  static const PROFILE_F = '/profile-f';
  static const KONTAK = '/kontak';
  static const LOKASI = '/lokasi';
}
