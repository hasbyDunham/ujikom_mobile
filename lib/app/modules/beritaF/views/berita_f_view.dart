import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';

import 'package:aisha_crud2/app/models/beritaF_model.dart';
import 'package:aisha_crud2/app/modules/beritaF/views/detail_berita_f_view.dart';
import 'package:aisha_crud2/app/modules/beritaF/controllers/berita_f_controller.dart';
import 'package:aisha_crud2/app/utils/api.dart'; // untuk BaseUrl.storageBeritaF

class BeritaFView extends StatelessWidget {
  final BeritaFController controller = Get.put(BeritaFController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA4D4E4),
      appBar: AppBar(
        title: Text(
          'Berita Fakultas',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blue.shade800,
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
          return _buildErrorState();
        }

        if (controller.beritaFList.isEmpty) {
          return _buildEmptyState();
        }

        return RefreshIndicator(
          onRefresh: controller.fetchBeritaF,
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: controller.beritaFList.length,
            separatorBuilder: (_, __) => const SizedBox(height: 16),
            itemBuilder: (_, index) => _buildBeritaFCard(controller.beritaFList[index]),
          ),
        );
      }),
    );
  }

  /// Widget saat error terjadi saat fetch data
  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 50, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            controller.errorMessage.value,
            style: GoogleFonts.poppins(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: controller.fetchBeritaF,
            child: const Text('Coba Lagi'),
          ),
        ],
      ),
    );
  }

  /// Widget saat list berita kosong
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.announcement, size: 50, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            'Tidak ada berita tersedia',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  /// Kartu berita
  Widget _buildBeritaFCard(BeritaFModel berita) {
    final String imageUrl = berita.foto != null && berita.foto!.isNotEmpty
        ? '${BaseUrl.storageBeritaF}${berita.foto}'
        : '';

    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Get.to(() => DetailBeritaFView(beritaF: berita)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Berita
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Container(
                height: 180,
                width: double.infinity,
                color: Colors.grey[200],
                child: _buildImage(imageUrl),
              ),
            ),
            // Konten Berita
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    berita.judulBeritaF ?? 'Judul tidak tersedia',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Text(
                  //   berita.deskripsiF ?? '',
                  //   style: GoogleFonts.poppins(
                  //     fontSize: 14,
                  //     color: Colors.grey[600],
                  //   ),
                  //   maxLines: 2,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Lihat Selengkapnya',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xFF2E7D32),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget untuk memuat gambar berita
  Widget _buildImage(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) {
      return const Center(
        child: Icon(Icons.announcement, size: 50, color: Colors.grey),
      );
    }

    if (kDebugMode) print('Loading image from: $imageUrl');

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.cover,
      httpHeaders: const {'Accept': 'image/*'},
      placeholder: (_, __) => const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2E7D32)),
        ),
      ),
      errorWidget: (_, __, error) {
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
}
