// PengumumanView dengan style mirip berita tapi beda nuansa
import 'package:aisha_crud2/app/models/pengumuman_model.dart';
import 'package:aisha_crud2/app/modules/pengumuman/views/detail_pengumuman_view.dart';
import 'package:aisha_crud2/app/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/pengumuman_controller.dart';

class PengumumanView extends StatelessWidget {
  final PengumumanController controller = Get.put(PengumumanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA4D4E4),
      appBar: AppBar(
        title: Text(
          'Pengumuman',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue.shade800,
        centerTitle: true,
        elevation: 4,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }

        if (controller.pengumumanList.isEmpty) {
          return Center(
            child: Text(
              'Belum ada pengumuman',
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.pengumumanList.length,
          itemBuilder: (context, index) {
            final pengumuman = controller.pengumumanList[index];
            return _buildCard(pengumuman);
          },
        );
      }),
    );
  }

  Widget _buildCard(PengumumanModel pengumuman) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailPengumumanView(pengumuman: pengumuman));
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (pengumuman.foto != null && pengumuman.foto!.isNotEmpty)
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: CachedNetworkImage(
                  imageUrl: "${BaseUrl.storagePengumuman}${pengumuman.foto}",
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.broken_image, size: 60),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pengumuman.judulPengumuman ?? 'Tanpa Judul',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF007399),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Text(
                  //   pengumuman.deskripsiPengumuman ?? 'Tanpa Deskripsi',
                  //   style: GoogleFonts.poppins(
                  //     fontSize: 14,
                  //     color: Colors.grey[700],
                  //   ),
                  //   maxLines: 3,
                  //   overflow: TextOverflow.ellipsis,
                  // ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Selengkapnya',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF007399),
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 12, color: Colors.orange),
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
}
