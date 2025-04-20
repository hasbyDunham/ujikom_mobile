import 'dart:convert';
import 'package:aisha_crud2/app/models/pengumuman_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PengumumanController extends GetxController {
  var pengumumanList = <PengumumanModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs; // ✅ Tambahkan ini
  final authToken = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchPengumuman();
  }

  Future<void> fetchPengumuman() async {
    try {
      isLoading.value = true;
      errorMessage.value = ''; // reset error

      final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/pengumuman'));

      print("🔹 Response Status Code: ${response.statusCode}");
      print("🔹 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData != null && jsonData['data'] != null) {
          var pengumumanData = jsonData['data'] as List;

          if (pengumumanData.isNotEmpty) {
            pengumumanList.assignAll(
              pengumumanData.map((e) => PengumumanModel.fromJson(e)).toList(),
            );
          } else {
            errorMessage.value = "Data pengumuman kosong.";
          }
        } else {
          errorMessage.value = "Format JSON tidak sesuai.";
        }
      } else {
        errorMessage.value = "Gagal memuat data. Kode: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage.value = "Terjadi kesalahan: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
