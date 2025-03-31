
import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:aisha_crud2/app/modules/dashboard/controllers/dashboard_controller.dart';
// import 'package:aisha_crud2/app/modules/dashboard/views/add_view.dart';
// import 'package:aisha_crud2/app/modules/dashboard/views/edit_view.dart';

class YourEventView extends GetView {
  const YourEventView({super.key});
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pengumuman')),
      body: Obx(() {
        // print("News List: ${controller.newsList}"); // Debugging list berita

        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.newsList.isEmpty) {
          return Center(child: Text('Tidak ada pengumuman tersedia'));
        }
        return ListView.builder(
          itemCount: controller.newsList.length,
          itemBuilder: (context, index) {
            var news = controller.newsList[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'http://127.0.0.1:8000/images/pengumuman/${news.image}',
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
                subtitle: Text(news.description),
              ),
            );
          },
        );
      }),
    );
  }
}
