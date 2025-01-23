import 'package:aisha_crud2/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => controller.logout(),
          )
        ],
      ),
      body: Obx(() {
        // Tampilkan loading jika data sedang diambil
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        // Tampilkan data jika berhasil diambil
        final profile = controller.profile.value;
        if (profile != null) {
          return Center( // Gunakan Center untuk memposisikan widget di tengah
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Agar konten hanya mengambil ruang minimum
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar Profil atau Huruf Pertama Nama
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: profile.avatar != null
                        ? NetworkImage(profile.avatar!)
                        : null,
                    child: profile.avatar == null
                        ? Text(
                            profile.name != null && profile.name!.isNotEmpty
                                ? profile.name![0]
                                : '?',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : null,
                  ),
                  SizedBox(height: 16),
                  // Nama User
                  Text(
                    profile.name ?? "Nama tidak tersedia",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  // Email User
                  Text(
                    profile.email ?? "Email tidak tersedia",
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 16),
                  // Tombol Muat Ulang Data
                  ElevatedButton(
                    onPressed: () => controller.getProfile(),
                    child: Text("Muat Ulang Profil"),
                  ),
                ],
              ),
            ),
          );
        }

        // Tampilkan pesan jika data kosong
        return Center(
          child: Text(
            "Profil tidak ditemukan",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        );
      }),
    );
  }
}
