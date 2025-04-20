import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../controllers/berita_controller.dart';
import 'detail_berita_view.dart';
import '../../../models/berita_model.dart';
import '../../../utils/api.dart';

class BeritaView extends StatelessWidget {
  final BeritaController controller = Get.put(BeritaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA4D4E4),
      appBar: AppBar(
        title: Text(
          'Berita',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFF2E7D32),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2E7D32)),
            ),
          );
        }

        if (controller.errorMessage.isNotEmpty) {
          return _buildError(controller.errorMessage.value);
        }

        if (controller.beritaList.isEmpty) {
          return _buildEmptyState();
        }

        return RefreshIndicator(
          onRefresh: controller.fetchBerita,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: controller.beritaList.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (context, index) {
              final berita = controller.beritaList[index];
              return _buildBeritaCard(berita);
            },
          ),
        );
      }),
    );
  }

  Widget _buildBeritaCard(BeritaModel berita) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Get.to(() => DetailBeritaView(berita: berita)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Container(
                height: 180,
                width: double.infinity,
                color: Colors.grey[200],
                child: _buildImage(berita.foto),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    berita.title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDate(berita.timestamp),
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Baca Selengkapnya',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: const Color(0xFF2E7D32),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String imageUrl) {
  final finalUrl = imageUrl.startsWith('http')
      ? imageUrl
      : '${BaseUrl.imageBerita}$imageUrl';

    if (kDebugMode) print('Loading image from: $finalUrl');

    return CachedNetworkImage(
      imageUrl: finalUrl,
      fit: BoxFit.cover,
      httpHeaders: const {'Accept': 'image/*'},
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2E7D32)),
        ),
      ),
      errorWidget: (context, url, error) {
        if (kDebugMode) print('Image load error: $error');
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.broken_image, size: 40, color: Colors.grey),
              SizedBox(height: 8),
              Text('Gagal memuat gambar', style: TextStyle(fontSize: 12)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildError(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 50, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            message,
            style: GoogleFonts.poppins(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () => controller.fetchBerita(),
            child: const Text('Coba Lagi'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.article, size: 50, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            'Tidak ada berita tersedia',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  String _formatDate(dynamic timestamp) {
    if (timestamp == null || timestamp.toString().toLowerCase().contains('tidak ada')) return '-';

    try {
      return DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.parse(timestamp));
    } catch (e) {
      if (kDebugMode) print('Date format error: $e');
      return '-';
    }
  }
}
