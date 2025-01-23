// ignore_for_file: unused_import

import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/profile_response.dart';
import '../../../utils/api.dart';

class ProfileController extends GetxController {
  final box = GetStorage();
  final _getConnect = GetConnect();
  final token = GetStorage().read('token');
  final isLoading = false.obs;
  final profile = Rx<ProfileResponse?>(null); // Observable untuk profil user

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }

  Future<void> getProfile() async {
    isLoading.value = true; // Tampilkan loading saat proses berjalan
    try {
      final response = await _getConnect.get(
        BaseUrl.profile,
        headers: {'Authorization': "Bearer $token"},
        contentType: "application/json",
      );

      if (response.statusCode == 200) {
        profile.value = ProfileResponse.fromJson(response.body);
      } else {
        Get.snackbar("Error", "Gagal memuat profil: ${response.statusText}");
      }
    } catch (e) {
      print("Error: $e");
      Get.snackbar("Error", "Terjadi kesalahan saat memuat profil");
    } finally {
      isLoading.value = false; // Sembunyikan loading setelah selesai
    }
  }

  void logout() {
    box.remove('token');
    Get.offAllNamed('/login');
  }
}
