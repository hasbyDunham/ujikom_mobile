import 'dart:convert';
import 'package:ujikom_mobile/app/models/berita_model.dart';
import 'package:ujikom_mobile/app/modules/berita/views/berita_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

// controllers/berita_controller.dart
class BeritaController extends GetxController {
  var beritaList = <BeritaModel>[].obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchBerita();
    super.onInit();
  }

  Future<void> fetchBerita() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await http.get(
        Uri.parse('http://127.0.0.1:8000/api/berita'),
        headers: {'Accept': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        beritaList.assignAll(
          (data['data'] as List).map((e) => BeritaModel.fromJson(e)).toList()
        );
      } else {
        throw Exception('Failed to load berita: ${response.statusCode}');
      }
    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
