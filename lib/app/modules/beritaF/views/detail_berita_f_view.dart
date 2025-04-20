import 'package:ujikom_mobile/app/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:ujikom_mobile/app/models/beritaF_model.dart';
import 'package:intl/intl.dart';

class DetailBeritaFView extends StatelessWidget {
  final BeritaFModel beritaF;

  const DetailBeritaFView({Key? key, required this.beritaF}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String judul = beritaF.judulBeritaF ?? 'Tidak ada judul';
    final String deskripsi = beritaF.deskripsiF ?? 'Tidak ada deskripsi';
    final String fotoUrl = beritaF.foto != null && beritaF.foto!.isNotEmpty
        ? '${BaseUrl.storageBeritaF}${beritaF.foto}'
        : '';
    // final String tanggal = beritaF.createdAt != null
    //     ? DateFormat('dd MMMM yyyy', 'id_ID').format(DateTime.parse(beritaF.createdAt!))
    //     : 'Tanggal tidak tersedia';
    // final String penulis = beritaF.author?.name ?? 'Penulis tidak diketahui';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Berita Fakultas'),
        backgroundColor: Colors.blue.shade800,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Berita
            if (fotoUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  fotoUrl,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.broken_image, size: 60, color: Colors.grey),
                        SizedBox(height: 8),
                        Text('Gagal memuat gambar', style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 16),

            // Tanggal & Penulis
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       tanggal,
            //       style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            //     ),
            //     Text(
            //       penulis,
            //       style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            //     ),
            //   ],
            // ),

            const SizedBox(height: 16),

            // Judul Berita
            Text(
              judul,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 16),

            // Deskripsi
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
