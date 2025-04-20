import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pengumuman_controller.dart';

class PengumumanView extends StatelessWidget {
  final PengumumanController controller = Get.put(PengumumanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengumuman')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.pengumumanList.isEmpty) {
          return const Center(child: Text('Tidak ada pengumuman tersedia'));
        }
        return ListView.builder(
          itemCount: controller.pengumumanList.length,
          itemBuilder: (context, index) {
            var pengumuman = controller.pengumumanList[index];

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: pengumuman.foto != null && pengumuman.foto!.isNotEmpty
                      ? Image.network(
                          'http://192.168.1.2:8000/storage/images/pengumuman/${pengumuman.foto}',
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
                  pengumuman.judulPengumuman ?? 'Tanpa Judul',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  _stripHtmlTags(pengumuman.deskripsiPengumuman ?? 'Tidak ada deskripsi'),
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
