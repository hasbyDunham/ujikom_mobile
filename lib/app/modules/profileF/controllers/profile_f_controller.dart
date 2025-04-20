import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:html/parser.dart';

class ProfileFController extends GetxController {
  final _getConnect = GetConnect();

  final sejarah = "".obs;
  final visi = "".obs;
  final misi = "".obs;
  final tujuan = "".obs;
  final pimpinan = "".obs;

  final isLoading = false.obs;

  final baseUrl = "http://192.168.0.249:8000/api/"; // Ganti sesuai kebutuhan

  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
  }

  void fetchProfileData() async {
    isLoading.value = true;

    try {
      // Sejarah
      final sejarahRes = await _getConnect.get("$baseUrl/sejarah");
      if (sejarahRes.statusCode == 200) {
        final data = sejarahRes.body['data'];
        if (data != null && data.length > 0) {
          sejarah.value = parse(data[0]['sejarah']).body!.text;
        }
      }

      // Visi Misi Tujuan
      final vmRes = await _getConnect.get("$baseUrl/visimisi");
      if (vmRes.statusCode == 200) {
        final data = vmRes.body['data'];
        if (data != null && data.length > 0) {
          visi.value = parse(data[0]['visi']).body!.text;
          misi.value = data[0]['misi'];
          tujuan.value = data[0]['tujuan'];
        }
      }

      // Pimpinan Fakultas
      // final pimpinanRes = await _getConnect.get("$baseUrl/pimpinan");
      // if (pimpinanRes.statusCode == 200) {
      //   final data = pimpinanRes.body['data'];
      //   if (data != null && data.length > 0) {
      //     pimpinan.value = data[0]['nama'];
      //   }
      // }
    } catch (e) {
      Get.snackbar("Error", "Gagal memuat data: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
