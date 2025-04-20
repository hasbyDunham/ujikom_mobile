import 'package:aisha_crud2/app/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aisha_crud2/app/models/pengumuman_model.dart';

class DetailPengumumanView extends StatelessWidget {
  final PengumumanModel pengumuman;

  const DetailPengumumanView({Key? key, required this.pengumuman}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String fotoUrl = pengumuman.foto != null
        ? '${BaseUrl.storagePengumuman}${pengumuman.foto}'
        : '';
    final String judul = pengumuman.judulPengumuman ?? 'Tanpa Judul';
    final String deskripsi = pengumuman.deskripsiPengumuman ?? 'Tanpa Deskripsi';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pengumuman'),
        backgroundColor: Colors.blue.shade800,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul Pengumuman
            Text(
              judul,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF007399),
              ),
            ),
            const SizedBox(height: 12),

            // Gambar jika ada
            if (fotoUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  fotoUrl,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 100),
                ),
              ),
            const SizedBox(height: 20),

            // Deskripsi pengumuman
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                deskripsi,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
