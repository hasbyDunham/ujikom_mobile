// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
// ignore: undefined_prefixed_name
import 'dart:ui' as ui;

void registerIFrame(String viewID, Object Function(int viewId) viewFactory) {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(viewID, viewFactory);
}
