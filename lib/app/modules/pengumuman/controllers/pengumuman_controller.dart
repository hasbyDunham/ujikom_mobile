import 'dart:convert';
import 'package:aisha_crud2/app/models/pengumuman_model.dart'; // Sesuaikan dengan model pengumuman
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PengumumanController extends GetxController {
  var pengumumanList = <Pengumuman>[].obs;
  var isLoading = true.obs;
  final authToken = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchPengumuman();
  }

  Future<void> fetchPengumuman() async {
    try {
      isLoading.value = true;

      final response = await http.get(Uri.parse('http://192.168.1.2:8000/api/pengumuman'));

      print("🔹 Response Status Code: ${response.statusCode}");
      print("🔹 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData != null && jsonData['data'] != null) {
          var pengumumanData = jsonData['data'] as List;

          if (pengumumanData.isNotEmpty) {
            pengumumanList.assignAll(
              pengumumanData.map((e) => Pengumuman.fromJson(e)).toList(),
            );
          } else {
            print("⚠️ Data pengumuman kosong.");
          }
        } else {
          print("❌ Format JSON tidak sesuai.");
        }
      } else {
        print("❌ Error mengambil data pengumuman: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Exception saat fetch pengumuman: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
