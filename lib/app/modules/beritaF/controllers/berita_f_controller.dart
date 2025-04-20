import 'dart:convert';
import 'package:aisha_crud2/app/models/beritaF_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import '../models/beritaF_model.dart'; // Sesuaikan path

class BeritaFController extends GetxController {
  var beritaFList = <BeritaF>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBeritaF();
  }

  Future<void> fetchBeritaF() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('http://192.168.1.2:8000/api/beritaF'));

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);

        if (jsonData['data'] != null) {
          var beritaFData = jsonData['data'] as List;
          beritaFList.assignAll(
            beritaFData.map((e) => BeritaF.fromJson(e)).toList(),
          );
        }
      }
    } catch (e) {
      print("❌ Error fetching berita fakultas: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
