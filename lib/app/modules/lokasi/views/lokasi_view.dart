import 'dart:io' show Platform;
import 'package:aisha_crud2/app/utils/web_iframe_real.dart';
import 'package:flutter/foundation.dart'; // kIsWeb
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart'; // WebView fallback
import 'dart:ui' as ui;
import 'dart:html' as html; // Untuk iframe web

class LokasiView extends StatelessWidget {
  const LokasiView({super.key});

  @override
  Widget build(BuildContext context) {
    final String mapUrl =
        'https://maps.google.com/maps?q=UIN%20Sunan%20Gunung%20Djati%20Bandung&output=embed';

    return Scaffold(
      backgroundColor: const Color(0xFFA4D4E4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFA4D4E4),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Lokasi Fakultas',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF002B4D),
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF002B4D)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Fakultas Ushuluddin\nUIN Sunan Gunung Djati Bandung\nJl. A.H. Nasution No.105, Cibiru, Bandung',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xFF002B4D)),
            ),
          ),
          Expanded(
            child: kIsWeb
                ? HtmlMapView(mapUrl)
                : const Center(
                    child: Text(
                      'Map hanya tersedia di Web untuk saat ini.',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

class HtmlMapView extends StatelessWidget {
  final String mapUrl;
  const HtmlMapView(this.mapUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    // Unique ID agar tidak bentrok
    final String viewID = 'iframe-${DateTime.now().millisecondsSinceEpoch}';

    // Daftarkan iframe sebagai platform view
    registerIFrame(viewID, (int _) { 
      final html.IFrameElement element = html.IFrameElement()
        ..src = mapUrl
        ..style.border = 'none'
        ..width = '100%'
        ..height = '100%'
        ..allowFullscreen = true;
      return element;
    });

    return HtmlElementView(viewType: viewID);
  }
}
