// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:aisha_crud2/app/data/event_response.dart';
// import 'package:aisha_crud2/app/modules/dashboard/controllers/dashboard_controller.dart';
// import 'package:aisha_crud2/app/modules/dashboard/views/event_detail_view.dart';
// import 'package:lottie/lottie.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// class IndexView extends GetView {
//   const IndexView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     DashboardController controller = Get.put(DashboardController());
//     final ScrollController scrollController = ScrollController();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Event List'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: FutureBuilder<EventResponse>(
//           future: controller.getEvent(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: Lottie.network(
//                   'https://gist.githubusercontent.com/olipiskandar/4f08ac098c81c32ebc02c55f5b11127b/raw/6e21dc500323da795e8b61b5558748b5c7885157/loading.json',
//                   repeat: true,
//                   width: MediaQuery.of(context).size.width / 1,
//                 ),
//               );
//             }
//             if (snapshot.data!.events!.isEmpty) {
//               return const Center(child: Text("Tidak ada data"));
//             }

//             return ListView.builder(
//               itemCount: snapshot.data!.events!.length,
//               controller: scrollController,
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 final event = snapshot.data!.events![index];
//                 return ZoomTapAnimation(
//                   onTap: () {
//                     // Pass event object ke EventDetailView
//                     Get.to(() => EventDetailView(event: event));
//                   },
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Image.network(
//                         // 'https://picsum.photos/id/${event.id}/700/300',
//                         'http://192.168.1.17:8000/${news.image}',
//                         fit: BoxFit.cover,
//                         height: 200,
//                         width: 500,
//                         errorBuilder: (context, error, stackTrace) {
//                           return const SizedBox(
//                             height: 200,
//                             child: Center(child: Text('Image not found')),
//                           );
//                         },
//                       ),
//                       const SizedBox(height: 16),
//                       Text(
//                         event.name!,
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         event.description!,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey,
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.location_on,
//                             color: Colors.red,
//                           ),
//                           const SizedBox(width: 8),
//                           Expanded(
//                             child: Text(
//                               event.location!,
//                               style: const TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Divider(height: 10),
//                       const SizedBox(height: 16),
//                     ],
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:aisha_crud2/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndexView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Berita')),
      body: Obx(() {
        // print("News List: ${controller.newsList}"); // Debugging list berita

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
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'http://192.168.1.12:8000/storage/images/berita/${news.image}',
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      print('URL Gambar: http://192.168.1.12:8000/storage/images/berita/${news.image}');
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
