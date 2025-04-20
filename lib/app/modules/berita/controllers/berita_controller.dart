import 'dart:convert';
import 'package:aisha_crud2/app/models/news_image.dart';
import 'package:aisha_crud2/app/modules/berita/views/berita_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class BeritaController extends GetxController {
  var newsList = <NewsModel>[].obs;
  var isLoading = true.obs;
  final authToken = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      isLoading.value = true;

      final response = await http.get(Uri.parse('http://192.168.1.2:8000/api/berita'));

      print("🔹 Response Status Code: ${response.statusCode}");
      print("🔹 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

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
}
