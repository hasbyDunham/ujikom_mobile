import 'package:aisha_crud2/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:aisha_crud2/app/utils/api.dart';

class RegisterController extends GetxController {
  final _getConnect = GetConnect();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

  final authStorage = GetStorage();

  void registerNow() async {
    final response = await _getConnect.post(BaseUrl.register, {
      'name': nameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'password_confirmation': passwordConfirmationController.text,
    });

    if ((response.statusCode == 200 || response.statusCode == 201) &&
        response.body['access_token'] != null) {
      
      // Simpan token
      authStorage.write('token', response.body['access_token']);

      // Opsional: simpan user info juga
      if (response.body['data'] != null) {
        authStorage.write('user', response.body['data']);
      }

      // Arahkan ke home
      Get.offAll(() => HomeView());
    } else {
      final message = response.body['message'] ??
          response.body.toString() ??
          'Register gagal. Coba lagi.';

      Get.snackbar(
        'Register Error',
        message,
        icon: const Icon(Icons.error),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(10),
      );
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    super.onClose();
  }
}
