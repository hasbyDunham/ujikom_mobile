import 'package:aisha_crud2/app/modules/berita/controllers/berita_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeritaView extends StatelessWidget {
  final BeritaController controller = Get.put(BeritaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Berita')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.newsList.isEmpty) {
          return Center(child: Text('Tidak ada berita tersedia'));
        }
        return ListView.builder(
          itemCount: controller.newsList.length,
          itemBuilder: (context, index) {
            var news = controller.newsList[index];
            print("Gambar berita: ${news.foto}"); // Debugging

            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'http://192.168.1.2:8000/storage/images/berita/${news.foto}',
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
                  ),
                ),
                title: Text(news.title, maxLines: 2, overflow: TextOverflow.ellipsis),
                subtitle: Text(news.description, maxLines: 2, overflow: TextOverflow.ellipsis),
              ),
            );
          },
        );
      }),
    );
  }
}
