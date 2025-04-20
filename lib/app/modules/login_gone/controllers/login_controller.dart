import 'package:aisha_crud2/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';
import 'package:aisha_crud2/app/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final _getConnect = GetConnect();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final authStorage = GetStorage();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void loginNow() async {
    final response = await _getConnect.post(BaseUrl.login, {
      'email': emailController.text,
      'password': passwordController.text,
    });

    if (response.statusCode == 200 && response.body['access_token'] != null) {
      // Simpan token
      authStorage.write('token', response.body['access_token']);
      
      // Pindah ke HomeView
      Get.offAll(() => HomeView());
    } else {
      final message = response.body['message'] ?? 'Login gagal. Cek email dan password.';

      Get.snackbar(
        'Login Error',
        message,
        icon: const Icon(Icons.error, color: Colors.white),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(10),
      );
    }
  }
}