// import 'package:flutter/material.dart';

// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import 'app/routes/app_pages.dart';

// import 'package:flutter/gestures.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await GetStorage.init();
//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "My Event",
//       initialRoute: AppPages.INITIAL,
//       getPages: AppPages.routes,
//       scrollBehavior: MaterialScrollBehavior().copyWith(
//         dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
//       ),
//     ),
//   );
// }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// import 'app/routes/app_pages.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await GetStorage.init();
  
//   final box = GetStorage();
//   final token = box.read('token'); // <- kamu nyimpan token di sini

//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Fakultas Ushuluddin",
//       initialRoute: token != null ? Routes.HOME : Routes.LOGIN,
//       getPages: AppPages.routes,
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fakultas Ushuluddin",
      initialRoute: Routes.HOME, // Langsung masuk ke HOME tanpa cek token
      getPages: AppPages.routes,
    ),
  );
}


