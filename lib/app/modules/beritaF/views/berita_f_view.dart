import 'package:aisha_crud2/app/modules/beritaF/controllers/berita_f_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeritaFView extends StatelessWidget {
  final BeritaFController controller = Get.put(BeritaFController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengumuman')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.beritaFList.isEmpty) {
          return const Center(child: Text('Tidak ada beritaF tersedia'));
        }
        return ListView.builder(
          itemCount: controller.beritaFList.length,
          itemBuilder: (context, index) {
            var beritaF = controller.beritaFList[index];

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: beritaF.foto != null && beritaF.foto!.isNotEmpty
                      ? Image.network(
                          'http://192.168.1.2:8000/storage/images/beritaF/${beritaF.foto}',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              width: 60,
                              height: 60,
                              child: Icon(Icons.broken_image, size: 30),
                            );
                          },
                        )
                      : const Icon(Icons.image_not_supported, size: 60),
                ),
                title: Text(
                  beritaF.judulBeritaF ?? 'Tanpa Judul',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  _stripHtmlTags(beritaF.deskripsiF ?? 'Tidak ada deskripsi'),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          },
        );
      }),
    );
  }

  /// Fungsi untuk menghapus tag HTML dari teks
  String _stripHtmlTags(String htmlText) {
    return htmlText.replaceAll(RegExp(r'<[^>]*>'), '');
  }
}
