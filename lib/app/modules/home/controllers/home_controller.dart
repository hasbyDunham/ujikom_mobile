import 'dart:async';
import 'dart:convert';
import 'package:aisha_crud2/app/models/pengumuman_image.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:aisha_crud2/app/models/news_image.dart';
import 'package:aisha_crud2/app/modules/dashboard/views/dashboard_view.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  var newsList = <NewsModel>[].obs;
  var pengumumanList = <Pengumuman>[].obs;

  var isLoading = true.obs;
  late Timer _pindah;
  final authToken = GetStorage();
  final GetConnect _connect = GetConnect(); // Buat instance GetConnect

  @override
  void onInit() {
    super.onInit();
    fetchNews();
    fetchPengumuman(); // Tambahkan ini
    _pindah = Timer.periodic(
      const Duration(seconds: 4),
      (timer) => Get.off(() => const DashboardView()),
    );
  }

  Future<void> fetchNews() async {
    try {
      isLoading.value = true;

      final response = await _connect.get(
        'http://192.168.1.12:8000/api/berita',
      );

      print("🔹 Response Status Code: ${response.statusCode}");
      print("🔹 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        var jsonData = response.body;

        if (jsonData != null && jsonData['data'] != null) {
          var beritaList = jsonData['data'] as List;

          if (beritaList.isNotEmpty) {
            newsList.assignAll(
              beritaList.map((e) => NewsModel.fromJson(e)).toList(),
            );
          } else {
            print("⚠️ Data berita kosong.");
          }
        } else {
          print("❌ Format JSON tidak sesuai.");
        }
      } else {
        print("❌ Error mengambil data berita: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Exception saat fetch berita: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchPengumuman() async {
  try {
    isLoading(true);
    final response = await http.get(Uri.parse('http://192.168.1.7:8000/api/pengumuman'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      pengumumanList.value = (data['data'] as List)
          .map((item) => Pengumuman.fromJson(item))
          .toList();
    } else {
      print('❌ Gagal mengambil data pengumuman: ${response.statusCode}');
    }
  } catch (e) {
    print('❌ Error saat fetch pengumuman: $e');
  } finally {
    isLoading(false);
  }
}




  @override
  void onClose() {
    _pindah.cancel();
    super.onClose();
  }
}
