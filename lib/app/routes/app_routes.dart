part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const BERITA = _Paths.BERITA;
  static const PENGUMUMAN = _Paths.PENGUMUMAN;
  static const BERITA_F = _Paths.BERITA_F;
}

abstract class _Paths {
  static const HOME = '/home';
  static const DASHBOARD = '/dashboard';
  static const BERITA = '/berita';
  static const PENGUMUMAN = '/pengumuman';
  static const BERITA_F = '/berita-f';
}
