import 'package:get/get.dart';
import '../controllers/profile_f_controller.dart';

class ProfileFBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileFController>(() => ProfileFController());
  }
}
