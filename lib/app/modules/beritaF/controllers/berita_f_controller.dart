import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:aisha_crud2/app/models/beritaF_model.dart';

class BeritaFController extends GetxController {
  var beritaFList = <BeritaFModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBeritaF();
  }

  Future<void> fetchBeritaF() async {
    isLoading.value = true;
    errorMessage.value = ''; // Reset error

    try {
      final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/beritaF'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          final beritaFData = jsonData['data'] as List;
          beritaFList.assignAll(
            beritaFData.map((e) => BeritaFModel.fromJson(e)).toList(),
          );
        } else {
          beritaFList.clear();
          errorMessage.value = 'Data tidak ditemukan.';
        }
      } else {
        errorMessage.value = 'Gagal memuat data (${response.statusCode})';
      }
    } catch (e) {
      errorMessage.value = 'Terjadi kesalahan saat mengambil data';
      print('❌ Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
